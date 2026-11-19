# 🎮 PlayerInterface — one public Lua module

**Import only `scripts/player-interface/main` in gameplay code.** The input,
player-control, and camera implementations live below this folder as internals.
The main module registers the preexisting input/player-control/camera hooks once;
its methods share the same underlying state.

Read the full API and migration guide at
[`scripts/_DOCUMENTATION/player-interface/README.md`](../_DOCUMENTATION/player-interface/README.md).

```lua
local Players = require("scripts/player-interface/main")
local menu, err = Players.begin(player_id, {owner="my_feature", profile="menu"})
if menu then
    menu:on_pressed("Cancel", function() menu:close() end)
end
-- Independent named capture (no menu input ownership):
Players.acquire_capture(player_id,"my_feature:transition")
Players.release_capture(player_id,"my_feature:transition")
-- Existing raw input controller, if needed:
local input = Players.get_controller(player_id)
-- Optional player-operated free camera:
Players.activate_free_camera(player_id, Players.CameraMode.Custom, true)
Players.deactivate_free_camera(player_id, false)
-- Server-scripted camera scoped by a session:
local shot = Players.begin_scripted_camera(player_id,"my_feature:shot")
if shot then
    local camera = shot:camera()
    camera:slide_to(10,20,1,0.5)
    -- Close only after the cinematic duration, including cancellation.
end
```

Existing features were migrated to the single import. Do not instantiate
another `InputController` listener, directly claim input while a session is
active, or call raw engine unlocks over reference-counted captures.
