# `ezrushroads.lua`

> **Source:** `scripts/ezlibs-scripts/ezrushroads.lua`  
> **Source lines:** 675  
> **Functions detected:** 22  
> **Table declarations detected:** 17

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezrushroads.lua Rush Roads minigame integrated with ezlibs Uses eztriggers for tile detection and ezmemory for persistence

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 4
- `scripts/ezlibs-scripts/helpers` — line 10
- `scripts/ezlibs-scripts/ezmemory` — line 11
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 12
- `scripts/ezlibs-scripts/ezbus` — line 13

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 16 | `async` | `p` |
| 23 | `get_table_length` | `tbl` |
| 30 | `get_anim_state_from_direction` | `direction` |
| 65 | `get_food_item_id` | `player_id` |
| 72 | `get_player_rush_memory` | `player_id` |
| 82 | `update_food_item` | `player_id, count` |
| 97 | `ezrushroads.get_food` | `player_id` |
| 102 | `ezrushroads.add_food` | `player_id, amount` |
| 111 | `ezrushroads.remove_food` | `player_id, amount` |
| 127 | `group_rush_roads_in_area` | `area_id` |
| 139 | `dfs` | `start_id, group_id` |
| 182 | `create_permanent_bot` | `area_id, road_id, linked_obj, direction` |
| 240 | `process_rush_road` | `area_id, object` |
| 314 | `ezrushroads.init` | `(none)` |
| 338 | `update_visibility_for_player` | `player_id, area_id` |
| 371 | `create_temp_bots_for_player` | `player_id` |
| 410 | `remove_temp_bots_for_player` | `player_id` |
| 423 | `clear_active_animation` | `player_id` |
| 481 | `ezrushroads.handle_player_join` | `player_id` |
| 505 | `ezrushroads.handle_player_disconnect` | `player_id` |
| 526 | `ezrushroads.handle_player_transfer` | `player_id` |
| 534 | `ezrushroads.handle_object_interaction` | `player_id, object_id` |

### Function notes

- **`async(p)`** — Define local async/await using the global Async object (for use in handle_object_interaction) *(source line 16)*
- **`get_table_length(tbl)`** — Local table length helper *(source line 23)*
- **`get_anim_state_from_direction(direction)`** — Helper to get animation state from direction string *(source line 30)*
- **`get_food_item_id(player_id)`** — ============================================================================ Helper: generate player‑specific item ID ============================================================================ *(source line 65)*
- **`get_player_rush_memory(player_id)`** — ============================================================================ Food management using ezmemory ============================================================================ *(source line 72)*
- **`update_food_item(player_id, count)`** *(source line 82)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezrushroads.get_food(player_id)`** *(source line 97)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezrushroads.add_food(player_id, amount)`** *(source line 102)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezrushroads.remove_food(player_id, amount)`** *(source line 111)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`group_rush_roads_in_area(area_id)`** — ============================================================================ Group roads in an area (cardinal adjacency) ============================================================================ *(source line 127)*
- **`dfs(start_id, group_id)`** *(source line 139)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_permanent_bot(area_id, road_id, linked_obj, direction)`** — ============================================================================ Create permanent bot for linked object ============================================================================ *(source line 182)*
- **`process_rush_road(area_id, object)`** — ============================================================================ Process a single Rush Road object (called during init) ============================================================================ *(source line 240)*
- **`ezrushroads.init()`** — ============================================================================ After all objects are loaded, scan for Rush Roads and process them ============================================================================ *(source line 314)*
- **`update_visibility_for_player(player_id, area_id)`** — ============================================================================ Update visibility of road objects and permanent bots for a player in a given area ============================================================================ *(source line 338)*
- **`create_temp_bots_for_player(player_id)`** — ============================================================================ Create temporary animation bots for a player (one per road, off-map) ============================================================================ *(source line 371)*
- **`remove_temp_bots_for_player(player_id)`** — ============================================================================ Remove temporary bots for a player ============================================================================ *(source line 410)*
- **`clear_active_animation(player_id)`** — ============================================================================ Clean up active animation state for a player (if any) ============================================================================ *(source line 423)*
- **`ezrushroads.handle_player_join(player_id)`** — ============================================================================ Event handlers (called from main.lua) ============================================================================ *(source line 481)*
- **`ezrushroads.handle_player_disconnect(player_id)`** *(source line 505)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezrushroads.handle_player_transfer(player_id)`** *(source line 526)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezrushroads.handle_object_interaction(player_id, object_id)`** *(source line 534)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezrushroads` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `rush_roads` *(line 41)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_temp_bots` *(line 42)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_active_animation` *(line 43)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bot_occupants` *(line 44)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `any_player` *(line 45)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mem.rushroads` *(line 76)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `food` | number literal | `0` |
| `cleared` | table | `{}` |

### `road_ids` *(line 130)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `visited` *(line 135)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `stack` *(line 140)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `start_id` |

### `road` *(line 244)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `object.id` |
| `x` | expression/reference | `object.x` |
| `y` | expression/reference | `object.y` |
| `z` | expression/reference | `object.z` |
| `custom_properties` | expression/reference | `object.custom_properties` |
| `group_id` | nil | `nil` |
| `bot_name` | nil | `nil` |
| `original_x` | nil | `nil` |
| `original_y` | nil | `nil` |
| `original_z` | nil | `nil` |
| `down_x` | nil | `nil` |
| `down_y` | nil | `nil` |
| `down_z` | nil | `nil` |
| `anim_state` | nil | `nil` |

### `group_roads` *(line 580)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `anim_state` *(line 604)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `seq` | expression/reference | `seq` |
| `area` | expression/reference | `area` |
| `group_id` | expression/reference | `group_id` |
| `roads` | table | `{}` |

### `roads` *(line 608)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `move_in` *(line 623)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = x }, { property = "Y", value = y } }, duration = 0 }` |

### `keyframes` *(line 627)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "Animation", value = "IDLE_D" }, { property = "X", ease = "In", value = x }, { property = "Y", ease = "In", va…` |
| `[2]` | table | `{ properties = { { property = "Animation", value = "WIND_UP" }, { property = "X", ease = "In", value = (x - .2) }, { property = "Y", ease = …` |
| `[3]` | table | `{ properties = { { property = "Animation", value = "LAUNCH" }, { property = "X", ease = "In", value = (x - .4) }, { property = "Y", ease = "…` |
| `[4]` | table | `{ properties = { { property = "Animation", value = "SPIN" }, { property = "X", ease = "In", value = (x - .6) }, { property = "Y", ease = "In…` |
| `[5]` | table | `{ properties = { { property = "Animation", value = "SPIN" }, { property = "X", ease = "Out", value = (x - .8) }, { property = "Y", ease = "O…` |
| `[6]` | table | `{ properties = { { property = "Animation", value = "SPIN" }, { property = "X", ease = "Out", value = (x - 1) }, { property = "Y", ease = "Ou…` |
| `[7]` | table | `{ properties = { { property = "Animation", value = "SPIN" }, { property = "X", ease = "Out", value = (x) - .8 }, { property = "Y", ease = "O…` |
| `[8]` | table | `{ properties = { { property = "Animation", value = "SPIN" }, { property = "X", ease = "Out", value = (x) - .6 }, { property = "Y", ease = "O…` |
| `[9]` | table | `{ properties = { { property = "Animation", value = "SPIN" }, { property = "X", ease = "Out", value = (x) - .4 }, { property = "Y", ease = "O…` |
| `[10]` | table | `{ properties = { { property = "Animation", value = "SPIN" }, { property = "X", ease = "Out", value = (x) - .2 }, { property = "Y", ease = "O…` |
| `[11]` | table | `{ properties = { { property = "Animation", value = "SPIN" }, { property = "X", ease = "Out", value = (x) }, { property = "Y", ease = "Out", …` |
| `[12]` | table | `{ properties = { { property = "Animation", value = "END" }, { property = "X", ease = "Out", value = (x) }, { property = "Y", ease = "Out", v…` |

### `move_out` *(line 656)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = OFFMAP_X }, { property = "Y", value = OFFMAP_Y } }, duration = 0 }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezrushroads.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
