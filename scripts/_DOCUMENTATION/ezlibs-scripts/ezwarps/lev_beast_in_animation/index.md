# `lev_beast_in_animation.lua`

> **Source:** `scripts/ezlibs-scripts/ezwarps/lev_beast_in_animation.lua`  
> **Source lines:** 117  
> **Functions detected:** 1  
> **Table declarations detected:** 10

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

### `lev_beast_in_animation` *(line 1)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `pre_animation_offsets` | table | `{ x=0, y=0, z=0 }` |
| `animate` | function | `function(player_id) return async(function() local player_pos = Net.get_player_position(player_id) local area_id = Net.get_player_area(player…` |
| `[3]` | table | `{ texture_path = "/server/assets/ezlibs-assets/ezwarps/lev-beast-64-65.png", animation_path = "/server/assets/ezlibs-assets/ezwarps/lev-beas…` |
| `[4]` | number literal | `3` |
| `[5]` | number literal | `1) Net.animate_player(player_id` |
| `[6]` | string literal | `"IDLE_DL"` |
| `[7]` | call/expression | `true) Net.animate_player_properties(player_id` |
| `[8]` | call/expression | `player_keyframes) Net.animate_bot_properties(lev_beast_id` |
| `[9]` | call/expression | `beast_keyframes) await(Async.sleep(0.1)) Net.play_sound(area_id` |
| `[10]` | string literal | `'/server/assets/ezlibs-assets/ezwarps/lev-bus-arrive.ogg') await(Async.sleep(seconds_arriving)) Net.play_sound(area_id` |
| `[11]` | string literal | `'resources/sfx/falzar.ogg') Net.shake_player_camera(player_id` |
| `[12]` | number literal | `3` |
| `[13]` | number literal | `1) await(Async.sleep(seconds_here)) Net.play_sound(area_id` |
| `[14]` | string literal | `'/server/assets/ezlibs-assets/ezwarps/lev-bus-leave.ogg') Net.unlock_player_input(player_id) await(Async.sleep(seconds_leaving)) Net.remove_…` |

### `pre_animation_offsets` *(line 3)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `z` | number literal | `0` |

### `player_keyframes` *(line 27)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties={{ property="Y", value=player_pos.y-3, },{ property="Z", value=player_pos.z+17 }}, duration=0 }` |

### `properties` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", value=player_pos.y-3, }` |
| `[2]` | table | `{ property="Z", value=player_pos.z+17 }` |

### `properties` *(line 39)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", ease="Out", value=player_pos.y }` |
| `[2]` | table | `{ property="Z", ease="Out", value=player_pos.z }` |

### `beast_keyframes` *(line 50)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties={{ property="Y", value=player_pos.y-3, },{ property="Z", value=player_pos.z+17+beast_z_offset }}, duration=0 }` |

### `properties` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", value=player_pos.y-3, }` |
| `[2]` | table | `{ property="Z", value=player_pos.z+17+beast_z_offset }` |

### `properties` *(line 62)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", ease="Out", value=player_pos.y }` |
| `[2]` | table | `{ property="Z", ease="Out", value=player_pos.z+beast_z_offset }` |

### `properties` *(line 74)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", value=player_pos.y }` |
| `[2]` | table | `{ property="Z", value=player_pos.z+beast_z_offset }` |

### `properties` *(line 84)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", ease="In", value=player_pos.y+3 }` |
| `[2]` | table | `{ property="Z", ease="In", value=player_pos.z+17+beast_z_offset }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezwarps/lev_beast_in_animation.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
