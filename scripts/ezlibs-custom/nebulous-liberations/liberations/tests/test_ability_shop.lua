-- From the server root:
-- lua scripts/ezlibs-custom/nebulous-liberations/liberations/tests/test_ability_shop.lua
-- Isolated tests exercise the real Shop, Ownership, and Ability Lua modules.
local account = { money = 500, items = {HeroSwrd = 1}, memory = {}, registered = {} }
local last_menu, close_count
package.preload["scripts/net-games/menuAPI/main"] = function()
    return {
        open = function(_, spec) last_menu = spec; return {spec=spec} end,
        set_rows = function(_, rows) last_menu.rows=rows; return true end,
        set_title = function(_, title) last_menu.title=title; return true end,
        close = function(_, _) close_count=(close_count or 0)+1; last_menu.on_close(); return true end,
    }
end
package.preload["scripts/ezlibs-scripts/helpers"] = function()
    return { get_safe_player_secret=function(id) return "secret:" .. tostring(id) end }
end
local saved = 0
package.preload["scripts/ezlibs-scripts/ezmemory"] = function()
    return {
        get_player_memory = function() return account.memory end,
        save_player_memory = function() saved = saved + 1 end,
        get_item_id_by_name = function(name) return account.registered[name] and name end,
        create_or_update_item = function(name) account.registered[name]=true; return name end,
        count_player_item = function(_, name) return account.items[name] or 0 end,
        remove_player_item = function(_, name)
            if account.fail_remove and name == account.fail_remove then
                return account.items[name] or 0
            end
            account.items[name]=nil
            return 0
        end,
        give_player_item = function(_, name, count)
            if account.fail_grant then return 0 end
            account.items[name]=(account.items[name] or 0)+(count or 1)
            return account.items[name]
        end,
        get_player_money = function() return account.money end,
        spend_player_money = function(_, price)
            if account.money < price then return false end
            account.money=account.money-price;return true
        end,
        add_player_money = function(_, price) account.money=account.money+price;return account.money end,
    }
end
package.preload["scripts/logger/logger"] = function()
    local log={warn_data=function()end,error_data=function()end,info_data=function()end}
    return {register=function()return{register_subsystem=function()return log end}end}
end
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/panel_encounters"] = function()
    return {}
end
Net = {get_player_area=function() return "default" end, is_player=function() return true end}
Async = {create_promise=function(fn) fn(function()end); return {ok=true} end}
local Shop = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ability_shop")
local Ownership = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ability_ownership")
local Ability = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ability")

local function show(props)
    Shop.open({placeholder_custom_properties=props}, "p")
    return last_menu
end
local function choose(id)
    for _, row in ipairs(last_menu.rows) do
        if row.id == id then
            assert(row.selectable ~= false, id .. " is not selectable")
            last_menu.on_select(row)
            return
        end
    end
    error("No row: " .. tostring(id))
end
local function right(id)
    for _, row in ipairs(last_menu.rows) do
        if row.id == id then return row.right, row.selectable end
    end
    return nil
end
local player = {id = "p"}
local props = {
    ["Ability 1"]="HeroSwrd", ["Cost 1"]=225,
    ["Ability 2"]="WideSwrd", ["Cost 2"]=125,
    ["Ability 3"]="HexSickle", ["Cost 3"]=80,
    ["Enable Costs"]=true,
}
show(props)
assert(right("HeroSwrd") == "Owned")
assert(Ability.resolve_for_player(player) == Ability.HeroSwrd, "HeroSwrd must use its own three-panel ability")
choose("WideSwrd")
assert(account.items.HeroSwrd == nil and account.items.WideSwrd == 1, "old item must be replaced")
assert(account.money == 375, "first purchase costs 125")
assert(Shop.get_equipped("p") == "WideSwrd")
assert(Ability.resolve_for_player(player) == Ability.WideSwrd, "new ability must resolve in Liberation")
assert(right("WideSwrd") == "Owned" and right("HeroSwrd") == "Unlocked")
choose("HeroSwrd")
assert(account.items.WideSwrd == nil and account.items.HeroSwrd == 1)
assert(account.money == 375, "re-equipping an unlocked ability is free")
choose("WideSwrd")
assert(account.money == 375, "previously purchased ability stays unlocked")
assert(account.memory.liberation_abilities.unlocked.HeroSwrd == true)
assert(account.memory.liberation_abilities.unlocked.WideSwrd == true)
assert(account.memory.liberation_abilities.equipped == "WideSwrd")
last_menu.on_close()
-- Second shop visit / new session uses persistent unlocks.
show(props)
assert(right("WideSwrd") == "Owned" and right("HeroSwrd") == "Unlocked")
choose("HexSickle")
assert(Ability.resolve_for_player(player) == Ability.HexSickle)
assert(account.money == 295)
last_menu.on_close()

-- Free shop rows display no price until unlocked; unlocking persists.
account.items={}; account.memory={}; account.money=500
show({["Ability 1"]="HeroSwrd",["Ability 2"]="WideSwrd"})
assert(right("HeroSwrd") == nil)
choose("HeroSwrd")
assert(right("HeroSwrd") == "Owned")
choose("WideSwrd")
assert(right("HeroSwrd") == "Unlocked")
last_menu.on_close()

-- Quest-gated ability cannot be bought until an external unlock event runs.
account.items={}; account.memory={}; account.money=500
show({["Ability 1"]="WideSwrd",["Requires Unlock 1"]=true,["Cost 1"]=100,["Enable Costs"]=true})
assert(right("WideSwrd") == "Locked")
assert(Shop.unlock("p", "WideSwrd"))
assert(Shop.is_unlocked("p", "WideSwrd"))
last_menu.on_close()
show({["Ability 1"]="WideSwrd",["Requires Unlock 1"]=true,["Cost 1"]=100,["Enable Costs"]=true})
assert(right("WideSwrd") == "Unlocked")
choose("WideSwrd")
assert(account.money == 500, "earned unlock must not charge")
last_menu.on_close()

-- Failed grants must leave old ability and money intact.
account.items={HeroSwrd=1}; account.memory={}; account.money=500
account.fail_grant=true
show({["Ability 1"]="HeroSwrd",["Ability 2"]="WideSwrd",["Cost 2"]=125,["Enable Costs"]=true})
choose("WideSwrd")
assert(account.items.HeroSwrd == 1 and not account.items.WideSwrd)
assert(account.money == 500, "failed paid grant must be refunded")
account.fail_grant=false
last_menu.on_close()

-- Legacy inventories containing pre-shop item IDs are migrated on open.
account.items={HexScyth=1}; account.memory={}; account.money=500
show({["Ability 1"]="HexSickle",["Ability 2"]="Guard"})
assert(right("HexSickle") == "Owned")
assert(account.memory.liberation_abilities.unlocked.HexSickle)
assert(Ability.resolve_for_player(player) == Ability.HexSickle)
choose("Guard")
assert(account.items.HexScyth == nil and account.items.Guard == 1)
assert(Ability.resolve_for_player(player) == Ability.Guard)
last_menu.on_close()


-- Legacy quiz aliases must route through the canonical shop grant path.
account.items={}; account.memory={}; account.money=500
assert(Shop.grant("p", "LongSwrd"))
assert(account.items.LongSwrd == 1)
assert(Ability.resolve_for_player(player) == Ability.LongSwrd)
local long_shape = Ability.LongSwrd.generate_shape()
assert(#long_shape == 2 and #long_shape[1] == 1)
local hero_shape = Ability.HeroSwrd.generate_shape()
assert(#hero_shape == 3 and #hero_shape[1] == 1)
assert(Shop.grant("p", "HexScyth"))
assert(account.items.LongSwrd == nil and account.items.HexSickle == 1)

-- Simulated removal failure should undo the newly granted item and leave the
-- previous equipped ability untouched. The paid shop refunds when this occurs.
account.items={HeroSwrd=1}; account.memory={}; account.money=500
account.fail_remove="HeroSwrd"
show({["Ability 1"]="HeroSwrd",["Ability 2"]="WideSwrd",["Cost 2"]=125,["Enable Costs"]=true})
choose("WideSwrd")
assert(account.items.HeroSwrd == 1 and not account.items.WideSwrd)
assert(account.money == 500, "failed replacement must refund cost")
assert(Ability.resolve_for_player(player) == Ability.HeroSwrd)
account.fail_remove=nil
last_menu.on_close()
-- Old LongSwrd inventory must not imply HeroSwrd was unlocked.
account.items={LongSwrd=1}; account.memory={}; account.money=500
show({["Ability 1"]="HeroSwrd",["Ability 2"]="WideSwrd"})
assert(right("HeroSwrd") == nil)
assert(Ability.resolve_for_player(player) == Ability.LongSwrd)
choose("HeroSwrd")
assert(account.items.LongSwrd == nil and account.items.HeroSwrd == 1)
assert(Ability.resolve_for_player(player) == Ability.HeroSwrd)
last_menu.on_close()

-- Original definitions restored for the four previously unavailable actions.
account.items={}; account.memory={}; account.money=500
local full = {}
for i, item in ipairs(Shop.catalog) do full["Ability " .. i] = item.id end
show(full)
assert(#Shop.catalog == 13 and #last_menu.rows == 14)
local originals = {
    HeroSwrd = {cost=2,shape={{1},{1},{1}},flags={false,false},handler="battle"},
    CrosBmb = {cost=2,shape={{0,1,0},{1,1,1},{0,1,0}},flags={true,false},handler="battle"},
    Burner = {cost=4,shape={{1,1,1},{1,1,1},{1,1,1}},flags={true,true},handler="battle"},
    Blaster = {cost=1,shape={{0,1,0},{1,1,1}},flags={false,false},handler="battle"},
    Bazooka = {cost=2,shape={{1,1,1,1,1},{1,1,1,1,1},{1,1,1,1,1},{1,1,1,1,1},{1,1,1,1,1}},flags={true,true},handler="direct"},
}
for id, spec in pairs(originals) do
    local ability = Ability[id]
    assert(ability and ability.activate and ability.generate_shape, "missing implementation: " .. id)
    assert(Shop.is_supported(id), id .. " should be purchasable")
    assert(ability.cost == spec.cost)
    assert(ability.remove_traps == spec.flags[1] and ability.destroy_items == spec.flags[2])
    local shape, x, y = ability.generate_shape()
    assert(x == 0 and y == 0)
    assert(#shape == #spec.shape)
    for j, row in ipairs(spec.shape) do
        assert(#shape[j] == #row)
        for k, v in ipairs(row) do assert(shape[j][k] == v) end
    end
    assert(right(id) ~= "Unavailable")
    -- Grant via shop and verify both inventory and the Liberation resolver.
    choose(id)
    assert(account.items[id] == 1, "shop did not grant: " .. id)
    assert(Ability.resolve_for_player(player) == ability, "mission did not select: " .. id)
end
last_menu.on_close()
assert(saved > 0, "permanent state must be saved")
print("Gold Prog persistent unlock, equip, resolver, all 13 abilities, pricing and gating tests passed")
