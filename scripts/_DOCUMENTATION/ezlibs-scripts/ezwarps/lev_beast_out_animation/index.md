# `lev_beast_out_animation.lua`

> **Source:** `scripts/ezlibs-scripts/ezwarps/lev_beast_out_animation.lua`  
> **Source lines:** 114  
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
| 9 | `animate` | `player_id` |

### Function notes

- **`animate(player_id)`** *(source line 9)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `lev_beast_out_animation` *(line 1)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `pre_animation_offsets` | table | `{ x=0, y=0, z=0 }` |
| `duration` | number literal | `8` |
| `animate` | function | `function(player_id) return async(function() local player_pos = Net.get_player_position(player_id) local area_id = Net.get_player_area(player…` |
| `[4]` | table | `{ texture_path = "/server/assets/ezlibs-assets/ezwarps/lev-beast-64-65.png", animation_path = "/server/assets/ezlibs-assets/ezwarps/lev-beas…` |
| `[5]` | string literal | `'resources/sfx/falzar.ogg') Net.shake_player_camera(player_id` |
| `[6]` | number literal | `3` |
| `[7]` | number literal | `1) Net.animate_player(player_id` |
| `[8]` | string literal | `"IDLE_DL"` |
| `[9]` | call/expression | `true) await(Async.sleep(seconds_intro)) Net.play_sound(area_id` |
| `[10]` | string literal | `'/server/assets/ezlibs-assets/ezwarps/lev-bus-arrive.ogg') Net.animate_player_properties(player_id` |
| `[11]` | call/expression | `player_keyframes) Net.animate_bot_properties(lev_beast_id` |
| `[12]` | call/expression | `beast_keyframes) Net.message_player(player_id` |
| `[13]` | string literal | `"AHHH! The Lev Beast is here!?"` |
| `[14]` | expression/reference | `player_mugshot.texture_path` |
| `[15]` | call/expression | `player_mugshot.animation_path) await(Async.sleep(seconds_arriving)) Net.play_sound(area_id` |
| `[16]` | string literal | `'/server/assets/ezlibs-assets/ezwarps/lev-bus-leave.ogg') await(Async.sleep(seconds_here+seconds_leaving)) Net.remove_bot(lev_beast_id) end)…` |

### `pre_animation_offsets` *(line 3)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `z` | number literal | `0` |

### `player_keyframes` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties={{ property="Y", value=player_pos.y, },{ property="Z", value=player_pos.z }}, duration=seconds_arriving+seconds_here }` |

### `properties` *(line 31)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", value=player_pos.y, }` |
| `[2]` | table | `{ property="Z", value=player_pos.z }` |

### `properties` *(line 41)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", ease="In", value=player_pos.y+3 }` |
| `[2]` | table | `{ property="Z", ease="In", value=player_pos.z+17 }` |

### `beast_keyframes` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties={{ property="Y", value=player_pos.y-3, },{ property="Z", value=player_pos.z+17+beast_z_offset }}, duration=0 }` |

### `properties` *(line 54)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", value=player_pos.y-3, }` |
| `[2]` | table | `{ property="Z", value=player_pos.z+17+beast_z_offset }` |

### `properties` *(line 64)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", ease="Out", value=player_pos.y }` |
| `[2]` | table | `{ property="Z", ease="Out", value=player_pos.z+beast_z_offset }` |

### `properties` *(line 76)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", value=player_pos.y }` |
| `[2]` | table | `{ property="Z", value=player_pos.z+beast_z_offset }` |

### `properties` *(line 86)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", ease="In", value=player_pos.y+3 }` |
| `[2]` | table | `{ property="Z", ease="In", value=player_pos.z+17+beast_z_offset }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezwarps/lev_beast_out_animation.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
