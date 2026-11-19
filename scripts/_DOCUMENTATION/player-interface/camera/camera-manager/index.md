# 📄 `scripts/player-interface/camera/camera-manager.lua`

[⬆️ Modules](../../index.md) · [🎮 API](../../API_REFERENCE.md)

## Source-declared functions

| Line | Signature |
|---:|---|
| 12 | `dbg(...)` |
| 18 | `CameraManager:init(handle_on_join, tile_interaction, setup_inputs)` |
| 22 | `CameraManager:setup_event_listeners(handle_on_join, tile_interaction, setup_inputs)` |
| 30 | `CameraManager:ensure_controller(player_id)` |
| 44 | `CameraManager:get_controller(player_id)` |
| 52 | `CameraManager:activate_camera(player_id, mode, lock_input)` |
| 83 | `CameraManager:deactivate_camera(player_id, keep_camera_position)` |
| 99 | `CameraManager:is_camera_active(player_id)` |
| 108 | `CameraManager:has_pending_move(player_id)` |
| 117 | `CameraManager:move_camera(player_id, x, y, z)` |
| 130 | `CameraManager:slide_camera(player_id, x, y, z, duration)` |
| 136 | `CameraManager:pan_camera(player_id, dx, dy, dz)` |
| 149 | `CameraManager:get_camera_position(player_id)` |
| 162 | `CameraManager:get_pending_camera_position(player_id)` |

> Signatures are derived from the uploaded Lua code. Read the source for actual effects and error paths.
