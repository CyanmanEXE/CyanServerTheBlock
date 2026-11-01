# `bn-textbox.lua`

> **Source:** `scripts/net-games/bn-textbox.lua`  
> **Source lines:** 141  
> **Functions detected:** 3  
> **Table declarations detected:** 8

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

bn_textbox.lua Simple BN-style text box with typewriter, optional nameplate, mugshot, and backdrop. Uses the existing Dialogue.start system for reliable behavior and input handling.

## Dependencies

- `scripts/net-games/dialogue/dialogue` — line 5

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 10 | `shallow_copy` | `t` |
| 21 | `build_ui` | `player_id, opts` |
| 126 | `BNTextbox.show` | `player_id, text, opts` |

### Function notes

- **`shallow_copy(t)`** — Small helper to copy tables *(source line 10)*
- **`build_ui(player_id, opts)`** — Build the UI configuration table expected by Dialogue.start *(source line 21)*
- **`BNTextbox.show(player_id, text, opts)`** — - Show a BN‑style text box. - -@param player_id string -@param text string|table   -- single string or array of lines (strings) -@param opts table          -- optional overrides (see documentation below) -@return table              -- the dialogue object (from Dialogue.start) *(source line 126)*

## Tables and data structures

### `BNTextbox` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ui` *(line 22)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `box_id` | call/expression | `opts.box_id or ("bn_textbox_" .. player_id .. "_" .. tostring(os.time()))` |
| `font` | expression/reference | `opts.font or "THIN_BLACK"` |
| `scale` | expression/reference | `opts.scale or 2.0` |
| `z` | expression/reference | `opts.z or 100` |
| `typing_speed` | expression/reference | `opts.typing_speed or 30` |
| `type_sfx_path` | expression/reference | `opts.type_sfx_path or "/server/assets/net-games/sfx/text.ogg"` |
| `type_sfx_min_dt` | expression/reference | `opts.type_sfx_min_dt or 0.05` |

### `backdrop` *(line 33)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `render_offset_x` | expression/reference | `opts.backdrop_render_offset_x or 3` |
| `render_offset_y` | expression/reference | `opts.backdrop_render_offset_y or 46` |
| `style` | string literal | `"textbox_panel"` |
| `open_seconds` | expression/reference | `opts.backdrop_open_seconds or 0.20` |
| `close_seconds` | expression/reference | `opts.backdrop_close_seconds or 0.25` |
| `x` | expression/reference | `opts.backdrop_x or 1` |
| `y` | expression/reference | `opts.backdrop_y or 209` |
| `width` | expression/reference | `opts.backdrop_width or 478` |
| `height` | expression/reference | `opts.backdrop_height or 104` |
| `padding_x` | expression/reference | `opts.backdrop_padding_x or 16` |
| `padding_y` | expression/reference | `opts.backdrop_padding_y or 4` |
| `max_lines` | expression/reference | `opts.backdrop_max_lines or 3` |
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 26, }` |

### `indicator` *(line 46)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `width` | number literal | `2` |
| `height` | number literal | `2` |
| `offset_x` | number literal | `24` |
| `offset_y` | number literal | `26` |

### `ui.nameplate` *(line 70)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `text` | expression/reference | `name` |
| `anchor` | expression/reference | `opts.nameplate_anchor or "above"` |
| `align` | expression/reference | `opts.nameplate_align or "left"` |
| `gap_x` | expression/reference | `opts.nameplate_gap_x or 6` |
| `gap_y` | expression/reference | `opts.nameplate_gap_y or 59` |
| `dur` | expression/reference | `opts.nameplate_dur or 0.20` |
| `close_dur` | expression/reference | `opts.nameplate_close_dur or 0.20` |
| `bob_amp` | expression/reference | `opts.nameplate_bob_amp or 1.2` |
| `bob_speed` | expression/reference | `opts.nameplate_bob_speed or 2` |

### `ui.nameplate.frame` *(line 84)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `backdrop.r` |
| `g` | expression/reference | `backdrop.g` |
| `b` | expression/reference | `backdrop.b` |
| `a` | expression/reference | `backdrop.a` |
| `color_mode` | expression/reference | `backdrop.color_mode` |

### `ui.mugshot` *(line 101)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | expression/reference | `opts.mugshot_texture` |
| `anim_path` | expression/reference | `opts.mugshot_anim_path or ""` |
| `talk_anim_state` | expression/reference | `opts.mugshot_talk_anim_state or "TALK"` |
| `idle_anim_state` | expression/reference | `opts.mugshot_idle_anim_state or "IDLE"` |
| `reserve_w` | expression/reference | `opts.mugshot_reserve_w or 40` |
| `reserve_h` | expression/reference | `opts.mugshot_reserve_h or 40` |
| `offset_x` | expression/reference | `opts.mugshot_offset_x or 6` |
| `offset_y` | expression/reference | `opts.mugshot_offset_y or -46` |
| `gap_px` | expression/reference | `opts.mugshot_gap_px or 6` |
| `sprite_id` | expression/reference | `opts.mugshot_sprite_id or 5300` |
| `z_bias` | expression/reference | `opts.mugshot_z_bias or 50` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/bn-textbox.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
