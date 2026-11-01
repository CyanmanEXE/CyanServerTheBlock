# `prog_banner_dialogue.lua`

> **Source:** `scripts/net-games/npcs/prog_banner_dialogue.lua`  
> **Source lines:** 164  
> **Functions detected:** 5  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_banner_dialogue.lua Tiled-spawned NPC that triggers net-games Marquee =====================================================

## Dependencies

- `scripts/libs/direction` — line 6
- `scripts/displayer/displayer` — line 7

## Events

- `Net:on("tick", function(event) ...)` — line 94. The event name is taken directly from this source.
- `Net:on("actor_interaction", function(event) ...)` — line 109. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 161. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 10 | `dbg` | `msg` |
| 20 | `ensure_backdrop_sprite` | `player_id` |
| 28 | `draw_backdrop` | `player_id, backdrop, z` |
| 57 | `erase_backdrop` | `player_id` |
| 91 | `ensure_tick` | `(none)` |

### Function notes

- **`dbg(msg)`** *(source line 10)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_backdrop_sprite(player_id)`** *(source line 20)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_backdrop(player_id, backdrop, z)`** *(source line 28)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_backdrop(player_id)`** *(source line 57)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_tick()`** *(source line 91)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `player_backdrop_sprite` *(line 18)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `marquee_active` *(line 87)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `backdrop` *(line 123)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `width` | number literal | `240` |
| `height` | number literal | `30` |
| `padding_x` | number literal | `6` |
| `padding_y` | number literal | `0` |
| `loops` | string literal | `"once"` |
| `keep_backdrop` | boolean literal | `false` |

### `options` *(line 142)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `speed` | number literal | `60` |
| `loops` | number literal | `1` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_banner_dialogue.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
