# `simon-says.lua`

> **Source:** `scripts/simon-says.lua`  
> **Source lines:** 433  
> **Functions detected:** 9  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

[[

## Dependencies

- `scripts/net-games/main` — line 8
- `scripts/input-controller/main` — line 9
- `scripts/persistence/persistence` — line 14

## Events

- `Net:on("player_disconnect", function(event) ...)` — line 135. The event name is taken directly from this source.
- `Net:on("actor_interaction", function(event) ...)` — line 332. The event name is taken directly from this source.
- `Net:on("virtual_input", function(event) ...)` — line 340. The event name is taken directly from this source.
- `Net:on("countdown_ended", function(event) ...)` — line 413. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 24 | `async` | `p` |
| 28 | `await` | `v` |
| 30 | `removeValue` | `array, valueToRemove` |
| 55 | `is_simon_button` | `name` |
| 63 | `spawn_simon` | `(none)` |
| 152 | `simon_says_press` | `player_id` |
| 190 | `end_game_cleanup` | `player_id, reason, simon` |
| 217 | `greet_simon` | `actor_id, player_id` |
| 394 | `jiggle` | `dx, dy` |

### Function notes

- **`async(p)`** — Shorthand for async/await *(source line 24)*
- **`await(v)`** *(source line 28)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`removeValue(array, valueToRemove)`** *(source line 30)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_simon_button(name)`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`spawn_simon()`** — ===================================================== SPAWN SIMON NPCS ===================================================== *(source line 63)*
- **`simon_says_press(player_id)`** — ===================================================== GAME LOGIC ===================================================== *(source line 152)*
- **`end_game_cleanup(player_id, reason, simon)`** *(source line 190)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`greet_simon(actor_id, player_id)`** *(source line 217)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`jiggle(dx, dy)`** *(source line 394)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `simon_cache` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `simon_players` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `simon_optional_properties` *(line 13)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"NPC"` |
| `[2]` | string literal | `"NPC Mug"` |
| `[3]` | string literal | `"Time"` |
| `[4]` | string literal | `"Limit"` |

### `defaults` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `time_limit` | number literal | `60` |
| `default_npc` | string literal | `"/server/assets/simon-says/normal-navi-bn4_green"` |
| `default_npc_mug` | string literal | `"/server/assets/simon-says/normal-navi-bn4_green-mug"` |
| `total_answers` | number literal | `60` |

### `INPUT_CHOICES` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Interact"` |
| `[2]` | string literal | `"Shoulder L"` |
| `[3]` | string literal | `"Shoulder R"` |
| `[4]` | string literal | `"Move Down"` |
| `[5]` | string literal | `"Move Left"` |
| `[6]` | string literal | `"Move Right"` |
| `[7]` | string literal | `"Move Up"` |

### `INDICATOR_STATE` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Interact]` | string literal | `"A"` |
| `[Confirm]` | string literal | `"A"` |
| `[Shoulder L]` | string literal | `"LS"` |
| `[Shoulder R]` | string literal | `"RS"` |
| `[Move Down]` | string literal | `"D"` |
| `[Move Left]` | string literal | `"L"` |
| `[Move Right]` | string literal | `"R"` |
| `[Move Up]` | string literal | `"U"` |

### `possibilities` *(line 164)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/simon-says.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
