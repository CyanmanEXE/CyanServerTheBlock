# `ezvalidate.lua`

> **Source:** `scripts/ezlibs-scripts/utils/ezvalidate.lua`  
> **Source lines:** 68  
> **Functions detected:** 4  
> **Table declarations detected:** 1

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezvalidate.lua Dependency-free validation helpers for Lua 5.2.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `ezvalidate.is_type` | `value, expected_type` |
| 11 | `ezvalidate.number_range` | `value, minimum, maximum` |
| 33 | `ezvalidate.required_fields` | `value, fields` |
| 49 | `ezvalidate.table_field_types` | `value, expected` |

### Function notes

- **`ezvalidate.is_type(value, expected_type)`** *(source line 6)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezvalidate.number_range(value, minimum, maximum)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezvalidate.required_fields(value, fields)`** *(source line 33)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezvalidate.table_field_types(value, expected)`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezvalidate` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/utils/ezvalidate.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
