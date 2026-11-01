# `prompt.lua`

> **Source:** `scripts/net-games/dialogue/prompt.lua`  
> **Source lines:** 410  
> **Functions detected:** 22  
> **Table declarations detected:** 13

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/net-games/dialogue/prompt.lua Hardened YES/NO prompt using the public TextLayout service.

## Dependencies

- `scripts/displayer/displayer` — line 4
- `scripts/displayer/text-layout` — line 5
- `scripts/displayer/text-display` — line 6
- `scripts/input/input` — line 7

## Events

- `Net:on("tick", function(event) ...)` — line 351. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 397. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 21 | `has_asset` | `path` |
| 27 | `safe_provide` | `player_id, path` |
| 33 | `play_cursor_move_sfx` | `player_id` |
| 39 | `ensure_backdrop_asset` | `player_id` |
| 48 | `draw_backdrop` | `player_id, backdrop, z` |
| 66 | `erase_backdrop` | `player_id` |
| 70 | `ensure_cursor_asset` | `player_id` |
| 83 | `selector_draw` | `player_id, draw_id, virtual_x, virtual_y, z, scale` |
| 95 | `selector_erase` | `player_id, draw_id` |
| 99 | `normalize_ui` | `ui` |
| 128 | `build_prompt_text` | `question, ui` |
| 167 | `options_visible` | `player_id, box_id` |
| 176 | `find_option_virtual_positions` | `player_id, box_id, selection` |
| 197 | `set_input_locked` | `player_id, locked` |
| 202 | `mk_id` | `player_id` |
| 207 | `PromptInstance:new` | `player_id, opts` |
| 230 | `PromptInstance:render_initial` | `(none)` |
| 264 | `PromptInstance:render_cursor` | `(none)` |
| 270 | `PromptInstance:update` | `dt` |
| 348 | `ensure_tick` | `(none)` |
| 362 | `Prompt.yesno` | `player_id, opts` |
| 375 | `Prompt.close` | `player_id, _reason, opts` |

### Function notes

- **`has_asset(path)`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`safe_provide(player_id, path)`** *(source line 27)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`play_cursor_move_sfx(player_id)`** *(source line 33)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_backdrop_asset(player_id)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_backdrop(player_id, backdrop, z)`** *(source line 48)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_backdrop(player_id)`** *(source line 66)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_cursor_asset(player_id)`** *(source line 70)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`selector_draw(player_id, draw_id, virtual_x, virtual_y, z, scale)`** *(source line 83)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`selector_erase(player_id, draw_id)`** *(source line 95)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_ui(ui)`** *(source line 99)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_prompt_text(question, ui)`** *(source line 128)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`options_visible(player_id, box_id)`** *(source line 167)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`find_option_virtual_positions(player_id, box_id, selection)`** *(source line 176)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_input_locked(player_id, locked)`** *(source line 197)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`mk_id(player_id)`** *(source line 202)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptInstance:new(player_id, opts)`** *(source line 207)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptInstance:render_initial()`** *(source line 230)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptInstance:render_cursor()`** *(source line 264)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptInstance:update(dt)`** *(source line 270)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_tick()`** *(source line 348)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Prompt.yesno(player_id, opts)`** *(source line 362)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Prompt.close(player_id, _reason, opts)`** *(source line 375)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Prompt` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `Prompt.instances` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_cursor_asset` *(line 17)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_backdrop_asset` *(line 19)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o` *(line 101)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `box_id` | expression/reference | `ui.box_id` |
| `font` | expression/reference | `ui.font or "THIN_BLACK"` |
| `scale` | expression/reference | `ui.scale or 2.0` |
| `z` | expression/reference | `ui.z or 100` |
| `x` | expression/reference | `ui.x or 8` |
| `y` | expression/reference | `ui.y or 110` |
| `w` | expression/reference | `ui.w or 224` |
| `h` | expression/reference | `ui.h or 42` |
| `backdrop` | expression/reference | `ui.backdrop or ui.backdrop_config` |
| `mugshot` | expression/reference | `ui.mugshot` |
| `nameplate` | expression/reference | `ui.nameplate` |
| `typing_speed` | expression/reference | `ui.typing_speed or 99999` |
| `type_sfx_path` | expression/reference | `ui.type_sfx_path` |
| `type_sfx_min_dt` | expression/reference | `ui.type_sfx_min_dt` |

### `qlines` *(line 136)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pages` *(line 141)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `page` *(line 149)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `final` *(line 154)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `page_strings` *(line 161)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PromptInstance` *(line 203)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `text_options` *(line 236)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | expression/reference | `ui.font` |
| `scale` | expression/reference | `ui.scale` |
| `z` | expression/reference | `ui.z` |
| `speed` | expression/reference | `ui.typing_speed` |
| `type_sound` | expression/reference | `ui.type_sfx_path` |
| `type_sound_min_dt` | expression/reference | `ui.type_sfx_min_dt` |
| `max_lines` | expression/reference | `ui.backdrop and ui.backdrop.max_lines or nil` |

### `held` *(line 288)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/dialogue/prompt.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
