# `prog_vert_prompt_red.lua`

> **Source:** `scripts/net-games/npcs/prog_vert_prompt_red.lua`  
> **Source lines:** 58  
> **Functions detected:** 1  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_vert_prompt_red.lua Max-condensed example: - no Net:on in this file - no TalkVertMenu.open in this file - no SFX table in this file - no exit_index math in this file - full content control remains here =====================================================

## Dependencies

- `scripts/net-games/npcs/talk` — line 11

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 25 | `on_interact` | `player_id, _bot_id, bot_name` |

### Function notes

- **`on_interact(player_id, _bot_id, bot_name)`** *(source line 25)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `options` *(line 36)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `count` | number literal | `99` |
| `prefix` | string literal | `"Red Option "` |
| `pad` | number literal | `2` |
| `exit_text` | string literal | `"Exit"` |
| `exit_id` | string literal | `"exit"` |

### `texts` *(line 40)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `open_question` | string literal | `"Do you wanna check out the vertical menu?"` |
| `intro_text` | string literal | `"Awesome. Let me know if there's anything that you like."` |
| `decline_open` | string literal | `"No worries. Maybe next time."` |
| `confirm_format` | string literal | `'Are you sure you want "%s"?'` |
| `post_select_format` | string literal | `'You got "%s".'` |
| `after_yes` | string literal | `"Thank you!{p_1} Is there anything else you'd like?"` |
| `after_no` | string literal | `"No worries. Anything else?"` |
| `exit_goodbye` | string literal | `"Thanks for stopping by!"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_vert_prompt_red.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
