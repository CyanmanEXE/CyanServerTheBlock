-- ability.lua
local SharedLogger = require("scripts/logger/logger")
local log = SharedLogger.register("nebulous-liberations"):register_subsystem("ability")

local PanelEncounters = require("scripts/ezlibs-custom/nebulous-liberations/liberations/panel_encounters")
local helpers = require('scripts/ezlibs-scripts/helpers')
local ezmemory = require('scripts/ezlibs-scripts/ezmemory')
local Constants = require("scripts/ezlibs-custom/nebulous-liberations/liberations/constants")
local Ownership = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ability_ownership")

local function static_shape_generator(offset_x, offset_y, shape)
    return function() return shape, offset_x, offset_y end
end

local function liberate_and_loot(instance, player_session, results, remove_traps, destroy_items)
    local panels = player_session.selection:get_panels()
    player_session:liberate_and_loot_panels(panels, results, remove_traps, destroy_items).and_then(function()
        player_session:complete_turn()
    end)
end

local function panel_search(instance, player_session, results, remove_traps, destroy_items)
    local panels = player_session.selection:get_panels()
    player_session:loot_panels(panels, remove_traps, destroy_items).and_then(function()
        player_session:complete_turn()
    end)
end

local function initiate_encounter(instance, player_session)
    -- Ability-triggered encounters resolve from the base area's configured
    -- Liberation Encounters value via ezencounters, same as enemy encounters.
    local encounter_definition = PanelEncounters.resolve_encounter(instance.base_area_id)
    local ability_name = player_session.ability and player_session.ability.name
    if not encounter_definition or not encounter_definition.path then
        log:error_data("No encounter definition for ability", {
            base_area_id = instance.base_area_id,
            instance_area_id = instance.area_id,
            area_name = instance.area_name,
            player_id = player_session.player.id,
            ability = ability_name,
        })
        return Async.create_promise(function(resolve)
            resolve({
                success = false,
                enemies = {},
                turns = 0,
                ran = true,
                health = player_session.health,
                emotion = 0,
                score = 0,
            })
        end)
    end
    local encounter_data = {}
    for key, value in pairs(encounter_definition) do
        if key ~= "path" and key ~= "weight" then
            encounter_data[key] = value
        end
    end
    encounter_data.terrain = PanelEncounters.resolve_terrain(instance, player_session.player)

    log:info_data("Initiating ability encounter", {
        base_area_id = instance.base_area_id,
        instance_area_id = instance.area_id,
        area_name = instance.area_name,
        player_id = player_session.player.id,
        ability = ability_name,
        encounter_path = encounter_definition.path,
        terrain = encounter_data.terrain,
        phase = instance.phase,
    })

    return player_session:initiate_encounter(encounter_definition.path, encounter_data)
end

local function battle_to_liberate_and_loot(instance, player_session, r, remove_traps, destroy_items)
    initiate_encounter(instance, player_session).and_then(function(results)
        log:info_data("Ability encounter results", {
            base_area_id = instance.base_area_id,
            instance_area_id = instance.area_id,
            player_id = player_session.player.id,
            ability = player_session.ability and player_session.ability.name,
            success = results.success,
            turns = results.turns,
            ran = tostring(results.ran),
            reason = tostring(results.reason),
            escape = tostring(results.escape),
            fled = tostring(results.fled),
            health = results.health,
        })
        if results.success then
            liberate_and_loot(instance, player_session, results, remove_traps, destroy_items)
        else
            player_session:complete_turn()
        end
    end)
end

local Ability = {
    Guard = { name = "Guard" },
    Shadowstep = { name = "Shadowstep" },
    LongSwrd = {
        name = "LongSwrd",
        question = "Use LongSwrd?",
        cost = 1,
        remove_traps = false,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 0, { {1}, {1} }),
        activate = battle_to_liberate_and_loot
    },
    -- Distinct from the two-panel fallback LongSwrd: the original HeroSwrd
    -- liberates a three-panel vertical line at a cost of two Order Points.
    HeroSwrd = {
        name = "HeroSwrd",
        question = "Use HeroSwrd?",
        cost = 2,
        remove_traps = false,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 0, { {1}, {1}, {1} }),
        activate = battle_to_liberate_and_loot
    },
    WideSwrd = {
        name = "WideSwrd",
        question = "Use WideSwrd?",
        cost = 1,
        remove_traps = false,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 0, { {1, 1, 1} }),
        activate = battle_to_liberate_and_loot
    },
    GutsWave = {
        name = "GutsWave",
        question = "Destroy with GutsWave?",
        cost = 1,
        remove_traps = false,
        destroy_items = true,
        generate_shape = static_shape_generator(0, 0, { {1}, {1}, {1}, {1}, {1} }),
        activate = liberate_and_loot
    },
    ScrenDiv = {
        name = "ScrenDiv",
        question = "Use ScrenDiv to liberate?",
        cost = 3,
        remove_traps = false,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 0, {
            {1,1,1,1,1},
            {0,1,0,0,0},
            {0,0,1,0,0},
            {0,0,0,1,0},
            {1,1,1,1,1},
        }),
        activate = battle_to_liberate_and_loot
    },
    PanelSearch = {
        name = "PanelSearch",
        question = "Search in this area?",
        cost = 1,
        remove_traps = true,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 0, { {1}, {1}, {1} }),
        activate = function(instance, player_session)
            -- placeholder
        end
    },
    NumberSearch = {
        name = "NumberSearch",
        question = "Remove traps & get items?",
        cost = 1,
        remove_traps = true,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 0, { {1,1,1}, {1,1,1} }),
        activate = panel_search
    },
    HexSickle = {
        name = "HexSickle",
        question = "Should I cut panels with HexSickle?",
        cost = 1,
        remove_traps = true,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 1, { {1, 1, 1} }),
        activate = battle_to_liberate_and_loot
    },
    -- These four definitions restore the original Liberation abilities. They
    -- use the current base-area encounter resolver and existing loot handlers.
    Blaster = {
        name = "Blaster",
        question = "Should I blast panels with Blaster?",
        cost = 1,
        remove_traps = false,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 0, {
            {0, 1, 0},
            {1, 1, 1},
        }),
        activate = battle_to_liberate_and_loot
    },
    Burner = {
        name = "Burner",
        question = "Should I burn panels with Burner?",
        cost = 4,
        remove_traps = true,
        destroy_items = true,
        generate_shape = static_shape_generator(0, 0, {
            {1, 1, 1},
            {1, 1, 1},
            {1, 1, 1},
        }),
        activate = battle_to_liberate_and_loot
    },
    CrosBmb = {
        name = "CrosBmb",
        question = "Should I blow up panels with Cross Bomb?",
        cost = 2,
        remove_traps = true,
        destroy_items = false,
        generate_shape = static_shape_generator(0, 0, {
            {0, 1, 0},
            {1, 1, 1},
            {0, 1, 0},
        }),
        activate = battle_to_liberate_and_loot
    },
    Bazooka = {
        name = "Bazooka",
        question = "Demolish with Bazooka?",
        cost = 2,
        remove_traps = true,
        destroy_items = true,
        generate_shape = static_shape_generator(0, 0, {
            {1, 1, 1, 1, 1},
            {1, 1, 1, 1, 1},
            {1, 1, 1, 1, 1},
            {1, 1, 1, 1, 1},
            {1, 1, 1, 1, 1},
        }),
        activate = liberate_and_loot
    },
}

-- The old resolver used only legacy item IDs and selected an arbitrary item
-- through pairs(). The Gold Prog uses the canonical IDs below, so resolve
-- the actual equipped item deterministically instead.
local navi_ability_map = {
    LongSwrd = Ability.LongSwrd,
    HeroSwrd = Ability.HeroSwrd,
    WideSwrd = Ability.WideSwrd,
    OldSaber = Ability.ScrenDiv,
    Guard = Ability.Guard,
    HevyShld = Ability.Guard,
    HexSickle = Ability.HexSickle,
    NumGadgt = Ability.NumberSearch,
    GutsHamr = Ability.GutsWave,
    ShdwShoe = Ability.Shadowstep,
    CrosBmb = Ability.CrosBmb,
    Burner = Ability.Burner,
    Blaster = Ability.Blaster,
    Bazooka = Ability.Bazooka,
}

function Ability.resolve_for_player(player)
    local equipped = Ownership.get_equipped(player.id)
    local selected = equipped and navi_ability_map[equipped]
    if selected then return selected end
    if equipped then
        log:warn_data("Equipped Liberation item has no implemented ability", {
            player_id=player.id, item=equipped,
        })
    end
    return Ability.LongSwrd
end

return Ability