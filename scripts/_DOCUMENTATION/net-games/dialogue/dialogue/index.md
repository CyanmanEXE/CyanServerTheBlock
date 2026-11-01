# `dialogue.lua`

> **Source:** `scripts/net-games/dialogue/dialogue.lua`  
> **Source lines:** 330  
> **Functions detected:** 17  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/net-games/dialogue/dialogue.lua Hardened net-games dialogue lifecycle. Keeps the creator-side Displayer architecture while preserving production behavior learned from shadis_hp: held-input handoff protection, real visual teardown before unlock/on_complete, BN-style A/B behavior, and textbox reuse.

## Dependencies

- `scripts/net-games/main` — line 7
- `scripts/displayer/displayer` — line 9
- `scripts/displayer/text-display` — line 10
- `scripts/input/input` — line 11
- `scripts/net-games/dialogue/constants` — line 12
- `scripts/net-games/dialogue/prompt` — line 13
- `scripts/net-games/dialogue/prompt_vertical` — line 14

## Events

- `Net:on("tick", function(event) ...)` — line 161. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 24 | `ensure_backdrop_sprite` | `player_id` |
| 37 | `draw_backdrop` | `player_id, backdrop, z` |
| 58 | `erase_backdrop` | `player_id` |
| 62 | `set_input_locked` | `player_id, locked` |
| 72 | `ensure_listener` | `(none)` |
| 80 | `default_opts` | `(none)` |
| 96 | `merge` | `a, b` |
| 101 | `mk_box_id` | `player_id, ui` |
| 105 | `gate_handoff_input` | `player_id, seconds` |
| 111 | `close_instance` | `player_id, reason` |
| 136 | `finish_instance` | `player_id, inst` |
| 157 | `attach_tick` | `(none)` |
| 205 | `Dialogue.is_active` | `player_id` |
| 209 | `Dialogue.prompt_yesno` | `player_id, opts` |
| 213 | `Dialogue.prompt_menu` | `player_id, opts` |
| 217 | `Dialogue.start` | `player_id, script, opts` |
| 326 | `Dialogue.close` | `player_id` |

### Function notes

- **`ensure_backdrop_sprite(player_id)`** *(source line 24)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_backdrop(player_id, backdrop, z)`** *(source line 37)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_backdrop(player_id)`** *(source line 58)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_input_locked(player_id, locked)`** *(source line 62)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_listener()`** *(source line 72)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`default_opts()`** *(source line 80)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`merge(a, b)`** *(source line 96)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`mk_box_id(player_id, ui)`** *(source line 101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`gate_handoff_input(player_id, seconds)`** *(source line 105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`close_instance(player_id, reason)`** *(source line 111)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`finish_instance(player_id, inst)`** *(source line 136)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`attach_tick()`** *(source line 157)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Dialogue.is_active(player_id)`** *(source line 205)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Dialogue.prompt_yesno(player_id, opts)`** *(source line 209)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Dialogue.prompt_menu(player_id, opts)`** *(source line 213)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Dialogue.start(player_id, script, opts)`** *(source line 217)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Dialogue.close(player_id)`** *(source line 326)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Dialogue` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `Dialogue.instances` *(line 17)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_backdrop_sprite` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pages` *(line 255)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pages` *(line 258)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `script` |

### `pages` *(line 264)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `""` |

### `text_options` *(line 274)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | expression/reference | `o.font` |
| `scale` | expression/reference | `o.scale` |
| `z` | expression/reference | `o.z` |
| `speed` | expression/reference | `o.typing_speed` |
| `type_sound` | expression/reference | `o.type_sfx_path` |
| `type_sound_min_dt` | expression/reference | `o.type_sfx_min_dt` |
| `max_lines` | expression/reference | `backdrop and backdrop.max_lines or nil` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/dialogue/dialogue.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
