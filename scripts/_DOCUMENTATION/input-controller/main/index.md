# `main.lua`

> **Source:** `scripts/input-controller/main.lua`  
> **Source lines:** 192  
> **Functions detected:** 13  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

main.lua – Unified input API

## Dependencies

- `scripts/utils/utility` — line 12
- `scripts/input-controller/d-pad` — line 13
- `scripts/input-controller/input-controller` — line 14
- `scripts/input-controller/buttons` — line 15

## Events

- `Net:on("player_join", function(event) ...)` — line 46. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 55. The event name is taken directly from this source.
- `Net:on("virtual_input", function(event) ...)` — line 64. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 71. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 35 | `make_controller` | `player_id, opts` |
| 93 | `API.set_controller_class` | `class` |
| 97 | `API.get_controller_class` | `(none)` |
| 103 | `API.get_controller` | `player_id` |
| 108 | `API.get_controller_identity` | `player_id` |
| 119 | `API.create_controller` | `player_id, opts` |
| 127 | `API.spawn_controller` | `player_id, opts` |
| 137 | `API.reload_controller` | `player_id, opts` |
| 150 | `API.set_repeat_delays` | `player_id, first_repeat_delay, repeat_delay` |
| 158 | `API.restore_repeat_delays` | `player_id` |
| 166 | `API.activate_controller` | `player_id` |
| 172 | `API.deactivate_controller` | `player_id` |
| 178 | `API.destroy_controller` | `player_id` |

### Function notes

- **`make_controller(player_id, opts)`** *(source line 35)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`API.set_controller_class(class)`** — Class override ------------------------------------------------------------- *(source line 93)*
- **`API.get_controller_class()`** *(source line 97)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`API.get_controller(player_id)`** — Registry ------------------------------------------------------------------- *(source line 103)*
- **`API.get_controller_identity(player_id)`** — Diagnostic helper: Lua table identity as seen by each input consumer. *(source line 108)*
- **`API.create_controller(player_id, opts)`** — Create + register a controller for a player_id (idempotent). `opts` may include: auto_activate        (boolean, default true) button_mappings      (table)   override the default mapping direction_raw_names  (table)   override the default direction raw names first_repeat_delay   (number)  seconds before first repeat after press repeat_delay         (number)  seconds between subsequent repeats *(source line 119)*
- **`API.spawn_controller(player_id, opts)`** — Build a controller without adding it to the registry. *(source line 127)*
- **`API.reload_controller(player_id, opts)`** — Swap in fresh mappings on an existing controller without a full destroy/ recreate cycle. If no controller is registered, one is created.  `opts` may include: button_mappings      (table)   new mapping table; omitted = keep current direction_raw_names  (table)   new direction raw-name set; omitted = keep current *(source line 137)*
- **`API.set_repeat_delays(player_id, first_repeat_delay, repeat_delay)`** — Runtime repeat-cadence control (convenience wrappers around the per- controller methods). *(source line 150)*
- **`API.restore_repeat_delays(player_id)`** *(source line 158)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`API.activate_controller(player_id)`** *(source line 166)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`API.deactivate_controller(player_id)`** *(source line 172)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`API.destroy_controller(player_id)`** *(source line 178)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `button_mappings` *(line 18)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `controllers` *(line 30)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `API` *(line 80)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/input-controller/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
