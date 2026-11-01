# `ezfarms.lua`

> **Source:** `scripts/ezlibs-scripts/ezfarms.lua`  
> **Source lines:** 632  
> **Functions detected:** 27  
> **Table declarations detected:** 36

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Try getting the reference seed, if we cant then there is no map set up for ezfarms and we should cancel loading

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/ezconfig` — line 4
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 5
- `scripts/ezlibs-scripts/ezweather` — line 6
- `scripts/ezlibs-scripts/ezmemory` — line 7
- `table` — line 8
- `scripts/ezlibs-scripts/helpers` — line 9

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 105 | `calculate_plant_sell_price` | `plant_name` |
| 118 | `calculate_plant_gid` | `plant_name, growth_stage` |
| 136 | `determine_growth_stage` | `plant_name, elapsed_since_planted, elpased_since_water, death_time` |
| 157 | `update_tile` | `current_time, loc_string, area_weather` |
| 256 | `load_farm` | `(none)` |
| 271 | `update_all_tiles` | `(none)` |
| 290 | `ezfarms.handle_player_join` | `player_id` |
| 299 | `ezfarms.on_tick` | `delta_time` |
| 314 | `ezfarms.handle_post_selection` | `player_id, post_id` |
| 338 | `ezfarms.handle_board_close` | `player_id` |
| 342 | `try_buy_seed` | `player_id, plant_name` |
| 355 | `list_plants` | `player_id` |
| 373 | `action` | `npc, player_id, dialogue` |
| 389 | `ezfarms.list_player_tools` | `player_id` |
| 404 | `ezfarms.open_held_item_select` | `player_id` |
| 416 | `get_location_string` | `x, y, z` |
| 420 | `till_tile` | `tile, x, y, z, player_id` |
| 443 | `ezfarms.handle_object_interaction` | `player_id, object_id` |
| 468 | `water_tile` | `tile, tile_loc_string, player_id, safe_secret` |
| 488 | `plant` | `tile_loc_string, player_id, seed, current_time` |
| 505 | `deleet_plant` | `tile_loc_string, current_time` |
| 516 | `scythe_plant` | `tile_loc_string, current_time, prexisting_plant, player_id` |
| 527 | `harvest` | `tile_loc_string, player_id, safe_secret, current_time` |
| 538 | `describe_growth_state` | `growth_stage` |
| 542 | `try_harvest` | `tile_loc_string, prexisting_plant, player_id, safe_secret, current_time` |
| 559 | `try_plant_seed` | `tile, tile_loc_string, player_id, seed` |
| 573 | `ezfarms.handle_tile_interaction` | `player_id, x, y, z, button` |

### Function notes

- **`calculate_plant_sell_price(plant_name)`** *(source line 105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`calculate_plant_gid(plant_name, growth_stage)`** *(source line 118)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`determine_growth_stage(plant_name, elapsed_since_planted, elpased_since_water, death_time)`** *(source line 136)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_tile(current_time, loc_string, area_weather)`** *(source line 157)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_farm()`** *(source line 256)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_all_tiles()`** *(source line 271)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezfarms.handle_player_join(player_id)`** *(source line 290)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezfarms.on_tick(delta_time)`** *(source line 299)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezfarms.handle_post_selection(player_id, post_id)`** *(source line 314)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezfarms.handle_board_close(player_id)`** *(source line 338)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_buy_seed(player_id, plant_name)`** *(source line 342)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_plants(player_id)`** *(source line 355)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue)`** *(source line 373)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezfarms.list_player_tools(player_id)`** *(source line 389)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezfarms.open_held_item_select(player_id)`** *(source line 404)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_location_string(x, y, z)`** *(source line 416)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`till_tile(tile, x, y, z, player_id)`** *(source line 420)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezfarms.handle_object_interaction(player_id, object_id)`** *(source line 443)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`water_tile(tile, tile_loc_string, player_id, safe_secret)`** *(source line 468)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`plant(tile_loc_string, player_id, seed, current_time)`** *(source line 488)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`deleet_plant(tile_loc_string, current_time)`** *(source line 505)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`scythe_plant(tile_loc_string, current_time, prexisting_plant, player_id)`** *(source line 516)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`harvest(tile_loc_string, player_id, safe_secret, current_time)`** *(source line 527)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`describe_growth_state(growth_stage)`** *(source line 538)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_harvest(tile_loc_string, prexisting_plant, player_id, safe_secret, current_time)`** *(source line 542)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_plant_seed(tile, tile_loc_string, player_id, seed)`** *(source line 559)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezfarms.handle_tile_interaction(player_id, x, y, z, button)`** *(source line 573)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezfarms` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `players_using_bbs` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_tools` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `plant_ram` *(line 25)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PlantData` *(line 27)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Parsnip` | table | `{ price = 300, growth_time_multi = 0.4, local_gid = 0, harvest = { 1, 2 } }` |
| `Cauli` | table | `{ price = 1200, growth_time_multi = 1.2, local_gid = 7, harvest = { 1, 1 } }` |
| `Garlic` | table | `{ price = 600, growth_time_multi = 0.4, local_gid = 14, harvest = { 2, 3 } }` |
| `Tomato` | table | `{ price = 350, growth_time_multi = 1.1, local_gid = 21, harvest = { 1, 3 } }` |
| `Chili` | table | `{ price = 600, growth_time_multi = 0.5, local_gid = 28, harvest = { 1, 1 } }` |
| `Radish` | table | `{ price = 550, growth_time_multi = 0.6, local_gid = 35, harvest = { 1, 1 } }` |
| `[Star]` | table | `{ price = 1800, growth_time_multi = 1.3, local_gid = 42, harvest = { 1, 2 } }` |
| `Eggplant` | table | `{ price = 320, growth_time_multi = 0.5, local_gid = 49, harvest = { 2, 3 } }` |
| `Pumpkin` | table | `{ price = 1200, growth_time_multi = 1.3, local_gid = 56, harvest = { 1, 1 } }` |
| `Yam` | table | `{ price = 900, growth_time_multi = 1, local_gid = 63, harvest = { 2, 4 } }` |
| `Beetroot` | table | `{ price = 400, growth_time_multi = 1.8, local_gid = 70, harvest = { 1, 1 } }` |
| `[Ancient]` | table | `{ price = 2800, growth_time_multi = 2.8, local_gid = 77, harvest = { 1, 1 } }` |
| `[Sweet]` | table | `{ price = 3000, growth_time_multi = 2.4, local_gid = 84, harvest = { 1, 2 } }` |
| `Blueberry` | table | `{ price = 800, growth_time_multi = 1.5, local_gid = 91, harvest = { 2, 6 } }` |
| `Dead` | table | `{ local_gid = 98 }` |

### `Parsnip` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `300` |
| `growth_time_multi` | number literal | `0.4` |
| `local_gid` | number literal | `0` |
| `harvest` | table | `{ 1, 2 }` |

### `Cauli` *(line 30)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `1200` |
| `growth_time_multi` | number literal | `1.2` |
| `local_gid` | number literal | `7` |
| `harvest` | table | `{ 1, 1 }` |

### `Garlic` *(line 31)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `600` |
| `growth_time_multi` | number literal | `0.4` |
| `local_gid` | number literal | `14` |
| `harvest` | table | `{ 2, 3 }` |

### `Tomato` *(line 32)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `350` |
| `growth_time_multi` | number literal | `1.1` |
| `local_gid` | number literal | `21` |
| `harvest` | table | `{ 1, 3 }` |

### `Chili` *(line 33)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `600` |
| `growth_time_multi` | number literal | `0.5` |
| `local_gid` | number literal | `28` |
| `harvest` | table | `{ 1, 1 }` |

### `Radish` *(line 34)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `550` |
| `growth_time_multi` | number literal | `0.6` |
| `local_gid` | number literal | `35` |
| `harvest` | table | `{ 1, 1 }` |

### `Eggplant` *(line 36)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `320` |
| `growth_time_multi` | number literal | `0.5` |
| `local_gid` | number literal | `49` |
| `harvest` | table | `{ 2, 3 }` |

### `Pumpkin` *(line 37)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `1200` |
| `growth_time_multi` | number literal | `1.3` |
| `local_gid` | number literal | `56` |
| `harvest` | table | `{ 1, 1 }` |

### `Yam` *(line 38)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `900` |
| `growth_time_multi` | number literal | `1` |
| `local_gid` | number literal | `63` |
| `harvest` | table | `{ 2, 4 }` |

### `Beetroot` *(line 39)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `400` |
| `growth_time_multi` | number literal | `1.8` |
| `local_gid` | number literal | `70` |
| `harvest` | table | `{ 1, 1 }` |

### `Blueberry` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `price` | number literal | `800` |
| `growth_time_multi` | number literal | `1.5` |
| `local_gid` | number literal | `91` |
| `harvest` | table | `{ 2, 6 }` |

### `Dead` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `local_gid` | number literal | `98` |

### `ToolNames` *(line 47)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `CyberHoe` | string literal | `"CyberHoe"` |
| `CyberWtrCan` | string literal | `"CyberWtrCan"` |
| `CyberScythe` | string literal | `"CyberScythe"` |
| `GigFreez` | string literal | `"GigFreez"` |

### `growth_stage_descriptions` *(line 57)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[0]` | string literal | `"like it was just planted"` |
| `[1]` | string literal | `"to be growing steadily"` |
| `[2]` | string literal | `"to be healthy"` |
| `[3]` | string literal | `"almost ripe for picking!"` |
| `[4]` | string literal | `"ready for harvest!"` |
| `[5]` | string literal | `"very sad..."` |

### `Tiles` *(line 66)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Dirt` | number literal | `85` |
| `Grass` | number literal | `86` |
| `DirtWet` | number literal | `87` |

### `sfx` *(line 72)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `item_get` | string literal | `'/server/assets/ezlibs-assets/sfx/item_get.ogg'` |
| `card_error` | string literal | `'/server/assets/ezlibs-assets/ezfarms/card_error.ogg'` |
| `hoe` | string literal | `'/server/assets/ezlibs-assets/ezfarms/hoe.ogg'` |
| `rain` | string literal | `'/server/assets/ezlibs-assets/ezfarms/rain.ogg'` |
| `scythe` | string literal | `'/server/assets/ezlibs-assets/ezfarms/scythe.ogg'` |
| `swap_tool` | string literal | `'/server/assets/ezlibs-assets/ezfarms/swap_tool.ogg'` |
| `water_tile` | string literal | `'/server/assets/ezlibs-assets/ezfarms/water_tile.ogg'` |
| `wind` | string literal | `'/server/assets/ezlibs-assets/ezfarms/wind.ogg'` |

### `Period` *(line 86)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Minute` | number literal | `60` |
| `Hour` | number literal | `60 * 60` |

### `plant_tile_data` *(line 178)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"tile"` |
| `gid` | expression/reference | `plant_gid` |
| `flipped_horizontally` | boolean literal | `false` |
| `flipped_vertically` | boolean literal | `false` |

### `new_plant_data` *(line 184)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | expression/reference | `tile_memory.plant` |
| `visible` | boolean literal | `true` |
| `x` | expression/reference | `tile_memory.x + 0.6` |
| `y` | expression/reference | `tile_memory.y + 0.6` |
| `z` | expression/reference | `tile_memory.z` |
| `width` | number literal | `1` |
| `height` | number literal | `2` |
| `data` | expression/reference | `plant_tile_data` |

### `plant_tile_data` *(line 206)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"tile"` |
| `gid` | expression/reference | `plant_gid` |
| `flipped_horizontally` | boolean literal | `false` |
| `flipped_vertically` | boolean literal | `false` |

### `area_memory.tile_states` *(line 261)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `plant_counts` *(line 358)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `veggie_stall` *(line 370)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"veggie_stall"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | call/expression | `dialogue) return async(function() local board_color = { r = 128, g = 255, b = 128 } local posts = {} local player_plants = list_plants(playe…` |
| `[5]` | call/expression | `sell_price in pairs(player_plants) do posts[#posts + 1] = { id = plant_name, read = true, title = plant_name, author = tostring(sell_price) …` |
| `[6]` | expression/reference | `bbs_name` |
| `[7]` | expression/reference | `board_color` |
| `[8]` | expression/reference | `posts) end) end` |

### `board_color` *(line 375)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `128` |
| `g` | number literal | `255` |
| `b` | number literal | `128` |

### `posts` *(line 376)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `tool_counts` *(line 392)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `board_color` *(line 406)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `165` |
| `g` | number literal | `42` |
| `b` | number literal | `42` |

### `posts` *(line 407)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `time` *(line 430)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `tilled` | expression/reference | `current_time` |
| `watered` | number literal | `0` |
| `planted` | number literal | `0` |
| `death` | number literal | `0` |

### `player_memory.farming` *(line 456)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `water` | number literal | `50` |

### `player_memory.farming` *(line 473)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `water` | number literal | `0` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezfarms.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
