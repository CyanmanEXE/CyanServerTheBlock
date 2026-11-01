# `exploding_effect.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/utils/exploding_effect.lua`  
> **Source lines:** 98  
> **Functions detected:** 5  
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

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 5 | `update_tracked_position` | `exploding_effect` |
| 17 | `explode` | `self, explosion_bot_id` |
| 52 | `spawn` | `self, area_id, position` |
| 77 | `ExplodingEffect:new` | `actor_id` |
| 94 | `ExplodingEffect:remove` | `(none)` |

### Function notes

- **`update_tracked_position(exploding_effect)`** *(source line 5)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`explode(self, explosion_bot_id)`** *(source line 17)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`spawn(self, area_id, position)`** *(source line 52)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ExplodingEffect:new(actor_id)`** *(source line 77)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ExplodingEffect:remove()`** *(source line 94)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ExplodingEffect` *(line 74)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `exploding_effect` *(line 78)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `tracked_actor_id` | expression/reference | `actor_id` |
| `position` | nil | `nil` |
| `area_id` | nil | `nil` |
| `done` | boolean literal | `false` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/utils/exploding_effect.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
