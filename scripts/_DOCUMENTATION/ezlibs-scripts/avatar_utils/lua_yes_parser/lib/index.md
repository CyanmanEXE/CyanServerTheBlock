# `lib.lua`

> **Source:** `scripts/ezlibs-scripts/avatar_utils/lua_yes_parser/lib.lua`  
> **Source lines:** 53  
> **Functions detected:** 3  
> **Table declarations detected:** 6

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

- `scripts/ezlibs-scripts/avatar_utils/lua_yes_parser/src/enums` — line 1
- `scripts/ezlibs-scripts/avatar_utils/lua_yes_parser/src/element` — line 2

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 5 | `Collector.new` | `(none)` |
| 13 | `self.handleLine` | `line` |
| 40 | `parse` | `path` |

### Function notes

- **`Collector.new()`** *(source line 5)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`self.handleLine(line)`** *(source line 13)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse(path)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Collector` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self` *(line 7)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `lineCount` | number literal | `0` |
| `pendingAttrs` | table | `{}` |
| `elements` | table | `{}` |
| `errors` | table | `{}` |

### `pendingAttrs` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `elements` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `errors` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.pendingAttrs` *(line 31)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/avatar_utils/lua_yes_parser/lib.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
