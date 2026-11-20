-- Prevent duplicate initialization in the same Lua environment.
local initialized = rawget(_G, "__real_weather_effects_initialized")
if initialized then return initialized end

local weather_effects = {}

local screen_w = 480
local screen_h = 320
local sprite_z = 0
local sprite_scale = 2
local max_sync_attempts = 60

-- Animated weather effects.
local effects = {
  rain = {
    texture = "/server/assets/real_weather/rain/rain.png",
    animation = "/server/assets/real_weather/rain/rain.animation",
    width = 64,
    height = 64,

    states = {
      low = "LOW",
      medium = "MEDIUM",
      high = "HIGH"
    },

    loop_durations = {
      LOW = 1.089,
      MEDIUM = 0.55,
      HIGH = 0.330
    }
  },

  snow = {
    texture = "/server/assets/real_weather/snow/snow.png",
    animation = "/server/assets/real_weather/snow/snow.animation",
    width = 64,
    height = 64,

    states = {
      low = "LOW",
      medium = "MEDIUM",
      high = "HIGH"
    },

    loop_durations = {
      LOW = 3.2,
      MEDIUM = 2.078,
      HIGH = 1.089
    }
  }
}

for _, effect in pairs(effects) do
  effect.tile_w = effect.width * sprite_scale
  effect.tile_h = effect.height * sprite_scale

  effect.columns = math.ceil(screen_w / effect.tile_w)
  effect.rows = math.ceil(screen_h / effect.tile_h)

  effect.assets = {
    effect.texture,
    effect.animation
  }
end

local area_weather = {}
local players = {}
local missing_assets = {}

local function safe_call(fn, ...)
  if type(fn) ~= "function" then
    print("[Real Weather] Invalid API function")
    return false
  end

  local ok, result = pcall(fn, ...)

  if not ok then
    print("[Real Weather] API error: " .. tostring(result))
    return false
  end

  return result ~= false
end



-- =========================================================
-- TEMPORARY WEATHER ANIMATION LOOP WORKAROUND
-- Remove when the ONB client bug is fixed.
-- =========================================================

local animation_loops = {}

local function register_animation_loop(player_id, sprite_id, effect, state)
  local duration = effect.loop_durations
      and effect.loop_durations[state]

  if not duration or duration <= 0 then
    animation_loops[player_id] = nil
    return
  end

  animation_loops[player_id] = {
    sprite_id = sprite_id,
    effect = effect,
    state = state,
    duration = duration,
    elapsed = 0
  }
end

local function unregister_animation_loop(player_id)
  animation_loops[player_id] = nil
end

Net:on("tick", function(event)
  local dt = event.delta_time or 0

  for player_id, data in pairs(animation_loops) do
    data.elapsed = data.elapsed + dt

    if data.elapsed >= data.duration then
      data.elapsed = data.elapsed % data.duration

      local effect = data.effect

      for row = 0, effect.rows - 1 do
        for col = 0, effect.columns - 1 do
          local draw_id = data.sprite_id .. ":" .. col .. ":" .. row

          safe_call(
            Net.player_draw_sprite,
            player_id,
            data.sprite_id,
            {
              id = draw_id,
              x = col * effect.tile_w,
              y = row * effect.tile_h,
              z = sprite_z,
              sx = sprite_scale,
              sy = sprite_scale,
              anim_state = data.state
            }
          )
        end
      end
    end
  end
end)

-- =========================================================
-- END TEMPORARY WORKAROUND
-- =========================================================


local function list_players(area_id)
  if type(Net.list_players) ~= "function" then
    return nil
  end

  local ok, ids = pcall(Net.list_players, area_id)

  if not ok or type(ids) ~= "table" then
    print("[Real Weather] Failed to list players: " .. tostring(area_id))
    return nil
  end

  return ids
end

local function get_player_area(player_id)
  if type(Net.get_player_area) ~= "function" then
    return nil, false
  end

  local ok, area_id = pcall(Net.get_player_area, player_id)

  if not ok then
    return nil, false
  end

  return area_id, true
end

-- Verify that both texture and animation assets are registered.
local function assets_available(effect)
  if type(Net.has_asset) ~= "function" then
    print("[Real Weather] Net.has_asset unavailable")
    return false
  end

  for _, path in ipairs(effect.assets) do
    local ok, exists = pcall(Net.has_asset, path)

    if not ok or not exists then
      if not missing_assets[path] then
        missing_assets[path] = true
        print("[Real Weather] Missing asset: " .. path)
      end

      return false
    end

    missing_assets[path] = nil
  end

  return true
end

-- Remove all weather visuals allocated for a player.

local function remove_player(player_id, send_cleanup)
  unregister_animation_loop(player_id) -- remove it in future

  local info = players[player_id]
  if not info then return nil end

  players[player_id] = nil

  if send_cleanup then
    -- Explicitly erase every drawn weather sprite.
    local name = info.sprite_id:match("^real_weather:(.+)$")
    local effect = name and effects[name]

    if effect then
      for row = 0, effect.rows - 1 do
        for col = 0, effect.columns - 1 do
          local draw_id = info.sprite_id .. ":" .. col .. ":" .. row

          safe_call(
            Net.player_erase_sprite,
            player_id,
            draw_id
          )
        end
      end
    end

    -- Deallocate the sprite after erasing its objects.
    safe_call(
      Net.player_dealloc_sprite,
      player_id,
      info.sprite_id
    )
  end

  return info.area_id
end


-- Select the visual effect and its animation state.
local function resolve_effect(weather)
  if type(weather) ~= "table"
      or type(weather.condition) ~= "string"
      or weather.condition == "clear" then
    return nil
  end

  local name = weather.condition

  -- Thunderstorms use rain until their own visuals are available.
  if name == "thunderstorm" then
    name = "rain"
  end

  local effect = effects[name]
  if not effect then return nil end

  local state = effect.states[weather.intensity]
      or effect.states.low

  if not state then return nil end

  return name, effect, state
end

-- Draw a tiled animation across the player's screen.
local function render_player(player_id, area_id, weather)
  local name, effect, state = resolve_effect(weather)
  local signature = name and (name .. ":" .. state) or nil

  local previous = players[player_id]

  if previous
      and previous.area_id == area_id
      and previous.signature == signature then
    return
  end

  if not effect then
    if previous then
      remove_player(player_id, true)
    end

    return
  end
  if not assets_available(effect) then
    return
  end

  local texture_ready = safe_call(
    Net.provide_asset_for_player, player_id, effect.texture
  )

  local animation_ready = safe_call(
    Net.provide_asset_for_player, player_id, effect.animation
  )

  if not texture_ready or not animation_ready then
    print("[Real Weather] Unable to provide assets for " .. tostring(player_id))
    return
  end

  -- Remove previous visuals only after assets are ready.
  if previous then
    remove_player(player_id, true)
  end

  local sprite_id = "real_weather:" .. name

  local allocated = safe_call(
    Net.player_alloc_sprite,
    player_id,
    sprite_id,
    {
      texture_path = effect.texture,
      anim_path = effect.animation,
      anim_state = state
    }
  )

  if not allocated then
    print("[Real Weather] Unable to allocate " .. sprite_id)
    return
  end

  players[player_id] = {
    area_id = area_id,
    signature = signature,
    sprite_id = sprite_id
  }

  for row = 0, effect.rows - 1 do
    for col = 0, effect.columns - 1 do
      local draw_id = sprite_id .. ":" .. col .. ":" .. row

      local drawn = safe_call(
        Net.player_draw_sprite,
        player_id,
        sprite_id,
        {
          id = draw_id,
          x = col * effect.tile_w,
          y = row * effect.tile_h,
          z = sprite_z,
          sx = sprite_scale,
          sy = sprite_scale,
          anim_state = state
        }
      )

      if not drawn then
        print("[Real Weather] Unable to draw " .. draw_id)
        remove_player(player_id, true)
        return
      end
    end
  end
  register_animation_loop(player_id, sprite_id, effect, state) -- remove later
end

-- Synchronize the weather visuals of players in an area.
local function refresh_area_population(area_id)
  local ids = list_players(area_id)

  if not ids then return end

  local weather = area_weather[area_id]
  local present = {}

  for _, player_id in ipairs(ids) do
    present[player_id] = true
    render_player(player_id, area_id, weather)
  end

  local stale = {}

  for player_id, info in pairs(players) do
    if info.area_id == area_id and not present[player_id] then
      stale[#stale + 1] = player_id
    end
  end

  for _, player_id in ipairs(stale) do
    remove_player(player_id, true)
  end
end

-- Called by the weather state layer, never queries Open-Meteo itself.
function weather_effects.set_weather(area_id, state)
  area_weather[area_id] = state
  refresh_area_population(area_id)
end

function weather_effects.refresh_area(area_id)
  refresh_area_population(area_id)
end

-- Synchronize a player's current area.
local function sync_player(player_id)
  local area_id, success = get_player_area(player_id)

  if not success or not area_id then
    return false
  end

  render_player(player_id, area_id, area_weather[area_id])

  return true
end

local pending_players = {}

Net:on("player_join", function(event)
  pending_players[event.player_id] = 0
end)

Net:on("player_area_transfer", function(event)
  remove_player(event.player_id, true)
  pending_players[event.player_id] = 0
end)

Net:on("player_disconnect", function(event)
  pending_players[event.player_id] = nil
  remove_player(event.player_id, false)
end)

-- Only resolve pending transfers; animation runs on the client.
Net:on("tick", function()
  for player_id, attempts in pairs(pending_players) do
    if sync_player(player_id) then
      pending_players[player_id] = nil
    else
      attempts = attempts + 1

      if attempts >= max_sync_attempts then
        pending_players[player_id] = nil

        print(
          "[Real Weather] Sync timeout for player: "
          .. tostring(player_id)
        )
      else
        pending_players[player_id] = attempts
      end
    end
  end
end)

rawset(_G, "__real_weather_effects_initialized", weather_effects)
return weather_effects
