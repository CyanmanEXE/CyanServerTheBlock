local ezmemory = require("scripts/ezlibs-scripts/ezmemory")
local helpers = require('scripts/ezlibs-scripts/helpers')
local SharedLogger = require("scripts/logger/logger")
local log = SharedLogger.register("nebulous-liberations"):register_subsystem("player")
local OptionMenu = require("scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu")
local ScaleRegistry = require('scripts/ezlibs-scripts/ezencounters/scale_registry')

-- private functions

local function create_textbox_promise(self)
  if self.disconnected then
    return Async.create_promise(function(resolve)
      resolve()
    end)
  end

  return Async.create_promise(function(resolve)
    table.insert(self.textbox_promise_resolvers, resolve)
  end)
end

local BattleReason = {
  DRAW = 0,
  WIN = 1,
  LOSE = 2,
  RUN = 3,
  USER_PANIC = 4,
}

-- Diagnostic helper for inspecting the complete battle-results payload.
-- This intentionally does not assume any undocumented battle-effect fields.
local function debug_print_battle_data(value, prefix, depth)
  prefix = prefix or "battle"
  depth = depth or 0

  if type(value) ~= "table" then
    print("[Battle Debug] " .. prefix .. " = " .. tostring(value))
    return
  end

  if depth >= 8 then
    print("[Battle Debug] " .. prefix .. " = <maximum depth>")
    return
  end

  for key, entry in pairs(value) do
    local field = prefix .. "." .. tostring(key)

    if type(entry) == "table" then
      print("[Battle Debug] " .. field .. " = {")
      debug_print_battle_data(entry, field, depth + 1)
    else
      print("[Battle Debug] " .. field .. " = " .. tostring(entry))
    end
  end
end

-- Only these two explicit end reasons are considered a forced exit.
-- DRAW and LOSE are ordinary battle outcomes, not panics.
local function stats_indicate_panic(stats)
  if not stats then return false end
  local reason = tonumber(stats.reason)
  return reason == BattleReason.RUN or reason == BattleReason.USER_PANIC
end

-- public
local Player = {}

function Player:new(player_id)
  local position = Net.get_player_position(player_id)

  local player = {
    id = player_id,
    activity = nil,
    mug = Net.get_player_mugshot(player_id),
    textbox_promise_resolvers = {},
    resolve_battle = nil,
    pending_battle_stats = nil,
    battle_exit_fallback_token = nil,
    avatar_details = nil,
    moved = false,
    x = position.x,
    y = position.y,
    z = position.z,
    disconnected = false
  }

  setmetatable(player, self)
  self.__index = self

  return player
end

function Player:message(message, texture_path, animation_path)
  Net.message_player(self.id, message, texture_path, animation_path)
  return create_textbox_promise(self)
end

function Player:message_with_mug(message)
  return self:message(message, self.mug.texture_path, self.mug.animation_path)
end

-- Fire-and-forget informational message. Does NOT push a resolver, so it
-- cannot hang the caller if the client never renders/dismisses the textbox
-- (which can happen right after a battle exit). Use this for flavor text.
function Player:say(message, texture_path, animation_path)
  if self.disconnected then return end
  Net.message_player(self.id, message, texture_path, animation_path)
end

function Player:say_with_mug(message)
  self:say(message, self.mug.texture_path, self.mug.animation_path)
end

function Player:question(question, texture_path, animation_path)
  Net.question_player(self.id, question, texture_path, animation_path)
  return create_textbox_promise(self)
end

function Player:question_with_mug(question)
  return self:question(question, self.mug.texture_path, self.mug.animation_path)
end

function Player:quiz(a, b, c, texture_path, animation_path)
  Net.quiz_player(self.id, a, b, c, texture_path, animation_path)
  return create_textbox_promise(self)
end

-- Mugshot-flavored quiz. Used by the liberation flow so the player's own
-- portrait accompanies the "Liberation / Pass / Cancel" prompts; the
-- order-points value is now shown by PointsGauge, not by the mugshot.
function Player:quiz_with_mug(a, b, c)
  return self:quiz(a, b, c, self.mug.texture_path, self.mug.animation_path)
end

-- Controller-driven sliced option menu used by mission interactions.
-- Returns a zero-based index to preserve the existing mission response handling.
function Player:select_mission_option(options, title)
  return OptionMenu.select(self.id, options, title)
end

function Player:is_battling()
  return self.resolve_battle ~= nil
end

-- A missing battle_results payload must never be interpreted as a victory,
-- a run, or a new HP value. The player session retains its current HP when
-- health is absent and never applies the panic penalty for a missing result.
local function create_default_results()
  return {
    reason = BattleReason.DRAW,
    ran = false,
    enemies = {},
    missing_battle_results = true,
  }
end

function Player:initiate_encounter(asset_path, data)
  if self.disconnected then
    return Async.create_promise(function(resolve)
      resolve(create_default_results())
    end)
  end

  if self:is_battling() then
    error("This player is already in a battle")
  end

  -- Provision on the player connection immediately before dispatch, in
  -- addition to the mission-area preflight. This closes the gap for cloned
  -- Liberation areas and clients that entered after the area was provisioned.
  -- A successful API call requests delivery; it is not a client ACK.
  print("[EZDBG][SERVER][BATTLE_ASSET_PLAYER_BEGIN]", tostring(self.id), tostring(asset_path))
  local provided, provision_result = pcall(Net.provide_asset_for_player, self.id, asset_path)
  if not provided or provision_result == false then
    log:error_data("Battle ZIP player provisioning failed; encounter not dispatched", {
      player_id = self.id, package_path = asset_path,
      error = tostring(provision_result),
    })
    print("[EZDBG][SERVER][BATTLE_ASSET_PLAYER_FAIL]", tostring(self.id), tostring(asset_path), tostring(provision_result))
    return Async.create_promise(function(resolve)
      resolve(create_default_results())
    end)
  end
  print("[EZDBG][SERVER][BATTLE_ASSET_PLAYER_REQUESTED]", tostring(self.id), tostring(asset_path))

  -- Liberation uses Net.initiate_encounter directly (it bypasses
  -- ezencounters.begin_encounter). Enrich the network payload here as well.
  -- `enrich` clones the enemy tables, preserving persistent overworld HP.
  local battle_data = ScaleRegistry.enrich(data, asset_path)
  local started, dispatch_error = pcall(Net.initiate_encounter, self.id, asset_path, battle_data)
  if not started or dispatch_error == false then
    log:error_data("Battle dispatch failed", {
      player_id = self.id, package_path = asset_path,
      error = tostring(dispatch_error),
    })
    print("[EZDBG][SERVER][BATTLE_DISPATCH_FAIL]", tostring(self.id), tostring(asset_path), tostring(dispatch_error))
    return Async.create_promise(function(resolve)
      resolve(create_default_results())
    end)
  end
  print("[EZDBG][SERVER][BATTLE_DISPATCH_SENT]", tostring(self.id), tostring(asset_path))

  return Async.create_promise(function(resolve)
    self.resolve_battle = resolve
  end)
end

function Player:handle_textbox_response(response)
  local pending = self.textbox_promise_resolvers and #self.textbox_promise_resolvers or 0
  local resolve = table.remove(self.textbox_promise_resolvers, 1)
  if resolve ~= nil then
    log:debug_data("textbox_response: resolver consumed", {
      player_id = self.id,
      response = response,
      pending_before = pending,
      pending_after = self.textbox_promise_resolvers and #self.textbox_promise_resolvers or 0,
    })
    resolve(response)
  else
    log:debug_data("textbox_response: stray (no pending resolver)", {
      player_id = self.id,
      response = response,
    })
  end
end

function Player:handle_battle_results(stats)
  -- Print the actual payload before any result handling changes it.
  print("[Battle Debug] battle_results received for player " .. tostring(self.id))
  print("[Battle Debug] stats type = " .. type(stats))
  debug_print_battle_data(stats, "results")

  local is_panic = stats_indicate_panic(stats)
  log:info_data("handle_battle_results: captured", {
    player_id = self.id,
    has_stats = stats ~= nil,
    has_pending_resolve = self.resolve_battle ~= nil,
    reason = stats and tostring(stats.reason) or nil,
    escape = stats and tostring(stats.escape) or nil,
    fled = stats and tostring(stats.fled) or nil,
    panicked = is_panic,
  })
  if not self.resolve_battle then
    return
  end
  self.pending_battle_stats = stats

  local fallback_delay = is_panic and 3.0 or 20.0
  local token = {}
  self.battle_exit_fallback_token = token
  local player_id = self.id
  Async.sleep(fallback_delay).and_then(function()
    if self.battle_exit_fallback_token ~= token then
      return
    end
    if not self.resolve_battle then
      return
    end
    log:warn_data("battle_exit did not fire; resolving via fallback", {
      player_id = player_id,
      delay_seconds = fallback_delay,
      panicked = is_panic,
    })
    self.battle_exit_fallback_token = nil
    local resolve = self.resolve_battle
    self.resolve_battle = nil
    local pending = self.pending_battle_stats or stats
    self.pending_battle_stats = nil
    resolve(pending or create_default_results())
  end)
end

function Player:handle_battle_exit(stats)
  self.battle_exit_fallback_token = nil

  -- battle_exit can contain only an ID or other partial data. Preserve the
  -- complete battle_results payload whenever it exists, rather than letting
  -- an incomplete exit event replace the authoritative WIN/LOSE reason and HP.
  local pending = self.pending_battle_stats
  local resolved = pending or stats
  local source
  if pending ~= nil then
    source = "pending_from_results"
  elseif stats ~= nil then
    source = "battle_exit_event"
  else
    source = "defaults"
  end
  self.pending_battle_stats = nil
  log:info_data("handle_battle_exit: resolving", {
    player_id = self.id,
    has_stats_arg = stats ~= nil,
    source = source,
    has_pending_resolve = self.resolve_battle ~= nil,
  })
  if not self.resolve_battle then
    return
  end
  local resolve = self.resolve_battle
  self.resolve_battle = nil
  resolve(resolved or create_default_results())
end

function Player:handle_disconnect()
  self.disconnected = true
  self.pending_return_verification = nil
  self.battle_exit_fallback_token = nil

  for _, resolve in ipairs(self.textbox_promise_resolvers) do
    resolve()
  end

  if self.resolve_battle then
    local resolve = self.resolve_battle
    self.resolve_battle = nil
    -- Disconnecting while an encounter promise is pending cannot award an
    -- encounter victory, even when a results event arrived before the exit.
    resolve(create_default_results())
  end
  self.pending_battle_stats = nil

  self.textbox_promise_resolvers = nil

  if self.activity then
    self.activity:handle_player_disconnect(self.id)
  end
end

-- Resolve the area ID supplied by the Mission Selector. Source Tiled objects
-- may use a runtime area ID or a map name; do not assume they are identical.
local function resolve_loaded_return_area(reference)
  if type(reference) ~= "string" or reference == "" then return nil end
  local ok, areas = pcall(Net.list_areas)
  if not ok or type(areas) ~= "table" then return nil end
  for _, candidate in ipairs(areas) do
    if candidate == reference then return candidate end
  end
  for _, candidate in ipairs(areas) do
    local name_ok, name = pcall(Net.get_area_name, candidate)
    if name_ok and name == reference then return candidate end
  end
  return nil
end

local function valid_return_coordinate(value)
  return type(value) == "number"
    and value == value and value ~= math.huge and value ~= -math.huge
end

local function resolve_liberation_return(player_id, activity, current_area)
  -- Mission Selector launches store a return point on their unique instance.
  -- Victory exits happen before the general instance cleanup, so the
  -- Player exit path MUST consume this destination itself.
  local selected = activity and activity.return_destination
  if selected then
    local area = resolve_loaded_return_area(selected.area_id)
    if area and valid_return_coordinate(selected.x)
      and valid_return_coordinate(selected.y)
      and valid_return_coordinate(selected.z) then
      return area, { x = selected.x, y = selected.y, z = selected.z }, "mission_selector"
    end
    log:warn_data("Invalid Mission Selector return point; using mission respawn", {
      player_id = player_id,
      mission_instance_area = current_area,
      requested_area = selected.area_id,
      return_x = selected.x,
      return_y = selected.y,
      return_z = selected.z,
    })
  end

  -- Existing Liberation Gate behavior: prefer the mission's configured
  -- Respawn Area / Liberation Respawn, then the default spawn.
  local property_ok, configured_area = pcall(Net.get_area_custom_property,
    current_area, "Respawn Area")
  local area = property_ok and resolve_loaded_return_area(configured_area) or nil
  if area then
    local object_ok, spawn = pcall(Net.get_object_by_name, area, "Liberation Respawn")
    if object_ok and spawn and valid_return_coordinate(spawn.x)
      and valid_return_coordinate(spawn.y)
      and valid_return_coordinate(spawn.z) then
      return area, spawn, "mission_respawn"
    end
    local default_ok, area_spawn = pcall(Net.get_spawn_position, area)
    if default_ok and area_spawn and valid_return_coordinate(area_spawn.x)
      and valid_return_coordinate(area_spawn.y)
      and valid_return_coordinate(area_spawn.z) then
      return area, area_spawn, "configured_area_spawn"
    end
  end

  area = resolve_loaded_return_area("default")
  if area then
    local ok, spawn = pcall(Net.get_spawn_position, area)
    if ok and spawn and valid_return_coordinate(spawn.x)
      and valid_return_coordinate(spawn.y)
      and valid_return_coordinate(spawn.z) then
      return area, spawn, "default_spawn"
    end
  end
  return nil, nil, "no_valid_return"
end

function Player:boot_to_lobby(isVictory, mapName)
  local activity = self.activity
  if not activity then
    log:warn_data("Liberation return skipped: no active mission", {
      player_id = self.id,
      map_name = mapName,
    })
    return false
  end

  local mission_area = Net.get_player_area(self.id)
  local return_area, spawn, return_source = resolve_liberation_return(
    self.id, activity, mission_area)
  if not return_area then
    log:error_data("Liberation return blocked: no valid destination", {
      player_id = self.id,
      mission_area = mission_area,
      map_name = mapName,
    })
    return false
  end

  -- Retain the requested destination until the player_transfer observer
  -- reports the area/coordinates actually accepted by the engine.
  self.pending_return_verification = {
    source_area_id = mission_area,
    area_id = return_area,
    x = spawn.x, y = spawn.y, z = spawn.z,
    return_source = return_source,
  }

  log:info_data("Liberation exit transfer requested", {
    player_id = self.id,
    mission_instance_area = mission_area,
    return_area = return_area,
    return_source = return_source,
    return_x = spawn.x,
    return_y = spawn.y,
    return_z = spawn.z,
    victory = isVictory,
  })

  -- Request the transfer before removing this player from the mission.
  -- That prevents an empty mission from being eligible for cleanup before
  -- the server has even accepted its outgoing transfer request.
  local transfer_ok, transfer_result = pcall(Net.transfer_player,
    self.id, return_area, true, spawn.x, spawn.y, spawn.z)
  if not transfer_ok or transfer_result == false then
    self.pending_return_verification = nil
    log:error_data("Liberation exit transfer failed; retaining mission state", {
      player_id = self.id,
      mission_instance_area = mission_area,
      return_area = return_area,
      return_source = return_source,
      error = not transfer_ok and tostring(transfer_result) or "transfer returned false",
    })
    return false
  end

  -- A transfer request may be accepted before Net reports the destination
  -- area. Hold the empty instance's cleanup until the player has actually
  -- left the instance on the server, preventing premature area removal.
  activity.pending_exit_transfers = activity.pending_exit_transfers or {}
  activity.pending_exit_transfers[self.id] = {
    requested_area = return_area,
    elapsed = 0,
  }

  activity:handle_player_disconnect(self.id)
  self.activity = nil

  if isVictory then
    local gate_to_remove = nil
    for _, value in ipairs(Net.list_objects(return_area) or {}) do
      local prospective_gate = Net.get_object_by_id(return_area, value)
      if prospective_gate and prospective_gate.custom_properties
        and prospective_gate.custom_properties["Liberation Map Name"] == mapName then
        gate_to_remove = prospective_gate
        break
      end
    end
    if gate_to_remove then
      local safe_secret = helpers.get_safe_player_secret(self.id)
      local player_area_memory = ezmemory.get_player_area_memory(safe_secret, return_area)
      player_area_memory.hidden_objects[tostring(gate_to_remove.id)] = true
      ezmemory.save_player_memory(safe_secret)
    end
  end
  ezmemory.set_player_max_health(self.id, ezmemory.get_player_max_health(self.id), true)
  ezmemory.set_player_health(self.id, 9999)
  return true
end

return Player
