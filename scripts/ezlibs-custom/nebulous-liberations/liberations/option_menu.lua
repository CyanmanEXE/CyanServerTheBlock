-- Controller-driven option menu for Nebulous Liberations mission interactions.
-- The title and option list use separate 9-slice panels:
--   options-header: title
--   options-body: option rows
-- Both panels share a width while keeping independently measured heights.

local Displayer = require("scripts/displayer/displayer")
local InputAPI = require("scripts/input-controller/main")

local OptionMenu = {}

local ASSET_ROOT = "/server/assets/ezlibs-custom/nebulous-liberations/"
local HEADER_TEXTURE = ASSET_ROOT .. "options-header.png"
local HEADER_ANIMATION = ASSET_ROOT .. "options-header.animation"
local BODY_TEXTURE = ASSET_ROOT .. "options-body.png"
local BODY_ANIMATION = ASSET_ROOT .. "options-body.animation"

local PANEL_ID_PREFIX = "liberation_option_menu:"
local INPUT_OWNER_PREFIX = "liberation_option_menu:"
local INPUT_SETTLE_SECONDS = 0.10

-- The previous menu used scale 2.0. 1.5 is three quarters of that scale.
local TEXT_SCALE = 1.5
local SLICE_SCALE = 1.5
local MENU_MAX_WIDTH = 220
local SCREEN_MARGIN = 12
-- Keep the header and body edges touching. A positive gap creates a
-- visible horizontal line between the two separate panel sprites.
local PANEL_GAP = 0

local PANEL_PADDING = { horizontal = 9, vertical = 8 }
local CHILD_PADDING = { horizontal = 3, vertical = 2 }
local OPTION_SPACING = 2

local header_style = Displayer.Builder.sliceStyle9(
    HEADER_TEXTURE,
    HEADER_ANIMATION
)

local body_style = Displayer.Builder.sliceStyle9(
    BODY_TEXTURE,
    BODY_ANIMATION
)

local active_menus = {}
local MENU_ACTIONS = { "Up", "Down", "Confirm", "Cancel" }

local function make_header_children(title)
    return {
        Displayer.Builder.panelTextChild(title or "Select an option", {
            font = "THICK",
            scale = TEXT_SCALE,
            color = { r = 0, g = 0, b = 0, a = 255 },
            align = "center",
        }),
    }
end

local function make_body_children(options, selected)
    local children = {}

    for index, label in ipairs(options) do
        local cursor = index == selected and "> " or "  "
        children[#children + 1] = Displayer.Builder.panelTextChild(
            cursor .. tostring(label),
            {
                font = "THICK",
                scale = TEXT_SCALE,
                color = { r = 0, g = 0, b = 0, a = 255 },
                align = "start",
            }
        )
    end

    return children
end

local function remove_panel(player_id, panel_id)
    if panel_id then
        pcall(Displayer.SlicedPanel.remove, player_id, panel_id)
    end
end

local function position_panels(menu)
    if not menu.header_panel or not menu.body_panel then
        return
    end

    local screen_width, screen_height = Displayer:getScreenDimensions()
    screen_width = tonumber(screen_width) or 480
    screen_height = tonumber(screen_height) or 320

    local _, header_height = menu.header_panel:getSize()
    local _, body_height = menu.body_panel:getSize()
    header_height = tonumber(header_height) or 0
    body_height = tonumber(body_height) or 0

    -- Anchor both panels to the lower-right corner. The title panel sits
    -- flush against the options panel and shares the body panel's left edge.
    local actual_width = math.max(tonumber(menu.shared_width) or 0, 1)
    local x = math.floor(screen_width - actual_width - SCREEN_MARGIN)
    local body_y = screen_height - body_height - SCREEN_MARGIN
    local header_y = body_y - header_height - PANEL_GAP

    if header_y < SCREEN_MARGIN then
        header_y = SCREEN_MARGIN
        body_y = header_y + header_height + PANEL_GAP
    end

    x = math.max(SCREEN_MARGIN, x)

    menu.header_panel:setPosition(x, math.floor(header_y))
    menu.body_panel:setPosition(x, math.floor(body_y))
end

local function refresh_body(menu)
    if menu.body_panel then
        menu.body_panel:setChildren(make_body_children(
            menu.options,
            menu.selected
        ))
        position_panels(menu)
    end
end

local function cleanup(player_id, menu, result)
    if menu.finished then
        return
    end

    menu.finished = true

    if active_menus[player_id] == menu then
        active_menus[player_id] = nil
    end

    remove_panel(player_id, menu.header_id)
    remove_panel(player_id, menu.body_id)
    menu.header_panel = nil
    menu.body_panel = nil

    -- Guard held menu keys before relinquishing this menu's controller claim.
    menu.controller:require_release(MENU_ACTIONS, menu.owner)
    menu.controller:release_input(menu.owner)

    menu.resolve(result)
end

local function apply_shared_width(menu)
    local header_width = menu.header_panel:getSize()
    local body_width = menu.body_panel:getSize()

    local shared_width = math.max(
        tonumber(header_width) or 0,
        tonumber(body_width) or 0
    )
    shared_width = math.min(shared_width, MENU_MAX_WIDTH)
    shared_width = math.max(shared_width, 1)

    -- The sliced-sprite TextPanel layout now supports a fixed width with an
    -- independently measured height. This lets wrapped options grow vertically.
    menu.shared_width = shared_width
    menu.header_panel:setOptions({
        auto_size = false,
        width = shared_width,
    })

    menu.body_panel:setOptions({
        auto_size = false,
        width = shared_width,
    })
end

local function create_panels(player_id, menu)
    local initial_options = {
        auto_size = true,
        max_width = MENU_MAX_WIDTH,
        padding = PANEL_PADDING,
        child_padding = CHILD_PADDING,
        slice_scale = SLICE_SCALE,
        z = 220,
    }

    local header_options = Displayer.Builder.columnPanelOptions({
        auto_size = initial_options.auto_size,
        max_width = initial_options.max_width,
        padding = initial_options.padding,
        child_padding = initial_options.child_padding,
        slice_scale = initial_options.slice_scale,
        z = initial_options.z,
        children = make_header_children(menu.title),
    })

    local body_options = Displayer.Builder.columnPanelOptions({
        auto_size = initial_options.auto_size,
        max_width = initial_options.max_width,
        padding = initial_options.padding,
        child_padding = initial_options.child_padding,
        main_axis_spacing = OPTION_SPACING,
        slice_scale = initial_options.slice_scale,
        z = initial_options.z,
        children = make_body_children(menu.options, menu.selected),
    })

    local header_panel, header_err = Displayer.SlicedPanel.createWithChildren(
        player_id,
        menu.header_id,
        SCREEN_MARGIN,
        SCREEN_MARGIN,
        header_style,
        header_options
    )

    if not header_panel then
        return false, header_err
    end

    menu.header_panel = header_panel

    local body_panel, body_err = Displayer.SlicedPanel.createWithChildren(
        player_id,
        menu.body_id,
        SCREEN_MARGIN,
        SCREEN_MARGIN,
        body_style,
        body_options
    )

    if not body_panel then
        remove_panel(player_id, menu.header_id)
        menu.header_panel = nil
        return false, body_err
    end

    menu.body_panel = body_panel

    apply_shared_width(menu)
    position_panels(menu)
    return true
end

-- Process all active menus from one engine tick listener.
Net:on("tick", function(event)
    for player_id, menu in pairs(active_menus) do
        if menu.active and not menu.finished then
            if not Net.is_player(player_id) then
                cleanup(player_id, menu, nil)
            elseif menu.controller:is_action_pressed("Up", menu.owner) then
                menu.selected = menu.selected - 1
                if menu.selected < 1 then
                    menu.selected = #menu.options
                end
                refresh_body(menu)
            elseif menu.controller:is_action_pressed("Down", menu.owner) then
                menu.selected = menu.selected + 1
                if menu.selected > #menu.options then
                    menu.selected = 1
                end
                refresh_body(menu)
            elseif menu.controller:is_action_pressed("Confirm", menu.owner) then
                -- Preserve the zero-based response expected by instance.lua.
                cleanup(player_id, menu, menu.selected - 1)
            end
        end
    end
end)

function OptionMenu.select(player_id, options, title)
    if type(options) ~= "table" or #options == 0 then
        return Async.create_promise(function(resolve)
            resolve(nil)
        end)
    end

    if active_menus[player_id] then
        return Async.create_promise(function(resolve)
            resolve(nil)
        end)
    end

    local controller = InputAPI.get_controller(player_id)
        or InputAPI.create_controller(player_id)

    if not controller then
        return Async.create_promise(function(resolve)
            resolve(nil)
        end)
    end

    local owner = INPUT_OWNER_PREFIX .. tostring(player_id)
    local header_id = PANEL_ID_PREFIX .. tostring(player_id) .. ":header"
    local body_id = PANEL_ID_PREFIX .. tostring(player_id) .. ":body"

    return Async.create_promise(function(resolve)
        local menu = {
            player_id = player_id,
            controller = controller,
            owner = owner,
            header_id = header_id,
            body_id = body_id,
            title = title,
            options = options,
            selected = 1,
            active = false,
            finished = false,
            header_panel = nil,
            body_panel = nil,
            resolve = resolve,
        }

        -- Do not steal input from another active controller owner. The mission
        -- interaction can retry or handle nil if another system owns input.
        if not controller:claim_input(owner) then
            resolve(nil)
            return
        end

        controller:consume(owner)
        controller:require_release(MENU_ACTIONS, owner)

        local created, create_err = create_panels(player_id, menu)
        if not created then
            controller:require_release(MENU_ACTIONS, owner)
            controller:release_input(owner)
            resolve(nil)
            return
        end

        active_menus[player_id] = menu

        -- Ignore inputs during the panel transition. Then consume any edges
        -- generated during that interval and require a fresh release/press.
        Async.sleep(INPUT_SETTLE_SECONDS).and_then(function()
            if menu.finished then
                return
            end

            if not Net.is_player(player_id) then
                cleanup(player_id, menu, nil)
                return
            end

            controller:consume(owner)
            controller:require_release(MENU_ACTIONS, owner)
            menu.active = true
        end)
    end)
end

return OptionMenu
