# `fall_in_animation.lua`

> **Source:** `scripts/ezlibs-scripts/ezwarps/fall_in_animation.lua`  
> **Source lines:** 39  
> **Functions detected:** 1  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

these offsets will modify the warp landing location so that the player can animate from their spawn location nicely

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 8 | `animate` | `player_id` |

### Function notes

- **`animate(player_id)`** *(source line 8)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `fall_in_animation` *(line 1)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `pre_animation_offsets` | table | `{ x=0, y=0, z=40 }` |
| `animate` | function | `function(player_id) return async(function() local player_pos = Net.get_player_position(player_id) local area_id = Net.get_player_area(player…` |
| `[3]` | call/expression | `keyframes) await(Async.sleep(fall_duration)) local sound_path = '/server/assets/ezlibs-assets/ezwarps/earthquake.ogg' Net.play_sound(area_id` |
| `[4]` | call/expression | `sound_path) Net.shake_player_camera(player_id` |
| `[5]` | number literal | `3` |
| `[6]` | number literal | `2) Net.unlock_player_input(player_id) end) end` |

### `pre_animation_offsets` *(line 3)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `z` | number literal | `40` |

### `keyframes` *(line 14)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties={{ property="Z", value=player_pos.z }}, duration=0.0 }` |

### `properties` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Z", value=player_pos.z }` |

### `properties` *(line 22)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Z", ease="Linear", value=landing_z }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezwarps/fall_in_animation.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
