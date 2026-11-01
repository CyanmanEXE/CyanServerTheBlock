# `prog_dyed_dialogue%28bak%29.lua`

> **Source:** `scripts/net-games/npcs/prog_dyed_dialogue%28bak%29.lua`  
> **Source lines:** 125  
> **Functions detected:** 2  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_dyed_dialogue.lua Tiled-spawned NPC that triggers net-games Dialogue Uses textbox_panel_frame_tint (base textbox untouched + tinted frame overlay) =====================================================

## Dependencies

- `scripts/libs/direction` — line 7
- `scripts/net-games/dialogue/dialogue` — line 8

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 41. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `dbg` | `msg` |
| 120 | `on_finish` | `(none)` |

### Function notes

- **`dbg(msg)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_finish()`** *(source line 120)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ui` *(line 61)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `box_id` | string literal | `"prog_dyed_dialogue_box"` |
| `font` | string literal | `"THIN_BLACK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `typing_speed` | number literal | `30` |
| `type_sfx_path` | string literal | `"/server/assets/net-games/sfx/text.ogg"` |
| `type_sfx_min_dt` | number literal | `0.05` |
| `backdrop` | table | `{ render_offset_x = 3, render_offset_y = 46, style = "textbox_panel_frame_tint", r = 80, g = 255, b = 80, a = 255, color_mode = 2, x = 1, y …` |
| `mugshot` | table | `{ enabled = true, texture_path = "/server/assets/ow/prog/prog_mug.png", anim_path = "/server/assets/ow/prog/prog_mug.animation", talk_anim_s…` |

### `backdrop` *(line 70)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `render_offset_x` | number literal | `3` |
| `render_offset_y` | number literal | `46` |
| `style` | string literal | `"textbox_panel_frame_tint"` |
| `r` | number literal | `80` |
| `g` | number literal | `255` |
| `b` | number literal | `80` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |
| `x` | number literal | `1` |
| `y` | number literal | `209` |
| `width` | number literal | `478` |
| `height` | number literal | `104` |
| `padding_x` | number literal | `16` |
| `padding_y` | number literal | `4` |
| `max_lines` | number literal | `3` |
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 26, indicator_timer = 0, indicator_base_x = nil, indicator_base_y = nil, …` |

### `indicator` *(line 92)*

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

### `mugshot` *(line 104)*

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

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_dyed_dialogue%28bak%29.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
