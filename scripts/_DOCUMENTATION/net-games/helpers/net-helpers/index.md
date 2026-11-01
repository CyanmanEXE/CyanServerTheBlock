# `net-helpers.lua`

> **Source:** `scripts/net-games/helpers/net-helpers.lua`  
> **Source lines:** 106  
> **Functions detected:** 5  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== scripts/net-games/helpers/net-helpers.lua EZLIBS compatibility helpers for net-games Adds: Net:create_timer(seconds, callback) -> handle handle:cancel() Why: EZLIBS ships timer helpers; base net-games typically doesn't. We implement it in the net-games style: driven by Net:on("tick"). =====================================================

## Dependencies

- No `require(...)` dependency was detected.

## Events

- `Net:on("tick", function(event) ...)` — line 11. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 25. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 21 | `attach_tick_listener` | `(none)` |
| 49 | `NetHelpers.create_timer` | `seconds, callback` |
| 68 | `handle:cancel` | `(none)` |
| 81 | `NetHelpers.safe_require` | `path` |
| 93 | `NetHelpers.patch_net` | `(none)` |

### Function notes

- **`attach_tick_listener()`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`NetHelpers.create_timer(seconds, callback)`** — Public: Net:create_timer(seconds, callback) *(source line 49)*
- **`handle:cancel()`** *(source line 68)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`NetHelpers.safe_require(path)`** — ===================================================== EZLIBS-ish safe_require: load a module without hard-crashing the whole server boot. Returns: module_or_nil, err_or_nil ===================================================== *(source line 81)*
- **`NetHelpers.patch_net()`** — Patch Net only if missing, so you don't stomp something else later. *(source line 93)*

## Tables and data structures

### `NetHelpers` *(line 13)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `TIMERS` *(line 19)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `handle` *(line 67)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/helpers/net-helpers.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
