-- FootBomb referee dialog using Nebulous Liberations' 9-slice option menu.
-- This module owns no input listeners; OptionMenu and PlayerInterface manage
-- focus, movement capture, sprite cleanup, and held-button handoff.
local OptionMenu = require("scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu")
local Config = require("scripts/ezlibs-custom/footbomb/constants")

local RefereeMenu = {}

local MENU_TITLE = "FootBomb"
local MAX_WINNING_SCORE = 999

function RefereeMenu.select_mode(player_id)
    -- OptionMenu returns zero-based indexes, including the explicit Cancel.
    return OptionMenu.select(player_id, {
        "[VS] NPC", "[VS] Player", "Explanation", "Cancel"
    }, MENU_TITLE, { stable_text = true })
end

function RefereeMenu.select_join(player_id)
    return OptionMenu.select(player_id, {
        "Join Match", "Cancel"
    }, "FootBomb Opponent", { stable_text = true })
end

-- The host edits both rules inside one persistent menu. Direction repeats
-- adjust the score one point at a time; only Start Match submits the rules.
-- No new 9-slice panels are created while the cursor/value changes.
function RefereeMenu.configure(player_id, initial_rules, is_current)
    initial_rules = initial_rules or {}
    is_current = is_current or function() return true end
    local points = math.floor(tonumber(initial_rules.points_to_win)
        or Config.DEFAULTS.POINTS_TO_WIN)
    points = math.min(MAX_WINNING_SCORE, math.max(1, points))
    local grace = initial_rules.grace_enabled ~= false

    -- Aligned fields are measured in actual THICK font pixels by OptionMenu.
    -- Both rows use the same arrow positions and a centered three-character
    -- value field. Only the field value changes while the menu is open.
    local aligned_values = {
        [1] = { label = "Winning Score:", value = tostring(points), reserve = "999" },
        [2] = { label = "Grace:", value = grace and "On" or "Off", reserve = "Off" },
    }

    return Async.promisify(coroutine.create(function()
        local choice = Async.await(OptionMenu.select(player_id, {
            "Winning Score:", "Grace:", "Start Match", "Cancel",
        }, "FootBomb Setup", {
            stable_text = true,
            aligned_values = aligned_values,
            on_horizontal = function(index, delta)
                if not is_current() then return true end
                if index == 0 then
                    -- Wrap within 1..999 in either direction (999+1 -> 1; 1-1 -> 999).
                    points = ((points - 1 + delta) % MAX_WINNING_SCORE) + 1
                    aligned_values[1].value = tostring(points)
                    return true
                elseif index == 1 then
                    -- Either direction flips the current value, never forces On/Off.
                    if delta ~= 0 then grace = not grace end
                    aligned_values[2].value = grace and "On" or "Off"
                    return true
                end
                return false
            end,
            on_confirm = function(index)
                if not is_current() then return true end
                if index == 0 then
                    -- Score is adjusted with Left/Right, not Confirm.
                    return true
                elseif index == 1 then
                    grace = not grace
                    aligned_values[2].value = grace and "On" or "Off"
                    return true
                end
                return false
            end,
        }))
        if not is_current() then return nil end
        if choice == 2 then
            return {
                points_to_win = points,
                grace_enabled = grace,
            }
        end
        return nil
    end))
end

return RefereeMenu
