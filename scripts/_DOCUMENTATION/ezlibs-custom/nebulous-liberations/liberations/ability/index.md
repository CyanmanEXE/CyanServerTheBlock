# `ability.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/ability.lua`  
> **Source lines:** 196  
> **Functions detected:** 7  
> **Table declarations detected:** 13

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ability.lua

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 2
- `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_encounters` — line 5
- `scripts/ezlibs-scripts/helpers` — line 6
- `scripts/ezlibs-scripts/ezmemory` — line 7
- `scripts/ezlibs-custom/nebulous-liberations/liberations/constants` — line 8

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 10 | `static_shape_generator` | `offset_x, offset_y, shape` |
| 14 | `liberate_and_loot` | `instance, player_session, results, remove_traps, destroy_items` |
| 21 | `panel_search` | `instance, player_session, results, remove_traps, destroy_items` |
| 28 | `initiate_encounter` | `instance, player_session` |
| 75 | `battle_to_liberate_and_loot` | `instance, player_session, r, remove_traps, destroy_items` |
| 150 | `activate` | `instance, player_session` |
| 185 | `Ability.resolve_for_player` | `player` |

### Function notes

- **`static_shape_generator(offset_x, offset_y, shape)`** *(source line 10)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`liberate_and_loot(instance, player_session, results, remove_traps, destroy_items)`** *(source line 14)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`panel_search(instance, player_session, results, remove_traps, destroy_items)`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`initiate_encounter(instance, player_session)`** *(source line 28)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`battle_to_liberate_and_loot(instance, player_session, r, remove_traps, destroy_items)`** *(source line 75)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate(instance, player_session)`** *(source line 150)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Ability.resolve_for_player(player)`** *(source line 185)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `enemies` *(line 44)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `encounter_data` *(line 53)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `Ability` *(line 97)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Guard` | table | `{ name = "Guard" }` |
| `Shadowstep` | table | `{ name = "Shadowstep" }` |
| `LongSwrd` | table | `{ name = "LongSwrd", question = "Use LongSwrd?", cost = 1, remove_traps = false, destroy_items = false, generate_shape = static_shape_genera…` |
| `WideSwrd` | table | `{ name = "WideSwrd", question = "Use WideSwrd?", cost = 1, remove_traps = false, destroy_items = false, generate_shape = static_shape_genera…` |
| `GutsWave` | table | `{ name = "GutsWave", question = "Destroy with GutsWave?", cost = 1, remove_traps = false, destroy_items = true, generate_shape = static_shap…` |
| `ScrenDiv` | table | `{ name = "ScrenDiv", question = "Use ScrenDiv to liberate?", cost = 3, remove_traps = false, destroy_items = false, generate_shape = static_…` |
| `PanelSearch` | table | `{ name = "PanelSearch", question = "Search in this area?", cost = 1, remove_traps = true, destroy_items = false, generate_shape = static_sha…` |
| `NumberSearch` | table | `{ name = "NumberSearch", question = "Remove traps & get items?", cost = 1, remove_traps = true, destroy_items = false, generate_shape = stat…` |
| `HexSickle` | table | `{ name = "HexSickle", question = "Should I cut panels with HexSickle?", cost = 1, remove_traps = true, destroy_items = false, generate_shape…` |

### `Guard` *(line 99)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Guard"` |

### `Shadowstep` *(line 100)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Shadowstep"` |

### `LongSwrd` *(line 101)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"LongSwrd"` |
| `question` | string literal | `"Use LongSwrd?"` |
| `cost` | number literal | `1` |
| `remove_traps` | boolean literal | `false` |
| `destroy_items` | boolean literal | `false` |
| `generate_shape` | call/expression | `static_shape_generator(0` |
| `[7]` | number literal | `0` |
| `[8]` | table | `{ {1}, {1} })` |
| `activate` | expression/reference | `battle_to_liberate_and_loot` |

### `WideSwrd` *(line 110)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"WideSwrd"` |
| `question` | string literal | `"Use WideSwrd?"` |
| `cost` | number literal | `1` |
| `remove_traps` | boolean literal | `false` |
| `destroy_items` | boolean literal | `false` |
| `generate_shape` | call/expression | `static_shape_generator(0` |
| `[7]` | number literal | `0` |
| `[8]` | table | `{ {1, 1, 1} })` |
| `activate` | expression/reference | `battle_to_liberate_and_loot` |

### `GutsWave` *(line 119)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"GutsWave"` |
| `question` | string literal | `"Destroy with GutsWave?"` |
| `cost` | number literal | `1` |
| `remove_traps` | boolean literal | `false` |
| `destroy_items` | boolean literal | `true` |
| `generate_shape` | call/expression | `static_shape_generator(0` |
| `[7]` | number literal | `0` |
| `[8]` | table | `{ {1}, {1}, {1}, {1}, {1} })` |
| `activate` | expression/reference | `liberate_and_loot` |

### `ScrenDiv` *(line 128)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"ScrenDiv"` |
| `question` | string literal | `"Use ScrenDiv to liberate?"` |
| `cost` | number literal | `3` |
| `remove_traps` | boolean literal | `false` |
| `destroy_items` | boolean literal | `false` |
| `generate_shape` | call/expression | `static_shape_generator(0` |
| `[7]` | number literal | `0` |
| `[8]` | table | `{ {1,1,1,1,1}, {0,1,0,0,0}, {0,0,1,0,0}, {0,0,0,1,0}, {1,1,1,1,1}, })` |
| `activate` | expression/reference | `battle_to_liberate_and_loot` |

### `PanelSearch` *(line 143)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"PanelSearch"` |
| `question` | string literal | `"Search in this area?"` |
| `cost` | number literal | `1` |
| `remove_traps` | boolean literal | `true` |
| `destroy_items` | boolean literal | `false` |
| `generate_shape` | call/expression | `static_shape_generator(0` |
| `[7]` | number literal | `0` |
| `[8]` | table | `{ {1}, {1}, {1} })` |
| `activate` | function | `function(instance` |
| `[10]` | expression/reference | `player_session) end` |

### `NumberSearch` *(line 154)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"NumberSearch"` |
| `question` | string literal | `"Remove traps & get items?"` |
| `cost` | number literal | `1` |
| `remove_traps` | boolean literal | `true` |
| `destroy_items` | boolean literal | `false` |
| `generate_shape` | call/expression | `static_shape_generator(0` |
| `[7]` | number literal | `0` |
| `[8]` | table | `{ {1,1,1}, {1,1,1} })` |
| `activate` | expression/reference | `panel_search` |

### `HexSickle` *(line 163)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"HexSickle"` |
| `question` | string literal | `"Should I cut panels with HexSickle?"` |
| `cost` | number literal | `1` |
| `remove_traps` | boolean literal | `true` |
| `destroy_items` | boolean literal | `false` |
| `generate_shape` | call/expression | `static_shape_generator(0` |
| `[7]` | number literal | `1` |
| `[8]` | table | `{ {1, 1, 1} })` |
| `activate` | expression/reference | `battle_to_liberate_and_loot` |

### `navi_ability_map` *(line 173)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `[Constants.AbilityIDs.LongSwrd] = Ability.LongSwrd` |
| `[2]` | expression/reference | `[Constants.AbilityIDs.WideSwrd] = Ability.WideSwrd` |
| `[3]` | expression/reference | `[Constants.AbilityIDs.OldSaber] = Ability.ScrenDiv` |
| `[4]` | expression/reference | `[Constants.AbilityIDs.HevyShld] = Ability.Guard` |
| `[5]` | expression/reference | `[Constants.AbilityIDs.HexScyth] = Ability.HexSickle` |
| `[6]` | expression/reference | `[Constants.AbilityIDs.NumGadgt] = Ability.NumberSearch` |
| `[7]` | expression/reference | `[Constants.AbilityIDs.GutsHamr] = Ability.GutsWave` |
| `[8]` | expression/reference | `[Constants.AbilityIDs.ShdwShoe] = Ability.Shadowstep` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/ability.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
