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
    points = math.max(1, points)
    local grace = initial_rules.grace_enabled ~= false

    local function score_label()
        return "Winning Score: < " .. tostring(points) .. " >"
    end
    local function grace_label()
        return "Grace: < " .. (grace and "On" or "Off") .. " >"
    end

    return Async.promisify(coroutine.create(function()
        local choice = Async.await(OptionMenu.select(player_id, {
            score_label(), grace_label(), "Start Match", "Cancel",
        }, "FootBomb Setup", {
            stable_text = true,
            -- Keep the panel width fixed even as score digits are added.
            -- Reserve four digits (or one more than the current score).
            -- This prevents normal adjustments from resizing the backdrop
            -- without scaling down the font for an unnecessarily wide value.
            width_samples = { "Winning Score: < "
                .. string.rep("9", math.max(4, #tostring(points) + 1))
                .. " >" },
            on_horizontal = function(index, delta, options)
                if not is_current() then return true end
                if index == 0 then
                    points = math.max(1, points + delta)
                    options[1] = score_label()
                    return true
                elseif index == 1 then
                    grace = delta > 0
                    options[2] = grace_label()
                    return true
                end
                return false
            end,
            on_confirm = function(index, options)
                if not is_current() then return true end
                if index == 0 then
                    -- Score is adjusted with Left/Right, not Confirm.
                    return true
                elseif index == 1 then
                    grace = not grace
                    options[2] = grace_label()
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
