# `arrow_animation_factory.lua`

> **Source:** `scripts/ezlibs-scripts/ezwarps/arrow_animation_factory.lua`  
> **Source lines:** 93  
> **Functions detected:** 2  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

No module-level description was present in the source. The reference below documents the symbols and behavior visible in this file.

## Dependencies

- `scripts/ezlibs-scripts/ezweather` — line 1

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 17 | `create_arrow_animation` | `is_arriving,direction_str` |
| 44 | `animate` | `player_id` |

### Function notes

- **`create_arrow_animation(is_arriving,direction_str)`** *(source line 17)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animate(player_id)`** *(source line 44)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Direction` *(line 2)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `UP_LEFT` | string literal | `"Up Left"` |
| `UP_RIGHT` | string literal | `"Up Right"` |
| `DOWN_LEFT` | string literal | `"Down Left"` |
| `DOWN_RIGHT` | string literal | `"Down Right"` |

### `reverse_table` *(line 9)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Up Left]` | string literal | `"Down Right"` |
| `[Up Right]` | string literal | `"Down Left"` |
| `[Down Left]` | string literal | `"Up Right"` |
| `[Down Right]` | string literal | `"Up Left"` |

### `new_animation` *(line 37)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `pre_animation_offsets` | table | `{ x=x_start_offset, y=y_start_offset, z=0 }` |
| `animate` | function | `function(player_id) return async(function() local player_pos = Net.get_player_position(player_id) local area_id = Net.get_player_area(player…` |
| `[3]` | expression/reference | `weather.camera_tint` |
| `[4]` | number literal | `0.5) Net.move_player_camera(player_id` |
| `[5]` | expression/reference | `player_pos.x+x_distance` |
| `[6]` | expression/reference | `player_pos.y+y_distance` |
| `[7]` | expression/reference | `player_pos.z` |
| `[8]` | number literal | `1) Net.unlock_player_camera(player_id) else Net.fade_player_camera(player_id` |
| `[9]` | table | `{r=0, g=0, b=0, a=255}` |
| `[10]` | number literal | `0.5) Net.slide_player_camera(player_id` |
| `[11]` | expression/reference | `player_pos.x+x_distance` |
| `[12]` | expression/reference | `player_pos.y+y_distance` |
| `[13]` | expression/reference | `player_pos.z` |
| `[14]` | number literal | `1) Net.unlock_player_camera(player_id) end player_keyframes[#player_keyframes+1] = { properties={{ property="X", ease="Linear", value=player…` |
| `[15]` | call/expression | `player_keyframes) await(Async.sleep(1)) end) end` |

### `pre_animation_offsets` *(line 39)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `x_start_offset` |
| `y` | expression/reference | `y_start_offset` |
| `z` | number literal | `0` |

### `player_keyframes` *(line 49)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `properties` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="X", ease="Linear", value=player_pos.x, }` |
| `[2]` | table | `{ property="Y", ease="Linear", value=player_pos.y }` |

### `properties` *(line 73)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="X", ease="Linear", value=player_pos.x+x_distance }` |
| `[2]` | table | `{ property="Y", ease="Linear", value=player_pos.y+y_distance }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezwarps/arrow_animation_factory.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
