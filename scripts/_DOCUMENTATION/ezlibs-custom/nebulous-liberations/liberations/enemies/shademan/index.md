# `shademan.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/enemies/shademan.lua`  
> **Source lines:** 111  
> **Functions detected:** 4  
> **Table declarations detected:** 5

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
- `scripts/libs/direction` — line 4
- `scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception` — line 5

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 9 | `ShadeMan:new` | `instance, position, direction` |
| 40 | `ShadeMan:spawn` | `direction` |
| 55 | `ShadeMan:get_death_message` | `(none)` |
| 59 | `ShadeMan:take_turn` | `(none)` |

### Function notes

- **`ShadeMan:new(instance, position, direction)`** *(source line 9)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ShadeMan:spawn(direction)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ShadeMan:get_death_message()`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ShadeMan:take_turn()`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ShadeMan` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `shademan` *(line 10)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `id` | nil | `nil` |
| `health` | number literal | `600` |
| `is_boss` | boolean literal | `true` |
| `max_health` | number literal | `600` |
| `x` | call/expression | `math.floor(position.x)` |
| `y` | call/expression | `math.floor(position.y)` |
| `z` | call/expression | `math.floor(position.z)` |
| `mug` | table | `{ texture_path = "/server/assets/NebuLibsAssets/mugs/shademan.png", animation_path = "/server/assets/NebuLibsAssets/mugs/shademan.animation"…` |
| `encounter` | string literal | `"/server/assets/ezlibs-assets/ezencounters/Shademan.zip"` |
| `selection` | call/expression | `EnemySelection:new(instance)` |

### `mug` *(line 19)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/NebuLibsAssets/mugs/shademan.png"` |
| `animation_path` | string literal | `"/server/assets/NebuLibsAssets/mugs/shademan.animation"` |

### `shape` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1}` |

### `warp_back_pos` *(line 88)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `self.x` |
| `y` | expression/reference | `self.y` |
| `z` | expression/reference | `self.z` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/enemies/shademan.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
