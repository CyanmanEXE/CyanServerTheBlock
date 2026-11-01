# `enemy.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy.lua`  
> **Source lines:** 101  
> **Functions detected:** 3  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

enemy.lua

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 2
- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_templates` — line 5
- `scripts/ezlibs-custom/nebulous-liberations/utils/exploding_effect` — line 6
- `scripts/ezlibs-custom/nebulous-liberations/liberations/hp_indicators` — line 7

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `Enemy.from` | `instance, position, direction, name, spawn_options` |
| 21 | `Enemy.is_alive` | `enemy` |
| 35 | `Enemy.destroy` | `instance, enemy` |

### Function notes

- **`Enemy.from(instance, position, direction, name, spawn_options)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Enemy.is_alive(enemy)`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Enemy.destroy(instance, enemy)`** *(source line 35)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Enemy` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `lock_tracker` *(line 66)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
