# 📘 PlayerInterface public API — source-verified

[🏠 Documentation home](../index.md) · [🎮 PlayerInterface](README.md)

This page describes **signatures defined in the relocated Lua**. The public
module copies the `InputAPI` and `PlayerControl` methods without adapters or
changes to their arguments. No additional event registry is created.

## Input (direct methods on `Players`)

| Method | Arguments | Behavior |
|---|---|---|
| `get_controller` / `get_input_controller` | `player_id` | Get current shared raw input instance or nil |
| `create_controller` | `player_id, opts` | Idempotent create and register |
| `spawn_controller` | `player_id, opts` | Create without registration |
| `reload_controller` | `player_id, opts` | Reload mappings/directions |
| `set_controller_class` | `class` | Change registry constructor |
| `get_controller_class` | none | Current constructor |
| `get_controller_identity` | `player_id` | Diagnostic table identity |
| `set_repeat_delays` | `player_id, first_repeat_delay, repeat_delay` | Set raw controller default cadence |
| `restore_repeat_delays` | `player_id` | Restore configured raw defaults |
| `activate_controller` / `deactivate_controller` / `destroy_controller` | `player_id` | Input lifecycle operations |

Fields `Players.buttons`, `Players.DPad`, `Players.InputController`,
`Players.default_button_mappings`, and
`Players.default_direction_raw_names` are the original input API exports.
Use a scoped `Players.begin` session for gameplay UI instead of claiming raw
controller ownership manually.

## Sessions, input locks, HUD

| Method | Arguments | Result / ownership |
|---|---|---|
| `begin` | `player_id, options` | `Session` or `nil,err`; close with `:close()` |
| `begin_capture_scope` | `player_id,owner,options` | Input lock + optional HUD, `scope:close()` |
| `acquire_capture` / `release_capture` | `player_id,owner` | Reference-counted named input lock |
| `has_capture` | `player_id,owner` | Named capture held? |
| `suppress_hud` / `restore_hud` | `player_id,owner` | Reference-counted HUD toggle |
| `get_active` | `player_id` | Current scoped session or nil |
| `get_debug_state` | `player_id` | Session stack, captures, camera leases, pending releases |
| `retry_cleanup` / `cleanup_player` | `player_id` | Retry pending state / disconnect-style cleanup |

`begin` options supported in code: `owner`, `profile`, `parent`, `focus`,
`native`, `capture`, `hud`, `camera`, `restore_camera`,
`handoff_free_camera`, `first_repeat_delay`, `repeat_delay`.
Profiles declared in source: `desktop`, `menu`, `music_menu`,
`settings_menu`, `native_ui`, `cinematic`, `capture_only`, `free_camera`,
`minigame`, `mission_transition`.

**Session methods:** `:is_alive()`, `:is_current()`, `:input()`, `:poll(actions)`,
`:on_pressed(action,fn)`, `:on_repeat(action,fn)`, `:on_released(action,fn)`,
`:guard_input(seconds,actions)`, `:begin_native_handoff(options)`,
`:set_repeat_delays(first,interval)`, `:on_close(fn)`, `:on_error(fn)`,
`:on_suspend(fn)`, `:on_resume(fn)`, `:yield_to_native_ui()`,
`:resume_buttons()`, `:suspend_buttons()`, `:child(opts)`, `:camera()`,
`:close()`.

`session:camera()` is available for a scripted/exclusive camera session and
returns an object with `:move_to(x,y,z)`, `:slide_to(x,y,z,duration)`, and
`:follow_player()`.

## Player camera

| Method | Arguments | Behavior |
|---|---|---|
| `get_camera_controller` | `player_id` | Registered camera controller; lazily creates it for a connected player when the join handler was loaded late |
| `activate_free_camera` | `player_id,mode,lock_input` | Uses existing camera controller session; true/false |
| `deactivate_free_camera` | `player_id,keep_camera_position` | Close free camera; true when already inactive |
| `is_free_camera_active` | `player_id` | Whether free camera is active |
| `move_free_camera` | `player_id,x,y,z` | Immediate camera movement through camera controller |
| `slide_free_camera` | `player_id,x,y,z,duration` | Timed camera slide through camera controller |
| `pan_free_camera` | `player_id,dx,dy,dz` | Relative camera pan |
| `get_free_camera_position` | `player_id` | Camera controller's tracked position |
| `get_pending_free_camera_position` | `player_id` | Queued slide endpoint, if any |
| `has_pending_free_camera_move` | `player_id` | Controller has pending slide? |
| `begin_scripted_camera` | `player_id,owner,options` | Protected `cinematic` session; caller closes |

`begin_scripted_camera` options passed to `Control.begin`: `parent`,
`capture`, `restore_camera`. `Players.CameraMode` is the enum from
`scripts/enum/predefined-enums.lua`.

## Advanced internals exposed without another require

`Players.Input`, `Players.Control`, `Players.Camera` (colon-method manager),
`Players.CameraFocus`, `Players.UISuppression` expose the **same underlying
module tables**. Their presence is for advanced cases or older integrations;
regular consumers should use the flat methods above. The internal files
must not be loaded as separate plugins or duplicated under old paths.
