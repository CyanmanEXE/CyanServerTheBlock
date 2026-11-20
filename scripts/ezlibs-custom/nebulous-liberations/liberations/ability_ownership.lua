-- Permanent unlocks and the currently equipped Liberation ability are separate.
-- ezmemory inventory items remain the runtime equipment representation used by
-- older systems. Persistent unlocks survive removal of the former item.
local EzMemory = require("scripts/ezlibs-scripts/ezmemory")
local Helpers = require("scripts/ezlibs-scripts/helpers")
local Logger = require("scripts/logger/logger")
local log = Logger.register("nebulous-liberations"):register_subsystem("ability-ownership")

local Ownership = {}

-- Names are the existing ezmemory item IDs from the Gold Prog catalog.
Ownership.ids = {
    "HeroSwrd", "WideSwrd", "OldSaber", "Guard", "HevyShld",
    "HexSickle", "NumGadgt", "GutsHamr", "ShdwShoe", "CrosBmb",
    "Burner", "Blaster", "Bazooka",
}
-- Older mission code used these IDs for the same abilities. Their inventory
-- entries must be detected and removed when switching to another ability.
Ownership.legacy_ids = { "LongSwrd", "HexScyth" }
-- LongSwrd is NOT HeroSwrd: they have different shapes in the original
-- ability.lua. Keep LongSwrd as a legacy-equipped ability, outside the
-- 13-item Gold Prog catalog. HexScyth is the older name for HexSickle.
Ownership.legacy_aliases = { HexScyth = "HexSickle" }

-- All thirteen catalog entries now map to a Liberation action or passive.
-- Keep this list synchronized with liberations/ability.lua's item map.
Ownership.supported = {
    LongSwrd=true, HeroSwrd=true, WideSwrd=true, OldSaber=true, Guard=true,
    HevyShld=true, HexSickle=true, NumGadgt=true, GutsHamr=true,
    ShdwShoe=true, CrosBmb=true, Burner=true, Blaster=true,
    Bazooka=true,
}

local valid = {}
for _, id in ipairs(Ownership.ids) do valid[id] = true end
valid.LongSwrd = true -- older non-shop mission ability

function Ownership.normalize(id)
    id = Ownership.legacy_aliases[id] or id
    return valid[id] and id or nil
end

function Ownership.is_supported(id)
    id = Ownership.normalize(id)
    return id ~= nil and Ownership.supported[id] == true
end

local function memory_record(player_id)
    local secret = Helpers.get_safe_player_secret(player_id)
    local memory = EzMemory.get_player_memory(secret)
    if type(memory.liberation_abilities) ~= "table" then
        memory.liberation_abilities = {}
    end
    local record = memory.liberation_abilities
    if type(record.unlocked) ~= "table" then record.unlocked = {} end
    return record, secret
end

local function count(player_id, id)
    return tonumber(EzMemory.count_player_item(player_id, id)) or 0
end

local function inventory_ids(player_id)
    local held = {}
    for _, id in ipairs(Ownership.ids) do
        if count(player_id, id) > 0 then held[#held + 1] = id end
    end
    for _, id in ipairs(Ownership.legacy_ids) do
        if count(player_id, id) > 0 then held[#held + 1] = id end
    end
    return held
end

-- Only an actual equipped item is treated as equipped. The stored name is a
-- preference, not permission to resurrect an externally removed inventory item.
function Ownership.get_equipped(player_id)
    local record = memory_record(player_id)
    local preferred = Ownership.normalize(record.equipped)
    local first
    for _, id in ipairs(inventory_ids(player_id)) do
        local canonical = Ownership.normalize(id)
        if canonical and canonical == preferred then return canonical end
        if canonical and not first then first = canonical end
    end
    return first
end

-- Migrate existing/legacy single-ability inventories once per shop interaction,
-- without taking items or creating new unlocks from an empty inventory.
function Ownership.sync(player_id)
    local record, secret = memory_record(player_id)
    local changed = false
    for _, id in ipairs(inventory_ids(player_id)) do
        local canonical = Ownership.normalize(id)
        if canonical and record.unlocked[canonical] ~= true then
            record.unlocked[canonical] = true
            changed = true
        end
    end
    local equipped = Ownership.get_equipped(player_id)
    if record.equipped ~= equipped then
        record.equipped = equipped
        changed = true
    end
    if changed then EzMemory.save_player_memory(secret) end
    return equipped
end

function Ownership.is_unlocked(player_id, ability_id)
    local id = Ownership.normalize(ability_id)
    if not id then return false end
    local record = memory_record(player_id)
    if record.unlocked[id] == true then return true end
    -- Compatibility with players who earned an item before this feature.
    for _, held in ipairs(inventory_ids(player_id)) do
        if Ownership.normalize(held) == id then return true end
    end
    return false
end

-- External quests or another NPC can award an ability without equipping it:
-- require(".../ability_ownership").unlock(player_id, "WideSwrd")
function Ownership.unlock(player_id, ability_id)
    local id = Ownership.normalize(ability_id)
    if not id then return false, "unknown ability: " .. tostring(ability_id) end
    local record, secret = memory_record(player_id)
    if record.unlocked[id] ~= true then
        record.unlocked[id] = true
        EzMemory.save_player_memory(secret)
        log:info_data("Liberation ability unlocked", {player_id=player_id, ability=id})
    end
    return true
end

local function restore_inventory(player_id, previous)
    -- If a later removal fails, best-effort restore all original inventory
    -- counts rather than leave both old and newly granted abilities held.
    for id, previous_count in pairs(previous) do
        local actual = count(player_id, id)
        if actual > previous_count then
            local ok, result = pcall(EzMemory.remove_player_item, player_id, id, actual - previous_count)
            if not ok or (tonumber(result) or -1) ~= previous_count then
                log:error_data("Ability switch rollback removal failed", {player_id=player_id, ability=id})
            end
        elseif actual < previous_count then
            local ok, result = pcall(EzMemory.give_player_item, player_id, id, previous_count - actual)
            if not ok or (tonumber(result) or -1) ~= previous_count then
                log:error_data("Ability switch rollback award failed", {player_id=player_id, ability=id})
            end
        end
    end
end

function Ownership.equip(player_id, ability_id)
    local id = Ownership.normalize(ability_id)
    if not id then return false, "unknown ability: " .. tostring(ability_id) end
    if not Ownership.is_supported(id) then
        return false, "Liberation action not implemented for: " .. id
    end
    if not EzMemory.get_item_id_by_name(id) then
        return false, "ability item is not registered: " .. id
    end
    Ownership.sync(player_id)
    local previous = {}
    for _, held in ipairs(inventory_ids(player_id)) do
        previous[held] = count(player_id, held)
    end
    previous[id] = previous[id] or 0

    -- Award before removal: a failed grant cannot leave the player without
    -- their current Liberation ability.
    if count(player_id, id) < 1 then
        local ok, amount = pcall(EzMemory.give_player_item, player_id, id, 1)
        if not ok or tonumber(amount) == nil or amount < 1 then
            return false, "ezmemory could not give ability: " .. id
        end
    end
    if count(player_id, id) < 1 then
        return false, "ability missing after grant: " .. id
    end

    for _, held in ipairs(inventory_ids(player_id)) do
        if held ~= id then
            local n = count(player_id, held)
            if n > 0 then
                local ok, remaining = pcall(EzMemory.remove_player_item, player_id, held, n)
                if not ok or (tonumber(remaining) or 0) > 0 then
                    log:error_data("Could not remove old Liberation ability", {
                        player_id=player_id, ability=held, remaining=tostring(remaining),
                    })
                    restore_inventory(player_id, previous)
                    return false, "old ability could not be removed: " .. held
                end
            end
        end
    end
    local record, secret = memory_record(player_id)
    record.unlocked[id] = true
    record.equipped = id
    EzMemory.save_player_memory(secret)
    log:info_data("Liberation ability equipped", {player_id=player_id, ability=id})
    return true
end

return Ownership
