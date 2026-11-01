# `prog_vert_prompt_2.lua`

> **Source:** `scripts/net-games/npcs/prog_vert_prompt_2.lua`  
> **Source lines:** 246  
> **Functions detected:** 5  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_vert_prompt_2.lua Vertical prompt demo PROG (basic style, like prog_basic_nameplate) Adds: - Mugshot support in the vertical prompt UI - Mugshot support in the follow-up Dialogue (reuse_existing_box) - RED frame dye applied to: * vertical menu frame overlay * textbox frame overlay * nameplate frame overlay (using the same red preset from talk_presets.lua) =====================================================

## Dependencies

- `scripts/libs/direction` — line 15
- `scripts/net-games/dialogue/startup` — line 16
- `scripts/net-games/dialogue/dialogue` — line 18
- `scripts/net-games/dialogue/prompt_vertical` — line 19
- `scripts/net-games/npcs/talk_presets` — line 20

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 204. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 51 | `copy_frame_preset` | `preset` |
| 64 | `build_options` | `(none)` |
| 77 | `build_ui_config` | `box_id` |
| 166 | `build_layout_config` | `(none)` |
| 235 | `on_select` | `choice, index` |

### Function notes

- **`copy_frame_preset(preset)`** — ===================================================== Frame dye preset (from talk_presets.lua) ===================================================== *(source line 51)*
- **`build_options()`** — ===================================================== Options builder (menu entries) ===================================================== *(source line 64)*
- **`build_ui_config(box_id)`** — ===================================================== Shared UI config (So the prompt + follow-up dialogue stay visually identical) ===================================================== *(source line 77)*
- **`build_layout_config()`** — ===================================================== Shared menu layout config ===================================================== *(source line 166)*
- **`on_select(choice, index)`** — ===================================================== When the player selects an option: Reuse the existing textbox AND keep the mugshot consistent. ===================================================== *(source line 235)*

## Tables and data structures

### `t` *(line 65)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mugshot` *(line 92)*

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

### `backdrop` *(line 114)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `render_offset_x` | number literal | `3` |
| `render_offset_y` | number literal | `46` |
| `style` | string literal | `"textbox_panel_frame_tint"` |
| `open_seconds` | number literal | `0.20` |
| `r` | expression/reference | `RED_FRAME.r` |
| `g` | expression/reference | `RED_FRAME.g` |
| `b` | expression/reference | `RED_FRAME.b` |
| `a` | expression/reference | `RED_FRAME.a` |
| `color_mode` | expression/reference | `RED_FRAME.color_mode` |
| `x` | number literal | `1` |
| `y` | number literal | `209` |
| `width` | number literal | `478` |
| `height` | number literal | `104` |
| `padding_x` | number literal | `16` |
| `padding_y` | number literal | `4` |
| `max_lines` | number literal | `3` |
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 26 }` |

### `indicator` *(line 140)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `width` | number literal | `2` |
| `height` | number literal | `2` |
| `offset_x` | number literal | `24` |
| `offset_y` | number literal | `26` |

### `nameplate` *(line 146)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `frame` | expression/reference | `RED_FRAME` |
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

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_vert_prompt_2.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
