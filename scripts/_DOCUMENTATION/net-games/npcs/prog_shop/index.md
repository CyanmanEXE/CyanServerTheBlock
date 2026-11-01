# `prog_shop.lua`

> **Source:** `scripts/net-games/npcs/prog_shop.lua`  
> **Source lines:** 64  
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

===================================================== prog_shop.lua Default PROG shop NPC: - Default OW sprite + default mug - No frame dye (uses default look) - Uses shop UI skin for the vertical menu window =====================================================

## Dependencies

- `scripts/net-games/npcs/talk` — line 9

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
| `open_question` | string literal | `"Yo! Wanna browse what I've got?"` |
| `intro_text` | string literal | `"No rush. Look around and pretend you're rich."` |
| `decline_open` | string literal | `"All good. Come back when your wallet stops crying."` |
| `confirm_format` | string literal | `'Buy "%s"?'` |
| `post_select_format` | string literal | `'You bought "%s".'` |
| `after_yes` | string literal | `"Nice pick.{p_1} Want anything else?"` |
| `after_no` | string literal | `"Fair.{p_1} Wanna check something else?"` |
| `exit_goodbye` | string literal | `"Thanks for stoppin' by!"` |

### `assets` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `menu_bg` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_shop_an.png"` |
| `menu_bg_anim` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_an.animation"` |
| `menu_bg_frame` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_shop_an_frame.png"` |
| `highlight` | string literal | `"/server/assets/net-games/ui/highlight_shop.png"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_shop.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
