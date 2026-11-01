# `encounters.lua`

> **Source:** `scripts/libs/encounters.lua`  
> **Source lines:** 143  
> **Functions detected:** 6  
> **Table declarations detected:** 7

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
| 8 | `lib.track_player` | `player_id` |
| 16 | `lib.drop_player` | `player_id` |
| 20 | `lib.setup` | `encounter_table` |
| 26 | `lib.setup_area` | `area_id, area_table` |
| 47 | `lib.handle_player_move` | `player_id, x, y, z` |
| 104 | `lib.initiate_direct_encounter` | `player_id, asset_path` |

### Function notes

- **`lib.track_player(player_id)`** *(source line 8)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lib.drop_player(player_id)`** *(source line 16)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lib.setup(encounter_table)`** *(source line 20)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lib.setup_area(area_id, area_table)`** *(source line 26)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lib.handle_player_move(player_id, x, y, z)`** *(source line 47)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lib.initiate_direct_encounter(player_id, asset_path)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `lib` *(line 1)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `BIG_TILE_MOVEMENT` | number literal | `1` |

### `player_trackers` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `table` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pos` *(line 67)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |

### `encounter_table` *(line 113)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `encounters` *(line 120)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ asset_path = "/server/assets/basic_mob1.zip", weight = 0.1 }` |
| `[2]` | table | `{ asset_path = "/server/assets/basic_mob2.zip", weight = 0.5 }` |
| `[3]` | table | `{ asset_path = "/server/assets/basic_mob3.zip", weight = 0.01 }` |

### `encounters` *(line 139)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `... etc ...` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/libs/encounters.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
