-- Camera event bootstrap. Only required by scripts/player-interface/main.lua.
local CameraManager = require("scripts/player-interface/camera/camera-manager")
local PredefinedEnums = require("scripts/enum/predefined-enums")
local InputAPI = require("scripts/player-interface/input/api")
local PlayerControl = require("scripts/player-interface/control")
local CameraMode = PredefinedEnums.CameraMode

local DBG = false
local function dbg(...)
    if DBG then print("[CAMMAIN]", ...) end
end

local setupPlayerJoin = function()
    Net:on("player_join", function(event)
        dbg("player_join: player=", tostring(event.player_id),
            "existing_controller=", tostring(CameraManager.PlayerControllers[event.player_id] ~= nil))

        if not event.player_id then
            print("ERROR: player_join event missing player_id")
            return
        end

        if CameraManager.PlayerControllers[event.player_id] then
            dbg("player_join: controller already exists for player, skipping create")
            return
        end

        print("Player joined: " .. tostring(event.player_id))

        CameraManager:ensure_controller(event.player_id)
    end)
end

local setupTileInteraction = function()
    Net:on("tile_interaction", function(event)
        local player_id = event.player_id
        local player_camera = CameraManager:get_controller(player_id)
        local input = InputAPI.get_controller(player_id)
        local input_owner = input and type(input.get_input_owner) == "function"
            and input:get_input_owner() or nil

        local area_id = nil
        if player_id and type(Net.get_player_area) == "function" then
            local ok, value = pcall(Net.get_player_area, player_id)
            if ok then area_id = value end
        end

        dbg("tile_interaction: player=", tostring(player_id),
            "area=", tostring(area_id),
            "button=", tostring(event.button),
            "camera_controller=", tostring(player_camera),
            "input_controller=", tostring(input),
            "controller=", tostring(player_camera ~= nil),
            "is_active=", tostring(player_camera and player_camera.is_active),
            "input_owner=", tostring(input_owner))

        if event.button ~= 1 then
            dbg("tile_interaction: ignoring non-left button")
            return
        end

        -- FootBomb and Liberation missions run their own player/camera flows.
        -- Named capture scopes (e.g. liberation:turn) do NOT occupy logical
        -- input focus, so an ownership-only check below is insufficient.
        -- In particular, activating free camera during Liberation could
        -- leave movement locked until the camera was dismissed.
        if type(area_id) == "string" and
            (area_id:match("^footbomb[_%-]") or area_id:match("^liberation_")) then
            dbg("tile_interaction: free camera disabled in game instance", tostring(area_id))
            return
        end

        -- In other areas, do not let the camera steal input from a different
        -- active owner.
        local current_session=PlayerControl.get_active(player_id)
        local camera_owner=player_camera and player_camera.input_session
            and player_camera.input_session.state.owner or nil
        if (current_session and
            (not player_camera or current_session~=player_camera.input_session))
            or (input_owner~=nil and input_owner~=camera_owner) then
            dbg("tile_interaction: camera blocked by managed input owner")
            return
        end

        if player_camera and not player_camera.is_active then
            dbg("tile_interaction: activating camera for player", tostring(player_id))
            local activated = CameraManager:activate_camera(player_id, CameraMode.Custom, true)
            dbg("tile_interaction: activation result=", tostring(activated))
        else
            dbg("tile_interaction: skipped activation (active=",
                tostring(player_camera and player_camera.is_active), ")")
        end
    end)
end

CameraManager:init(setupPlayerJoin, setupTileInteraction)

Net:on("player_area_transfer", function(event)
    local controller = CameraManager.PlayerControllers[event.player_id]
    if controller and controller.is_active then
        controller:deactivate(true)
    end
end)

-- Track only the duration we requested; do not assume that Net confirms
-- the rendered camera completed at precisely this time.
Net:on("tick",function(event)
    for _, controller in pairs(CameraManager.PlayerControllers) do
        if controller and controller.tick then controller:tick(event.delta_time) end
    end
end)

Net:on("player_disconnect", function(event)
    local controller = CameraManager.PlayerControllers[event.player_id]
    if controller then
        if controller.is_active then controller:deactivate(true) end
        if type(controller.destroy) == "function" then controller:destroy() end
        CameraManager.PlayerControllers[event.player_id] = nil
    end
end)

return CameraManager
