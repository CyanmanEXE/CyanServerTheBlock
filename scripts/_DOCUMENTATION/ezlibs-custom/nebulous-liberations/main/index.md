# `main.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/main.lua`  
> **Source lines:** 715  
> **Functions detected:** 21  
> **Table declarations detected:** 10

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

main.lua Nebulous Liberations ezlibs custom plugin entry point. This module follows scripts/ezlibs-scripts/main.lua's plugin contract: it returns a table of handle_* functions and does not register its own Net event listeners. The ezlibs dispatcher passes event fields to these methods.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 10
- `scripts/ezlibs-scripts/ezmapinstance` — line 11
- `scripts/ezlibs-custom/nebulous-liberations/player` — line 24
- `scripts/ezlibs-custom/nebulous-liberations/liberations/instance` — line 25
- `scripts/ezlibs-custom/nebulous-liberations/utils/parties` — line 26
- `scripts/ezlibs-custom/nebulous-liberations/liberations/constants` — line 27
- `scripts/ezlibs-custom/nebulous-liberations/liberations/validation` — line 28
- `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_registry` — line 29
- `scripts/ezlibs-custom/nebulous-liberations/liberations/tileset_embedder` — line 33

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 43 | `transfer_players_to_new_instance` | `base_area, player_ids` |
| 175 | `LibPlugin.spawn_boss` | `instance_area_id, boss_id` |
| 187 | `LibPlugin.start_game_for_player` | `player_id, liberation_id` |
| 205 | `detect_door_interaction` | `area_id, player_id, object_id, button` |
| 226 | `leave_party` | `player` |
| 245 | `remove_instance` | `area_id` |
| 295 | `LibPlugin.on_tick` | `delta_time` |
| 314 | `LibPlugin.handle_tile_interaction` | `player_id, x, y, z, button` |
| 330 | `LibPlugin.handle_object_interaction` | `player_id, object_id, button` |
| 348 | `LibPlugin.handle_actor_interaction` | `player_id, actor_id, button` |
| 380 | `LibPlugin.handle_textbox_response` | `player_id, response` |
| 387 | `LibPlugin.handle_battle_results` | `...` |
| 414 | `LibPlugin.handle_battle_exit` | `...` |
| 441 | `LibPlugin.handle_player_avatar_change` | `player_id, details` |
| 450 | `LibPlugin.handle_player_transfer` | `player_id` |
| 484 | `LibPlugin.handle_player_request` | `player_id, data` |
| 490 | `LibPlugin.handle_player_disconnect` | `player_id` |
| 502 | `LibPlugin.handle_player_move` | `player_id, x, y, z` |
| 520 | `resolve_area_reference` | `area_reference, area_ids` |
| 543 | `register_waiting_area` | `source_area_id, source_area_name, waiting_area, respawn_area, area_ids` |
| 568 | `initialize_areas` | `(none)` |

### Function notes

- **`transfer_players_to_new_instance(base_area, player_ids)`** *(source line 43)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.spawn_boss(instance_area_id, boss_id)`** — Spawn a boss configured with Spawn Mode = Manual (or force a dormant boss definition) in an active Liberation instance. boss_id accepts the configured Boss ID or the Tiled object ID when Boss ID is blank. *(source line 175)*
- **`LibPlugin.start_game_for_player(player_id, liberation_id)`** *(source line 187)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`detect_door_interaction(area_id, player_id, object_id, button)`** *(source line 205)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`leave_party(player)`** *(source line 226)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_instance(area_id)`** *(source line 245)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.on_tick(delta_time)`** *(source line 295)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_tile_interaction(player_id, x, y, z, button)`** *(source line 314)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_object_interaction(player_id, object_id, button)`** *(source line 330)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_actor_interaction(player_id, actor_id, button)`** *(source line 348)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_textbox_response(player_id, response)`** *(source line 380)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_battle_results(...)`** *(source line 387)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_battle_exit(...)`** *(source line 414)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_player_avatar_change(player_id, details)`** *(source line 441)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_player_transfer(player_id)`** *(source line 450)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_player_request(player_id, data)`** *(source line 484)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_player_disconnect(player_id)`** *(source line 490)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LibPlugin.handle_player_move(player_id, x, y, z)`** *(source line 502)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_area_reference(area_reference, area_ids)`** *(source line 520)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`register_waiting_area(source_area_id, source_area_name, waiting_area, respawn_area, area_ids)`** *(source line 543)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`initialize_areas()`** *(source line 568)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `LibPlugin` *(line 18)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `waiting_area_map` *(line 34)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `respawn_table` *(line 36)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `gate_to_area_map` *(line 37)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instances` *(line 38)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `players` *(line 39)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instance_players` *(line 51)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instance_player_ids` *(line 53)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `metadata` *(line 76)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `game` | string literal | `"nebulous-liberations"` |

### `dead_instances` *(line 298)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
