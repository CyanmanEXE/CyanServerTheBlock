# `direction.lua`

> **Source:** `scripts/libs/direction.lua`  
> **Source lines:** 86  
> **Functions detected:** 5  
> **Table declarations detected:** 3

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

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 23 | `Direction.reverse` | `direction` |
| 27 | `Direction.from_points` | `point_a, point_b` |
| 39 | `Direction.diagonal_from_points` | `point_a, point_b` |
| 62 | `Direction.from_offset` | `x, y` |
| 68 | `Direction.diagonal_from_offset` | `x, y` |

### Function notes

- **`Direction.reverse(direction)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Direction.from_points(point_a, point_b)`** *(source line 27)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Direction.diagonal_from_points(point_a, point_b)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Direction.from_offset(x, y)`** *(source line 62)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Direction.diagonal_from_offset(x, y)`** *(source line 68)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Direction` *(line 1)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `UP` | string literal | `"Up"` |
| `LEFT` | string literal | `"Left"` |
| `DOWN` | string literal | `"Down"` |
| `RIGHT` | string literal | `"Right"` |
| `UP_LEFT` | string literal | `"Up Left"` |
| `UP_RIGHT` | string literal | `"Up Right"` |
| `DOWN_LEFT` | string literal | `"Down Left"` |
| `DOWN_RIGHT` | string literal | `"Down Right"` |

### `reverse_table` *(line 11)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Up]` | string literal | `"Down"` |
| `[Left]` | string literal | `"Right"` |
| `[Down]` | string literal | `"Up"` |
| `[Right]` | string literal | `"Left"` |
| `[Up Left]` | string literal | `"Down Right"` |
| `[Up Right]` | string literal | `"Down Left"` |
| `[Down Left]` | string literal | `"Up Right"` |
| `[Down Right]` | string literal | `"Up Left"` |

### `directions` *(line 50)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Up Left"` |
| `[2]` | string literal | `"Up"` |
| `[3]` | string literal | `"Up Right"` |
| `[4]` | string literal | `"Right"` |
| `[5]` | string literal | `"Down Right"` |
| `[6]` | string literal | `"Down"` |
| `[7]` | string literal | `"Down Left"` |
| `[8]` | string literal | `"Left"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/libs/direction.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
