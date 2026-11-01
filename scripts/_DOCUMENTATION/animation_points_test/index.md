# `animation_points_test.lua`

> **Source:** `scripts/animation_points_test.lua`  
> **Source lines:** 22  
> **Functions detected:** 1  
> **Table declarations detected:** 2

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

- `scripts/ezlibs-custom/footbomb/animation_points` — line 2

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 4 | `check` | `label, frame, point, expected_x, expected_y` |

### Function notes

- **`check(label, frame, point, expected_x, expected_y)`** *(source line 4)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `base` *(line 11)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `w` | number literal | `36` |
| `h` | number literal | `36` |
| `originx` | number literal | `19` |
| `originy` | number literal | `35` |

### `ball` *(line 13)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `31` |
| `y` | number literal | `11` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/animation_points_test.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
