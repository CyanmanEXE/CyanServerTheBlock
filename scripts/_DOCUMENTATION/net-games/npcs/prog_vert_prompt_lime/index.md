# `prog_vert_prompt_lime.lua`

> **Source:** `scripts/net-games/npcs/prog_vert_prompt_lime.lua`  
> **Source lines:** 171  
> **Functions detected:** 5  
> **Table declarations detected:** 10

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_vert_prompt_lime.lua LIME variant of prog_vert_prompt_pink.lua. Key requirement: identical in-game flow, but implemented using Talk.lua + TalkVertMenu.lua (reusable wrapper). =====================================================

## Dependencies

- `scripts/libs/direction` — line 10
- `scripts/net-games/dialogue/startup` — line 11
- `scripts/net-games/dialogue/dialogue` — line 13
- `scripts/net-games/npcs/talk` — line 14
- `scripts/net-games/npcs/talk_vert_menu` — line 15
- `scripts/net-games/npcs/talk_presets` — line 16

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 100. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 27 | `play_sfx` | `player_id, path` |
| 38 | `shallow_copy` | `t` |
| 88 | `build_options` | `(none)` |
| 115 | `on_yes` | `(none)` |
| 160 | `on_no` | `(none)` |

### Function notes

- **`play_sfx(player_id, path)`** *(source line 27)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`shallow_copy(t)`** *(source line 38)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_options()`** — ===================================================== Menu options ===================================================== *(source line 88)*
- **`on_yes()`** *(source line 115)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_no()`** *(source line 160)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `SFX` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DESC` | string literal | `"/server/assets/net-games/sfx/card_desc.ogg"` |
| `CONFIRM` | string literal | `"/server/assets/net-games/sfx/card_confirm.ogg"` |
| `DESC_CLOSE` | string literal | `"/server/assets/net-games/sfx/card_desc_close.ogg"` |

### `o` *(line 39)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `TALK_CFG` *(line 74)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `object` | expression/reference | `obj_name` |
| `box_id` | string literal | `"prog_vert_lime_box"` |
| `preset` | string literal | `"prog_prompt"` |
| `frame` | string literal | `"lime"` |
| `mug` | string literal | `"prog_lime"` |
| `nameplate` | string literal | `"prog"` |

### `t` *(line 89)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `flow` *(line 130)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `keep_menu_open` | boolean literal | `true` |
| `lock_dim_alpha` | number literal | `0.35` |
| `hide_cursor_when_locked` | boolean literal | `true` |
| `confirm` | table | `{ enabled = true, text_format = 'Are you sure you want "%s"?', skip_ids = { exit = true }, }` |
| `post_select` | table | `{ enabled = true, text_format = 'You got "%s".', skip_ids = { exit = true }, }` |
| `after_yes_text` | string literal | `"Thank you!{p_1} Is there anything else you'd like?"` |
| `after_no_text` | string literal | `"Is there anything else you'd like?"` |
| `exit_goodbye_text` | string literal | `"Thanks for stopping by!"` |
| `sfx` | table | `{ desc = SFX.DESC, confirm = SFX.CONFIRM, close = SFX.DESC_CLOSE, }` |

### `confirm` *(line 134)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `text_format` | string literal | `'Are you sure you want "%s"?'` |
| `skip_ids` | table | `{ exit = true }` |

### `skip_ids` *(line 138)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `exit` | boolean literal | `true` |

### `post_select` *(line 140)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `text_format` | string literal | `'You got "%s".'` |
| `skip_ids` | table | `{ exit = true }` |

### `skip_ids` *(line 144)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `exit` | boolean literal | `true` |

### `sfx` *(line 151)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `desc` | expression/reference | `SFX.DESC` |
| `confirm` | expression/reference | `SFX.CONFIRM` |
| `close` | expression/reference | `SFX.DESC_CLOSE` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_vert_prompt_lime.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
