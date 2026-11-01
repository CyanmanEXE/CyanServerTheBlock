# `hp_indicators.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/hp_indicators.lua`  
> **Source lines:** 448  
> **Functions detected:** 24  
> **Table declarations detected:** 14

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Current-HP digits for Liberation mission participants and enemies. Each viewer gets private world map-element bots for other players and enemies. A viewer never receives an HP indicator for their own player. Enemy/boss indicators use the enemy bot origin (enemy.x, enemy.y) and hide during tile movement.

## Dependencies

- `scripts/net-games/main` — line 7

## Events

- `Net:on("player_move", function(event) ...)` — line 400. The event name is taken directly from this source.
- `Net:on("player_area_transfer", function(event) ...)` — line 423. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 20 | `safe_id` | `value` |
| 24 | `map_offset` | `horizontal_offset, vertical_offset, z_lift` |
| 34 | `round_fraction` | `value, denominator` |
| 41 | `fix_offsets` | `x, y` |
| 58 | `target_key` | `target_type, target_id` |
| 62 | `get_target_position` | `target` |
| 69 | `get_digit_layout` | `hp, index, digit_count` |
| 76 | `get_digit_position` | `target, index, digit_count` |
| 84 | `remove_viewer_digits` | `viewer_id, target` |
| 93 | `render_player_for_viewer` | `state, viewer_id, target` |
| 134 | `render_enemy_for_viewer` | `state, viewer_id, target` |
| 171 | `render_target` | `state, target` |
| 195 | `add_target` | `instance, target_type, target_id, hp, position` |
| 219 | `HPIndicators.register` | `instance` |
| 253 | `HPIndicators.add_enemy` | `instance, enemy` |
| 267 | `HPIndicators.update_enemy_hp_for_enemy` | `enemy` |
| 274 | `HPIndicators.update_player_hp` | `instance, player_id, hp` |
| 284 | `HPIndicators.update_enemy_hp` | `instance, enemy` |
| 298 | `HPIndicators.hide_enemy` | `instance, enemy` |
| 308 | `HPIndicators.show_enemy` | `instance, enemy` |
| 321 | `HPIndicators.update_enemy_position` | `instance, enemy` |
| 339 | `HPIndicators.remove_enemy` | `instance, enemy` |
| 352 | `HPIndicators.remove_player` | `instance, player_id` |
| 375 | `HPIndicators.destroy` | `instance` |

### Function notes

- **`safe_id(value)`** *(source line 20)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`map_offset(horizontal_offset, vertical_offset, z_lift)`** *(source line 24)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`round_fraction(value, denominator)`** *(source line 34)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fix_offsets(x, y)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`target_key(target_type, target_id)`** *(source line 58)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_target_position(target)`** *(source line 62)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_digit_layout(hp, index, digit_count)`** *(source line 69)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_digit_position(target, index, digit_count)`** *(source line 76)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_viewer_digits(viewer_id, target)`** *(source line 84)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`render_player_for_viewer(state, viewer_id, target)`** *(source line 93)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`render_enemy_for_viewer(state, viewer_id, target)`** *(source line 134)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`render_target(state, target)`** *(source line 171)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`add_target(instance, target_type, target_id, hp, position)`** *(source line 195)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.register(instance)`** *(source line 219)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.add_enemy(instance, enemy)`** *(source line 253)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.update_enemy_hp_for_enemy(enemy)`** *(source line 267)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.update_player_hp(instance, player_id, hp)`** *(source line 274)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.update_enemy_hp(instance, enemy)`** *(source line 284)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.hide_enemy(instance, enemy)`** *(source line 298)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.show_enemy(instance, enemy)`** *(source line 308)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.update_enemy_position(instance, enemy)`** *(source line 321)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.remove_enemy(instance, enemy)`** *(source line 339)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.remove_player(instance, player_id)`** *(source line 352)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HPIndicators.destroy(instance)`** *(source line 375)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `HPIndicators` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instances_by_area` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instances_by_player` *(line 18)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `names` *(line 100)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `names` *(line 137)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `target` *(line 202)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `key` | expression/reference | `key` |
| `type` | expression/reference | `target_type` |
| `id` | expression/reference | `target_id` |
| `hp` | call/expression | `math.max(0` |
| `[5]` | call/expression | `math.floor(tonumber(hp) or 0))` |
| `position` | expression/reference | `position or { x = 0, y = 0, z = 0 }` |
| `elements` | table | `{}` |
| `hidden` | boolean literal | `false` |

### `elements` *(line 208)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `state` *(line 224)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `viewers` | table | `{}` |
| `targets` | table | `{}` |

### `position` *(line 240)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `result.x` |
| `y` | expression/reference | `result.y` |
| `z` | expression/reference | `result.z` |

### `position` *(line 242)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `player.x` |
| `y` | expression/reference | `player.y` |
| `z` | expression/reference | `player.z` |

### `target.position` *(line 312)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `(tonumber(enemy.x) or 0) + 0.5` |
| `y` | call/expression | `(tonumber(enemy.y) or 0) + 0.6` |
| `z` | call/expression | `tonumber(enemy.z) or 0` |

### `target.position` *(line 325)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `(tonumber(enemy.x) or 0) + 0.5` |
| `y` | call/expression | `(tonumber(enemy.y) or 0) + 0.6` |
| `z` | call/expression | `tonumber(enemy.z) or 0` |

### `target.position` *(line 405)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(event.x) or target.position.x or 0` |
| `y` | call/expression | `tonumber(event.y) or target.position.y or 0` |
| `z` | call/expression | `tonumber(event.z) or target.position.z or 0` |

### `target.position` *(line 431)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(position.x) or target.position.x or 0` |
| `y` | call/expression | `tonumber(position.y) or target.position.y or 0` |
| `z` | call/expression | `tonumber(position.z) or target.position.z or 0` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/hp_indicators.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
