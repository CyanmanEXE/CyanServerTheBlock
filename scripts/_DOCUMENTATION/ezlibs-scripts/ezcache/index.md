# `ezcache.lua`

> **Source:** `scripts/ezlibs-scripts/ezcache.lua`  
> **Source lines:** 59  
> **Functions detected:** 4  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Add a type to the cacheable set

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `ezcache.add_cacheable_type` | `type_name` |
| 11 | `ezcache.object_is_of_type` | `object` |
| 16 | `ezcache.cache_object` | `area_id, object` |
| 36 | `ezcache.get_object_by_id_cached` | `area_id, object_id` |

### Function notes

- **`ezcache.add_cacheable_type(type_name)`** — Add a type to the cacheable set *(source line 6)*
- **`ezcache.object_is_of_type(object)`** — Check if an object type should be cached *(source line 11)*
- **`ezcache.cache_object(area_id, object)`** — Store a pre‑fetched object in the cache and remove it from Net *(source line 16)*
- **`ezcache.get_object_by_id_cached(area_id, object_id)`** — Get an object by ID, using cache and fetching if necessary *(source line 36)*

## Tables and data structures

### `ezcache` *(line 1)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ezcache.cache` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ezcache.cacheable_types` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezcache.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
