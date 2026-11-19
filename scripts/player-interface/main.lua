-- PlayerInterface: the ONLY public entry point for input, player control and camera.
-- Require this once (Lua caches the module). The underlying controllers keep
-- their proven registries and reference-counted ownership; this module creates
-- no second input controller and registers no extra duplicate Net handlers.
--
-- Initialization is deliberately ordered: input events first, scoped player
-- control second, free-camera listeners last. Internal components never
-- require this file, so there is no circular module initialization.
local InputAPI = require("scripts/player-interface/input/api")
local Control = require("scripts/player-interface/control")
local CameraManager = require("scripts/player-interface/camera/camera-manager")
local CameraFocus = require("scripts/player-interface/camera-focus")
local UISuppression = require("scripts/player-interface/resources/ui-suppression")
local CameraMode = require("scripts/enum/predefined-enums").CameraMode

-- Export ALL existing Control and InputAPI public signatures directly so
-- callers can use one `require` without changing how they call these APIs.
local Interface = {}
for name, member in pairs(InputAPI) do Interface[name] = member end
for name, member in pairs(Control) do
    if Interface[name] ~= nil then
        error("PlayerInterface API collision: " .. tostring(name))
    end
    Interface[name] = member
end
Interface.Input = InputAPI -- Optional advanced access, same registry
Interface.Control = Control -- Optional advanced access, same session state
Interface.Camera = CameraManager -- Optional advanced access (colon methods)
Interface.CameraMode = CameraMode
Interface.CameraFocus = CameraFocus
Interface.UISuppression = UISuppression

function Interface.get_input_controller(player_id)
    return InputAPI.get_controller(player_id)
end

-- Free camera: optional player-directed camera with managed input ownership.
function Interface.get_camera_controller(player_id)
    local camera = CameraManager:get_controller(player_id)
    if camera then return camera end
    -- A plugin can be loaded after a player joined. In that case provision
    -- the same controller that the normal join listener would have created.
    if player_id and Net and type(Net.is_player) == "function"
        and Net.is_player(player_id) then
        return CameraManager:ensure_controller(player_id)
    end
    return nil
end
function Interface.activate_free_camera(player_id, mode, lock_input)
    if not Interface.get_camera_controller(player_id) then
        return false, "camera controller unavailable"
    end
    return CameraManager:activate_camera(player_id, mode, lock_input)
end
function Interface.deactivate_free_camera(player_id, keep_camera_position)
    local camera = CameraManager:get_controller(player_id)
    if not camera or (not camera.is_active and not camera.input_session) then return true end
    return CameraManager:deactivate_camera(player_id, keep_camera_position)
end
function Interface.is_free_camera_active(player_id)
    return CameraManager:is_camera_active(player_id)
end
function Interface.move_free_camera(player_id, x, y, z)
    return CameraManager:move_camera(player_id, x, y, z)
end
function Interface.slide_free_camera(player_id, x, y, z, duration)
    return CameraManager:slide_camera(player_id, x, y, z, duration)
end
function Interface.pan_free_camera(player_id, dx, dy, dz)
    return CameraManager:pan_camera(player_id, dx, dy, dz)
end
function Interface.get_free_camera_position(player_id)
    return CameraManager:get_camera_position(player_id)
end
function Interface.get_pending_free_camera_position(player_id)
    return CameraManager:get_pending_camera_position(player_id)
end
function Interface.has_pending_free_camera_move(player_id)
    return CameraManager:has_pending_move(player_id)
end

-- Server-directed camera: obtain a protected cinematic lease and close it on
-- all completion/error paths. Cannot displace an unrelated active camera.
function Interface.begin_scripted_camera(player_id, owner, options)
    options = options or {}
    return Control.begin(player_id, {
        owner = owner or "scripted_camera", profile = "cinematic",
        camera = "scripted", restore_camera = options.restore_camera,
        capture = options.capture, parent = options.parent,
    })
end

-- Import this LAST: it installs join/disconnect/tile/tick camera listeners and
-- its callbacks can now safely use Control and InputAPI initialized above.
require("scripts/player-interface/camera/events")

return Interface
