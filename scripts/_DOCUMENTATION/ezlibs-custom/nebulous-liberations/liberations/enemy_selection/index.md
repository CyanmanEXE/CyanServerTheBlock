# `enemy_selection.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_selection.lua`  
> **Source lines:** 69  
> **Functions detected:** 7  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

set indicator may need offset_y to adjust with a z input

## Dependencies

- `scripts/ezlibs-custom/nebulous-liberations/liberations/selection` — line 1

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 5 | `EnemySelection:new` | `instance` |
| 16 | `filter` | `x, y, z` |
| 36 | `EnemySelection:set_shape` | `shape, shape_offset_x, shape_offset_y` |
| 40 | `EnemySelection:move` | `position, direction` |
| 45 | `EnemySelection:detect_player_sessions` | `(none)` |
| 59 | `EnemySelection:indicate` | `(none)` |
| 63 | `EnemySelection:remove_indicators` | `(none)` |

### Function notes

- **`EnemySelection:new(instance)`** *(source line 5)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`filter(x, y, z)`** *(source line 16)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemySelection:set_shape(shape, shape_offset_x, shape_offset_y)`** — shape = [m][n] bool array, n being odd, just below bottom center is enemy position *(source line 36)*
- **`EnemySelection:move(position, direction)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemySelection:detect_player_sessions()`** — returns player sessions that collide *(source line 45)*
- **`EnemySelection:indicate()`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemySelection:remove_indicators()`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `EnemySelection` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enemy_selection` *(line 6)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `selection` | call/expression | `Selection:new(instance)` |

### `sessions` *(line 46)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_selection.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
