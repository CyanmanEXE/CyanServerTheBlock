# `keyval.lua`

> **Source:** `scripts/ezlibs-scripts/avatar_utils/lua_yes_parser/src/keyval.lua`  
> **Source lines:** 22  
> **Functions detected:** 2  
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
| 2 | `KeyVal.new` | `key, val` |
| 7 | `__tostring` | `self` |

### Function notes

- **`KeyVal.new(key, val)`** *(source line 2)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__tostring(self)`** *(source line 7)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `KeyVal` *(line 1)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `this` *(line 3)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `key` | expression/reference | `key` |
| `val` | expression/reference | `val` |

### `mt` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `__tostring` | expression/reference | `__tostring` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/avatar_utils/lua_yes_parser/src/keyval.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
