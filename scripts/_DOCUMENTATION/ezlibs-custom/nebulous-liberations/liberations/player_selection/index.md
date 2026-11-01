# `player_selection.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/player_selection.lua`  
> **Source lines:** 125  
> **Functions detected:** 10  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

private functions

## Dependencies

- `scripts/ezlibs-custom/nebulous-liberations/liberations/selection` — line 1
- `scripts/libs/direction` — line 2
- `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_registry` — line 3

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 5 | `includes` | `table, value` |
| 15 | `resolve_selection_direction` | `player_pos, panel_object` |
| 24 | `PlayerSelection:new` | `instance, player_id` |
| 40 | `filter` | `x, y, z` |
| 81 | `PlayerSelection:select_panel` | `panel_object` |
| 93 | `PlayerSelection:set_include_all_liberatable_panels` | `enabled` |
| 97 | `PlayerSelection:set_shape` | `shape, shape_offset_x, shape_offset_y` |
| 103 | `PlayerSelection:get_panels` | `(none)` |
| 113 | `PlayerSelection:clear` | `(none)` |
| 118 | `PlayerSelection:count_panels` | `(none)` |

### Function notes

- **`includes(table, value)`** *(source line 5)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_selection_direction(player_pos, panel_object)`** — private functions *(source line 15)*
- **`PlayerSelection:new(instance, player_id)`** *(source line 24)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`filter(x, y, z)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSelection:select_panel(panel_object)`** *(source line 81)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSelection:set_include_all_liberatable_panels(enabled)`** — shape = [m][n] bool array, n being odd, just below bottom center is player position *(source line 93)*
- **`PlayerSelection:set_shape(shape, shape_offset_x, shape_offset_y)`** *(source line 97)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSelection:get_panels()`** *(source line 103)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSelection:clear()`** *(source line 113)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSelection:count_panels()`** *(source line 118)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `PlayerSelection` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_selection` *(line 26)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `instance` | expression/reference | `instance` |
| `root_panel` | nil | `nil` |
| `selection` | call/expression | `Selection:new(instance)` |
| `LIBERATING_PANEL_GID` | expression/reference | `LIBERATING_PANEL_GID` |
| `SELECTED_PANEL_GID` | expression/reference | `LIBERATING_PANEL_GID + 1` |
| `include_all_liberatable_panels` | boolean literal | `false` |

### `panels` *(line 104)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/player_selection.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
