-- Standalone regression for Liberation Mission Selector return tiles.
-- Run from server root: lua scripts/ezlibs-custom/nebulous-liberations/liberations/tests/test_mission_selector_return.lua
local function same(actual, expected, reason)
    assert(actual == expected, tostring(reason) .. " expected " .. tostring(expected)
        .. " got " .. tostring(actual))
end

local LOG = {}
for _, name in ipairs({"info_data", "error_data", "warn_data", "debug_data", "error", "warn", "info", "debug"}) do
    LOG[name] = function() end
end
LOG.register_subsystem = function() return LOG end
package.preload["scripts/logger/logger"] = function()
    return { register = function() return LOG end }
end

local Direction = {
    to_vector = function(dir)
        local vectors = {
            ["Up"] = {x=-0.5,y=-0.5}, ["Down"] = {x=0.5,y=0.5},
            ["Left"] = {x=-0.5,y=0.5}, ["Right"] = {x=0.5,y=-0.5},
            ["Up Left"] = {x=-1,y=0}, ["Up Right"] = {x=0,y=-1},
            ["Down Left"] = {x=0,y=1}, ["Down Right"] = {x=1,y=0},
        }
        return vectors[dir]
    end,
}
package.preload["scripts/ezlibs-scripts/direction"] = function() return Direction end
local Constants = { CustomProperties = {
    LiberationTileset = "Liberation Tileset",
    RespawnArea = "Respawn Area", WaitingArea = "Waiting Area",
} }
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/constants"] =
    function() return Constants end

local registered_event, chosen = nil, 0
package.preload["scripts/ezlibs-scripts/eznpcs/eznpcs"] = function()
    return { add_event = function(event) registered_event = event end }
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu"] = function()
    return { select = function() return chosen end }
end

async = function(callback) return callback() end
await = function(value) return value end
local object = { id=272, x=10.25, y=20.75, z=3,
    custom_properties = {Direction="Down Left"} }
local player_areas = {P="default"}
local transfer_events = {}
Net = {
    list_areas = function() return {"default", "DEBUGLIB"} end,
    get_area_name = function(area) return area end,
    list_objects = function(area)
        return area == "DEBUGLIB" and {"config", "spawn"} or {} end,
    get_object_by_id = function(area, id)
        if area == "default" and id == 272 then return object end
        if area == "DEBUGLIB" and id == "config" then return {
            type="Liberation Config", custom_properties={
                ["Liberation Tileset"] = "test.tsx"
            }
        } end
        if area == "DEBUGLIB" and id == "spawn" then
            return { name="Spawn", type="Spawn Point" }
        end
        return nil
    end,
    get_player_area = function(id) return player_areas[id] end,
    get_player_position = function() return {x=1,y=2,z=3} end,
    is_player = function() return true end,
    get_spawn_position = function() return {x=90.5,y=91.5,z=0} end,
    transfer_player = function(id, area, warp, x, y, z)
        transfer_events[#transfer_events+1] = {player=id,area=area,x=x,y=y,z=z}
        player_areas[id] = area
        return true
    end,
}

local shared_instances = {}
local EzMapInstance = {
    create = function(base, name)
        local record = {id=name, area_id=name, base_area_id=base}
        shared_instances[name] = record
        return record
    end,
    transfer_player = function(area, id, x,y,z,warp,direction)
        return Net.transfer_player(id,area,warp,x,y,z,direction)
    end,
    remove = function(name) shared_instances[name]=nil; return true end,
    get_for_player = function() return nil end,
}
package.preload["scripts/ezlibs-scripts/ezmapinstance"] = function() return EzMapInstance end
package.preload["scripts/ezlibs-custom/nebulous-liberations/player"] = function()
    return {new = function(_, id) return { id=id, disconnected=false } end}
end
local latest_instance
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/instance"] = function()
    return {new = function(_, base, area, players)
        latest_instance = {
            area_id = area, base_area_id = base, players=players,
            pending_transfer_players = {},
            get_spawn_position = function() return {id=20,x=5.5,y=6.5,z=0} end,
            get_next_spawn_from_object = function() return nil end,
            get_players = function(self) return self.players end,
            clean_up = function() return {
                and_then = function(callback) callback() end
            } end,
        }
        return latest_instance
    end}
end
local party_members
package.preload["scripts/ezlibs-custom/nebulous-liberations/utils/parties"] = function()
    return {find = function() return party_members and {members=party_members} end,
        on_tick = function() end}
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/validation"] =
    function() return {report=function() end} end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/panel_registry"] =
    function() return {register=function() end} end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/tileset_embedder"] = function()
    return { run = function() return { and_then = function() end } end }
end

local Selector = require("scripts/ezlibs-custom/nebulous-liberations/liberations/mission_selector")
local reference_npc = {placeholder_id=272, x=99, y=99, z=0,
    direction="Up Right", placeholder_custom_properties={Direction="Up Right"}}
local cases = {
    ["Up"] = {-1,-1}, ["Down"] = {1,1},
    ["Left"] = {-1,1}, ["Right"] = {1,-1},
    ["Up Left"] = {-1,0}, ["Up Right"] = {0,-1},
    ["Down Left"] = {0,1}, ["Down Right"] = {1,0},
}
for dir, step in pairs(cases) do
    object.custom_properties.Direction = dir
    local dest, err = Selector.return_destination_for_npc(reference_npc, "default")
    assert(dest, err)
    same(dest.area_id, "default", "return area " .. dir)
    same(dest.x, 10.5 + step[1], "return x " .. dir)
    same(dest.y, 20.5 + step[2], "return y " .. dir)
    same(dest.z, 3, "return z " .. dir)
end
object.custom_properties.Direction = "Invalid"
local no_return = Selector.return_destination_for_npc(reference_npc, "default")
same(no_return, nil, "invalid direction must use fallback")
object.custom_properties.Direction = "Down Left"

local Plugin = require("scripts/ezlibs-custom/nebulous-liberations/main")
same(registered_event.name, "Liberation Mission Selector", "event registration")
Plugin.handle_player_request("P")
registered_event.action(reference_npc, "P")
same(latest_instance.return_destination.area_id, "default", "instance destination")
same(latest_instance.return_destination.x, 10.5, "instance return x")
same(latest_instance.return_destination.y, 21.5, "instance return y")
same(latest_instance.return_destination.z, 3, "instance return z")
-- Inspect only the local cleanup callback to test the existing teardown
-- without introducing a new runtime export/API.
local remove_instance
for idx=1,30 do
    local name, value = debug.getupvalue(Plugin.on_tick,idx)
    if not name then break end
    if name == "remove_instance" then remove_instance=value break end
end
assert(type(remove_instance)=="function", "Could not access cleanup callback")
remove_instance("liberation_P")
local returned = transfer_events[#transfer_events]
same(returned.area,"default","selector return area")
same(returned.x,10.5,"selector return center x")
same(returned.y,21.5,"selector return center y")
same(returned.z,3,"selector return elevated z")

-- Gates and other existing launchers pass no return override, and therefore
-- must keep the original spawn-based return flow.
player_areas.P = "default"
Plugin.start_game_for_player("P", "DEBUGLIB")
same(latest_instance.return_destination, nil, "gate has no override")
remove_instance("liberation_P")
returned = transfer_events[#transfer_events]
same(returned.area,"default","gate return area")
same(returned.x,90.5,"gate fallback x")
same(returned.y,91.5,"gate fallback y")
same(returned.z,0,"gate fallback z")

-- If the selector source area disappears, keep the old configured/fallback
-- respawn logic instead of transferring into an unloaded area.
player_areas.P = "default"
Plugin.start_game_for_player("P", "DEBUGLIB", {
    area_id="missing-source", x=33.5, y=34.5, z=1,
})
remove_instance("liberation_P")
returned = transfer_events[#transfer_events]
same(returned.area,"default","missing source fallback area")
same(returned.x,90.5,"missing source fallback x")

-- Party launches share the selector's captured return tile and all present
-- members return there, without relying on global mutable return settings.
player_areas.P = "default"
player_areas.Q = "default"
Plugin.handle_player_request("Q")
party_members = {"P", "Q"}
registered_event.action(reference_npc,"P")
same(#latest_instance.players,2,"party player count")
remove_instance("liberation_P")
local n = #transfer_events
same(transfer_events[n].player,"Q","party second return player")
same(transfer_events[n].x,10.5,"party second return x")
same(transfer_events[n-1].player,"P","party first return player")
same(transfer_events[n-1].y,21.5,"party first return y")

print("Mission Selector return tests passed (8 directions + solo/party/gate/fallback teardown)")
