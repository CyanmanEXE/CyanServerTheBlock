# `npc_api.lua`

> **Source:** `scripts/net-games/npcs/npc_api.lua`  
> **Source lines:** 56  
> **Functions detected:** 3  
> **Table declarations detected:** 1

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/net-games/npcs/npc_api.lua Purpose: Remove NPC boilerplate (interaction wiring, busy guards, face-player, SFX helper). This does NOT contain dialogue/menu content defaults.

## Dependencies

- `scripts/libs/direction` — line 5
- `scripts/net-games/dialogue/startup` — line 6
- `scripts/net-games/dialogue/dialogue` — line 8
- `scripts/net-games/npcs/talk_vert_menu` — line 9

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 38. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 13 | `M.play_sfx` | `player_id, path` |
| 24 | `M.face_player` | `bot_id, bot_pos, player_id` |
| 34 | `M.bind_confirm_interaction` | `bot_id, bot_pos, handler, opts` |

### Function notes

- **`M.play_sfx(player_id, path)`** *(source line 13)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.face_player(bot_id, bot_pos, player_id)`** *(source line 24)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.bind_confirm_interaction(bot_id, bot_pos, handler, opts)`** — Standard interaction wrapper: - filters to this bot + confirm button - prevents overlap via TalkVertMenu busy + Dialogue active - optionally faces player - calls your handler(player_id) *(source line 34)*

## Tables and data structures

### `M` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/npc_api.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
