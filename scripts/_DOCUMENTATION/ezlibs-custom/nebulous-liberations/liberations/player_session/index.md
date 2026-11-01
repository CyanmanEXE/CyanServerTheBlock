# `player_session.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/player_session.lua`  
> **Source lines:** 561  
> **Functions detected:** 22  
> **Table declarations detected:** 6

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

player_session.lua

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 2
- `scripts/ezlibs-custom/nebulous-liberations/liberations/ability` — line 5
- `scripts/ezlibs-custom/nebulous-liberations/liberations/player_selection` — line 6
- `scripts/ezlibs-custom/nebulous-liberations/liberations/loot` — line 7
- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers` — line 8
- `scripts/ezlibs-custom/nebulous-liberations/utils/paralyze_effect` — line 9
- `scripts/ezlibs-custom/nebulous-liberations/utils/recover_effect` — line 10
- `scripts/ezlibs-custom/nebulous-liberations/liberations/constants` — line 11
- `scripts/ezlibs-scripts/ezmemory` — line 12
- `scripts/libs/emotes` — line 13
- `scripts/ezlibs-custom/nebulous-liberations/liberations/hp_indicators` — line 14

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 33 | `stats_indicate_panic` | `results` |
| 41 | `PlayerSession:new` | `instance, player` |
| 63 | `PlayerSession:emote_state` | `(none)` |
| 75 | `PlayerSession:get_ability_permission` | `(none)` |
| 109 | `PlayerSession:get_pass_turn_permission` | `(none)` |
| 124 | `PlayerSession:initiate_encounter` | `encounter_path, data` |
| 183 | `PlayerSession:heal` | `amount` |
| 204 | `is_guardable_attacker` | `attacker` |
| 209 | `guard_is_covering_target` | `instance, target_session` |
| 234 | `PlayerSession:hurt` | `amount, attacker` |
| 278 | `PlayerSession:paralyze` | `(none)` |
| 290 | `PlayerSession:pass_turn` | `(none)` |
| 304 | `PlayerSession:complete_turn` | `(none)` |
| 325 | `PlayerSession:give_turn` | `(none)` |
| 359 | `PlayerSession:find_matching_gates` | `(none)` |
| 374 | `PlayerSession:find_gate_points` | `id` |
| 385 | `PlayerSession:find_closest_guardian` | `(none)` |
| 400 | `PlayerSession:liberate_panels` | `panels, results` |
| 428 | `PlayerSession:get_cash` | `panel, destroy_items` |
| 455 | `PlayerSession:loot_panels` | `panels, remove_traps, destroy_items` |
| 535 | `PlayerSession:liberate_and_loot_panels` | `panels, results, remove_traps, destroy_items` |
| 543 | `PlayerSession:handle_disconnect` | `(none)` |

### Function notes

- **`stats_indicate_panic(results)`** *(source line 33)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:new(instance, player)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:emote_state()`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:get_ability_permission()`** *(source line 75)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:get_pass_turn_permission()`** *(source line 109)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:initiate_encounter(encounter_path, data)`** *(source line 124)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:heal(amount)`** *(source line 183)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_guardable_attacker(attacker)`** *(source line 204)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`guard_is_covering_target(instance, target_session)`** *(source line 209)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:hurt(amount, attacker)`** *(source line 234)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:paralyze()`** *(source line 278)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:pass_turn()`** *(source line 290)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:complete_turn()`** *(source line 304)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:give_turn()`** *(source line 325)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:find_matching_gates()`** *(source line 359)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:find_gate_points(id)`** *(source line 374)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:find_closest_guardian()`** *(source line 385)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:liberate_panels(panels, results)`** *(source line 400)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:get_cash(panel, destroy_items)`** *(source line 428)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:loot_panels(panels, remove_traps, destroy_items)`** *(source line 455)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:liberate_and_loot_panels(panels, results, remove_traps, destroy_items)`** *(source line 535)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PlayerSession:handle_disconnect()`** *(source line 543)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `BattleReason` *(line 17)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DRAW` | number literal | `0` |
| `WIN` | number literal | `1` |
| `LOSE` | number literal | `2` |
| `RUN` | number literal | `3` |
| `USER_PANIC` | number literal | `4` |

### `PlayerSession` *(line 38)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_session` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `player` | expression/reference | `player` |
| `health` | number literal | `100` |
| `max_health` | number literal | `100` |
| `shadowsteps` | table | `{}` |
| `paralyze_effect` | nil | `nil` |
| `paralyze_counter` | number literal | `0` |
| `invincible` | boolean literal | `false` |
| `completed_turn` | boolean literal | `false` |
| `selection` | call/expression | `PlayerSelection:new(instance` |
| `[11]` | expression/reference | `player.id)` |
| `ability` | call/expression | `Ability.resolve_for_player(player)` |
| `disconnected` | boolean literal | `false` |
| `is_trapped` | boolean literal | `false` |
| `get_monies` | boolean literal | `false` |

### `shadowsteps` *(line 47)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `gates` *(line 360)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `points` *(line 375)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/player_session.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
