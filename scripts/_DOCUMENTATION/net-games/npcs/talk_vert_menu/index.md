# `talk_vert_menu.lua`

> **Source:** `scripts/net-games/npcs/talk_vert_menu.lua`  
> **Source lines:** 409  
> **Functions detected:** 12  
> **Table declarations detected:** 6

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== talk_vert_menu.lua Talk-mode wrapper for PromptVertical =====================================================

## Dependencies

- `scripts/net-games/npcs/talk` — line 6
- `scripts/net-games/npcs/talk_presets` — line 7
- `scripts/net-games/dialogue/dialogue` — line 9
- `scripts/net-games/dialogue/prompt` — line 10
- `scripts/net-games/dialogue/prompt_vertical` — line 11
- `scripts/displayer/displayer` — line 13
- `scripts/input/input` — line 14

## Events

- `Net:on("tick", function(event) ...)` — line 83. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 31 | `play_sfx` | `player_id, path` |
| 41 | `set_menu_locked` | `menu, locked` |
| 48 | `set_textbox_indicator` | `player_id, box_id, enabled` |
| 55 | `resolve_frame` | `frame_key_or_table` |
| 63 | `apply_default_layout_frame` | `talk_cfg, layout` |
| 79 | `ensure_tick` | `(none)` |
| 158 | `on_yes` | `(none)` |
| 178 | `on_no` | `(none)` |
| 279 | `TalkVertMenu.is_busy` | `player_id` |
| 293 | `TalkVertMenu.open` | `player_id, bot_name, talk_cfg, menu_cfg` |
| 335 | `on_choose` | `choice, index, menu` |
| 361 | `do_post_text_then_ack` | `(none)` |

### Function notes

- **`play_sfx(player_id, path)`** — ===================================================== Small helpers ===================================================== *(source line 31)*
- **`set_menu_locked(menu, locked)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_textbox_indicator(player_id, box_id, enabled)`** *(source line 48)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_frame(frame_key_or_table)`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`apply_default_layout_frame(talk_cfg, layout)`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_tick()`** — ===================================================== Tick loop ===================================================== *(source line 79)*
- **`on_yes()`** *(source line 158)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_no()`** *(source line 178)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TalkVertMenu.is_busy(player_id)`** — ===================================================== Busy guard ===================================================== *(source line 279)*
- **`TalkVertMenu.open(player_id, bot_name, talk_cfg, menu_cfg)`** — ===================================================== Public API ===================================================== *(source line 293)*
- **`on_choose(choice, index, menu)`** *(source line 335)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`do_post_text_then_ack()`** *(source line 361)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `TalkVertMenu` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_ack` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `exit_pending` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `confirm_pending` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `goodbye_closing` *(line 24)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `layout.frame` *(line 68)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `f.r` |
| `g` | expression/reference | `f.g` |
| `b` | expression/reference | `f.b` |
| `a` | expression/reference | `f.a` |
| `color_mode` | expression/reference | `f.color_mode` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/talk_vert_menu.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
