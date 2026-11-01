# `ezmenus.lua`

> **Source:** `scripts/ezlibs-scripts/ezmenus.lua`  
> **Source lines:** 45  
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

No module-level description was present in the source. The reference below documents the symbols and behavior visible in this file.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- `Net:on("player_disconnect", function(event) ...)` — line 29. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 2 | `ezmenus.open_menu` | `player_id, board_name, color, posts` |
| 5 | `board_emitter.close_async` | `(none)` |
| 19 | `board_emitter.selection_once` | `(none)` |
| 23 | `handle_cancel` | `event` |

### Function notes

- **`ezmenus.open_menu(player_id, board_name, color, posts)`** *(source line 2)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`board_emitter.close_async()`** *(source line 5)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`board_emitter.selection_once()`** *(source line 19)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`handle_cancel(event)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezmenus` *(line 1)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezmenus.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
