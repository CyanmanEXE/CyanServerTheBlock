# `animation_diagnostics.lua`

> **Source:** `scripts/ezlibs-custom/footbomb/animation_diagnostics.lua`  
> **Source lines:** 99  
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

Startup diagnostics for FootBomb's active v2.0 Navi animations and their optional v2.5 .ani counterparts. This module is read-only: it never changes the animation state used by Net.animate_bot.

## Dependencies

- `scripts/boom/main` — line 4

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 8 | `emit` | `log, message` |
| 12 | `sorted_state_names` | `states` |
| 19 | `inspect_file` | `option, path, expected_state, log` |
| 82 | `Diagnostics.run` | `options, log` |

### Function notes

- **`emit(log, message)`** *(source line 8)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sorted_state_names(states)`** *(source line 12)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`inspect_file(option, path, expected_state, log)`** *(source line 19)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Diagnostics.run(options, log)`** *(source line 82)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Diagnostics` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `names` *(line 13)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `point_names` *(line 47)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/footbomb/animation_diagnostics.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
