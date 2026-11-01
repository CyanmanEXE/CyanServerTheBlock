# `create_custom_bot.lua`

> **Source:** `scripts/bot/create_custom_bot.lua`  
> **Source lines:** 96  
> **Functions detected:** 8  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

No module-level description was present in the source. The reference below documents the symbols and behavior visible in this file.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 1 | `create_custom_bot` | `id, initial_data` |
| 18 | `bot._tick` | `delta_time` |
| 57 | `bot.message_player` | `player_id, message` |
| 61 | `bot.question_player` | `player_id, message` |
| 65 | `bot.quiz_player` | `player_id, option_a, option_b, option_c` |
| 69 | `bot._handle_actor_interaction` | `player_id, other_id` |
| 79 | `bot._handle_textbox_response` | `player_id, response` |
| 85 | `bot._handle_player_disconnect` | `player_id` |

### Function notes

- **`create_custom_bot(id, initial_data)`** *(source line 1)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bot._tick(delta_time)`** *(source line 18)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bot.message_player(player_id, message)`** *(source line 57)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bot.question_player(player_id, message)`** *(source line 61)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bot.quiz_player(player_id, option_a, option_b, option_c)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bot._handle_actor_interaction(player_id, other_id)`** *(source line 69)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bot._handle_textbox_response(player_id, response)`** *(source line 79)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bot._handle_player_disconnect(player_id)`** *(source line 85)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `bot` *(line 2)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `_id` | expression/reference | `id` |
| `x` | expression/reference | `initial_data.x` |
| `y` | expression/reference | `initial_data.y` |
| `z` | expression/reference | `initial_data.z` |
| `path` | table | `{}` |
| `_path_target_index` | number literal | `1` |
| `talking_to` | nil | `nil` |
| `speed` | number literal | `1.2` |
| `size` | expression/reference | `.35` |
| `mug_texture_path` | nil | `nil` |
| `mug_animation_path` | nil | `nil` |
| `on_interact` | nil | `nil` |
| `on_response` | nil | `nil` |

### `path` *(line 7)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/bot/create_custom_bot.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
