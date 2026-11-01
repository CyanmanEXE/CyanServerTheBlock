# `camera-controller.lua`

> **Source:** `scripts/camera/camera-controller.lua`  
> **Source lines:** 556  
> **Functions detected:** 28  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

camera-controller.lua Unified camera controller with mode-based input handling. Subscribes to the shared per-player InputController's emitter. The camera applies its own repeat cadence to the shared InputController while it is active, and restores the controller's configured defaults on deactivate. This lets camera movement feel snappier without affecting any other consumer of the same InputController.

## Dependencies

- `scripts/input-controller/main` — line 10
- `scripts/enum/predefined-enums` — line 11

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 32 | `dbg` | `...` |
| 41 | `handle_player_controlled_movement` | `self` |
| 104 | `emitter_off` | `emitter, event, cb` |
| 119 | `CameraController:new` | `player_id, opts` |
| 169 | `controller._handler_owner_changed` | `change` |
| 190 | `CameraController:_bind_input` | `(none)` |
| 199 | `make_handler` | `kind` |
| 217 | `CameraController:_unbind_input` | `(none)` |
| 234 | `CameraController:_apply_repeat_delays` | `(none)` |
| 244 | `CameraController:_restore_repeat_delays` | `(none)` |
| 255 | `CameraController:set_camera_repeat_delays` | `first_repeat_delay, repeat_delay` |
| 272 | `CameraController:_on_input_event` | `kind, ev` |
| 334 | `CameraController:handle_input` | `(none)` |
| 356 | `CameraController:activate` | `mode, lock_player_input` |
| 426 | `CameraController:deactivate` | `keep_camera_position` |
| 462 | `CameraController:destroy` | `(none)` |
| 472 | `CameraController:returnToPlayer` | `(none)` |
| 485 | `CameraController:setMode` | `new_mode, custom_handlers` |
| 500 | `CameraController:setCustomHandlers` | `handlers` |
| 507 | `CameraController:moveTo` | `x, y, z` |
| 518 | `CameraController:relativeMoveTo` | `dx, dy, dz` |
| 525 | `CameraController:pan` | `dx, dy, dz` |
| 527 | `CameraController:setPosition` | `new_x, new_y, new_z` |
| 534 | `CameraController:getPosition` | `(none)` |
| 538 | `CameraController:getPendingPosition` | `(none)` |
| 545 | `CameraController:hasPendingMove` | `(none)` |
| 547 | `CameraController:fadePlayerCamera` | `color, durationInSeconds` |
| 552 | `CameraController:shakePlayerCamera` | `strength, durationInSeconds` |

### Function notes

- **`dbg(...)`** *(source line 32)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`handle_player_controlled_movement(self)`** — -------------------------------------------------------------------------- Default direction-driven movement. -------------------------------------------------------------------------- *(source line 41)*
- **`emitter_off(emitter, event, cb)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:new(player_id, opts)`** — -------------------------------------------------------------------------- Constructor -------------------------------------------------------------------------- *(source line 119)*
- **`controller._handler_owner_changed(change)`** — Observe exclusive input ownership. A minigame can take control of the player's shared controller; the camera then stops processing input but leaves the camera position alone for the new owner to manage. *(source line 169)*
- **`CameraController:_bind_input()`** — -------------------------------------------------------------------------- Input binding -------------------------------------------------------------------------- *(source line 190)*
- **`make_handler(kind)`** *(source line 199)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:_unbind_input()`** *(source line 217)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:_apply_repeat_delays()`** — -------------------------------------------------------------------------- Repeat cadence override -------------------------------------------------------------------------- *(source line 234)*
- **`CameraController:_restore_repeat_delays()`** *(source line 244)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:set_camera_repeat_delays(first_repeat_delay, repeat_delay)`** — Optional API: change the camera's cadence at runtime. If the camera is currently active, the change takes effect immediately. *(source line 255)*
- **`CameraController:_on_input_event(kind, ev)`** — -------------------------------------------------------------------------- Input event handling -------------------------------------------------------------------------- *(source line 272)*
- **`CameraController:handle_input()`** — Legacy entry point. *(source line 334)*
- **`CameraController:activate(mode, lock_player_input)`** — -------------------------------------------------------------------------- Activation / Deactivation -------------------------------------------------------------------------- *(source line 356)*
- **`CameraController:deactivate(keep_camera_position)`** *(source line 426)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:destroy()`** *(source line 462)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:returnToPlayer()`** *(source line 472)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:setMode(new_mode, custom_handlers)`** — -------------------------------------------------------------------------- Mode switching -------------------------------------------------------------------------- *(source line 485)*
- **`CameraController:setCustomHandlers(handlers)`** *(source line 500)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:moveTo(x, y, z)`** — -------------------------------------------------------------------------- Camera movement API (unchanged) -------------------------------------------------------------------------- *(source line 507)*
- **`CameraController:relativeMoveTo(dx, dy, dz)`** *(source line 518)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:pan(dx, dy, dz)`** *(source line 525)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:setPosition(new_x, new_y, new_z)`** *(source line 527)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:getPosition()`** *(source line 534)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:getPendingPosition()`** *(source line 538)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:hasPendingMove()`** *(source line 545)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:fadePlayerCamera(color, durationInSeconds)`** *(source line 547)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraController:shakePlayerCamera(strength, durationInSeconds)`** *(source line 552)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `CameraController` *(line 13)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `CAMERA_DIRECTIONS` *(line 27)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Left"` |
| `[2]` | string literal | `"Right"` |
| `[3]` | string literal | `"Up"` |
| `[4]` | string literal | `"Down"` |
| `[5]` | string literal | `"UpLeft"` |
| `[6]` | string literal | `"UpRight"` |
| `[7]` | string literal | `"DownLeft"` |
| `[8]` | string literal | `"DownRight"` |

### `controller` *(line 142)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `input` | expression/reference | `input` |
| `mode` | expression/reference | `mode` |
| `custom_handlers` | expression/reference | `opts.custom_handlers or nil` |
| `is_active` | boolean literal | `false` |
| `input_locked` | boolean literal | `false` |
| `keep_player_input_locked` | expression/reference | `opts.keep_player_input_locked or false` |
| `current_position` | table | `{ x = 0, y = 0, z = 100 }` |
| `pending_position` | nil | `nil` |
| `camera_color` | table | `{ r = 255, g = 255, b = 255, a = 0 }` |
| `camera_first_repeat_delay` | expression/reference | `cam_first` |
| `camera_repeat_delay` | expression/reference | `cam_repeat` |
| `_input_bound` | boolean literal | `false` |
| `_activating` | boolean literal | `false` |
| `_handler_pressed` | nil | `nil` |
| `_handler_released` | nil | `nil` |
| `_handler_repeat` | nil | `nil` |

### `current_position` *(line 151)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `z` | number literal | `100` |

### `camera_color` *(line 153)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `a` | number literal | `0` |

### `self.current_position` *(line 410)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `player_pos.x` |
| `y` | expression/reference | `player_pos.y` |
| `z` | expression/reference | `player_pos.z` |

### `self.pending_position` *(line 508)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z or self.current_position.z or 100` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/camera/camera-controller.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
