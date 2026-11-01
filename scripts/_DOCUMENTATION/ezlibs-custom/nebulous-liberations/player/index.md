# `player.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/player.lua`  
> **Source lines:** 290  
> **Functions detected:** 20  
> **Table declarations detected:** 6

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

private functions

## Dependencies

- `scripts/ezlibs-scripts/ezmemory` — line 1
- `scripts/ezlibs-scripts/helpers` — line 2
- `scripts/ezlibs-scripts/ezlogger` — line 3
- `scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu` — line 5

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 9 | `create_textbox_promise` | `self` |
| 31 | `stats_indicate_panic` | `stats` |
| 40 | `Player:new` | `player_id` |
| 65 | `Player:message` | `message, texture_path, animation_path` |
| 70 | `Player:message_with_mug` | `message` |
| 77 | `Player:say` | `message, texture_path, animation_path` |
| 82 | `Player:say_with_mug` | `message` |
| 86 | `Player:question` | `question, texture_path, animation_path` |
| 91 | `Player:question_with_mug` | `question` |
| 95 | `Player:quiz` | `a, b, c, texture_path, animation_path` |
| 103 | `Player:quiz_with_mug` | `a, b, c` |
| 109 | `Player:select_mission_option` | `options, title` |
| 113 | `Player:is_battling` | `(none)` |
| 117 | `create_default_results` | `(none)` |
| 130 | `Player:initiate_encounter` | `asset_path, data` |
| 148 | `Player:handle_textbox_response` | `response` |
| 167 | `Player:handle_battle_results` | `stats` |
| 208 | `Player:handle_battle_exit` | `stats` |
| 235 | `Player:handle_disconnect` | `(none)` |
| 257 | `Player:boot_to_lobby` | `isVictory, mapName` |

### Function notes

- **`create_textbox_promise(self)`** — private functions *(source line 9)*
- **`stats_indicate_panic(stats)`** — Only these two explicit end reasons are considered a forced exit. DRAW and LOSE are ordinary battle outcomes, not panics. *(source line 31)*
- **`Player:new(player_id)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:message(message, texture_path, animation_path)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:message_with_mug(message)`** *(source line 70)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:say(message, texture_path, animation_path)`** — Fire-and-forget informational message. Does NOT push a resolver, so it cannot hang the caller if the client never renders/dismisses the textbox (which can happen right after a battle exit). Use this for flavor text. *(source line 77)*
- **`Player:say_with_mug(message)`** *(source line 82)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:question(question, texture_path, animation_path)`** *(source line 86)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:question_with_mug(question)`** *(source line 91)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:quiz(a, b, c, texture_path, animation_path)`** *(source line 95)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:quiz_with_mug(a, b, c)`** — Mugshot-flavored quiz. Used by the liberation flow so the player's own portrait accompanies the "Liberation / Pass / Cancel" prompts; the order-points value is now shown by PointsGauge, not by the mugshot. *(source line 103)*
- **`Player:select_mission_option(options, title)`** — Controller-driven sliced option menu used by mission interactions. Returns a zero-based index to preserve the existing mission response handling. *(source line 109)*
- **`Player:is_battling()`** *(source line 113)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_default_results()`** *(source line 117)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:initiate_encounter(asset_path, data)`** *(source line 130)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:handle_textbox_response(response)`** *(source line 148)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:handle_battle_results(stats)`** *(source line 167)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:handle_battle_exit(stats)`** *(source line 208)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:handle_disconnect()`** *(source line 235)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Player:boot_to_lobby(isVictory, mapName)`** *(source line 257)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `BattleReason` *(line 20)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DRAW` | number literal | `0` |
| `WIN` | number literal | `1` |
| `LOSE` | number literal | `2` |
| `RUN` | number literal | `3` |
| `USER_PANIC` | number literal | `4` |

### `Player` *(line 38)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `player_id` |
| `activity` | nil | `nil` |
| `mug` | call/expression | `Net.get_player_mugshot(player_id)` |
| `textbox_promise_resolvers` | table | `{}` |
| `resolve_battle` | nil | `nil` |
| `pending_battle_stats` | nil | `nil` |
| `battle_exit_fallback_token` | nil | `nil` |
| `avatar_details` | nil | `nil` |
| `moved` | boolean literal | `false` |
| `x` | expression/reference | `position.x` |
| `y` | expression/reference | `position.y` |
| `z` | expression/reference | `position.z` |
| `disconnected` | boolean literal | `false` |

### `textbox_promise_resolvers` *(line 47)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enemies` *(line 124)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `token` *(line 184)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/player.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
