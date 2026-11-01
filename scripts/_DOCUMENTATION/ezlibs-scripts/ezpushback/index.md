# `ezpushback.lua`

> **Source:** `scripts/ezlibs-scripts/ezpushback.lua`  
> **Source lines:** 574  
> **Functions detected:** 27  
> **Table declarations detected:** 13

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezpushback.lua A Pushback NPC uses the regular eznpcs NPC pipeline, with a moving rectangle trigger that follows its bot. On collision, a temporary bot uses the player's own avatar, plays a movement animation, and carries the player to its endpoint.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 6
- `scripts/ezlibs-scripts/eztriggers` — line 7
- `scripts/ezlibs-scripts/ezbus` — line 8
- `scripts/ezlibs-scripts/ezemitter` — line 9
- `scripts/ezlibs-scripts/object_registry` — line 10
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 11

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 26 | `truthy` | `value, default` |
| 36 | `number_property` | `props, name, default, min_value` |
| 43 | `safe_call` | `fn, ...` |
| 48 | `get_area_players` | `area_id` |
| 54 | `provide_avatar_to_area` | `area_id, avatar` |
| 62 | `set_player_actor_hidden` | `player_id, area_id, hidden` |
| 72 | `remove_bot` | `bot_id` |
| 76 | `event_for` | `entry, player_id, extra` |
| 90 | `emit_entry` | `entry, name, event` |
| 125 | `map_vector_to_screen` | `dx, dy` |
| 130 | `screen_vector_to_map` | `sx, sy` |
| 135 | `atan2` | `y, x` |
| 159 | `snap_to_canonical_map` | `dx, dy` |
| 170 | `direction_vector` | `direction` |
| 192 | `get_push_vector` | `entry, player_pos, npc_pos, player_direction` |
| 219 | `calculate_target` | `entry, player_pos, npc_pos, player_direction` |
| 246 | `cleanup_push` | `player_id, state, reason, restore_player` |
| 269 | `perform_pushback` | `entry, player_id` |
| 420 | `update_entry_geometry` | `entry` |
| 440 | `register_pushback_npc` | `area_id, object` |
| 504 | `ezpushback.get_emitter` | `area_id, object_id` |
| 509 | `ezpushback.set_collision_enabled` | `area_id, object_id, enabled` |
| 517 | `ezpushback.handle_player_move` | `player_id, x, y, z` |
| 522 | `ezpushback.on_tick` | `delta_time` |
| 544 | `ezpushback.handle_player_join` | `player_id` |
| 556 | `ezpushback.handle_player_transfer` | `player_id` |
| 563 | `ezpushback.handle_player_disconnect` | `player_id` |

### Function notes

- **`truthy(value, default)`** *(source line 26)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`number_property(props, name, default, min_value)`** *(source line 36)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`safe_call(fn, ...)`** *(source line 43)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_area_players(area_id)`** *(source line 48)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`provide_avatar_to_area(area_id, avatar)`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_player_actor_hidden(player_id, area_id, hidden)`** *(source line 62)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_bot(bot_id)`** *(source line 72)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`event_for(entry, player_id, extra)`** *(source line 76)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`emit_entry(entry, name, event)`** *(source line 90)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`map_vector_to_screen(dx, dy)`** *(source line 125)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`screen_vector_to_map(sx, sy)`** *(source line 130)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`atan2(y, x)`** *(source line 135)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`snap_to_canonical_map(dx, dy)`** — Snap an arbitrary map-space vector to the nearest canonical isometric direction. Returns the unit-length snapped vector plus its canonical name. *(source line 159)*
- **`direction_vector(direction)`** *(source line 170)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_push_vector(entry, player_pos, npc_pos, player_direction)`** — Get the radial push direction (from NPC toward player) in map space, as a unit vector. This vector is the raw radial direction; it is snapped to the canonical isometric grid in calculate_target. *(source line 192)*
- **`calculate_target(entry, player_pos, npc_pos, player_direction)`** *(source line 219)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cleanup_push(player_id, state, reason, restore_player)`** *(source line 246)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`perform_pushback(entry, player_id)`** *(source line 269)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_entry_geometry(entry)`** *(source line 420)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`register_pushback_npc(area_id, object)`** *(source line 440)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.get_emitter(area_id, object_id)`** *(source line 504)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.set_collision_enabled(area_id, object_id, enabled)`** *(source line 509)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.handle_player_move(player_id, x, y, z)`** *(source line 517)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.on_tick(delta_time)`** *(source line 522)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.handle_player_join(player_id)`** *(source line 544)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.handle_player_transfer(player_id)`** *(source line 556)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.handle_player_disconnect(player_id)`** *(source line 563)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezpushback` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `entries` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `active_by_player` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `cooldowns` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `event` *(line 77)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `area_id` | expression/reference | `entry.area_id` |
| `object_id` | expression/reference | `entry.object_id` |
| `npc_bot_id` | expression/reference | `entry.bot_id` |
| `trigger_id` | expression/reference | `entry.trigger_id` |

### `CANONICAL_DIRECTIONS` *(line 141)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = 'DownRight', x = 1, y = 0 }` |
| `[2]` | table | `{ name = 'Down', x = 0.70710678, y = 0.70710678 }` |
| `[3]` | table | `{ name = 'DownLeft', x = 0, y = 1 }` |
| `[4]` | table | `{ name = 'Left', x = -0.70710678, y = 0.70710678 }` |
| `[5]` | table | `{ name = 'UpLeft', x = -1, y = 0 }` |
| `[6]` | table | `{ name = 'Up', x = -0.70710678, y = -0.70710678 }` |
| `[7]` | table | `{ name = 'UpRight', x = 0, y = -1 }` |
| `[8]` | table | `{ name = 'Right', x = 0.70710678, y = -0.70710678 }` |

### `OPPOSITE_DIRECTION` *(line 151)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DownRight` | string literal | `'UpLeft'` |
| `Down` | string literal | `'Up'` |
| `DownLeft` | string literal | `'UpRight'` |
| `Left` | string literal | `'Right'` |
| `UpLeft` | string literal | `'DownRight'` |
| `Up` | string literal | `'Down'` |
| `UpRight` | string literal | `'DownLeft'` |
| `Right` | string literal | `'Left'` |

### `state` *(line 300)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `area_id` | expression/reference | `entry.area_id` |
| `entry` | expression/reference | `entry` |
| `bot_id` | expression/reference | `temp_bot_id` |
| `start_position` | table | `{ x = player_pos.x, y = player_pos.y, z = player_pos.z or 0 }` |
| `target_position` | expression/reference | `target` |
| `original_direction` | expression/reference | `player_direction` |
| `was_input_locked` | call/expression | `(type(Net.is_player_input_locked) == 'function' and Net.is_player_input_locked(player_id)) or false` |
| `avatar` | expression/reference | `avatar` |
| `cleaned` | boolean literal | `false` |
| `transferring` | boolean literal | `false` |

### `start_position` *(line 305)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `player_pos.x` |
| `y` | expression/reference | `player_pos.y` |
| `z` | expression/reference | `player_pos.z or 0` |

### `properties` *(line 352)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = 'X', value = target.x, ease = 'Out' }` |
| `[2]` | table | `{ property = 'Y', value = target.y, ease = 'Out' }` |
| `[3]` | table | `{ property = 'Z', value = target.z, ease = 'Linear' }` |

### `final_pos` *(line 383)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(bot_pos.x)` |
| `y` | call/expression | `tonumber(bot_pos.y)` |
| `z` | call/expression | `tonumber(bot_pos.z) or target.z` |
| `direction` | expression/reference | `target.direction` |

### `trigger_object` *(line 451)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `trigger_id` |
| `name` | call/expression | `object.name or ('Pushback NPC ' .. tostring(object.id))` |
| `x` | call/expression | `(tonumber(object.x) or 0) - width / 2` |
| `y` | call/expression | `(tonumber(object.y) or 0) - height / 2` |
| `z` | call/expression | `tonumber(object.z) or 0` |
| `width` | expression/reference | `width` |
| `height` | expression/reference | `height` |

### `entry` *(line 462)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `key` | expression/reference | `trigger_id` |
| `trigger_id` | expression/reference | `trigger_id` |
| `area_id` | expression/reference | `area_id` |
| `object_id` | expression/reference | `object.id` |
| `bot_id` | expression/reference | `bot_id` |
| `width` | expression/reference | `width` |
| `height` | expression/reference | `height` |
| `push_distance` | call/expression | `number_property(props` |
| `[9]` | string literal | `'Push Distance'` |
| `[10]` | expression/reference | `DEFAULT_PUSH_DISTANCE` |
| `[11]` | number literal | `0.1)` |
| `push_duration` | call/expression | `number_property(props` |
| `[13]` | string literal | `'Push Duration'` |
| `[14]` | expression/reference | `DEFAULT_PUSH_DURATION` |
| `[15]` | number literal | `0.05)` |
| `cooldown` | call/expression | `number_property(props` |
| `[17]` | string literal | `'Push Cooldown'` |
| `[18]` | expression/reference | `DEFAULT_COOLDOWN` |
| `[19]` | number literal | `0)` |
| `move_state` | expression/reference | `props['Move Animation State'] or DEFAULT_MOVE_STATE` |
| `enabled` | call/expression | `truthy(props['Collision Enabled']` |
| `[22]` | expression/reference | `true)` |
| `trigger_object` | expression/reference | `trigger_object` |
| `emitter` | expression/reference | `emitter` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezpushback.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
