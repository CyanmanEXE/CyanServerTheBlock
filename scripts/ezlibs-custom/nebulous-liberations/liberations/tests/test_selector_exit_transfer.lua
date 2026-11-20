-- Regression test for the normal Mission Selector victory/return path.
-- Run from server root:
--   lua scripts/ezlibs-custom/nebulous-liberations/liberations/tests/test_selector_exit_transfer.lua
local function same(a, b, msg)
  assert(a == b, (msg or "value mismatch") .. ": expected " .. tostring(b) .. " got " .. tostring(a))
end

local logged = {}
local logger = {}
for _, name in ipairs({"info_data", "warn_data", "error_data"}) do
  logger[name] = function(_, message, details)
    logged[#logged + 1] = { level = name, message = message, details = details }
  end
end
logger.register_subsystem = function() return logger end
package.preload["scripts/logger/logger"] = function()
  return {register = function() return logger end}
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu"] = function()
  return {}
end
package.preload["scripts/ezlibs-scripts/ezencounters/scale_registry"] = function()
  return {}
end
package.preload["scripts/ezlibs-scripts/helpers"] = function()
  return {get_safe_player_secret = function(player_id) return "secret:" .. player_id end}
end

local area_memory = {hidden_objects={}}
local saved = 0
local memory = {
  get_player_area_memory = function(secret, area)
    same(secret, "secret:P", "secret for victory gate hide")
    same(area, "default", "victory gate hide area")
    return area_memory
  end,
  save_player_memory = function() saved = saved + 1 end,
  get_player_max_health = function() return 200 end,
  set_player_max_health = function() end,
  set_player_health = function() end,
}
package.preload["scripts/ezlibs-scripts/ezmemory"] = function() return memory end

local player_area = {P="liberation_P", Q="liberation_P"}
local transfer_records = {}
local fail_transfer = false
local active_activity = nil
Net = {
  get_player_position = function() return {x=5.5,y=6.5,z=0} end,
  get_player_mugshot = function() return {} end,
  get_player_area = function(id) return player_area[id] end,
  get_area_custom_property = function(area, name)
    same(name,"Respawn Area","fallback property name")
    return "legacy"
  end,
  list_areas = function() return {"liberation_P", "default", "legacy"} end,
  get_area_name = function(id) return id end,
  get_object_by_name = function(area, name)
    if area == "legacy" and name == "Liberation Respawn" then
      return {x=80.5,y=81.5,z=1}
    end
  end,
  get_spawn_position = function(area)
    return {x=100.5,y=101.5,z=0}
  end,
  list_objects = function(area)
    return area == "default" and {"gate"} or {}
  end,
  get_object_by_id = function(area, object_id)
    if area == "default" and object_id == "gate" then
      return {id=25, custom_properties={["Liberation Map Name"]="DEBUGLIB"}}
    end
  end,
  transfer_player = function(id, area, warp, x, y, z)
    if fail_transfer then return false end
    assert(active_activity ~= nil, "transfer must be issued while activity exists")
    transfer_records[#transfer_records+1] = {
      id=id, area=area, warp=warp, x=x, y=y, z=z,
    }
    player_area[id] = area
    return nil -- ONB's Net.transfer_player may return no value on success
  end,
}

local Player = require("scripts/ezlibs-custom/nebulous-liberations/player")
local function attach(p, destination)
  local activity = {
    area_id="liberation_P", return_destination=destination,
    disconnected_count=0, players={p},
  }
  function activity:handle_player_disconnect(id)
    same(id,p.id,"mission exit player")
    same(player_area[id] ~= "liberation_P",true,"transfer requested before detaching")
    self.disconnected_count = self.disconnected_count + 1
    self.players = {}
  end
  p.activity = activity
  return activity
end

local player = Player:new("P")
local selector_point = {area_id="default",x=10.5,y=21.5,z=3}
local mission = attach(player,selector_point)
active_activity=mission
same(player:boot_to_lobby(true,"DEBUGLIB"),true,"selector victory")
local t = transfer_records[#transfer_records]
same(t.area,"default","selector return area")
same(t.x,10.5,"selector return x")
same(t.y,21.5,"selector return y")
same(t.z,3,"selector return z")
same(t.warp,true,"selector warp flag")
same(mission.disconnected_count,1,"mission player removed once")
assert(mission.pending_exit_transfers and mission.pending_exit_transfers.P,
  "successful transfer must hold cleanup until confirmed")
same(player.activity,nil,"player activity cleared")
same(area_memory.hidden_objects["25"],true,"gate hidden after victory")
same(saved,1,"gate memory persisted")
active_activity=nil

-- Normal Liberation Gate flow still uses the mission-configured Respawn Area.
player_area.P="liberation_P"
mission=attach(player,nil)
active_activity=mission
same(player:boot_to_lobby(false,"DEBUGLIB"),true,"gate return")
t=transfer_records[#transfer_records]
same(t.area,"legacy","gate return area")
same(t.x,80.5,"gate return x")
same(t.y,81.5,"gate return y")
same(t.z,1,"gate return z")
same(mission.disconnected_count,1,"gate session detached")

-- Invalid/unloaded selector area falls back, never transfers to an unknown area.
player_area.P="liberation_P"
mission=attach(player,{area_id="missing",x=12.5,y=13.5,z=0})
active_activity=mission
same(player:boot_to_lobby(false,"DEBUGLIB"),true,"invalid return fallback")
t=transfer_records[#transfer_records]
same(t.area,"legacy","fallback area")

-- Transfer failure must not detach the player or initiate empty-instance cleanup.
player_area.P="liberation_P"
mission=attach(player,selector_point)
active_activity=mission
fail_transfer=true
local count=#transfer_records
same(player:boot_to_lobby(false,"DEBUGLIB"),false,"failed transfer")
same(#transfer_records,count,"no success recorded")
same(player.activity,mission,"failed transfer retains activity")
same(mission.disconnected_count,0,"failed transfer retains session")
assert(mission.pending_exit_transfers == nil,
  "failed transfer must not register a pending success")
fail_transfer=false

-- Party members each use the instance's selector return tile.
player_area.P="liberation_P"
player_area.Q="liberation_P"
local other = Player:new("Q")
local party_mission={ area_id="liberation_P",return_destination=selector_point, players={player,other} }
function party_mission:handle_player_disconnect(id)
  for index,member in ipairs(self.players) do
    if member.id == id then table.remove(self.players,index); return end
  end
  error("missing player")
end
player.activity=party_mission
other.activity=party_mission
active_activity=party_mission
same(player:boot_to_lobby(false,"DEBUGLIB"),true,"party host exit")
same(other:boot_to_lobby(false,"DEBUGLIB"),true,"party member exit")
same(#party_mission.players,0,"party mission empty after transfers")
same(transfer_records[#transfer_records-1].x,10.5,"party host x")
same(transfer_records[#transfer_records].x,10.5,"party member x")
print("Mission Selector normal exit transfer tests passed")
