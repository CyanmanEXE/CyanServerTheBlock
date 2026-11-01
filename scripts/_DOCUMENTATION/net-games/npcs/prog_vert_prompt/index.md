# `prog_vert_prompt.lua`

> **Source:** `scripts/net-games/npcs/prog_vert_prompt.lua`  
> **Source lines:** 227  
> **Functions detected:** 4  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_vert_prompt.lua Vertical prompt demo PROG (basic style, like prog_basic_nameplate) Adds: - Mugshot support in the vertical prompt UI - Mugshot support in the follow-up Dialogue (reuse_existing_box) =====================================================

## Dependencies

- `scripts/libs/direction` — line 10
- `scripts/net-games/dialogue/startup` — line 11
- `scripts/net-games/dialogue/dialogue` — line 13
- `scripts/net-games/dialogue/prompt_vertical` — line 14

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 185. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 45 | `build_options` | `(none)` |
| 58 | `build_ui_config` | `box_id` |
| 149 | `build_layout_config` | `(none)` |
| 216 | `on_select` | `choice, index` |

### Function notes

- **`build_options()`** — ===================================================== Options builder (menu entries) ===================================================== *(source line 45)*
- **`build_ui_config(box_id)`** — ===================================================== Shared UI config (So the prompt + follow-up dialogue stay visually identical) ===================================================== *(source line 58)*
- **`build_layout_config()`** — ===================================================== Shared menu layout config ===================================================== *(source line 149)*
- **`on_select(choice, index)`** — ===================================================== When the player selects an option: Reuse the existing textbox AND keep the mugshot consistent. ===================================================== *(source line 216)*

## Tables and data structures

### `t` *(line 46)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mugshot` *(line 77)*

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

### `backdrop` *(line 108)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
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
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 26 }` |

### `indicator` *(line 126)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `width` | number literal | `2` |
| `height` | number literal | `2` |
| `offset_x` | number literal | `24` |
| `offset_y` | number literal | `26` |

### `nameplate` *(line 132)*

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

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_vert_prompt.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
