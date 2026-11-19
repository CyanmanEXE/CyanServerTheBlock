-- FootBomb referee dialog using Nebulous Liberations' 9-slice option menu.
-- This module owns no input listeners; OptionMenu and PlayerInterface manage
-- focus, movement capture, sprite cleanup, and held-button handoff.
local OptionMenu = require("scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu")
local Config = require("scripts/ezlibs-custom/footbomb/constants")

local RefereeMenu = {}

local MENU_TITLE = "FootBomb"

function RefereeMenu.select_mode(player_id)
    -- OptionMenu returns zero-based indexes, including the explicit Cancel.
    return OptionMenu.select(player_id, {
        "[VS] NPC", "[VS] Player", "Explanation", "Cancel"
    }, MENU_TITLE)
end

function RefereeMenu.select_join(player_id)
    return OptionMenu.select(player_id, {
        "Join Match", "Cancel"
    }, "FootBomb Opponent")
end

-- Score is a numeric counter, not a fixed list of presets. Keeping the editor
-- in a single menu also lets users enable/disable the existing final-chance
-- (grace) rule before starting a match. 'Cancel' returns to the main menu.
-- The returned promise resolves with the host's rules or nil on cancellation,
-- disconnect, transfer, or loss of input focus.
function RefereeMenu.configure(player_id, initial_rules, is_current)
    initial_rules = initial_rules or {}
    local points = math.floor(tonumber(initial_rules.points_to_win)
        or Config.DEFAULTS.POINTS_TO_WIN)
    points = math.max(1, points)
    local grace = initial_rules.grace_enabled ~= false

    return Async.promisify(coroutine.create(function()
        while is_current() do
            local choice = Async.await(OptionMenu.select(player_id, {
                "Score -1", "Score +1", "Score -5", "Score +5",
                grace and "Grace: On" or "Grace: Off",
                "Start Match", "Cancel",
            }, "Winning Score: " .. tostring(points), {
                max_visible = 5,
            }))
            if not is_current() then return nil end
            if choice == 0 then
                points = math.max(1, points - 1)
            elseif choice == 1 then
                points = points + 1
            elseif choice == 2 then
                points = math.max(1, points - 5)
            elseif choice == 3 then
                points = points + 5
            elseif choice == 4 then
                grace = not grace
            elseif choice == 5 then
                return {
                    points_to_win = points,
                    grace_enabled = grace,
                }
            else
                return nil
            end
        end
        return nil
    end))
end

return RefereeMenu
