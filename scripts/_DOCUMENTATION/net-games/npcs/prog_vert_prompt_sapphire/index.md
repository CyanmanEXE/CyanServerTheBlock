# `prog_vert_prompt_sapphire.lua`

> **Source:** `scripts/net-games/npcs/prog_vert_prompt_sapphire.lua`  
> **Source lines:** 255  
> **Functions detected:** 8  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_vert_prompt_sapphire.lua Flow: Interact -> YES/NO prompt: "Do you wanna check out the vertical menu?" YES -> SAME textbox becomes: "Awesome. Let me know if there's anything that you like." Vertical menu opens while that line prints, and menu control unlocks after printing finishes. NO -> short line (same textbox) Assumes prompt_vertical.lua supports reuse_existing_box reset. =====================================================

## Dependencies

- `scripts/libs/direction` — line 17
- `scripts/net-games/dialogue/startup` — line 18
- `scripts/net-games/dialogue/dialogue` — line 20
- `scripts/net-games/dialogue/prompt` — line 21
- `scripts/net-games/dialogue/prompt_vertical` — line 22
- `scripts/net-games/npcs/talk_presets` — line 23

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 224. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 57 | `copy_frame_preset` | `preset` |
| 70 | `build_options` | `(none)` |
| 82 | `build_ui_config` | `box_id` |
| 160 | `build_layout_config` | `(none)` |
| 194 | `open_vertical_menu` | `player_id, intro_text` |
| 209 | `on_select` | `choice, index` |
| 238 | `on_yes` | `(none)` |
| 242 | `on_no` | `(none)` |

### Function notes

- **`copy_frame_preset(preset)`** *(source line 57)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_options()`** — ===================================================== Menu options ===================================================== *(source line 70)*
- **`build_ui_config(box_id)`** — ===================================================== Shared UI config (textbox + nameplate + mug) ===================================================== *(source line 82)*
- **`build_layout_config()`** — ===================================================== Vertical menu layout (frame overlay dye uses layout.frame) ===================================================== *(source line 160)*
- **`open_vertical_menu(player_id, intro_text)`** — ===================================================== Open the vertical menu. NOTE: reuse_existing_box=true is what forces the textbox text to change from the YES/NO prompt into the new "Awesome..." line. ===================================================== *(source line 194)*
- **`on_select(choice, index)`** *(source line 209)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_yes()`** *(source line 238)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_no()`** *(source line 242)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `t` *(line 71)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mugshot` *(line 92)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `texture_path` | expression/reference | `SAPPHIRE_MUG.texture_path` |
| `anim_path` | expression/reference | `SAPPHIRE_MUG.anim_path` |
| `talk_anim_state` | expression/reference | `SAPPHIRE_MUG.talk_anim_state` |
| `idle_anim_state` | expression/reference | `SAPPHIRE_MUG.idle_anim_state` |
| `reserve_w` | expression/reference | `SAPPHIRE_MUG.reserve_w` |
| `reserve_h` | expression/reference | `SAPPHIRE_MUG.reserve_h` |
| `offset_x` | expression/reference | `SAPPHIRE_MUG.offset_x` |
| `offset_y` | expression/reference | `SAPPHIRE_MUG.offset_y` |
| `gap_px` | expression/reference | `SAPPHIRE_MUG.gap_px` |
| `sprite_id` | expression/reference | `SAPPHIRE_MUG.sprite_id` |
| `z_bias` | expression/reference | `SAPPHIRE_MUG.z_bias` |

### `backdrop` *(line 109)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `render_offset_x` | number literal | `3` |
| `render_offset_y` | number literal | `46` |
| `style` | string literal | `"textbox_panel_frame_tint"` |
| `open_seconds` | number literal | `0.20` |
| `close_seconds` | number literal | `0.25` |
| `r` | expression/reference | `FRAME.r` |
| `g` | expression/reference | `FRAME.g` |
| `b` | expression/reference | `FRAME.b` |
| `a` | expression/reference | `FRAME.a` |
| `color_mode` | expression/reference | `FRAME.color_mode` |
| `x` | number literal | `1` |
| `y` | number literal | `209` |
| `width` | number literal | `478` |
| `height` | number literal | `104` |
| `padding_x` | number literal | `16` |
| `padding_y` | number literal | `4` |
| `max_lines` | number literal | `3` |
| `indicator` | table | `{ enabled = true, width = 2, height = 2, offset_x = 24, offset_y = 26, }` |

### `indicator` *(line 130)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `width` | number literal | `2` |
| `height` | number literal | `2` |
| `offset_x` | number literal | `24` |
| `offset_y` | number literal | `26` |

### `nameplate` *(line 141)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `frame` | expression/reference | `FRAME` |
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

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_vert_prompt_sapphire.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
