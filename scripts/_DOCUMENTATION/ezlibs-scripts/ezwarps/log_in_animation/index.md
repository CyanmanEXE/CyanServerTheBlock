# `log_in_animation.lua`

> **Source:** `scripts/ezlibs-scripts/ezwarps/log_in_animation.lua`  
> **Source lines:** 81  
> **Functions detected:** 2  
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

- `scripts/ezlibs-scripts/ezlogger` — line 1

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 2 | `create_jack_in_out_animation` | `is_arriving` |
| 10 | `animate` | `player_id` |

### Function notes

- **`create_jack_in_out_animation(is_arriving)`** *(source line 2)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animate(player_id)`** *(source line 10)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `log_in_animation` *(line 3)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `pre_animation_offsets` | table | `{ x=0, y=0, z=0 }` |
| `animate` | function | `function(player_id) return async(function() local player_pos = Net.get_player_position(player_id) local area_id = Net.get_player_area(player…` |
| `[3]` | string literal | `"/server/assets/ezlibs-assets/ezwarps/logout.png") Net.provide_asset(area_id` |
| `[4]` | string literal | `"/server/assets/ezlibs-assets/ezwarps/logout.animation") local warp_in_effect_id = "warp_in_effect_"..player_id logger:info('spawning log in…` |
| `[5]` | table | `{ warp_in = false, texture_path = "/server/assets/ezlibs-assets/ezwarps/logout.png", animation_path = "/server/assets/ezlibs-assets/ezwarps/…` |
| `[6]` | string literal | `"JACK_IN"` |
| `[7]` | call/expression | `false) Net.play_sound(area_id` |
| `[8]` | string literal | `'/server/assets/ezlibs-assets/ezwarps/log_in.ogg') else Net.animate_bot(warp_in_effect_id` |
| `[9]` | string literal | `"JACK_OUT"` |
| `[10]` | call/expression | `false) Net.play_sound(area_id` |
| `[11]` | string literal | `'/server/assets/ezlibs-assets/ezwarps/log_out.ogg') end local duration = 1.0 local vanish_time = 0.4 local player_keyframes = {{ properties=…` |
| `[12]` | call/expression | `player_keyframes) await(Async.sleep(vanish_time)) local players = Net.list_players(area_id) for i` |
| `[13]` | expression/reference | `nearby_player_id in next` |
| `[14]` | call/expression | `players do if is_arriving then Net.include_actor_for_player(nearby_player_id` |
| `[15]` | call/expression | `player_id) else Net.exclude_actor_for_player(nearby_player_id` |
| `[16]` | call/expression | `player_id) end end await(Async.sleep(duration)) Net.unlock_player_camera(player_id) Net.remove_bot(warp_in_effect_id) end) end` |

### `pre_animation_offsets` *(line 5)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `z` | number literal | `0` |

### `player_keyframes` *(line 36)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties={{ property="Y", value=player_pos.y, },{ property="Z", value=player_pos.z }}, duration=0 }` |

### `properties` *(line 38)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", value=player_pos.y, }` |
| `[2]` | table | `{ property="Z", value=player_pos.z }` |

### `properties` *(line 48)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property="Y", ease="Out", value=player_pos.y }` |
| `[2]` | table | `{ property="Z", ease="Out", value=player_pos.z }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezwarps/log_in_animation.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
