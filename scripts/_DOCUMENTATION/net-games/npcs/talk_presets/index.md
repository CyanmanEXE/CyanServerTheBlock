# `talk_presets.lua`

> **Source:** `scripts/net-games/npcs/talk_presets.lua`  
> **Source lines:** 336  
> **Functions detected:** 3  
> **Table declarations detected:** 49

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== talk_presets.lua Creator-facing presets for Dialogue NPCs (PROG-defaulted) =====================================================

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 158 | `_shallow_copy` | `t` |
| 265 | `P.get_vert_menu_layout` | `key` |
| 288 | `P.get_vert_menu_flow` | `key` |

### Function notes

- **`_shallow_copy(t)`** — ---------------------------- Vertical menu layout presets (PromptVertical) ---------------------------- *(source line 158)*
- **`P.get_vert_menu_layout(key)`** *(source line 265)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`P.get_vert_menu_flow(key)`** *(source line 288)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `P` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `P.nameplates` *(line 11)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `prog` | table | `{ anchor = "above", align = "left", gap_x = 6, gap_y = 59, dur = 0.20, close_dur = 0.20, bob_amp = 1.2, bob_speed = 2, }` |

### `prog` *(line 12)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `anchor` | string literal | `"above"` |
| `align` | string literal | `"left"` |
| `gap_x` | number literal | `6` |
| `gap_y` | number literal | `59` |
| `dur` | number literal | `0.20` |
| `close_dur` | number literal | `0.20` |
| `bob_amp` | number literal | `1.2` |
| `bob_speed` | number literal | `2` |

### `P.mugs` *(line 28)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `prog` | table | `{ enabled = true, texture_path = "/server/assets/ow/prog/prog_mug.png", anim_path = "/server/assets/ow/prog/prog_mug.animation", talk_anim_s…` |
| `prog_red` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_red.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_anim_sta…` |
| `prog_sapphire` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_sapphire.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_ani…` |
| `prog_emerald` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_emerald.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_anim…` |
| `prog_yellow` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_yellow.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_anim_…` |
| `prog_orange` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_orange.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_anim_…` |
| `prog_purple` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_purple.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_anim_…` |
| `prog_pink` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_pink.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_anim_st…` |
| `prog_turquoise` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_turquoise.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_an…` |
| `prog_charcoal_grey` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_charcoal_grey.png", anim_path="/server/assets/ow/prog/prog_mug.animation", tal…` |
| `prog_lime` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_lime.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_anim_st…` |
| `prog_white` | table | `{ enabled=true, texture_path="/server/assets/ow/prog/prog_mug_white.png", anim_path="/server/assets/ow/prog/prog_mug.animation", talk_anim_s…` |

### `prog` *(line 29)*

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

### `prog_red` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_red.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5301` |
| `z_bias` | number literal | `50` |

### `prog_sapphire` *(line 45)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_sapphire.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5302` |
| `z_bias` | number literal | `50` |

### `prog_emerald` *(line 46)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_emerald.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5303` |
| `z_bias` | number literal | `50` |

### `prog_yellow` *(line 47)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_yellow.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5304` |
| `z_bias` | number literal | `50` |

### `prog_orange` *(line 48)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_orange.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5305` |
| `z_bias` | number literal | `50` |

### `prog_purple` *(line 49)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_purple.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5306` |
| `z_bias` | number literal | `50` |

### `prog_pink` *(line 50)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_pink.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5307` |
| `z_bias` | number literal | `50` |

### `prog_turquoise` *(line 51)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_turquoise.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5308` |
| `z_bias` | number literal | `50` |

### `prog_charcoal_grey` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_charcoal_grey.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5309` |
| `z_bias` | number literal | `50` |

### `prog_lime` *(line 53)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_lime.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5310` |
| `z_bias` | number literal | `50` |

### `prog_white` *(line 54)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | string literal | `"/server/assets/ow/prog/prog_mug_white.png"` |
| `anim_path` | string literal | `"/server/assets/ow/prog/prog_mug.animation"` |
| `talk_anim_state` | string literal | `"TALK"` |
| `idle_anim_state` | string literal | `"IDLE"` |
| `reserve_w` | number literal | `40` |
| `reserve_h` | number literal | `40` |
| `offset_x` | number literal | `6` |
| `offset_y` | number literal | `-46` |
| `gap_px` | number literal | `6` |
| `sprite_id` | number literal | `5311` |
| `z_bias` | number literal | `50` |

### `P.boxes` *(line 62)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `panel` | table | `{ font = "THIN_BLACK", scale = 2.0, z = 100, typing_speed = 12, type_sfx_path = "/server/assets/net-games/sfx/text.ogg", type_sfx_min_dt = 0…` |
| `black` | table | `{ font = "THICK", scale = 2.0, z = 100, typing_speed = 30, type_sfx_path = "/server/assets/net-games/sfx/text.ogg", type_sfx_min_dt = 0.05, …` |

### `panel` *(line 64)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THIN_BLACK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `typing_speed` | number literal | `12` |
| `type_sfx_path` | string literal | `"/server/assets/net-games/sfx/text.ogg"` |
| `type_sfx_min_dt` | number literal | `0.05` |
| `backdrop` | table | `{ render_offset_x = 3, render_offset_y = 46, style = "textbox_panel", open_seconds = 0.20, close_seconds = 0.25, x = 1, y = 209, width = 478…` |

### `backdrop` *(line 73)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `render_offset_x` | number literal | `3` |
| `render_offset_y` | number literal | `46` |
| `style` | string literal | `"textbox_panel"` |
| `open_seconds` | number literal | `0.20` |
| `close_seconds` | number literal | `0.25` |
| `x` | number literal | `1` |
| `y` | number literal | `209` |
| `width` | number literal | `478` |
| `height` | number literal | `104` |
| `padding_x` | number literal | `16` |
| `padding_y` | number literal | `4` |
| `max_lines` | number literal | `3` |
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 26, indicator_timer = 0, indicator_base_x = nil, indicator_base_y = nil, …` |

### `indicator` *(line 90)*

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

### `black` *(line 104)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `typing_speed` | number literal | `30` |
| `type_sfx_path` | string literal | `"/server/assets/net-games/sfx/text.ogg"` |
| `type_sfx_min_dt` | number literal | `0.05` |
| `backdrop` | table | `{ style = "black_box", x = 1, y = 209, width = 478, height = 104, padding_x = 16, padding_y = 16, max_lines = 3, indicator = { enabled = tru…` |

### `backdrop` *(line 111)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `style` | string literal | `"black_box"` |
| `x` | number literal | `1` |
| `y` | number literal | `209` |
| `width` | number literal | `478` |
| `height` | number literal | `104` |
| `padding_x` | number literal | `16` |
| `padding_y` | number literal | `16` |
| `max_lines` | number literal | `3` |
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 24, indicator_timer = 0, indicator_base_x = nil, indicator_base_y = nil, …` |

### `indicator` *(line 121)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `width` | number literal | `2` |
| `height` | number literal | `2` |
| `offset_x` | number literal | `24` |
| `offset_y` | number literal | `24` |
| `indicator_timer` | number literal | `0` |
| `indicator_base_x` | nil | `nil` |
| `indicator_base_y` | nil | `nil` |

### `P.frames` *(line 139)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `lime` | table | `{ r = 80, g = 255, b = 80, a = 255, color_mode = 2 }` |
| `red` | table | `{ r = 255, g = 80, b = 80, a = 255, color_mode = 2 }` |
| `purple` | table | `{ r = 200, g = 80, b = 255, a = 255, color_mode = 2 }` |
| `turquoise` | table | `{ r = 80, g = 230, b = 200, a = 255, color_mode = 2 }` |
| `pink` | table | `{ r = 255, g = 120, b = 200, a = 255, color_mode = 2 }` |
| `emerald` | table | `{ r = 60, g = 200, b = 120, a = 255, color_mode = 2 }` |
| `sapphire` | table | `{ r = 80, g = 120, b = 255, a = 255, color_mode = 2 }` |
| `yellow` | table | `{ r = 255, g = 220, b = 80, a = 255, color_mode = 2 }` |
| `orange` | table | `{ r = 255, g = 160, b = 80, a = 255, color_mode = 2 }` |
| `charcoal_grey` | table | `{ r = 70, g = 70, b = 70, a = 255, color_mode = 2 }` |
| `white` | table | `{ r = 255, g = 255, b = 255, a = 255, color_mode = 2 }` |

### `lime` *(line 140)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `80` |
| `g` | number literal | `255` |
| `b` | number literal | `80` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `red` *(line 141)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `80` |
| `b` | number literal | `80` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `purple` *(line 142)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `200` |
| `g` | number literal | `80` |
| `b` | number literal | `255` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `turquoise` *(line 143)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `80` |
| `g` | number literal | `230` |
| `b` | number literal | `200` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `pink` *(line 145)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `120` |
| `b` | number literal | `200` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `emerald` *(line 146)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `60` |
| `g` | number literal | `200` |
| `b` | number literal | `120` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `sapphire` *(line 147)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `80` |
| `g` | number literal | `120` |
| `b` | number literal | `255` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `yellow` *(line 148)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `220` |
| `b` | number literal | `80` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `orange` *(line 149)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `160` |
| `b` | number literal | `80` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `charcoal_grey` *(line 150)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `70` |
| `g` | number literal | `70` |
| `b` | number literal | `70` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `white` *(line 152)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `a` | number literal | `255` |
| `color_mode` | number literal | `2` |

### `o` *(line 159)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `P.vert_menus` *(line 163)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `prog_prompt` | table | `{ anchor = "textbox", offset_x = 1, offset_y = -199, width = 160, height = 64, visible_rows = 5, row_height = 14, padding_x = 48, padding_y …` |
| `prog_prompt_shop` | table | `{ anchor = "textbox", offset_x = 1, offset_y = -199, width = 160, height = 64, visible_rows = 5, row_height = 14, padding_x = 48, padding_y …` |

### `prog_prompt` *(line 166)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `anchor` | string literal | `"textbox"` |
| `offset_x` | number literal | `1` |
| `offset_y` | number literal | `-199` |
| `width` | number literal | `160` |
| `height` | number literal | `64` |
| `visible_rows` | number literal | `5` |
| `row_height` | number literal | `14` |
| `padding_x` | number literal | `48` |
| `padding_y` | number literal | `4` |
| `text_intro_enabled` | boolean literal | `true` |
| `text_intro_frames` | number literal | `18` |
| `text_intro_stagger_frames` | number literal | `12` |
| `text_intro_slide_px` | number literal | `6` |
| `scrollbar_x` | number literal | `452` |
| `scrollbar_y` | number literal | `12` |
| `scrollbar_h` | number literal | `126` |
| `highlight_inset_x` | number literal | `12` |
| `highlight_inset_y` | number literal | `3` |
| `cursor_offset_x` | number literal | `16` |
| `cursor_offset_y` | number literal | `4` |

### `prog_prompt_shop` *(line 195)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `anchor` | string literal | `"textbox"` |
| `offset_x` | number literal | `1` |
| `offset_y` | number literal | `-199` |
| `width` | number literal | `160` |
| `height` | number literal | `64` |
| `visible_rows` | number literal | `5` |
| `row_height` | number literal | `14` |
| `padding_x` | number literal | `48` |
| `padding_y` | number literal | `4` |
| `text_intro_enabled` | boolean literal | `true` |
| `text_intro_frames` | number literal | `16` |
| `text_intro_stagger_frames` | number literal | `8` |
| `text_intro_slide_px` | number literal | `6` |
| `scrollbar_x` | number literal | `452` |
| `scrollbar_y` | number literal | `12` |
| `scrollbar_h` | number literal | `126` |
| `highlight_inset_x` | number literal | `12` |
| `highlight_inset_y` | number literal | `3` |
| `cursor_offset_x` | number literal | `16` |
| `cursor_offset_y` | number literal | `4` |
| `monies_label_enabled` | boolean literal | `true` |
| `monies_label_text` | string literal | `"MONIES"` |
| `monies_label_font` | string literal | `"WIDE"` |
| `monies_label_pad_x` | number literal | `52` |
| `monies_label_pad_y` | number literal | `2` |
| `monies_label_z_add` | number literal | `4` |
| `monies_amount_enabled` | boolean literal | `true` |
| `monies_amount_text` | string literal | `"0$"` |
| `monies_amount_font` | string literal | `"THIN"` |
| `monies_amount_offset_y` | number literal | `5` |
| `monies_amount_offset_x` | number literal | `32` |
| `shop_item_enabled` | boolean literal | `true` |
| `shop_item_swap_exit` | boolean literal | `true` |
| `shop_item_pad_x` | number literal | `164` |
| `shop_item_pad_y` | number literal | `54` |
| `shop_item_z_add` | number literal | `4` |
| `shop_item_intro_enabled` | boolean literal | `true` |
| `shop_item_intro_frames` | number literal | `8` |
| `shop_item_w` | number literal | `56` |
| `shop_item_h` | number literal | `48` |
| `shop_exit_w` | number literal | `56` |
| `shop_exit_h` | number literal | `48` |

### `P.vert_menu_flows` *(line 274)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `prog_prompt` | table | `{ keep_menu_open = true, lock_dim_alpha = 0.35, hide_cursor_when_locked = true, confirm = { enabled = true }, post_select = { enabled = true…` |

### `prog_prompt` *(line 275)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `keep_menu_open` | boolean literal | `true` |
| `lock_dim_alpha` | number literal | `0.35` |
| `hide_cursor_when_locked` | boolean literal | `true` |
| `confirm` | table | `{ enabled = true }` |
| `post_select` | table | `{ enabled = true }` |
| `sfx` | table | `{}` |

### `confirm` *(line 279)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |

### `post_select` *(line 281)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |

### `sfx` *(line 284)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `P.sfx_sets` *(line 298)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `card_desc` | table | `{ desc = "/server/assets/net-games/sfx/card_desc.ogg", confirm = "/server/assets/net-games/sfx/card_confirm.ogg", close = "/server/assets/ne…` |

### `card_desc` *(line 299)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `desc` | string literal | `"/server/assets/net-games/sfx/card_desc.ogg"` |
| `confirm` | string literal | `"/server/assets/net-games/sfx/card_confirm.ogg"` |
| `close` | string literal | `"/server/assets/net-games/sfx/card_desc_close.ogg"` |

### `P.packs` *(line 309)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `prog` | table | `{ box = "panel", mug = "prog", nameplate = "prog", vert_menu_layout = "prog_prompt", vert_menu_sfx_set = "card_desc", vert_menu_flow = "prog…` |
| `prog_prompt` | table | `{ box = "panel", mug = "prog", nameplate = "prog", vert_menu_layout = "prog_prompt", vert_menu_sfx_set = "card_desc", vert_menu_flow = "prog…` |

### `prog` *(line 311)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `box` | string literal | `"panel"` |
| `mug` | string literal | `"prog"` |
| `nameplate` | string literal | `"prog"` |
| `vert_menu_layout` | string literal | `"prog_prompt"` |
| `vert_menu_sfx_set` | string literal | `"card_desc"` |
| `vert_menu_flow` | string literal | `"prog_prompt"` |

### `prog_prompt` *(line 324)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `box` | string literal | `"panel"` |
| `mug` | string literal | `"prog"` |
| `nameplate` | string literal | `"prog"` |
| `vert_menu_layout` | string literal | `"prog_prompt"` |
| `vert_menu_sfx_set` | string literal | `"card_desc"` |
| `vert_menu_flow` | string literal | `"prog_prompt"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/talk_presets.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
