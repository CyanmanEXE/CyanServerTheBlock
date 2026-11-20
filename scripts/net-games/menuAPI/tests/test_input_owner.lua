-- Regression: MenuAPI must preserve BOTH return values of Session:input().
-- Run from the server root: lua scripts/net-games/menuAPI/tests/test_input_owner.lua
-- Uses the real PlayerInterface + MenuAPI. Network rendering and storage are mocked.
package.path = './?.lua;./?/init.lua;' .. package.path

local listeners = {}
local lock_count, unlock_count = 0, 0
Net = {}
function Net:on(name, callback)
    listeners[name] = listeners[name] or {}
    listeners[name][#listeners[name] + 1] = callback
end
local function emit(name, event)
    for _, callback in ipairs(listeners[name] or {}) do callback(event or {}) end
end
function Net.lock_player_input() lock_count = lock_count + 1 end
function Net.unlock_player_input() unlock_count = unlock_count + 1 end
function Net.toggle_player_hud() end
function Net.get_player_area() return 'default' end
function Net.is_player() return true end
function Net.get_player_position() return {x=1, y=1, z=0} end
function Net.track_with_player_camera() end
function Net.unlock_player_camera() end

local draw_calls = 0
package.loaded['scripts/net-games/main'] = {}
package.loaded['scripts/displayer/displayer'] = {
    Text = {
        drawStatic = function() draw_calls = draw_calls + 1 end,
        removeStatic = function() end,
    },
    Font = {allocateAllFontsForPlayer = function() end},
}
package.loaded['scripts/net-games/ui-safe'] = {
    draw = function() return true end,
    erase = function() return true end,
    safe_provide = function() return true end,
}
local log = {}
function log:register_subsystem() return self end
function log:info_data() end
function log:warn_data() end
function log:error_data() end
function log:debug_data() end
function log:info() end
package.loaded['scripts/logger/logger'] = {
    register = function() return log end,
    register_subsystem = function() return log end,
}

local items = {HeroSwrd = 1}
local money = 1000
package.loaded['scripts/ezlibs-scripts/ezmemory'] = {
    get_item_id_by_name = function(name) return name end,
    create_or_update_item = function(name) return name end,
    count_player_item = function(_, name) return items[name] or 0 end,
    remove_player_item = function(_, name) items[name] = nil end,
    give_player_item = function(_, name, count) items[name] = count; return count end,
    get_player_money = function() return money end,
    spend_player_money = function(_, amount)
        if amount > money then return false end
        money = money - amount
        return true
    end,
    add_player_money = function(_, amount) money = money + amount end,
}

Async = require('scripts/utils/async')
local Interface = require('scripts/player-interface/main')
local MenuAPI = require('scripts/net-games/menuAPI/main')
local Shop = require('scripts/ezlibs-custom/nebulous-liberations/liberations/ability_shop')
local player_id = 'gold_shop_input_test'
emit('player_join', {player_id = player_id})
local ctrl = assert(Interface.get_controller(player_id))

local function tick(delta_time)
    emit('tick', {delta_time = delta_time or 0.08})
end
local function press(raw_name)
    emit('virtual_input', {
        player_id = player_id,
        events = {{name = raw_name, state = 1}},
    })
    tick()
    emit('virtual_input', {
        player_id = player_id,
        events = {{name = raw_name, state = 3}},
    })
    tick()
end

-- eznpcs applies a native movement lock before calling its dialogue handler.
-- MenuAPI must still be able to claim logical input inside that named scope.
assert(Interface.acquire_capture(player_id, 'eznpcs'))
local props = {['Enable Costs'] = false}
for index, ability in ipairs(Shop.catalog) do
    props['Ability ' .. index] = ability.id
end
local promise = Shop.open({placeholder_custom_properties = props}, player_id)
assert(promise and promise.state == 'pending', 'Gold shop promise did not stay pending')
local st = assert(MenuAPI.get_state(player_id), 'Gold shop did not open')
assert(#st.rows == 14, 'All 13 abilities and Cancel should be present')
assert(st.rows[1].right == 'Owned', 'Current ability should show Owned')
assert(st.cursor == 2, 'First unowned ability should be selected')
assert(st.control_session:is_current(), 'Menu did not own PlayerInterface focus')
assert(ctrl:get_input_owner() ~= nil, 'Controller was not claimed')
tick(0.2) -- intentionally clear the post-open stale-input guard

-- Verify real Up/Down events reach MenuAPI with its owner token.
press('UI Down')
assert(st.cursor == 3, 'Down input did not reach Gold Prog menu')
press('UI Up')
assert(st.cursor == 2, 'Up input did not reach Gold Prog menu')
press('Confirm')
assert(items.WideSwrd == 1 and not items.HeroSwrd,
    'Confirm did not purchase/activate the selected Liberation ability')
assert(MenuAPI.get_state(player_id) == st, 'Purchase unexpectedly closed the menu')
assert(st.rows[2].right == 'Owned', 'The newly acquired ability did not show Owned')
assert(st.rows[1].right == nil, 'The previous ability still showed Owned')
press('Cancel')
assert(not MenuAPI.is_open(player_id), 'Cancel did not close the menu')
assert(promise.state == 'fulfilled', 'Closing the menu did not resolve the conversation')
assert(Interface.has_capture(player_id, 'eznpcs'),
    'Closing a shop released the enclosing NPC conversation lock')
assert(Interface.release_capture(player_id, 'eznpcs'))
assert(lock_count == 1 and unlock_count == 1,
    'Overlapping locks caused an extra lock/unlock transition')
assert(draw_calls > 0, 'Menu never rendered')

-- The two Gold Progs with Welcome Text must hand input from the textbox
-- session to a fresh shop session AFTER the textbox finishes and closes.
local welcome_session, complete_welcome
package.loaded['scripts/net-games/bn-textbox'] = {
    show = function(pid, _text, options)
        welcome_session = assert(Interface.begin(pid, {
            owner = 'net-games:dialogue', profile = 'menu',
        }))
        complete_welcome = function()
            welcome_session:close()
            options.on_finish()
        end
        return 'simulated-welcome'
    end,
}
assert(Interface.acquire_capture(player_id, 'eznpcs'))
local greeting_props = {['Welcome Text'] = 'Choose your ability!'}
for index, ability in ipairs(Shop.catalog) do
    greeting_props['Ability ' .. index] = ability.id
end
local greeting_promise = Shop.open({
    placeholder_custom_properties = greeting_props,
}, player_id)
assert(greeting_promise.state == 'pending')
assert(welcome_session and welcome_session:is_current())
assert(not MenuAPI.is_open(player_id),
    'Gold shop opened before the Welcome Text was dismissed')
complete_welcome()
local greeting_menu = assert(MenuAPI.get_state(player_id),
    'Gold shop did not open after welcome textbox closed')
assert(greeting_menu.control_session:is_current(),
    'Gold shop did not regain control after greeting')
tick(0.2)
press('UI Down')
assert(greeting_menu.cursor == 3, 'Input did not navigate after welcome textbox')
press('Cancel')
assert(greeting_promise.state == 'fulfilled',
    'Greeting shop conversation did not complete on Cancel')
assert(Interface.release_capture(player_id, 'eznpcs'))
assert(lock_count == 2 and unlock_count == 2,
    'Welcome-to-shop transition leaked a PlayerInterface capture')
print('PASS: Gold Prog 13-ability Up/Down/Confirm/Cancel, named capture and welcome handoff')
