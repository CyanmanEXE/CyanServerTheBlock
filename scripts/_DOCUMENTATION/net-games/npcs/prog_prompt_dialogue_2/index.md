# `prog_prompt_dialogue_2.lua`

> **Source:** `scripts/net-games/npcs/prog_prompt_dialogue_2.lua`  
> **Source lines:** 167  
> **Functions detected:** 7  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_prompt_dialogue_2.lua Tiled-spawned NPC that shows a YES/NO prompt, then follows up with Dialogue.start. =====================================================

## Dependencies

- `scripts/libs/direction` — line 7
- `scripts/net-games/dialogue/dialogue` — line 8

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 117. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `dbg` | `msg` |
| 41 | `basic_prog_ui` | `box_id` |
| 100 | `prog_ui_prompt` | `box_id` |
| 107 | `prog_ui_dialogue` | `box_id` |
| 134 | `on_yes` | `(none)` |
| 150 | `on_no` | `(none)` |
| 162 | `on_cancel` | `(none)` |

### Function notes

- **`dbg(msg)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`basic_prog_ui(box_id)`** — ===================================================== Shared UI base (clone of prog_basic_dialogue.lua settings) ===================================================== *(source line 41)*
- **`prog_ui_prompt(box_id)`** — Two helpers so you can tweak prompt vs dialogue later without collateral damage *(source line 100)*
- **`prog_ui_dialogue(box_id)`** *(source line 107)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_yes()`** *(source line 134)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_no()`** *(source line 150)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_cancel()`** *(source line 162)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `backdrop` *(line 50)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `render_offset_x` | number literal | `3` |
| `render_offset_y` | number literal | `46` |
| `style` | string literal | `"textbox_panel"` |
| `x` | number literal | `1` |
| `y` | number literal | `209` |
| `width` | number literal | `478` |
| `height` | number literal | `104` |
| `padding_x` | number literal | `16` |
| `padding_y` | number literal | `4` |
| `max_lines` | number literal | `3` |
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 26, indicator_timer = 0, indicator_base_x = nil, indicator_base_y = nil, …` |

### `indicator` *(line 67)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `width` | number literal | `2` |
| `height` | number literal | `2` |
| `offset_x` | number literal | `24` |
| `offset_y` | number literal | `26` |
| `indicator_timer` | number literal | `0` |
| `indicator_base_x` | nil | `nil` |
| `indicator_base_y` | nil | `nil` |

### `mugshot` *(line 80)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5300` |
| `z_bias` | number literal | `50` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_prompt_dialogue_2.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
