# `main.lua`

> **Source:** `scripts/ezlibs-scripts/ezwarps/main.lua`  
> **Source lines:** 339  
> **Functions detected:** 16  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

arrival / leaving animations

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/json` — line 2
- `scripts/ezlibs-scripts/ezwarps/arrow_animation_factory` — line 3
- `scripts/ezlibs-scripts/ezwarps/log_in_animation` — line 4
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 5
- `scripts/ezlibs-scripts/object_registry` — line 6
- `scripts/ezlibs-scripts/ezbus` — line 7
- `scripts/ezlibs-scripts/ezcache` — line 8
- `scripts/ezlibs-scripts/ezwarps/fall_in_animation` — line 14
- `scripts/ezlibs-scripts/ezwarps/lev_beast_in_animation` — line 15
- `scripts/ezlibs-scripts/ezwarps/lev_beast_out_animation` — line 16
- `scripts/ezlibs-scripts/ezwarps/fall_off_2` — line 25
- `scripts/ezlibs-scripts/ezpress` — line 251

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 35 | `table_has_value` | `table, val` |
| 45 | `log` | `message` |
| 51 | `property_is_true` | `value` |
| 55 | `add_landing` | `area_id, incoming_data, x, y, z, direction, warp_in, arrival_animation` |
| 73 | `doAnimationForWarp` | `player_id,animation_name,is_leave_animation,warp_object` |
| 92 | `add_interact_warp` | `object, object_id, area_id, area_name` |
| 105 | `add_radius_warp` | `object, object_id, area_id, area_name` |
| 122 | `add_custom_warp` | `object, object_id, area_id, area_name` |
| 142 | `process_warp_object` | `area_id, object` |
| 167 | `prepare_player_arrival` | `player_id,x,y,z,special_animation_name` |
| 184 | `ezwarps.handle_player_request` | `player_id, data` |
| 200 | `use_warp` | `player_id,warp_object,warp_meta` |
| 300 | `ezwarps.handle_custom_warp` | `player_id, object_id` |
| 317 | `ezwarps.handle_player_join` | `player_id` |
| 324 | `ezwarps.player_is_in_animation` | `player_id` |
| 331 | `ezwarps.handle_player_transfer` | `player_id` |

### Function notes

- **`table_has_value(table, val)`** *(source line 35)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`log(message)`** — Logs the given message on screen -- *(source line 45)*
- **`property_is_true(value)`** — Normalizes a custom property that may be a real boolean or a string such as "true"/"false" into a real Lua boolean. *(source line 51)*
- **`add_landing(area_id, incoming_data, x, y, z, direction, warp_in, arrival_animation)`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`doAnimationForWarp(player_id,animation_name,is_leave_animation,warp_object)`** *(source line 73)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`add_interact_warp(object, object_id, area_id, area_name)`** *(source line 92)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`add_radius_warp(object, object_id, area_id, area_name)`** — Adds the given radius warp to the list of detected radius warps *(source line 105)*
- **`add_custom_warp(object, object_id, area_id, area_name)`** — Adds the given custom warp to the list of detected custom warps *(source line 122)*
- **`process_warp_object(area_id, object)`** — Shared function to process any warp object *(source line 142)*
- **`prepare_player_arrival(player_id,x,y,z,special_animation_name)`** *(source line 167)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezwarps.handle_player_request(player_id, data)`** *(source line 184)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`use_warp(player_id,warp_object,warp_meta)`** *(source line 200)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezwarps.handle_custom_warp(player_id, object_id)`** *(source line 300)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezwarps.handle_player_join(player_id)`** *(source line 317)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezwarps.player_is_in_animation(player_id)`** *(source line 324)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezwarps.handle_player_transfer(player_id)`** *(source line 331)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezwarps` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `special_animations` *(line 13)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `fall_in` | call/expression | `require('scripts/ezlibs-scripts/ezwarps/fall_in_animation')` |
| `lev_beast_in` | call/expression | `require('scripts/ezlibs-scripts/ezwarps/lev_beast_in_animation')` |
| `lev_beast_out` | call/expression | `require('scripts/ezlibs-scripts/ezwarps/lev_beast_out_animation')` |
| `arrow_up_left_out` | call/expression | `create_arrow_animation(false` |
| `[5]` | string literal | `"Up Left")` |
| `arrow_up_right_out` | call/expression | `create_arrow_animation(false` |
| `[7]` | string literal | `"Up Right")` |
| `arrow_down_left_out` | call/expression | `create_arrow_animation(false` |
| `[9]` | string literal | `"Down Left")` |
| `arrow_down_right_out` | call/expression | `create_arrow_animation(false` |
| `[11]` | string literal | `"Down Right")` |
| `arrow_up_left_in` | call/expression | `create_arrow_animation(true` |
| `[13]` | string literal | `"Up Left")` |
| `arrow_up_right_in` | call/expression | `create_arrow_animation(true` |
| `[15]` | string literal | `"Up Right")` |
| `arrow_down_left_in` | call/expression | `create_arrow_animation(true` |
| `[17]` | string literal | `"Down Left")` |
| `arrow_down_right_in` | call/expression | `create_arrow_animation(true` |
| `[19]` | string literal | `"Down Right")` |
| `fall_off_2` | call/expression | `require('scripts/ezlibs-scripts/ezwarps/fall_off_2')` |
| `log_in` | call/expression | `create_jack_in_out_animation(true)` |
| `log_out` | call/expression | `create_jack_in_out_animation(false)` |

### `landings` *(line 29)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_animations` *(line 31)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `players_in_animations` *(line 32)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `warp_types_with_landings` *(line 33)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Server Warp"` |
| `[2]` | string literal | `"Custom Warp"` |
| `[3]` | string literal | `"Interact Warp"` |
| `[4]` | string literal | `"Radius Warp"` |

### `new_landing` *(line 56)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `warp_in` | expression/reference | `warp_in` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |
| `pre_animation_x` | expression/reference | `x` |
| `pre_animation_y` | expression/reference | `y` |
| `pre_animation_z` | expression/reference | `z` |
| `direction` | expression/reference | `direction` |
| `arrival_animation` | expression/reference | `arrival_animation` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezwarps/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
