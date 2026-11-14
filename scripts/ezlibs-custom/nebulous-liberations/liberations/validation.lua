-- Map-level diagnostic validation for Liberation object references and values.
-- Never prevents other maps/objects from loading; affected invalid spawns are
-- handled by the existing spawn/encounter fallbacks.
local Constants = require("scripts/ezlibs-custom/nebulous-liberations/liberations/constants")
local EnemyConfig = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_config")
local Numbered = require("scripts/ezlibs-custom/nebulous-liberations/liberations/numbered_properties")
local log = require("scripts/ezlibs-custom/nebulous-liberations/liberations/logger").map_problems
local Validation = {}

local function props(object) return object and object.custom_properties or {} end
local function present(value) return value ~= nil and value ~= "" and value ~= 0 and value ~= "0" end
local function report(level, area, obj, field, message, value, action)
    local record = {
        area_id = area, object_id = obj and obj.id, object_type = obj and obj.type,
        object_name = obj and obj.name, x = obj and obj.x, y = obj and obj.y,
        property = field, actual = value == nil and "<missing>" or tostring(value),
        action = action or "inspect map",
    }
    if level == "ERROR" then log:error_data(message, record)
    else log:warn_data(message, record) end
end

local function check_ref(area, obj, field, expected)
    local ref = props(obj)[field]
    if not present(ref) then return nil, true end
    local id = tonumber(ref)
    local value
    if id and id > 0 then
        local ok, result = pcall(Net.get_object_by_id, area, id)
        if ok then value = result end
    end
    local valid = false
    if value then
        for _, class in ipairs(expected) do if value.type == class then valid = true end end
    end
    if not valid then
        report("ERROR", area, obj, field, "Missing or wrong-class Tiled object reference",
            ref, "choose " .. table.concat(expected, " / ") .. " object")
    end
    return value, valid
end

local enum_choices = {
    ["Direction"] = {"Up", "Down", "Left", "Right", "Up Left", "Up Right", "Down Left", "Down Right"},
    ["AI Type"] = {"Auto", "simple_charge", "ranged", "shockwave_line"},
    ["Battle Scale Scope"] = {"Auto", "Matching", "All"},
    ["Encounter Mode"] = {"Auto", "Fixed", "Pool", "Category"},
    ["Encounter Category"] = {"Auto", "encounters", "special_encounters", "bosses"},
    ["Spawn Mode"] = {"Immediate", "On Dark Hole Cleared", "Manual", "After Boss Defeated"},
    ["Type"] = {"All", "Any"},
}
local function check_enums(area, obj)
    local valid = true
    for field, options in pairs(enum_choices) do
        local raw = props(obj)[field]
        if raw ~= nil and raw ~= "" and (field ~= "Type" or obj.type == "Indestructible Panel") then
            local found = false
            for _, choice in ipairs(options) do if raw == choice then found = true; break end end
            if not found then
                report("ERROR", area, obj, field, "Invalid enum value", raw,
                    "use one of: " .. table.concat(options, ", "))
                valid = false
            end
        end
    end
    return valid
end

local non_negative_fields = {
    "Max HP", "Starting HP", "OW Scale", "Battle Scale", "OW Attack Damage",
    "OW Damage Multiplier", "OW Defense Multiplier", "Battle Attack Multiplier",
    "Battle Defense Multiplier", "Heal Percent Per Turn", "Heal Flat Per Turn",
}
local function check_numeric(area, obj)
    local valid = true
    for _, field in ipairs(non_negative_fields) do
        local raw = props(obj)[field]
        if raw ~= nil and raw ~= "" then
            local n = tonumber(raw)
            local inherited = (field == "Heal Percent Per Turn" or field == "Heal Flat Per Turn")
                and n == -1
            if not n or (n < 0 and not inherited) or n ~= n or n == math.huge then
                report("ERROR", area, obj, field, "Invalid numeric configuration", raw, "set a finite value >= 0")
                valid = false
            end
        end
    end
    return valid
end

local function check_numbered(area, obj)
    local valid = true
    local p = props(obj)
    local legacy = obj.type == "Dark Hole Encounter List" or obj.type == "Liberation Encounter Pool"
    local names, excess = Numbered.names(p, legacy)
    if #excess > 0 then
        report("WARN", area, obj, "Name #", "More than nine names on new Encounter Config",
            #excess, "use numbered fields from 1 through 9")
    end
    if legacy and #names > 9 then
        report("WARN", area, obj, "Name #", "Legacy list exceeds nine names; preserved for compatibility",
            #names, "split into smaller Encounter Config objects when ready")
    end
    if not legacy then
        local _, unused_weights = Numbered.collect(p, "Weight", 9)
        if #unused_weights > 0 then
            report("WARN", area, obj, "Weight #", "Weights above nine are ignored", #unused_weights)
        end
    end
    for _, entry in ipairs(names) do
        if not entry.weight or entry.weight <= 0 or entry.weight == math.huge then
            report("ERROR", area, obj, "Weight " .. entry.index,
                "Invalid weighted encounter entry", entry.weight, "set a positive weight")
            valid = false
        end
    end
    local name_set = {}
    for _, entry in ipairs(names) do name_set[entry.index] = true end
    for _, item in ipairs(Numbered.collect(p, "Weight", legacy and math.huge or 9)) do
        if not name_set[item.index] then
            report("WARN", area, obj, "Weight " .. item.index,
                "Weight has no matching nonempty Name", item.value, "remove unused Weight field")
        end
    end
    return valid
end

local function check_object(area, obj)
    local kind, p = obj.type, props(obj)
    local valid = true
    if not check_enums(area, obj) then valid = false end
    if kind == "Bot Config" or kind == "Liberation Enemy Config" or kind == "Liberation Enemy Defaults"
        or kind == "Dark Hole" or kind == "Dark Hole Buffed Virus" or kind == "Boss Dark Panel" then
        if not check_numeric(area, obj) then valid = false end
    end
    if kind == "Dark Hole" or kind == "Dark Hole Buffed Virus" or kind == "Boss Dark Panel" then
        local _, ok = check_ref(area, obj, "Bot Config", {"Bot Config", "Liberation Enemy Config"})
        if not ok then valid = false end
        _, ok = check_ref(area, obj, "Enemy Config", {"Liberation Enemy Config", "Bot Config"})
        if not ok then valid = false end
        _, ok = check_ref(area, obj, "OW Encounter Config", {"Encounter Config", "Liberation Encounter Pool"})
        if not ok then valid = false end
        if kind ~= "Boss Dark Panel" then
            _, ok = check_ref(area, obj, "Liberation Encounter Config", {"Encounter Config", "Dark Hole Encounter List"})
            if not ok then valid = false end
            _, ok = check_ref(area, obj, "Liberation Encounters", {"Encounter Config", "Dark Hole Encounter List"})
            if not ok then valid = false end
        end
        local category = kind == "Boss Dark Panel" and "Boss"
            or kind == "Dark Hole Buffed Virus" and "Buffed Virus" or "Dark Hole"
        local config = EnemyConfig.resolve(area, obj,
            kind == "Boss Dark Panel" and "Boss Health Override" or "Minion Health Override", category)
        if not config.template_name then
            report("ERROR", area, obj, "Bot Config",
                "No overworld bot template found", nil, "set Spawns in referenced Bot Config")
            valid = false
        end
        if not present(p.Direction) then
            report("WARN", area, obj, "Direction", "No facing direction", nil, "using Down")
        end
        if kind == "Boss Dark Panel" then
            local mode = p[Constants.CustomProperties.SpawnMode] or "Immediate"
            if mode ~= "Immediate" and mode ~= "On Dark Hole Cleared"
                and mode ~= "Manual" and mode ~= "After Boss Defeated" then
                report("ERROR", area, obj, "Spawn Mode", "Invalid boss spawn mode", mode)
                valid = false
            end
            if mode == "After Boss Defeated" and not present(p["Trigger Boss"]) then
                report("ERROR", area, obj, "Trigger Boss", "Missing required boss dependency", nil)
                valid = false
            end
        end
    elseif kind == "Bot Config" then
        if not present(p.Spawns) then
            report("WARN", area, obj, "Spawns", "Bot Config has no template", nil, "set Spawns")
        end
    elseif kind == "Encounter Config" or kind == "Dark Hole Encounter List" or kind == "Liberation Encounter Pool" then
        if not check_numbered(area, obj) then valid = false end
        if kind == "Encounter Config" then
            local _, ok = check_ref(area, obj, "Encounter Pool", {"Encounter Config", "Liberation Encounter Pool"})
            if not ok then valid = false end
        end
    elseif kind == "Liberation Enemy Defaults" then
        local _, ok = check_ref(area, obj, "Bot Config", {"Bot Config", "Liberation Enemy Config"})
        if not ok then valid = false end
    elseif kind == "Spawn Point" then
        if not present(p[Constants.CustomProperties.NextSpawn]) then
            report("WARN", area, obj, "Next Spawn", "Spawn Point has no next spawn", nil, "using default order")
        end
    elseif kind == Constants.PanelTypes.PanelGate then
        if not present(p[Constants.CustomProperties.GateKey]) then
            report("ERROR", area, obj, "Gate Key", "Panel Gate has no Gate Key", nil)
            valid = false
        end
    end
    return valid
end

function Validation.validate_area(area)
    local ok, ids = pcall(Net.list_objects, area)
    if not ok or type(ids) ~= "table" then
        report("ERROR", area, nil, "Objects", "Cannot enumerate map objects", nil)
        return false
    end
    local objects, boss_ids, boss_objects, dependencies = {}, {}, {}, {}
    local errors, has_spawn = 0, false
    for _, id in ipairs(ids) do
        local good, obj = pcall(Net.get_object_by_id, area, id)
        if good and obj then objects[#objects + 1] = obj end
    end
    for _, obj in ipairs(objects) do
        local p = props(obj)
        if obj.type == "Spawn Point" then has_spawn = true end
        if obj.type == "Boss Dark Panel" or present(p.Boss) then
            local group = present(p["Boss ID"]) and tostring(p["Boss ID"]) or tostring(obj.id)
            if boss_ids[group] then
                report("ERROR", area, obj, "Boss ID", "Duplicate boss group identifier", group)
                errors = errors + 1
            end
            boss_ids[group], boss_objects[tostring(obj.id)] = true, true
            if present(p["Trigger Boss"]) then
                dependencies[#dependencies + 1] = {obj = obj, ref = tostring(p["Trigger Boss"])}
            end
        end
    end
    for _, obj in ipairs(objects) do
        if not check_object(area, obj) then errors = errors + 1 end
        local p = props(obj)
        if obj.type == "Dark Hole" or obj.type == "Dark Hole Buffed Virus"
            or obj.type == "Indestructible Panel" then
            local _, excess = Numbered.collect(p, "Boss ID", 9)
            if #excess > 0 then
                report("WARN", area, obj, "Boss ID #", "Boss associations above 9 are ignored", #excess)
            end
            for _, ref in ipairs(Numbered.boss_ids(p)) do
                if not boss_ids[ref] and not boss_objects[ref] then
                    report("ERROR", area, obj, "Boss ID #", "Unknown boss association", ref)
                    errors = errors + 1
                end
            end
        end
        if obj.type == "Indestructible Panel" then
            local requirement = p.Type
            if present(requirement) and requirement ~= "All" and requirement ~= "Any" then
                report("ERROR", area, obj, "Type", "Invalid panel boss requirement enum", requirement,
                    "use All or Any")
                errors = errors + 1
            end
        end
    end
    for _, dependency in ipairs(dependencies) do
        if dependency.ref == tostring(dependency.obj.id) or not boss_objects[dependency.ref] then
            report("ERROR", area, dependency.obj, "Trigger Boss", "Missing/self-referential boss dependency", dependency.ref)
            errors = errors + 1
        end
    end
    if not has_spawn then
        report("ERROR", area, nil, "Spawn Point", "Map has no Liberation Spawn Point", nil)
        errors = errors + 1
    end
    return errors == 0
end

function Validation.report(area_id)
    local valid = Validation.validate_area(area_id)
    if valid then
        log:info_data("Liberation map validation passed", {area_id = area_id})
    else
        log:warn_data("Liberation map validation found problems", {area_id = area_id})
    end
    return valid
end
return Validation
