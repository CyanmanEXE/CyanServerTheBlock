-- Dedicated Liberation Ability Prog shop. The NPC itself is spawned/handled
-- by eznpcs; its synthetic Dialogue event calls this module.
-- Uses the existing MenuAPI scroll_list and its built-in gold palette.
local MenuAPI = require("scripts/net-games/menuAPI/main")
local EzMemory = require("scripts/ezlibs-scripts/ezmemory")
local Ownership = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ability_ownership")
local Logger = require("scripts/logger/logger")
local log = Logger.register("nebulous-liberations"):register_subsystem("ability-shop")

local Shop = {}
Shop.EVENT_NAME = "Liberation Ability Shop"
Shop.OBJECT_TYPE = "Liberation Ability Prog"

-- Same canonical item names and descriptions as the existing eznpcs grant
-- event: preserve player inventories and Liberation ability resolution.
Shop.catalog = {
    { id = "HeroSwrd",   name = "Hero Sword",   description = "A Hero Sword Chip. Use it in Liberations!" },
    { id = "WideSwrd",   name = "Wide Sword",   description = "A Wide Sword Chip. Use it in Liberations!" },
    { id = "OldSaber",   name = "Old Saber",    description = "A Saber projection hilt, scarred with age. Use it in Liberations!" },
    { id = "Guard",      name = "Guard",        description = "Guards you and your teammates!" },
    { id = "HevyShld",   name = "Heavy Shield", description = "A heavy shield, great for defense. Use it in Liberations!" },
    { id = "HexSickle",  name = "Hex Sickle",   description = "A wicked scythe which cleaves most anything. Use it in Liberations!" },
    { id = "NumGadgt",   name = "Num Gadget",   description = "A gadget that's constantly calculating outcomes. Use it in Liberations!" },
    { id = "GutsHamr",   name = "Guts Hammer",  description = "A hammer that takes guts to wield. Use it in Liberations!" },
    { id = "ShdwShoe",   name = "Shadow Shoe",  description = "Delicate shoes that let you walk on air. Wear them in Liberations!" },
    { id = "CrosBmb",    name = "Cross Bomb",   description = "A hefty bomb to blow up panels in a plus shape. Use it in Liberations!" },
    { id = "Burner",     name = "Burner",       description = "A powerful fire blast to burn up what stands in your way. Use it in Liberations!" },
    { id = "Blaster",    name = "Blaster",      description = "A well rounded buster that fires in a T shape. Use it in Liberations!" },
    { id = "Bazooka",    name = "Bazooka",      description = "A destructive and powerful weapon. Use it in Liberations!" },
}

local by_id = {}
for _, ability in ipairs(Shop.catalog) do by_id[ability.id] = ability end

local function is_true(value)
    return value == true or value == 1 or value == "1"
        or (type(value) == "string" and value:lower() == "true")
end

function Shop.ensure_items()
    for _, item in ipairs(Shop.catalog) do
        -- Reuse the existing item ID; creating a duplicate would lose ownership.
        local id = EzMemory.get_item_id_by_name(item.id)
        if not id then EzMemory.create_or_update_item(item.id, item.description, true) end
    end
end

-- "Owned" means currently equipped; permanent unlocks are tracked separately.
function Shop.is_owned(player_id, ability_id)
    return Ownership.get_equipped(player_id) == Ownership.normalize(ability_id)
end

Shop.is_unlocked = Ownership.is_unlocked
Shop.unlock = Ownership.unlock
Shop.get_equipped = Ownership.get_equipped
Shop.is_supported = Ownership.is_supported

-- Switch inventory equipment while keeping all previously purchased/earned
-- abilities in persistent unlock memory. Existing legacy grant events use this.
function Shop.grant(player_id, ability_id)
    -- HexScyth uses the canonical HexSickle item. LongSwrd is different
    -- from HeroSwrd and remains available for legacy quiz grants only.
    local id = Ownership.normalize(ability_id)
    if not id or (not by_id[id] and id ~= "LongSwrd") then
        return false, "unknown ability: " .. tostring(ability_id)
    end
    Shop.ensure_items()
    if id == "LongSwrd" and not EzMemory.get_item_id_by_name(id) then
        EzMemory.create_or_update_item(id, "A Long Sword Chip. Use it in Liberations!", true)
    end
    return Ownership.equip(player_id, id)
end

-- Numbered properties are strings from Tiled. Cost is only charged when
-- Enable Costs is true. Omitted/zero Cost N means Free when enabled.
function Shop.read_offerings(properties)
    properties = properties or {}
    local enable_costs = is_true(properties["Enable Costs"])
    local offerings, seen = {}, {}
    for i = 1, #Shop.catalog do
        local id = properties["Ability " .. i]
        if type(id) == "string" then id = id:match("^%s*(.-)%s*$") end
        if id and id ~= "" then
            if by_id[id] and not seen[id] then
                seen[id] = true
                local raw_cost = tonumber(properties["Cost " .. i]) or 0
                local cost = math.max(0, math.floor(raw_cost))
                offerings[#offerings + 1] = {
                    id = id, name = by_id[id].name,
                    cost = enable_costs and cost or 0,
                    costs_enabled = enable_costs,
                    requires_unlock = is_true(properties["Requires Unlock " .. i]),
                }
            else
                log:warn_data("Unknown ability on Gold Prog", {
                    slot = i, ability = tostring(id),
                })
            end
        end
    end
    return offerings
end

local function menu_rows(player_id, offerings)
    local rows = {}
    local equipped = Shop.get_equipped(player_id)
    for _, item in ipairs(offerings) do
        local current = equipped == item.id
        local unlocked = Shop.is_unlocked(player_id, item.id)
        local supported = Shop.is_supported(item.id)
        local locked = item.requires_unlock and not unlocked
        local right
        if current then right = "Owned"
        elseif not supported then right = "Unavailable"
        elseif unlocked then right = "Unlocked"
        elseif locked then right = "Locked"
        elseif item.costs_enabled then
            right = item.cost == 0 and "Free" or tostring(item.cost) .. " Z"
        end
        rows[#rows + 1] = {
            id = item.id,
            text = #item.name <= 11 and item.name or item.id,
            right = right,
            selectable = supported and not current and not locked,
            tint = (current or unlocked) and {r=115, g=95, b=55, color_mode=2} or nil,
        }
    end
    rows[#rows + 1] = { id = "cancel", text = "Cancel" }
    return rows
end

local function player_still_here(player_id, initial_area)
    if type(Net.is_player) == "function" and not Net.is_player(player_id) then return false end
    return Net.get_player_area(player_id) == initial_area
end

function Shop.open(npc, player_id)
    return Async.create_promise(function(resolve)
        local area_id = Net.get_player_area(player_id)
        local properties = npc and npc.placeholder_custom_properties or {}
        local offerings = Shop.read_offerings(properties)
        local resolved = false
        local function finish()
            if not resolved then resolved = true; resolve(nil) end
        end
        if #offerings == 0 then
            log:warn_data("Gold Prog has no valid offerings", {
                player_id = player_id, area_id = area_id,
                placeholder_id = npc and npc.placeholder_id,
            })
            finish()
            return
        end
        -- Register canonical IDs and capture old inventory into persistent
        -- unlock flags before showing the shop.
        local ok, err = pcall(function()
            Shop.ensure_items()
            Ownership.sync(player_id)
        end)
        if not ok then
            log:error_data("Gold Prog item catalog unavailable", {error=tostring(err)})
            finish()
            return
        end

        local function show_menu()
            if not player_still_here(player_id, area_id) then finish(); return end
            local state, open_error = MenuAPI.open(player_id, {
            type = "scroll_list",
            palette = "gold",  -- native MenuAPI gold title, rows and prices
            bg_tint = { r = 217, g = 168, b = 72, color_mode = 2 },
            title = "Gold Shop",
            rows = menu_rows(player_id, offerings),
            layout = {
                row_scale = 1.25,
                right_scale = 1.0,
                right_x = 104,
                visible_rows = 8,
            },
            close_on_select = false,
            on_close = finish,
            on_select = function(row)
                if row.id == "cancel" then
                    MenuAPI.close(player_id, {reason = "cancel"})
                    return
                end
                if not player_still_here(player_id, area_id) then
                    MenuAPI.close(player_id, {reason = "area_changed"})
                    return
                end
                local selected
                for _, offer in ipairs(offerings) do
                    if offer.id == row.id then selected = offer; break end
                end
                if not selected or Shop.is_owned(player_id, row.id) then return end
                if not Shop.is_supported(row.id) then
                    MenuAPI.set_title(player_id, "Not available")
                    return
                end
                local unlocked = Shop.is_unlocked(player_id, row.id)
                if selected.requires_unlock and not unlocked then
                    MenuAPI.set_title(player_id, "Ability locked")
                    return
                end
                -- Charge only once. Re-equipping an unlocked ability is free.
                local charged = not unlocked and selected.costs_enabled and selected.cost > 0
                if charged then
                    local balance = EzMemory.get_player_money(player_id)
                    if not balance or balance < selected.cost then
                        MenuAPI.set_title(player_id, "Not enough Z")
                        return
                    end
                    if not EzMemory.spend_player_money(player_id, selected.cost) then
                        MenuAPI.set_title(player_id, "Not enough Z")
                        return
                    end
                end
                local success, grant_err = Shop.grant(player_id, row.id)
                if not success then
                    if charged then
                        EzMemory.add_player_money(player_id, selected.cost)
                    end
                    log:error_data("Gold Prog ability grant failed", {
                        player_id = player_id, ability = row.id,
                        error = tostring(grant_err),
                    })
                    MenuAPI.set_title(player_id, "Grant failed")
                    return
                end
                -- No menu teardown; only rows and their right-hand values
                -- update, avoiding background flicker while showing Owned.
                MenuAPI.set_title(player_id, "Gold Shop")
                MenuAPI.set_rows(player_id, menu_rows(player_id, offerings), true)
            end,
            on_move = function()
                if player_still_here(player_id, area_id) then
                    MenuAPI.set_title(player_id, "Gold Shop")
                end
            end,
        })
            if not state then
                log:error_data("Gold Prog menu open failed", {error=tostring(open_error)})
                finish()
            end
        end

        -- Optional gold-frame welcome text, dismissed before the shop opens.
        -- The existing eznpcs Text 1 is accepted for older placed Progs.
        local welcome = properties["Welcome Text"] or properties["Text 1"]
        if type(welcome) == "string" and welcome ~= "" then
            local BNTextbox = require("scripts/net-games/bn-textbox")
            local dialogue, dialogue_error = BNTextbox.show(player_id, welcome, {
                name = "GOLD PROG",
                font = "THIN",
                text_tint = {r=145, g=95, b=20, color_mode=2},
                frame_tint = {r=207, g=160, b=58, color_mode=2},
                mugshot_texture = "/server/assets/ezlibs-assets/eznpcs/mug/prog-gold.png",
                mugshot_anim_path = "/server/assets/ezlibs-assets/eznpcs/mug/prog-gold.animation",
                on_finish = show_menu,
            })
            if not dialogue then
                log:warn_data("Gold Prog welcome dialogue unavailable", {
                    error = tostring(dialogue_error),
                })
                show_menu()
            end
        else
            show_menu()
        end
    end)
end

function Shop.register(eznpcs)
    eznpcs.add_event({
        name = Shop.EVENT_NAME,
        action = function(npc, player_id)
            return async(function()
                await(Shop.open(npc, player_id))
            end)
        end,
    })
end

return Shop
