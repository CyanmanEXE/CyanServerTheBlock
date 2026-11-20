-- Persistent Gold Prog Liberation Mission selector.
-- The prog is a normal eznpcs NPC in default.tmx, not a destructible gate.
-- A Dialogue event opens the existing controller-driven Liberation 9-slice
-- menu. Mission discovery uses the active areas' Liberation Config objects
-- so new, correctly configured missions appear without editing this module.

local EzNPCs = require("scripts/ezlibs-scripts/eznpcs/eznpcs")
local OptionMenu = require("scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu")
local Constants = require("scripts/ezlibs-custom/nebulous-liberations/liberations/constants")
local Direction = require("scripts/ezlibs-scripts/direction")
local SharedLogger = require("scripts/logger/logger")
local log = SharedLogger.register("nebulous-liberations"):register_subsystem("mission-selector")

local Selector = {}
local EVENT_NAME = "Liberation Mission Selector"
local MENU_TITLE = "Liberations"
local MUG_ROOT = "/server/assets/ezlibs-assets/eznpcs/mug/"

local MENU_CONFIG = {
    max_visible = 5,
    centered = true,
    stable_text = true,
    mugshot = {
        texture_path = MUG_ROOT .. "prog-gold.png",
        animation_path = MUG_ROOT .. "prog-gold.animation",
        anim_state = "IDLE",
        width = 40,
        height = 48,
        scale = 2,
    },
}

-- Friendly names for the imported cyan missions. These are labels only;
-- the actual mission IDs are looked up from Net.list_areas(), and additional
-- maps with valid Liberation Config + Spawn objects are included by name.
local KNOWN_MISSIONS = {
    LiberationEasyMode = { label = "Easy Liberation", order = 1 },
    LiberationNormalMode = { label = "Normal Liberation", order = 2 },
    LiberationHardMode = { label = "Hard Liberation", order = 3 },
    NewLiberation1 = { label = "Beta Liberation", order = 4 },
    DEBUGLIB = { label = "Debug Liberation", order = 5 },
    testlib = { label = "Practice Liberation", order = 6 },
    LibEasy = { label = "Easy Liberation", order = 1 },
    LibNorm = { label = "Normal Liberation", order = 2 },
    LibHard = { label = "Hard Liberation", order = 3 },
    BetaLiberation = { label = "Beta Liberation", order = 4 },
    DEBUGIN = { label = "Debug Liberation", order = 5 },
    PracticeArea = { label = "Practice Liberation", order = 6 },
}

local function is_base_area(area_id)
    return type(area_id) == "string"
        and area_id:sub(1, #"liberation_") ~= "liberation_"
end

local function has_liberation_configuration(area_id)
    local objects = Net.list_objects(area_id) or {}
    local has_config = false
    local has_spawn = false
    for _, object_id in ipairs(objects) do
        local object = Net.get_object_by_id(area_id, object_id)
        if object then
            if object.type == "Liberation Config" then
                local properties = object.custom_properties or {}
                local tileset = properties[Constants.CustomProperties.LiberationTileset]
                if type(tileset) == "string" and tileset ~= "" then
                    has_config = true
                end
            elseif object.name == "Spawn" and object.type == "Spawn Point" then
                has_spawn = true
            end
        end
    end
    return has_config and has_spawn
end

function Selector.available_missions()
    local missions = {}
    for _, area_id in ipairs(Net.list_areas() or {}) do
        if is_base_area(area_id) and has_liberation_configuration(area_id) then
            local area_name = Net.get_area_name(area_id)
            local info = KNOWN_MISSIONS[tostring(area_id)]
                or KNOWN_MISSIONS[tostring(area_name)]
            missions[#missions + 1] = {
                id = area_id,
                label = (info and info.label) or area_name or tostring(area_id),
                order = (info and info.order) or 100,
            }
        end
    end
    table.sort(missions, function(a, b)
        if a.order ~= b.order then return a.order < b.order end
        if a.label ~= b.label then return a.label < b.label end
        return tostring(a.id) < tostring(b.id)
    end)
    return missions
end

-- The NPC bot can temporarily face the player while talking. For the
-- return tile, use the fixed Direction on the original Tiled placeholder.
-- Net.get_object_by_id returns world/tile coordinates, NOT raw TMX pixels.
-- The same tile-center convention (floor + 0.5) is used by Endless Runner.
local function direction_step(direction)
    if type(direction) ~= "string" or type(Direction.to_vector) ~= "function" then
        return nil, nil
    end
    local known = {
        ["Up"] = true, ["Down"] = true,
        ["Left"] = true, ["Right"] = true,
        ["Up Left"] = true, ["Up Right"] = true,
        ["Down Left"] = true, ["Down Right"] = true,
    }
    if not known[direction] then return nil, nil end
    local vec = Direction.to_vector(direction)
    if type(vec) ~= "table" then return nil, nil end
    -- to_vector uses +/-0.5 for the four screen-cardinal directions.
    -- Normalize each nonzero component to one map tile, so every target
    -- remains at a tile center for all eight possible directions.
    local function tile_step(value)
        if type(value) ~= "number" then return nil end
        if value > 0 then return 1 end
        if value < 0 then return -1 end
        return 0
    end
    return tile_step(vec.x), tile_step(vec.y)
end

-- Returns an optional *instance-specific* destination to be used by mission
-- cleanup. Never changes the configured Respawn Area of the mission map.
function Selector.return_destination_for_npc(npc, area_id)
    if type(npc) ~= "table" or type(area_id) ~= "string" or area_id == "" then
        return nil, "missing_npc_or_area"
    end

    local object
    if npc.placeholder_id ~= nil then
        local ok, result = pcall(Net.get_object_by_id, area_id, npc.placeholder_id)
        if ok then object = result end
    end
    local props = (object and object.custom_properties)
        or npc.placeholder_custom_properties or {}
    local direction = props.Direction or npc.direction
    local step_x, step_y = direction_step(direction)
    if step_x == nil or step_y == nil then
        return nil, "invalid_tiled_direction"
    end

    local x = tonumber(object and object.x or npc.x)
    local y = tonumber(object and object.y or npc.y)
    local z = tonumber(object and object.z or npc.z)
    if not x or not y or not z then
        return nil, "missing_npc_position"
    end

    return {
        area_id = area_id,
        x = math.floor(x) + step_x + 0.5,
        y = math.floor(y) + step_y + 0.5,
        z = z,
        npc_id = object and object.id or npc.placeholder_id,
        direction = direction,
    }
end

function Selector.register(plugin)
    assert(plugin and type(plugin.start_game_for_player) == "function",
        "Mission Selector requires the Nebulous Liberations plugin")

    EzNPCs.add_event({
        name = EVENT_NAME,
        action = function(npc, player_id, dialogue, relay_object)
            return async(function()
                local area_id = Net.get_player_area(player_id)
                local missions = Selector.available_missions()
                local labels = {}
                for _, mission in ipairs(missions) do
                    labels[#labels + 1] = mission.label
                end
                if #missions == 0 then
                    labels[1] = "No missions available"
                end

                log:info_data("Golden Prog mission selector opened", {
                    player_id = player_id,
                    area_id = area_id,
                    mission_count = #missions,
                })

                -- OptionMenu appends its own Cancel choice. It returns a
                -- zero-based index so mission[choice + 1] is the selected one.
                local choice = await(OptionMenu.select(
                    player_id, labels, MENU_TITLE, MENU_CONFIG))
                if type(choice) ~= "number" or choice < 0
                    or choice >= #missions then
                    return
                end
                if not Net.is_player(player_id)
                    or Net.get_player_area(player_id) ~= area_id then
                    return
                end

                local mission = missions[choice + 1]
                log:info_data("Golden Prog mission selected", {
                    player_id = player_id,
                    mission_area = mission.id,
                    label = mission.label,
                })
                local return_destination, return_error =
                    Selector.return_destination_for_npc(npc, area_id)
                if return_destination then
                    log:info_data("Golden Prog mission return destination", {
                        player_id = player_id,
                        mission_area = mission.id,
                        return_area = return_destination.area_id,
                        return_x = return_destination.x,
                        return_y = return_destination.y,
                        return_z = return_destination.z,
                        npc_id = return_destination.npc_id,
                        tiled_direction = return_destination.direction,
                    })
                else
                    log:warn_data("Golden Prog return tile unavailable; using mission respawn", {
                        player_id = player_id,
                        mission_area = mission.id,
                        reason = return_error,
                        npc_id = npc and npc.placeholder_id,
                    })
                end
                -- Keep the same party-aware launcher used by Liberation Gates.
                -- Only the Mission Selector passes a source-NPC return point.
                plugin.start_game_for_player(player_id, mission.id, return_destination)
            end)
        end,
    })
end

return Selector
