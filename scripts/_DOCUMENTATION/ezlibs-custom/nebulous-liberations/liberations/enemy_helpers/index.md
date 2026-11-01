# `enemy_helpers.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers.lua`  
> **Source lines:** 276  
> **Functions detected:** 14  
> **Table declarations detected:** 6

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

- `scripts/ezlibs-custom/nebulous-liberations/utils/recover_effect` — line 1
- `scripts/libs/direction` — line 2
- `scripts/ezlibs-custom/nebulous-liberations/liberations/hp_indicators` — line 3

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 17 | `EnemyHelpers.play_attack_animation` | `enemy` |
| 26 | `EnemyHelpers.update_name` | `enemy` |
| 33 | `EnemyHelpers.heal` | `enemy, amount` |
| 49 | `EnemyHelpers.face_position` | `enemy, x, y` |
| 56 | `is_enemy_team_panel` | `panel` |
| 64 | `EnemyHelpers.is_occupied_by_enemy` | `instance, x, y, z, ignored_enemy` |
| 91 | `EnemyHelpers.can_spawn_on` | `instance, x, y, z` |
| 97 | `EnemyHelpers.can_move_to` | `instance, x, y, z, moving_enemy` |
| 105 | `EnemyHelpers.move` | `instance, enemy, x, y, z, direction` |
| 182 | `EnemyHelpers.offset_position_with_direction` | `position, direction` |
| 202 | `EnemyHelpers.chebyshev_tile_distance` | `enemy, x, y` |
| 209 | `EnemyHelpers.find_closest_player_session` | `instance, enemy` |
| 233 | `normalize_enemy_name` | `value` |
| 242 | `EnemyHelpers.sync_health` | `enemy, results` |

### Function notes

- **`EnemyHelpers.play_attack_animation(enemy)`** *(source line 17)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.update_name(enemy)`** *(source line 26)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.heal(enemy, amount)`** *(source line 33)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.face_position(enemy, x, y)`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_enemy_team_panel(panel)`** *(source line 56)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.is_occupied_by_enemy(instance, x, y, z, ignored_enemy)`** *(source line 64)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.can_spawn_on(instance, x, y, z)`** — Liberation's enemy-owned territory is represented by the panel types already used by enemy movement. Keep spawning and movement on the same rule. *(source line 91)*
- **`EnemyHelpers.can_move_to(instance, x, y, z, moving_enemy)`** *(source line 97)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.move(instance, enemy, x, y, z, direction)`** — takes instance to move player cameras x, y, z should be floored *(source line 105)*
- **`EnemyHelpers.offset_position_with_direction(position, direction)`** *(source line 182)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.chebyshev_tile_distance(enemy, x, y)`** *(source line 202)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.find_closest_player_session(instance, enemy)`** — uses chebyshev_tile_distance *(source line 209)*
- **`normalize_enemy_name(value)`** *(source line 233)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyHelpers.sync_health(enemy, results)`** *(source line 242)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `EnemyHelpers` *(line 4)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `guardian_minimap_marker` | table | `{ r = 230, g = 50, b = 40 }` |
| `boss_minimap_color` | table | `{ r = 170, g = 50, b = 170 }` |

### `guardian_minimap_marker` *(line 6)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `230` |
| `g` | number literal | `50` |
| `b` | number literal | `40` |

### `boss_minimap_color` *(line 7)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `170` |
| `g` | number literal | `50` |
| `b` | number literal | `170` |

### `direction_suffix_map` *(line 9)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `[Direction.DOWN_LEFT] = "DL"` |
| `[2]` | expression/reference | `[Direction.DOWN_RIGHT] = "DR"` |
| `[3]` | expression/reference | `[Direction.UP_LEFT] = "UL"` |
| `[4]` | expression/reference | `[Direction.UP_RIGHT] = "UR"` |

### `position` *(line 183)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `position.x` |
| `y` | expression/reference | `position.y` |
| `z` | expression/reference | `position.z` |

### `reported_names` *(line 254)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
