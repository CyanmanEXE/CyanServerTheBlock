# `option_menu.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu.lua`  
> **Source lines:** 382  
> **Functions detected:** 10  
> **Table declarations detected:** 11

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Controller-driven option menu for Nebulous Liberations mission interactions. The title and option list use separate 9-slice panels: options-header: title options-body: option rows Both panels share a width while keeping independently measured heights.

## Dependencies

- `scripts/displayer/displayer` — line 7
- `scripts/input-controller/main` — line 8

## Events

- `Net:on("tick", function(event) ...)` — line 254. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 49 | `make_header_children` | `title` |
| 60 | `make_body_children` | `options, selected` |
| 79 | `remove_panel` | `player_id, panel_id` |
| 85 | `position_panels` | `menu` |
| 117 | `find_cancel_option` | `options` |
| 127 | `refresh_body` | `menu` |
| 137 | `cleanup` | `player_id, menu, result` |
| 160 | `apply_shared_width` | `menu` |
| 185 | `create_panels` | `player_id, menu` |
| 286 | `OptionMenu.select` | `player_id, options, title` |

### Function notes

- **`make_header_children(title)`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`make_body_children(options, selected)`** *(source line 60)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_panel(player_id, panel_id)`** *(source line 79)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`position_panels(menu)`** *(source line 85)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`find_cancel_option(options)`** *(source line 117)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`refresh_body(menu)`** *(source line 127)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cleanup(player_id, menu, result)`** *(source line 137)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`apply_shared_width(menu)`** *(source line 160)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_panels(player_id, menu)`** *(source line 185)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`OptionMenu.select(player_id, options, title)`** *(source line 286)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `OptionMenu` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PANEL_PADDING` *(line 30)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `horizontal` | number literal | `9` |
| `vertical` | number literal | `8` |

### `CHILD_PADDING` *(line 32)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `horizontal` | number literal | `3` |
| `vertical` | number literal | `2` |

### `active_menus` *(line 44)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `MENU_ACTIONS` *(line 46)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Up"` |
| `[2]` | string literal | `"Down"` |
| `[3]` | string literal | `"Confirm"` |
| `[4]` | string literal | `"Cancel"` |

### `color` *(line 54)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `0` |
| `b` | number literal | `0` |
| `a` | number literal | `255` |

### `children` *(line 61)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `color` *(line 70)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `0` |
| `b` | number literal | `0` |
| `a` | number literal | `255` |

### `initial_options` *(line 186)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `auto_size` | boolean literal | `true` |
| `max_width` | expression/reference | `MENU_MAX_WIDTH` |
| `padding` | expression/reference | `PANEL_PADDING` |
| `child_padding` | expression/reference | `CHILD_PADDING` |
| `slice_scale` | expression/reference | `SLICE_SCALE` |
| `z` | number literal | `220` |

### `menu_options` *(line 295)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `menu` *(line 326)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `controller` | expression/reference | `controller` |
| `owner` | expression/reference | `owner` |
| `header_id` | expression/reference | `header_id` |
| `body_id` | expression/reference | `body_id` |
| `title` | expression/reference | `title` |
| `options` | expression/reference | `menu_options` |
| `cancel_index` | expression/reference | `cancel_index` |
| `selected` | number literal | `1` |
| `active` | boolean literal | `false` |
| `finished` | boolean literal | `false` |
| `header_panel` | nil | `nil` |
| `body_panel` | nil | `nil` |
| `resolve` | expression/reference | `resolve` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
