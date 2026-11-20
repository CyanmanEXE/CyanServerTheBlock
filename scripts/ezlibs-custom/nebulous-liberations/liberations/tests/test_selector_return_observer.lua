-- Focused test for post-transfer return verification in main.lua.
-- Run from server root:
--   lua scripts/ezlibs-custom/nebulous-liberations/liberations/tests/test_selector_return_observer.lua
local logs = {}
local logger = {}
for _, name in ipairs({"info_data", "warn_data", "error_data", "debug_data", "error", "warn"}) do
  logger[name] = function(_, text, fields)
    logs[#logs+1] = {level=name, text=text, fields=fields}
  end
end
logger.register_subsystem = function() return logger end
package.preload["scripts/logger/logger"] = function()
  return {register = function() return logger end}
end
package.preload["scripts/ezlibs-scripts/ezmapinstance"] = function()
  return { get_for_player = function() return nil end }
end
local last_player
package.preload["scripts/ezlibs-custom/nebulous-liberations/player"] = function()
  return {new=function(_,id) last_player = {id=id, disconnected=false}; return last_player end}
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/instance"] = function()
  return {}
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/utils/parties"] = function()
  return {on_tick=function() end}
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/constants"] = function()
  return {CustomProperties={}}
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/validation"] = function() return {} end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/panel_registry"] = function() return {} end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/tileset_embedder"] = function()
  return { run=function() return {and_then=function() end} end }
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/mission_selector"] = function()
  return {register=function() end}
end
local current_area="default"
local current_position={x=10.5,y=21.5,z=3}
Net={
  get_player_area=function() return current_area end,
  get_player_position=function() return current_position end,
}
local Plugin=require("scripts/ezlibs-custom/nebulous-liberations/main")
Plugin.handle_player_request("P")
assert(last_player and last_player.id=="P")
local expected = {
  area_id="default", source_area_id="liberation_P", x=10.5,y=21.5,z=3,
  return_source="mission_selector",
}
last_player.pending_return_verification=expected
Plugin.handle_player_transfer("P")
local log=logs[#logs]
assert(log.text=="Liberation exit transfer verified")
assert(log.fields.area_matches and log.fields.position_matches)
assert(last_player.pending_return_verification==nil)

current_position={x=2.5,y=3.5,z=0}
last_player.pending_return_verification=expected
Plugin.handle_player_transfer("P")
log=logs[#logs]
assert(log.text=="Liberation exit destination differs from request")
assert(log.fields.area_matches and not log.fields.position_matches)
assert(last_player.pending_return_verification==nil)

-- A transfer event that still reports the mission instance must not consume
-- the expected destination before the actual return is reported.
current_area="liberation_P"
last_player.pending_return_verification=expected
local log_count=#logs
Plugin.handle_player_transfer("P")
assert(#logs==log_count)
assert(last_player.pending_return_verification==expected)

-- Verify an empty mission is not removed while Net still reports an
-- outgoing player in its instance. This models a deferred transfer event.
Net.list_areas=function() return {"liberation_P", "default"} end
Net.get_area_name=function(id) return id end
Net.get_spawn_position=function() return {x=30.5,y=31.5,z=0} end
Net.get_object_by_name=function() return nil end
local instance_map
for idx=1,30 do
  local name,value=debug.getupvalue(Plugin.on_tick,idx)
  if not name then break end
  if name=="instances" then instance_map=value; break end
end
assert(instance_map, "on_tick instances upvalue not available")
local cleaned=0
local ticks=0
local mock_instance={
  area_id="liberation_P", area_name="DEBUGLIB", base_area_id="DEBUGLIB",
  players={}, pending_exit_transfers={P={requested_area="default",elapsed=0}},
  on_tick=function() ticks=ticks+1 end,
  get_players=function(self) return self.players end,
  cleaning_up=function() return false end,
  clean_up=function(self)
    cleaned=cleaned+1
    return {and_then=function(fn) fn() end}
  end,
}
instance_map["liberation_P"]=mock_instance
current_area="liberation_P"
Plugin.on_tick(0.25)
assert(cleaned==0, "cleanup ran before transfer completed")
assert(ticks==0, "empty mission must not continue enemy turns while waiting")
assert(instance_map["liberation_P"]==mock_instance,
  "pending return instance was removed prematurely")
Plugin.on_tick(10)
assert(cleaned==0, "delayed transfer must not trigger area removal")
local warning_found=false
for _,entry in ipairs(logs) do
  if entry.text=="Liberation exit transfer has not reached target area" then
    warning_found=true
  end
end
assert(warning_found, "long transfer timeout warning not emitted")
current_area="default"
Plugin.on_tick(0.25)
assert(cleaned==1, "instance was not removed after departure was confirmed")
assert(instance_map["liberation_P"]==nil, "cleaned instance was not unregistered")

print("Liberation return observer + delayed cleanup tests passed")
