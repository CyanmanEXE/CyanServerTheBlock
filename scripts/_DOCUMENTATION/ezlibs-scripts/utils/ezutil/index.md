# `ezutil.lua`

> **Source:** `scripts/ezlibs-scripts/utils/ezutil.lua`  
> **Source lines:** 96  
> **Functions detected:** 8  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezutil.lua Small, dependency-free helpers for Lua 5.2. This module does not depend on ezlibs host APIs.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 7 | `ezutil.clamp` | `value, minimum, maximum` |
| 18 | `ezutil.table_contains` | `list, value` |
| 26 | `ezutil.table_remove_value` | `list, value, remove_all` |
| 44 | `ezutil.table_count` | `value` |
| 53 | `ezutil.table_is_empty` | `value` |
| 58 | `ezutil.shallow_copy` | `source` |
| 68 | `ezutil.deep_copy` | `source, seen` |
| 85 | `ezutil.table_merge` | `target, source` |

### Function notes

- **`ezutil.clamp(value, minimum, maximum)`** *(source line 7)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezutil.table_contains(list, value)`** *(source line 18)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezutil.table_remove_value(list, value, remove_all)`** *(source line 26)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezutil.table_count(value)`** *(source line 44)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezutil.table_is_empty(value)`** *(source line 53)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezutil.shallow_copy(source)`** *(source line 58)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezutil.deep_copy(source, seen)`** — Copies table keys and values recursively. Handles cycles and shared references. *(source line 68)*
- **`ezutil.table_merge(target, source)`** — Copies keys from source into target. Existing target keys are overwritten. *(source line 85)*

## Tables and data structures

### `ezutil` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `copy` *(line 60)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `copy` *(line 73)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/utils/ezutil.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
