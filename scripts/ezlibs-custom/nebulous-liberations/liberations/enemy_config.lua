-- Tiled Liberation configuration resolver. Placed panels only need references:
--   Bot Config           -> template, persistent HP, OW/battle scale, AI, healing
--   OW Encounter Config  -> battle mode/category/name/weighted pool
-- Legacy Enemy Config and inline settings remain readable for old maps.
-- Priority: placed property > referenced config > category defaults > global.
-- Numeric zero inherits except healing, where zero explicitly disables healing.
local Logger = require("scripts/ezlibs-custom/nebulous-liberations/liberations/logger")
local log = Logger.config
local problems = Logger.map_problems
local Config = {}

local function props(object)
    return object and (object.custom_properties or object) or {}
end
local function trim(value)
    return value ~= nil and tostring(value):match("^%s*(.-)%s*$") or ""
end
local function defined(value)
    return value ~= nil and value ~= "" and value ~= 0 and value ~= "0" and value ~= "Auto"
end
local function numeric(value, allow_zero)
    local n = tonumber(value)
    if n and n == n and n < math.huge and n > -math.huge
        and (n > 0 or (allow_zero and n == 0)) then return n end
    return nil
end
local function reference_object(area_id, source, key, accepted_types)
    local ref = props(source)[key]
    if not defined(ref) then return nil end
    local id = tonumber(ref)
    if not id or id <= 0 then
        problems:error_data("Invalid object reference", {
            area_id = area_id, object_id = source and source.id,
            property = key, value = tostring(ref), action = "ignored"})
        return nil
    end
    local ok, object = pcall(Net.get_object_by_id, area_id, id)
    if ok and type(object) == "table" then
        for _, expected in ipairs(accepted_types) do
            if object.type == expected then return object end
        end
    end
    problems:error_data("Object reference has wrong class or is missing", {
        area_id = area_id, object_id = source and source.id, property = key,
        referenced_id = id, expected = table.concat(accepted_types, " or "),
        actual = object and object.type, action = "fallback"})
    return nil
end
Config.reference_object = reference_object

-- The authored default objects are immutable during an active mission. Cache
-- their priority-ordered merged properties once per cloned area instead of
-- rescanning every map object once for every panel's EnemyConfig.resolve().
-- DEBUGLIB has hundreds of panels, making the old lookup quadratic.
local area_default_indexes = {}

local function index_area_defaults(area_id)
    local ok, ids = pcall(Net.list_objects, area_id)
    local index = {all = {}, categories = {}}
    if not ok or type(ids) ~= "table" then return index end
    table.sort(ids, function(a, b) return (tonumber(a) or 0) < (tonumber(b) or 0) end)
    for _, id in ipairs(ids) do
        local valid, object = pcall(Net.get_object_by_id, area_id, id)
        if valid and object and object.type == "Liberation Enemy Defaults" then
            local values = props(object)
            local ref = reference_object(area_id, object, "Bot Config", {"Bot Config", "Liberation Enemy Config"})
            local merged = {}
            for key, value in pairs(props(ref)) do merged[key] = value end
            for key, value in pairs(values) do
                if key ~= "Bot Config" and defined(value) then merged[key] = value end
            end
            local group = trim(values.Category)
            if group == "All" or group == "" then
                index.all = merged
            else
                index.categories[group] = merged
            end
        end
    end
    return index
end

function Config.prepare_area(area_id)
    if not area_default_indexes[area_id] then
        area_default_indexes[area_id] = index_area_defaults(area_id)
    end
end

function Config.clear_area(area_id)
    area_default_indexes[area_id] = nil
end

local function area_defaults(area_id, category)
    Config.prepare_area(area_id)
    local index = area_default_indexes[area_id]
    return index.categories[category] or {}, index.all
end

function Config.resolve(area_id, source, legacy_health_property, category)
    local own = props(source)
    category = category or "Dark Hole"
    local bot_ref = reference_object(area_id, source, "Bot Config", {"Bot Config", "Liberation Enemy Config"})
        or reference_object(area_id, source, "Enemy Config", {"Liberation Enemy Config", "Bot Config"})
    local shared = props(bot_ref)
    local encounter_ref = reference_object(area_id, source, "OW Encounter Config", {"Encounter Config", "Liberation Encounter Pool"})
    local encounter = props(encounter_ref)
    local defaults, global = area_defaults(area_id, category)
    local function first(layers, key, allow_zero)
        for _, layer in ipairs(layers) do
            if allow_zero then
                if layer[key] ~= nil and layer[key] ~= "" then return layer[key] end
            elseif defined(layer[key]) then return layer[key] end
        end
        return nil
    end
    local bot_layers = {own, shared, defaults, global}
    local encounter_layers = {own, encounter, shared, defaults, global}
    local function bot(key) return first(bot_layers, key) end
    local function enc(key) return first(encounter_layers, key) end
    local function positive(key) return numeric(bot(key), false) end
    local function text(value) local v = trim(value); return v ~= "" and v or nil end
    local function bot_text(key) return text(bot(key)) end
    local function enc_text(key) return text(enc(key)) end
    local legacy_hp = numeric(own[legacy_health_property], false)
    local max_hp = numeric(own["Max HP"], false) or legacy_hp or positive("Max HP")
    local starting_hp = positive("Starting HP")
    local legacy_scale = numeric(own.scale, false)
    local ow_scale = numeric(own["OW Scale"], false)
        or (legacy_scale ~= 1 and legacy_scale or nil)
        or positive("OW Scale") or legacy_scale or numeric(shared.scale, false)
    local explicit_battle_scale = positive("Battle Scale")
    local battle_scale = explicit_battle_scale or ow_scale
    local scope = bot_text("Battle Scale Scope")
    if scope ~= "All" then scope = "Matching" end
    local template_name = bot_text("Spawns") or bot_text("Enemy Template") or bot_text("Boss")
    local healing = numeric(first(bot_layers, "Heal Percent Per Turn", true), true)
    local flat_healing = numeric(first(bot_layers, "Heal Flat Per Turn", true), true)
    if healing == nil then healing = category == "Boss" and 10 or 0 end
    if flat_healing == nil then flat_healing = 0 end
    local name = enc_text("Encounter Name") or enc_text("OW Bot Encounter") or enc_text("Boss Encounter")
    local mode = enc_text("Encounter Mode") or "Auto"
    local pool = enc("Encounter Pool") or enc("OW Encounter Pool")
    -- An Encounter Config can itself be the numbered weighted pool.
    if not pool and encounter_ref and mode == "Pool" then pool = encounter_ref.id end
    local resolved = {
        template_name = template_name,
        max_hp = max_hp, starting_hp = starting_hp,
        ow_scale = ow_scale, battle_scale = battle_scale,
        battle_scale_explicit = explicit_battle_scale ~= nil,
        battle_scale_scope = scope,
        ow_attack_damage = positive("OW Attack Damage"),
        ow_damage_multiplier = positive("OW Damage Multiplier"),
        ow_defense_multiplier = positive("OW Defense Multiplier"),
        battle_attack_multiplier = positive("Battle Attack Multiplier"),
        battle_defense_multiplier = positive("Battle Defense Multiplier"),
        ai_type = (function() local v = bot_text("AI Type"); return v ~= "Auto" and v or nil end)(),
        -- Optional profile overrides; 0 inherits except movement tiles where
        -- 0 explicitly means stationary/no reposition.
        ow_attack_shape = bot_text("OW Attack Shape"),
        ow_attack_range = positive("OW Attack Range"),
        ow_move_mode = bot_text("OW Movement Mode"),
        ow_move_tiles = numeric(first(bot_layers, "OW Movement Tiles", true), true),
        ow_telegraph_seconds = positive("OW Telegraph Seconds"),
        ow_windup_seconds = positive("OW Windup Seconds"),
        ow_step_seconds = positive("OW Step Seconds"),
        heal_percent_per_turn = healing, heal_flat_per_turn = flat_healing,
        encounter_name = name, encounter_mode = mode, encounter_pool = pool,
        encounter_category = enc_text("Encounter Category"),
    }
    log:debug_data("Resolved enemy configuration", {
        area_id = area_id, source_object_id = source and source.id, category = category,
        bot_config_id = bot_ref and bot_ref.id, encounter_config_id = encounter_ref and encounter_ref.id,
        template_name = template_name, max_hp = max_hp, starting_hp = starting_hp,
        ow_scale = ow_scale, battle_scale = battle_scale,
        battle_scale_scope = scope, encounter_mode = mode,
        heal_percent_per_turn = healing, heal_flat_per_turn = flat_healing,
    })
    return resolved
end

function Config.apply(enemy, cfg)
    if not enemy or not cfg then return end
    if cfg.max_hp then
        enemy.max_health = cfg.max_hp
        enemy.health = cfg.max_hp
    end
    if cfg.starting_hp then
        enemy.health = math.min(cfg.starting_hp, enemy.max_health or cfg.starting_hp)
    end
    enemy.battle_scale = cfg.battle_scale or enemy.battle_scale or enemy.scale
    enemy.battle_scale_explicit = cfg.battle_scale_explicit == true
    enemy.battle_scale_scope = cfg.battle_scale_scope or "Matching"
    if cfg.ow_attack_damage then enemy.attack_damage = cfg.ow_attack_damage end
    if cfg.ow_damage_multiplier then enemy.ow_damage_multiplier = cfg.ow_damage_multiplier end
    if cfg.ow_defense_multiplier then enemy.ow_defense_multiplier = cfg.ow_defense_multiplier end
    if cfg.battle_attack_multiplier then enemy.battle_attack_multiplier = cfg.battle_attack_multiplier end
    if cfg.battle_defense_multiplier then enemy.battle_defense_multiplier = cfg.battle_defense_multiplier end
    if cfg.ai_type then enemy.ai_type = cfg.ai_type end
    if type(enemy.attack_profile) == "table" then
        local overrides = cfg.ow_attack_shape or cfg.ow_attack_range
            or cfg.ow_move_mode or cfg.ow_move_tiles ~= nil
            or cfg.ow_telegraph_seconds or cfg.ow_windup_seconds or cfg.ow_step_seconds
        if overrides then
            -- Profiles belong to a template, but one Tiled bot can customize
            -- its own instance without mutating other enemies' shared tables.
            local function clone(value)
                if type(value) ~= "table" then return value end
                local result = {}
                for k, v in pairs(value) do result[k] = clone(v) end
                return result
            end
            local profile = clone(enemy.attack_profile)
            profile.movement = profile.movement or {}
            if cfg.ow_move_mode and cfg.ow_move_mode ~= "Auto" then
                profile.movement.mode = cfg.ow_move_mode
            end
            if cfg.ow_move_tiles ~= nil then profile.movement.tiles = cfg.ow_move_tiles end
            if cfg.ow_telegraph_seconds then profile.telegraph_seconds = cfg.ow_telegraph_seconds end
            if cfg.ow_windup_seconds then profile.windup_seconds = cfg.ow_windup_seconds end
            local shapes = {line=true,arc=true,cone=true,cross=true,diamond=true}
            local selected = cfg.ow_attack_shape
            if selected == "Auto" or not shapes[selected] then selected = nil end
            if selected then
                profile.telegraph = {shape_type=selected,range=cfg.ow_attack_range or 1}
            elseif cfg.ow_attack_range and type(profile.telegraph)=="table" then
                profile.telegraph.range = cfg.ow_attack_range
            end
            for _, stage in ipairs(profile.stages or {}) do
                if cfg.ow_attack_range and stage.range then stage.range = cfg.ow_attack_range end
                if selected then
                    -- Replace the old shape consistently across all stages.
                    -- Motion still determines the traveling tile offsets.
                    stage.shape_type = selected
                    if stage.motion == "travel" then stage.motion = nil end
                end
                if cfg.ow_step_seconds then stage.duration = cfg.ow_step_seconds end
            end
            enemy.attack_profile = profile
        end
    end
    enemy.heal_percent_per_turn = cfg.heal_percent_per_turn
    enemy.heal_flat_per_turn = cfg.heal_flat_per_turn
    enemy.encounter_mode = cfg.encounter_mode
    enemy.encounter_pool = cfg.encounter_pool
    enemy.encounter_category = cfg.encounter_category
    if cfg.encounter_name then enemy.ow_bot_encounter_name = cfg.encounter_name end
end
return Config
