# 📄 `scripts/player-interface/main.lua`

[⬆️ Modules](../index.md) · [🎮 API](../API_REFERENCE.md)

## Source-declared functions

| Line | Signature |
|---:|---|
| 33 | `Interface.get_input_controller(player_id)` |
| 38 | `Interface.get_camera_controller(player_id)` |
| 49 | `Interface.activate_free_camera(player_id, mode, lock_input)` |
| 55 | `Interface.deactivate_free_camera(player_id, keep_camera_position)` |
| 60 | `Interface.is_free_camera_active(player_id)` |
| 63 | `Interface.move_free_camera(player_id, x, y, z)` |
| 66 | `Interface.slide_free_camera(player_id, x, y, z, duration)` |
| 69 | `Interface.pan_free_camera(player_id, dx, dy, dz)` |
| 72 | `Interface.get_free_camera_position(player_id)` |
| 75 | `Interface.get_pending_free_camera_position(player_id)` |
| 78 | `Interface.has_pending_free_camera_move(player_id)` |
| 84 | `Interface.begin_scripted_camera(player_id, owner, options)` |

> Signatures are derived from the uploaded Lua code. Read the source for actual effects and error paths.
