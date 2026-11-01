# `prog_dramatic_dialogue.lua`

> **Source:** `scripts/net-games/npcs/prog_dramatic_dialogue.lua`  
> **Source lines:** 110  
> **Functions detected:** 2  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_dramatic_dialogue.lua Tiled-spawned NPC that triggers net-games Dialogue (BLACK BOX style + normal THICK font) =====================================================

## Dependencies

- `scripts/libs/direction` — line 7
- `scripts/net-games/dialogue/dialogue` — line 8

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 41. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `dbg` | `msg` |
| 105 | `on_finish` | `(none)` |

### Function notes

- **`dbg(msg)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_finish()`** *(source line 105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ui` *(line 69)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `box_id` | string literal | `"prog_dialogue_box"` |
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `typing_speed` | number literal | `30` |
| `type_sfx_path` | string literal | `"/server/assets/net-games/sfx/text.ogg"` |
| `type_sfx_min_dt` | number literal | `0.05` |
| `backdrop` | table | `{ style = "black_box", x = 1, y = 209, width = 478, height = 104, padding_x = 16, padding_y = 16, max_lines = 3, indicator = { enabled = tru…` |

### `backdrop` *(line 81)*

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

### `indicator` *(line 91)*

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

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_dramatic_dialogue.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
