# `selection.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/selection.lua`  
> **Source lines:** 185  
> **Functions detected:** 9  
> **Table declarations detected:** 8

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

private functions

## Dependencies

- `scripts/libs/direction` — line 1

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 5 | `generate_selection_object` | `self` |
| 22 | `Selection:new` | `instance` |
| 41 | `Selection:set_filter` | `filter` |
| 54 | `Selection:set_indicator` | `indicator` |
| 59 | `Selection:set_shape` | `shape, shape_offset_x, shape_offset_y` |
| 65 | `Selection:move` | `position, direction` |
| 72 | `Selection:is_within` | `x, y, z` |
| 124 | `Selection:indicate` | `(none)` |
| 176 | `Selection:remove_indicators` | `(none)` |

### Function notes

- **`generate_selection_object(self)`** — private functions *(source line 5)*
- **`Selection:new(instance)`** *(source line 22)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Selection:set_filter(filter)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Selection:set_indicator(indicator)`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Selection:set_shape(shape, shape_offset_x, shape_offset_y)`** — shape = [m][n] bool array, n being odd, just below bottom center is actor position *(source line 59)*
- **`Selection:move(position, direction)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Selection:is_within(x, y, z)`** *(source line 72)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Selection:indicate()`** *(source line 124)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Selection:remove_indicators()`** *(source line 176)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `data` *(line 12)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"tile"` |
| `gid` | expression/reference | `self.indicator.gid` |

### `Selection` *(line 20)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `attack_collider` *(line 23)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `position` | table | `{ x = 0, y = 0, z = 0 }` |
| `shape` | table | `{}` |
| `shape_offset_x` | number literal | `0` |
| `shape_offset_y` | number literal | `0` |
| `direction` | nil | `nil` |
| `filter` | nil | `nil` |
| `objects` | table | `{}` |
| `indicator` | nil | `nil` |

### `position` *(line 25)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `z` | number literal | `0` |

### `shape` *(line 26)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `objects` *(line 31)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `indicator` *(line 46)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `gid` |
| `[2]` | expression/reference | `width` |
| `[3]` | expression/reference | `height` |
| `[4]` | expression/reference | `offset_x` |
| `[5]` | expression/reference | `offset_y` |

### `self.objects` *(line 181)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/selection.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
