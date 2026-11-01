# `prog_basic_freedraw.lua`

> **Source:** `scripts/net-games/npcs/prog_basic_freedraw.lua`  
> **Source lines:** 128  
> **Functions detected:** 4  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_basic_freedraw.lua Tiled-spawned NPC that draws ALL available fonts on screen WITHOUT using Dialogue / textbox pipeline. =====================================================

## Dependencies

- `scripts/libs/direction` — line 7
- `scripts/displayer/displayer` — line 8

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 109. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 126. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `dbg` | `msg` |
| 57 | `display_id_for` | `font_name` |
| 61 | `show` | `player_id` |
| 96 | `hide` | `player_id` |

### Function notes

- **`dbg(msg)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`display_id_for(font_name)`** *(source line 57)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`show(player_id)`** *(source line 61)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide(player_id)`** *(source line 96)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `FONT_TESTS` *(line 41)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ font = "THICK", label = "THICK", sample = "ABC abc 0123 !?.,:;()[]+-*/" }` |
| `[2]` | table | `{ font = "THICK_BLACK", label = "THICK_BLACK", sample = "ABC abc 0123 !?.,:;()[]+-*/" }` |
| `[3]` | table | `{ font = "BATTLE", label = "BATTLE", sample = "&lt;PROG_EXE&gt; ABC 0123 !?" }` |
| `[4]` | table | `{ font = "THIN", label = "THIN", sample = "ABC abc 0123 !?.,:;()[]+-*/" }` |
| `[5]` | table | `{ font = "TINY", label = "TINY", sample = "ABC abc 0123 !?.,:;()[]+-*/" }` |
| `[6]` | table | `{ font = "WIDE", label = "WIDE", sample = "ABC abc 0123 !?.,:;()[]+-*/" }` |
| `[7]` | table | `{ font = "GRADIENT", label = "GRADIENT", sample = "ABC abc 0123 !?.,:;()[]+-*/" }` |
| `[8]` | table | `{ font = "GRADIENT_BLACK", label = "GRADIENT_BLACK", sample = "ABC abc 0123 !?.,:;()[]+-*/" }` |

### `active_texts` *(line 55)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ids` *(line 71)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_basic_freedraw.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
