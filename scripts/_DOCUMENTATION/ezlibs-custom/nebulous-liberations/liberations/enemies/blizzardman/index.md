# `blizzardman.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/enemies/blizzardman.lua`  
> **Source lines:** 159  
> **Functions detected:** 4  
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

- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_selection` — line 1
- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers` — line 2
- `scripts/ezlibs-custom/nebulous-liberations/liberations/preloader` — line 3
- `scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception` — line 4

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `BlizzardMan:new` | `instance, position, direction` |
| 45 | `BlizzardMan:spawn` | `direction` |
| 59 | `BlizzardMan:get_death_message` | `(none)` |
| 63 | `BlizzardMan:take_turn` | `(none)` |

### Function notes

- **`BlizzardMan:new(instance, position, direction)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`BlizzardMan:spawn(direction)`** *(source line 45)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`BlizzardMan:get_death_message()`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`BlizzardMan:take_turn()`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `BlizzardMan` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `blizzardman` *(line 12)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `id` | nil | `nil` |
| `health` | number literal | `400` |
| `is_boss` | boolean literal | `true` |
| `max_health` | number literal | `400` |
| `x` | call/expression | `math.floor(position.x)` |
| `y` | call/expression | `math.floor(position.y)` |
| `z` | call/expression | `math.floor(position.z)` |
| `mug` | table | `{ texture_path = "/server/assets/ezlibs-custom/nebulous-liberations/mugs/blizzardman.png", animation_path = "/server/assets/ezlibs-custom/nebulous-liberations/mugs/blizzardman.anim…` |
| `encounter` | string literal | `"/server/assets/encounters/big_brute_encounter.zip"` |
| `selection` | call/expression | `EnemySelection:new(instance)` |

### `mug` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/mugs/blizzardman.png"` |
| `animation_path` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/mugs/blizzardman.animation"` |

### `shape` *(line 31)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1, 1, 1}` |
| `[2]` | table | `{1, 0, 1}` |
| `[3]` | table | `{1, 1, 1}` |
| `[4]` | table | `{1, 1, 1}` |

### `spawned_bots` *(line 102)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `properties` *(line 120)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "Animation", value = "FALL" }` |

### `properties` *(line 125)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "Z", ease = "Linear", value = position.z + 1 }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/enemies/blizzardman.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
