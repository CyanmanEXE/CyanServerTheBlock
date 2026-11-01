# `prog_vert_prompt_emerald.lua`

> **Source:** `scripts/net-games/npcs/prog_vert_prompt_emerald.lua`  
> **Source lines:** 65  
> **Functions detected:** 1  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_vert_prompt_emerald_shop.lua Shop-themed variant of ProgVertPromptRed: - identical flow + option generator - overrides PromptVertical assets ONLY for this NPC instance =====================================================

## Dependencies

- `scripts/net-games/npcs/talk` — line 8

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 24 | `on_interact` | `player_id, _bot_id, bot_name` |

### Function notes

- **`on_interact(player_id, _bot_id, bot_name)`** *(source line 24)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `options` *(line 35)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `count` | number literal | `99` |
| `prefix` | string literal | `"Item "` |
| `pad` | number literal | `2` |
| `exit_text` | string literal | `"Exit"` |
| `exit_id` | string literal | `"exit"` |

### `texts` *(line 38)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `open_question` | string literal | `"Welcome! Wanna browse the shop menu?"` |
| `intro_text` | string literal | `"Take your time. I won't judge your impulse buys."` |
| `decline_open` | string literal | `"No worries. Window shopping is still shopping."` |
| `confirm_format` | string literal | `'Buy "%s"?'` |
| `post_select_format` | string literal | `'You bought "%s".'` |
| `after_yes` | string literal | `"Nice!{p_1} Anything else catch your eye?"` |
| `after_no` | string literal | `"Fair. Anything else?"` |
| `exit_goodbye` | string literal | `"Thanks for stopping by!"` |

### `assets` *(line 53)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `menu_bg` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_shop_an.png"` |
| `menu_bg_anim` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_an.animation"` |
| `menu_bg_frame` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_shop_an_frame.png"` |
| `highlight` | string literal | `"/server/assets/net-games/ui/highlight_shop.png"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_vert_prompt_emerald.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
