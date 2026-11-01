# `prog_prompt_dialogue.lua`

> **Source:** `scripts/net-games/npcs/prog_prompt_dialogue.lua`  
> **Source lines:** 185  
> **Functions detected:** 7  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_prompt_dialogue_shared_box.lua Tiled-spawned NPC that shows a YES/NO prompt, then follows up with Dialogue.start, reusing the same textbox UI (no close/recreate). =====================================================

## Dependencies

- `scripts/libs/direction` — line 8
- `scripts/net-games/dialogue/dialogue` — line 9

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 134. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 12 | `dbg` | `msg` |
| 49 | `basic_prog_ui` | `box_id` |
| 119 | `prog_ui_prompt` | `(none)` |
| 125 | `prog_ui_dialogue` | `(none)` |
| 152 | `on_yes` | `(none)` |
| 167 | `on_no` | `(none)` |
| 180 | `on_cancel` | `(none)` |

### Function notes

- **`dbg(msg)`** *(source line 12)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`basic_prog_ui(box_id)`** — ===================================================== Shared UI base (clone of prog_basic_dialogue.lua settings) ===================================================== *(source line 49)*
- **`prog_ui_prompt()`** — Two helpers so you can tweak prompt vs dialogue later without collateral damage NOTE: both return the SAME box_id now, so prompt and dialogue reuse the textbox. *(source line 119)*
- **`prog_ui_dialogue()`** *(source line 125)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_yes()`** *(source line 152)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_no()`** *(source line 167)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_cancel()`** *(source line 180)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `nameplate` *(line 58)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `text` | expression/reference | `BOT_NAME` |
| `anchor` | string literal | `"above"` |
| `align` | string literal | `"left"` |
| `gap_x` | number literal | `6` |
| `gap_y` | number literal | `59` |
| `dur` | number literal | `0.20` |
| `close_dur` | number literal | `0.20` |
| `bob_amp` | number literal | `1.2` |
| `bob_speed` | number literal | `2` |

### `backdrop` *(line 69)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `close_seconds` | number literal | `0.25` |
| `render_offset_x` | number literal | `3` |
| `render_offset_y` | number literal | `46` |
| `style` | string literal | `"textbox_panel"` |
| `open_seconds` | number literal | `0.20` |
| `x` | number literal | `1` |
| `y` | number literal | `209` |
| `width` | number literal | `478` |
| `height` | number literal | `104` |
| `padding_x` | number literal | `16` |
| `padding_y` | number literal | `4` |
| `max_lines` | number literal | `3` |
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 26, indicator_timer = 0, indicator_base_x = nil, indicator_base_y = nil, …` |

### `indicator` *(line 86)*

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

### `mugshot` *(line 97)*

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

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_prompt_dialogue.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
