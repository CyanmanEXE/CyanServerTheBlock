# `main.lua`

> **Source:** `scripts/ezlibs-scripts/ezencounters/main.lua`  
> **Source lines:** 292  
> **Functions detected:** 14  
> **Table declarations detected:** 11

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Ensure encounters directory exists

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/ezwarps/main` — line 2
- `scripts/ezlibs-scripts/ezmemory` — line 3
- `scripts/ezlibs-scripts/helpers` — line 4
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 5
- `scripts/ezlibs-scripts/object_registry` — line 6
- `scripts/ezlibs-scripts/ezbus` — line 7
- `scripts/ezlibs-scripts/ezconfig` — line 8

## Events

- `Net:on("battle_results", function(event) ...)` — line 219. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 20 | `load_encounters_for_areas` | `(none)` |
| 65 | `ezencounters.get_encounter_by_name` | `encounter_name` |
| 73 | `ezencounters.resolve_encounter` | `encounter_reference` |
| 82 | `should_record_step` | `player_id` |
| 104 | `ezencounters.increment_steps_since_encounter` | `player_id` |
| 122 | `ezencounters.handle_player_move` | `player_id, x, y, z` |
| 139 | `ezencounters.pick_encounter_from_table` | `encounter_table` |
| 163 | `ezencounters.try_random_encounter` | `player_id,encounter_table` |
| 180 | `ezencounters.begin_encounter_by_name` | `player_id,encounter_name,trigger_object` |
| 192 | `ezencounters.begin_encounter` | `player_id,encounter_info,trigger_object` |
| 207 | `ezencounters.clear_tiles_since_encounter` | `player_id` |
| 211 | `ezencounters.clear_last_position` | `player_id` |
| 248 | `ezencounters.handle_player_disconnect` | `player_id` |
| 254 | `on_radius_encounter_triggered` | `event` |

### Function notes

- **`load_encounters_for_areas()`** *(source line 20)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.get_encounter_by_name(encounter_name)`** — Public lookup for systems that need the canonical encounter definition but must retain their own battle/session wrapper (for example, NebuLibs terrain and health handling). The returned table is the registered definition itself. *(source line 65)*
- **`ezencounters.resolve_encounter(encounter_reference)`** — Resolve a name or a direct encounter package path into the shape used by Net.initiate_encounter. Named definitions always win over treating a string as a raw path; callers may pass additional battle data to merge separately. *(source line 73)*
- **`should_record_step(player_id)`** *(source line 82)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.increment_steps_since_encounter(player_id)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.handle_player_move(player_id, x, y, z)`** *(source line 122)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.pick_encounter_from_table(encounter_table)`** *(source line 139)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.try_random_encounter(player_id,encounter_table)`** *(source line 163)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.begin_encounter_by_name(player_id,encounter_name,trigger_object)`** — FIXED: Now returns the stats *(source line 180)*
- **`ezencounters.begin_encounter(player_id,encounter_info,trigger_object)`** *(source line 192)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.clear_tiles_since_encounter(player_id)`** *(source line 207)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.clear_last_position(player_id)`** *(source line 211)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezencounters.handle_player_disconnect(player_id)`** *(source line 248)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_radius_encounter_triggered(event)`** *(source line 254)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezencounters` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `players_in_encounters` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_last_position` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_steps_since_encounter` *(line 13)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `named_encounters` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `provided_encounter_assets` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `encounter_finished_callbacks` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `area_encounter_tables` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `encounter_sections` *(line 32)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"encounters"` |
| `[2]` | string literal | `"bosses"` |
| `[3]` | string literal | `"special_encounters"` |

### `stats` *(line 235)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `health` | expression/reference | `event.health` |
| `time` | expression/reference | `event.time` |
| `ran` | expression/reference | `event.ran` |
| `emotion` | expression/reference | `event.emotion` |
| `turns` | expression/reference | `event.turns` |
| `enemies` | expression/reference | `event.enemies` |
| `score` | expression/reference | `event.score` |

### `encounter_info` *(line 267)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `path` | expression/reference | `event.object.custom_properties["Path"]` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezencounters/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
