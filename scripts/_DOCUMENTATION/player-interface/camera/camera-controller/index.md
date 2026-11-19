# 📄 `scripts/player-interface/camera/camera-controller.lua`

[⬆️ Modules](../../index.md) · [🎮 API](../../API_REFERENCE.md)

## Source-declared functions

| Line | Signature |
|---:|---|
| 34 | `dbg(...)` |
| 43 | `handle_player_controlled_movement(self)` |
| 106 | `emitter_off(emitter, event, cb)` |
| 121 | `CameraController:new(player_id, opts)` |
| 178 | `CameraController:_bind_input()` |
| 187 | `make_handler(kind)` |
| 205 | `CameraController:_unbind_input()` |
| 222 | `CameraController:_apply_repeat_delays()` |
| 230 | `CameraController:_restore_repeat_delays()` |
| 236 | `CameraController:set_camera_repeat_delays(first_repeat_delay, repeat_delay)` |
| 248 | `CameraController:has_input_control()` |
| 255 | `CameraController:_on_input_event(kind, ev)` |
| 317 | `CameraController:handle_input()` |
| 339 | `CameraController:activate(mode, lock_player_input)` |
| 411 | `CameraController:deactivate(keep_camera_position)` |
| 432 | `CameraController:destroy()` |
| 441 | `CameraController:returnToPlayer()` |
| 456 | `CameraController:setMode(new_mode, custom_handlers)` |
| 470 | `CameraController:setCustomHandlers(handlers)` |
| 477 | `CameraController:moveTo(x, y, z)` |
| 497 | `CameraController:relativeMoveTo(dx, dy, dz)` |
| 504 | `CameraController:pan(dx, dy, dz)` |
| 506 | `CameraController:setPosition(new_x, new_y, new_z)` |
| 514 | `CameraController:getPosition()` |
| 518 | `CameraController:getPendingPosition()` |
| 525 | `CameraController:hasPendingMove()` |
| 530 | `CameraController:slideTo(x, y, z, duration)` |
| 546 | `CameraController:tick(delta_time)` |
| 555 | `CameraController:fadePlayerCamera(color, durationInSeconds)` |
| 560 | `CameraController:shakePlayerCamera(strength, durationInSeconds)` |

> Signatures are derived from the uploaded Lua code. Read the source for actual effects and error paths.
