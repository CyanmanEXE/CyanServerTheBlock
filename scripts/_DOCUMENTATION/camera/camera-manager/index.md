# `camera-manager.lua`

> **Source:** `scripts/camera/camera-manager.lua`  
> **Source lines:** 154  
> **Functions detected:** 12  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

CameraManager.lua

## Dependencies

- `scripts/camera/camera-controller` — line 8
- `scripts/enum/predefined-enums` — line 9

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 12 | `dbg` | `...` |
| 18 | `CameraManager:init` | `handle_on_join, tile_interaction, setup_inputs` |
| 22 | `CameraManager:setup_event_listeners` | `handle_on_join, tile_interaction, setup_inputs` |
| 28 | `CameraManager:get_controller` | `player_id` |
| 36 | `CameraManager:activate_camera` | `player_id, mode, lock_input` |
| 67 | `CameraManager:deactivate_camera` | `player_id, keep_camera_position` |
| 82 | `CameraManager:is_camera_active` | `player_id` |
| 91 | `CameraManager:has_pending_move` | `player_id` |
| 100 | `CameraManager:move_camera` | `player_id, x, y, z` |
| 114 | `CameraManager:pan_camera` | `player_id, dx, dy, dz` |
| 128 | `CameraManager:get_camera_position` | `player_id` |
| 141 | `CameraManager:get_pending_camera_position` | `player_id` |

### Function notes

- **`dbg(...)`** *(source line 12)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:init(handle_on_join, tile_interaction, setup_inputs)`** *(source line 18)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:setup_event_listeners(handle_on_join, tile_interaction, setup_inputs)`** *(source line 22)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:get_controller(player_id)`** *(source line 28)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:activate_camera(player_id, mode, lock_input)`** *(source line 36)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:deactivate_camera(player_id, keep_camera_position)`** *(source line 67)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:is_camera_active(player_id)`** *(source line 82)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:has_pending_move(player_id)`** *(source line 91)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:move_camera(player_id, x, y, z)`** *(source line 100)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:pan_camera(player_id, dx, dy, dz)`** *(source line 114)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:get_camera_position(player_id)`** *(source line 128)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`CameraManager:get_pending_camera_position(player_id)`** *(source line 141)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `CameraManager` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PlayerControllers` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/camera/camera-manager.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
