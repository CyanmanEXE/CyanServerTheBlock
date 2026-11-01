# `bigbrute.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/enemies/bigbrute.lua`  
> **Source lines:** 224  
> **Functions detected:** 9  
> **Table declarations detected:** 4

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

- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers` — line 1
- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_selection` — line 2
- `scripts/ezlibs-custom/nebulous-liberations/liberations/preloader` — line 3
- `scripts/libs/direction` — line 4

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `BigBrute:new` | `instance, position, direction` |
| 40 | `BigBrute:spawn` | `direction` |
| 63 | `BigBrute:get_death_message` | `(none)` |
| 67 | `sign` | `a` |
| 75 | `find_offset` | `self, xstep, ystep, limit` |
| 90 | `attempt_axis_move` | `self, player, diff, xfilter, yfilter` |
| 117 | `attempt_move` | `self` |
| 156 | `attempt_attack` | `self` |
| 216 | `BigBrute:take_turn` | `(none)` |

### Function notes

- **`BigBrute:new(instance, position, direction)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`BigBrute:spawn(direction)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`BigBrute:get_death_message()`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sign(a)`** *(source line 67)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`find_offset(self, xstep, ystep, limit)`** *(source line 75)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`attempt_axis_move(self, player, diff, xfilter, yfilter)`** *(source line 90)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`attempt_move(self)`** *(source line 117)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`attempt_attack(self)`** *(source line 156)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`BigBrute:take_turn()`** *(source line 216)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `BigBrute` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bigbrute` *(line 12)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `id` | nil | `nil` |
| `battle_name` | string literal | `"BigBrute"` |
| `health` | number literal | `120` |
| `max_health` | number literal | `120` |
| `x` | call/expression | `math.floor(position.x)` |
| `y` | call/expression | `math.floor(position.y)` |
| `z` | call/expression | `math.floor(position.z)` |
| `selection` | call/expression | `EnemySelection:new(instance)` |
| `encounter` | string literal | `"/server/assets/encounters/big_brute_encounter.zip"` |

### `shape` *(line 27)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1, 1, 1}` |
| `[2]` | table | `{1, 0, 1}` |
| `[3]` | table | `{1, 1, 1}` |

### `spawned_bots` *(line 174)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/enemies/bigbrute.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
