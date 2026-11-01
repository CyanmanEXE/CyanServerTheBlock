# `object_registry.lua`

> **Source:** `scripts/ezlibs-scripts/object_registry.lua`  
> **Source lines:** 58  
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

Register a handler for an object type. @param object_type: string, the type of object (e.g., "Custom Warp") @param callback: function(area_id, object) to be called for each object @param cache: boolean, whether to cache the object (remove from Net). Default true.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/ezcache` — line 2

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 13 | `object_registry.register_handler` | `object_type, callback, cache` |
| 30 | `object_registry.load_all` | `(none)` |

### Function notes

- **`object_registry.register_handler(object_type, callback, cache)`** — Register a handler for an object type. @param object_type: string, the type of object (e.g., "Custom Warp") @param callback: function(area_id, object) to be called for each object @param cache: boolean, whether to cache the object (remove from Net). Default true. *(source line 13)*
- **`object_registry.load_all()`** *(source line 30)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `object_registry` *(line 3)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `handlers` | table | `{}` |
| `types_to_cache` | table | `{}` |

### `handlers` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `types_to_cache` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/object_registry.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
