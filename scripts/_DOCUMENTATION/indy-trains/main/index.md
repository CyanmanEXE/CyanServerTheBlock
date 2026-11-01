# `main.lua`

> **Source:** `scripts/indy-trains/main.lua`  
> **Source lines:** 1252  
> **Functions detected:** 13  
> **Table declarations detected:** 56

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

VERSION v1.10

## Dependencies

- No `require(...)` dependency was detected.

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 1153. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 1161. The event name is taken directly from this source.
- `Net:on("post_selection", function(event) ...)` — line 1172. The event name is taken directly from this source.
- `Net:on("player_area_transfer", function(event) ...)` — line 1180. The event name is taken directly from this source.
- `Net:on("player_join", function(event) ...)` — line 1192. The event name is taken directly from this source.
- `Net:on("player_request", function(event) ...)` — line 1204. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 1236. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 51 | `splitter` | `inputstr, sep` |
| 65 | `async` | `p` |
| 71 | `await` | `v` |
| 77 | `summon_arriving_passenger_train` | `player_id` |
| 294 | `summon_departing_passenger_train` | `player_id,post_id` |
| 602 | `validate_passenger_train` | `area_id,train_name` |
| 718 | `greet_conductor` | `bot_id,player_id` |
| 822 | `populate_server_list` | `(none)` |
| 876 | `check_servers` | `(none)` |
| 891 | `spawn_conductor` | `area_id, object_data` |
| 941 | `validate_cargo_train` | `area_id,train_name` |
| 1046 | `run_cargo_train` | `area_id,train_name` |
| 1108 | `find_trains` | `(none)` |

### Function notes

- **`splitter(inputstr, sep)`** — purpose: splits a string based on a delimiter usaged: used at various points to seperate values *(source line 51)*
- **`async(p)`** — Shorthand for async *(source line 65)*
- **`await(v)`** — Shorthand for await *(source line 71)*
- **`summon_arriving_passenger_train(player_id)`** — usage: called when a player selects an option from a train menu purpose: to spawn a train, pickup player, and depart (if track is not already occupied) *(source line 77)*
- **`summon_departing_passenger_train(player_id,post_id)`** *(source line 294)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`validate_passenger_train(area_id,train_name)`** — purpose: validates passenger train configuration, checks provided properties, and assigns necessary properties. usage: called on server boot for each passenger train object *(source line 602)*
- **`greet_conductor(bot_id,player_id)`** — purpose: populates and opens train route selection menu usage: called when player interacts with conductor *(source line 718)*
- **`populate_server_list()`** *(source line 822)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`check_servers()`** *(source line 876)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`spawn_conductor(area_id, object_data)`** — purpose: validates conductor configuration, checks provided properties, assigns necessary properties, and spawns bot. usage: called on server boot for each conductor object *(source line 891)*
- **`validate_cargo_train(area_id,train_name)`** — purpose: validates cargo train configuraton, checks properties, assigns necessary properties, and spawns bots. usage: called on server boot for each cargo train object *(source line 941)*
- **`run_cargo_train(area_id,train_name)`** — animate a given cargo train for one loop usage: called within the Net.on("tick") function whenever a given cargo train's animation ends *(source line 1046)*
- **`find_trains()`** — Find all trains in all areas, removes placeholders, and triggers them to start usage: runs on server boot to find all train and conductor objects and handle setup *(source line 1108)*

## Tables and data structures

### `passenger_train_required_properties` *(line 22)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Start"` |
| `[2]` | string literal | `"End"` |
| `[3]` | string literal | `"Direction"` |
| `[4]` | string literal | `"Stop"` |
| `[5]` | string literal | `"Platform Z"` |
| `[6]` | string literal | `"Train Z"` |

### `passenger_train_optional_properties` *(line 23)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Speed"` |
| `[2]` | string literal | `"Color"` |

### `cargo_train_required_properties` *(line 25)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Start"` |
| `[2]` | string literal | `"End"` |
| `[3]` | string literal | `"Direction"` |
| `[4]` | string literal | `"Train Z"` |

### `cargo_train_optional_properties` *(line 26)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Speed"` |
| `[2]` | string literal | `"Cars"` |
| `[3]` | string literal | `"Color"` |
| `[4]` | string literal | `"Driver Texture"` |
| `[5]` | string literal | `"Driver Animation"` |

### `conductor_required_properties` *(line 28)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Train"` |
| `[2]` | string literal | `"1 Area"` |

### `conductor_optional_properties` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"1 Type"` |
| `[2]` | string literal | `"1 Name"` |
| `[3]` | string literal | `"Animation"` |
| `[4]` | string literal | `"Texture"` |
| `[5]` | string literal | `"Mug"` |
| `[6]` | string literal | `"Mug Animation"` |
| `[7]` | string literal | `"Direction"` |

### `servers` *(line 39)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `train_cache` *(line 41)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `conductor_cache` *(line 42)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `cargo_schedule` *(line 43)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `passenger_cache` *(line 44)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `track_cache` *(line 45)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_using_train_menu` *(line 46)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `t` *(line 57)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keyframes` *(line 176)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=(trainProps["startX"]+1.5-.5+trainProps["offset"…` |

### `keyframes` *(line 181)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=(trainProps["startX"]+2.15+trainProps["offset"])…` |

### `keyframes` *(line 185)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=(trainProps["startX"]+1.4+trainProps["offset"])}…` |

### `keyframes` *(line 190)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=(trainProps["startX"]+1.3+trainProps["offset"])}…` |

### `keyframes` *(line 197)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=trainProps["startX"]+.5+driver_offset_x},{proper…` |

### `keyframes` *(line 200)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=trainProps["startX"]+.5+car_offset_x},{property=…` |

### `keyframes` *(line 203)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=trainProps["startX"]+.5+train_offset_x},{propert…` |

### `keyframes` *(line 208)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="X",ease="Out",value=trainProps["startX"]+.5+pedestal_offset_x},{property="Y",ease="Out",value=trainProps["startY"]+.…` |

### `keyframes` *(line 218)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",value=trainProps["stopX"]+.5+light_offset_x},{property="Y",value=…` |

### `keyframes` *(line 228)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="WALK_DL"},{property="X",ease="Linear",value=(trainProps["stopX"]+1+trainProps["offset"])},{propert…` |

### `keyframes` *(line 233)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="WALK_DL"},{property="X",ease="Linear",value=(trainProps["stopX"]+2.15+trainProps["offset"])},{prop…` |

### `keyframes` *(line 238)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="WALK_DR"},{property="X",ease="Linear",value=(trainProps["stopX"]+1.4+trainProps["offset"])},{prope…` |

### `keyframes` *(line 243)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="WALK_DR"},{property="X",ease="Linear",value=(trainProps["stopX"]+1.3+trainProps["offset"])},{prope…` |

### `keyframes` *(line 257)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=trainProps["stopX"]+.5+driver_offset_x},{property…` |

### `keyframes` *(line 262)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=trainProps["stopX"]+.5+car_offset_x},{property="Y…` |

### `keyframes` *(line 267)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=trainProps["stopX"]+.5+train_offset_x},{property=…` |

### `keyframes` *(line 274)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=trainProps["stopX"]+.5+pedestal_offset_x},{proper…` |

### `keyframes` *(line 429)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=trainProps["startX"]+.5+driver_offset_x},{proper…` |

### `keyframes` *(line 432)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=trainProps["startX"]+.5+car_offset_x},{property=…` |

### `keyframes` *(line 435)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Out",value=trainProps["startX"]+.5+train_offset_x},{propert…` |

### `keyframes` *(line 441)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="X",ease="Out",value=trainProps["startX"]+.5+pedestal_offset_x},{property="Y",ease="Out",value=trainProps["startY"]+.…` |

### `keyframes` *(line 451)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",value=trainProps["stopX"]+.5+light_offset_x},{property="Y",value=…` |

### `keyframes` *(line 465)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="WALK_UR"},{property="X",ease="Linear",value=player_position.x},{property="Z",ease="Linear",value=p…` |

### `keyframes` *(line 474)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=(trainProps["stopX"]+1.5-.5+trainProps["offset"])…` |

### `keyframes` *(line 480)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="WALK_UR"},{property="X",ease="Linear",value=player_position.x},{property="Z",ease="Linear",value=p…` |

### `keyframes` *(line 488)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=(trainProps["stopX"]+2.15+trainProps["offset"])},…` |

### `keyframes` *(line 494)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="WALK_UL"},{property="X",ease="Linear",value=player_position.x},{property="Z",ease="Linear",value=p…` |

### `keyframes` *(line 502)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=(trainProps["stopX"]+1.4+trainProps["offset"])},{…` |

### `keyframes` *(line 507)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="WALK_UL"},{property="X",ease="Linear",value=player_position.x},{property="Z",ease="Linear",value=p…` |

### `keyframes` *(line 515)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=(trainProps["stopX"]+1.3+trainProps["offset"])},{…` |

### `keyframes` *(line 521)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=trainProps["stopX"]+.5+driver_offset_x},{property…` |

### `keyframes` *(line 524)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=trainProps["stopX"]+.5+car_offset_x},{property="Y…` |

### `keyframes` *(line 527)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=trainProps["stopX"]+.5+train_offset_x},{property=…` |

### `keyframes` *(line 531)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="In",value=trainProps["stopX"]+.5+pedestal_offset_x},{proper…` |

### `board_color` *(line 739)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `120` |
| `g` | number literal | `196` |
| `b` | number literal | `159` |

### `posts` *(line 740)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `servers2` *(line 855)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `hash` *(line 856)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `servers` *(line 863)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keyframes` *(line 1088)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Linear",value=trainProps["startX"]+.5+driver_offset_x},{pro…` |

### `keyframes` *(line 1092)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Linear",value=trainProps["startX"]+.5+car_offset_x},{proper…` |

### `keyframes` *(line 1096)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{properties={{property="Animation",value="IDLE_"..direction},{property="X",ease="Linear",value=trainProps["startX"]+.5+train_offset_x},{prop…` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/indy-trains/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
