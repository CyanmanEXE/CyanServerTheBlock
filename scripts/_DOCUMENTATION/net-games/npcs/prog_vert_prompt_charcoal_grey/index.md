# `prog_vert_prompt_charcoal_grey.lua`

> **Source:** `scripts/net-games/npcs/prog_vert_prompt_charcoal_grey.lua`  
> **Source lines:** 150  
> **Functions detected:** 2  
> **Table declarations detected:** 9

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_vert_prompt_charcoal_grey.lua New NPC that mirrors Lime/Pink vertical menu flow, but uses the new helpers: - npc_api.lua (bind interaction + guards + face + sfx) - menu_options.lua (count/list -> options table) =====================================================

## Dependencies

- `scripts/net-games/npcs/npc_api` — line 10
- `scripts/net-games/npcs/menu_options` — line 11
- `scripts/libs/direction` — line 13
- `scripts/net-games/npcs/talk` — line 15
- `scripts/net-games/npcs/talk_vert_menu` — line 16
- `scripts/net-games/npcs/talk_presets` — line 17

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 85 | `on_yes` | `(none)` |
| 131 | `on_no` | `(none)` |

### Function notes

- **`on_yes()`** *(source line 85)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_no()`** *(source line 131)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `SFX` *(line 22)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DESC` | string literal | `"/server/assets/net-games/sfx/card_desc.ogg"` |
| `CONFIRM` | string literal | `"/server/assets/net-games/sfx/card_confirm.ogg"` |
| `DESC_CLOSE` | string literal | `"/server/assets/net-games/sfx/card_desc_close.ogg"` |

### `TALK_CFG` *(line 57)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `object` | expression/reference | `obj_name` |
| `box_id` | string literal | `"prog_vert_charcoal_box"` |
| `preset` | string literal | `"prog_prompt"` |
| `frame` | string literal | `"charcoal_grey"` |
| `mug` | string literal | `"prog_charcoal_grey"` |
| `nameplate` | string literal | `"prog"` |

### `flow` *(line 100)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `keep_menu_open` | boolean literal | `true` |
| `lock_dim_alpha` | number literal | `0.35` |
| `hide_cursor_when_locked` | boolean literal | `true` |
| `confirm` | table | `{ enabled = true, text_format = 'Are you sure you want "%s"?', skip_ids = { exit = true }, }` |
| `post_select` | table | `{ enabled = true, text_format = 'You got "%s".', skip_ids = { exit = true }, }` |
| `after_yes_text` | string literal | `"Confirmed.{p_0.2} Thank you."` |
| `after_no_text` | string literal | `"Understood."` |
| `exit_goodbye_text` | string literal | `"Signal closed."` |
| `sfx` | table | `{ desc = SFX.DESC, confirm = SFX.CONFIRM, close = SFX.DESC_CLOSE, }` |

### `confirm` *(line 104)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `text_format` | string literal | `'Are you sure you want "%s"?'` |
| `skip_ids` | table | `{ exit = true }` |

### `skip_ids` *(line 108)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `exit` | boolean literal | `true` |

### `post_select` *(line 110)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `text_format` | string literal | `'You got "%s".'` |
| `skip_ids` | table | `{ exit = true }` |

### `skip_ids` *(line 114)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `exit` | boolean literal | `true` |

### `sfx` *(line 122)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `desc` | expression/reference | `SFX.DESC` |
| `confirm` | expression/reference | `SFX.CONFIRM` |
| `close` | expression/reference | `SFX.DESC_CLOSE` |

### `next_cfg` *(line 133)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `TALK_CFG.area_id` |
| `object` | expression/reference | `TALK_CFG.object` |
| `box_id` | expression/reference | `TALK_CFG.box_id` |
| `preset` | expression/reference | `TALK_CFG.preset` |
| `frame` | expression/reference | `TALK_CFG.frame` |
| `mug` | expression/reference | `TALK_CFG.mug` |
| `nameplate` | expression/reference | `TALK_CFG.nameplate` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_vert_prompt_charcoal_grey.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
