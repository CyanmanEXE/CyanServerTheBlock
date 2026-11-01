# `eznpcs_events.lua`

> **Source:** `scripts/events/eznpcs_events.lua`  
> **Source lines:** 347  
> **Functions detected:** 13  
> **Table declarations detected:** 18

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

backwards compatibility with older builds

## Dependencies

- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 1
- `scripts/ezlibs-scripts/ezmemory` — line 2
- `scripts/ezlibs-scripts/ezmystery` — line 3
- `scripts/ezlibs-scripts/ezweather` — line 4
- `scripts/ezlibs-scripts/ezwarps/main` — line 5
- `scripts/ezlibs-scripts/ezencounters/main` — line 6
- `scripts/ezlibs-scripts/helpers` — line 7
- `scripts/ezlibs-custom/nebulous-liberations/main` — line 8

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 20 | `_encounter_result_flags` | `stats` |
| 92 | `action` | `npc,player_id,dialogue,relay_object` |
| 109 | `action` | `npc,player_id,dialogue,relay_object` |
| 122 | `action` | `npc,player_id,dialogue,relay_object` |
| 148 | `action` | `npc, player_id, dialogue, relay_object` |
| 157 | `action` | `npc, player_id, dialogue, relay_object` |
| 172 | `action` | `npc, player_id, dialogue, relay_object` |
| 196 | `action` | `npc, player_id, dialogue, relay_object` |
| 272 | `action` | `npc, player_id, dialogue` |
| 288 | `action` | `npc, player_id, dialogue` |
| 301 | `action` | `npc, player_id, dialogue, relay_object` |
| 313 | `action` | `npc, player_id, dialogue, relay_object` |
| 326 | `action` | `npc, player_id, dialogue, relay_object` |

### Function notes

- **`_encounter_result_flags(stats)`** *(source line 20)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc,player_id,dialogue,relay_object)`** *(source line 92)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc,player_id,dialogue,relay_object)`** *(source line 109)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc,player_id,dialogue,relay_object)`** *(source line 122)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 148)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 157)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 172)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 196)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue)`** *(source line 272)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue)`** *(source line 288)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 301)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 313)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 326)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `sfx` *(line 9)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `hurt` | string literal | `'/server/assets/ezlibs-assets/sfx/hurt.ogg'` |
| `item_get` | string literal | `'/server/assets/ezlibs-assets/sfx/item_get.ogg'` |
| `recover` | string literal | `'/server/assets/ezlibs-assets/sfx/recover.ogg'` |
| `card_error` | string literal | `'/server/assets/ezlibs-assets/ezfarms/card_error.ogg'` |

### `boss2` *(line 54)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"boss2"` |
| `path` | string literal | `"/server/assets/ezlibs-assets/ezencounters/ezencounters.zip"` |
| `pet_exp` | number literal | `0` |
| `enemies` | table | `{ {name="HeelNavi",rank=1}, }` |
| `obstacles` | table | `{ }` |
| `positions` | table | `{ {0,0,0,0,0,0}, {0,0,0,0,1,0}, {0,0,0,0,0,0}, }` |
| `obstacle_positions` | table | `{ {0,0,0,0,0,0}, {0,0,0,0,0,0}, {0,0,0,0,0,0}, }` |
| `player_positions` | table | `{ {0,0,0,0,0,0}, {0,1,0,0,0,0}, {0,0,0,0,0,0}, }` |
| `tiles` | table | `{ {1,1,1,1,1,1}, {1,1,1,1,1,1}, {1,1,1,1,1,1}, }` |
| `teams` | table | `{ {2,2,2,1,1,1}, {2,2,2,1,1,1}, {2,2,2,1,1,1}, }` |

### `enemies` *(line 58)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{name="HeelNavi",rank=1}` |

### `obstacles` *(line 61)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `positions` *(line 63)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{0,0,0,0,0,0}` |
| `[2]` | table | `{0,0,0,0,1,0}` |
| `[3]` | table | `{0,0,0,0,0,0}` |

### `obstacle_positions` *(line 68)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{0,0,0,0,0,0}` |
| `[2]` | table | `{0,0,0,0,0,0}` |
| `[3]` | table | `{0,0,0,0,0,0}` |

### `player_positions` *(line 73)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{0,0,0,0,0,0}` |
| `[2]` | table | `{0,1,0,0,0,0}` |
| `[3]` | table | `{0,0,0,0,0,0}` |

### `tiles` *(line 78)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1,1,1,1,1,1}` |
| `[2]` | table | `{1,1,1,1,1,1}` |
| `[3]` | table | `{1,1,1,1,1,1}` |

### `teams` *(line 83)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{2,2,2,1,1,1}` |
| `[2]` | table | `{2,2,2,1,1,1}` |
| `[3]` | table | `{2,2,2,1,1,1}` |

### `event1` *(line 89)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Heel1"` |
| `action` | function | `function (npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() local stats = await(ezencounters.begin_encounter(player_id` |
| `[6]` | call/expression | `boss2)) local flags = _encounter_result_flags(stats) if flags.ran or flags.lost then return dialogue.custom_properties["Battle Lost"] else r…` |

### `event2` *(line 118)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Clown1"` |
| `action` | function | `function (npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() Net.initiate_encounter(player_id` |
| `[6]` | string literal | `"/server/assets/bosses/com_louise_CircusMan.zip") return dialogue.custom_properties["Next 1"] end) end` |

### `liberation_item_list` *(line 129)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{n="HeroSwrd",d="A Hero Sword Chip. Use it in Liberations!"}` |
| `[2]` | table | `{n="WideSwrd",d="A Wide Sword Chip. Use it in Liberations!"}` |
| `[3]` | table | `{n="OldSaber",d="A Saber projection hilt, scarred with age. Use it in Liberations!"}` |
| `[4]` | table | `{n="Guard",d="A Guards you and your teammates!"}` |
| `[5]` | table | `{n="HexSickle",d="A wicked scythe which cleaves most anything. Use it in Liberations!"}` |
| `[6]` | table | `{n="NumGadgt",d="A gadget that's constantly calculating outcomes. Use it in Liberations!"}` |
| `[7]` | table | `{n="GutsHamr",d="A hammer that takes guts to wield. Use it in Liberations!"}` |
| `[8]` | table | `{n="ShdwShoe",d="Delicate shoes that let you walk on air. Wear them in Liberations!"}` |
| `[9]` | table | `{n="CrosBmb",d="A hefty bomb to blow up panels in a plus shape. use it in Liberations!"}` |
| `[10]` | table | `{n="Burner",d="A powerful fire blast to burn up what stands in your way. use it in Liberations!"}` |
| `[11]` | table | `{n="Blaster",d="A well rounded buster that fires in a T shape. use it in Liberations!"}` |
| `[12]` | table | `{n="Bazooka",d="A destructive and powerful weapon. use it in Liberations!"}` |

### `RematchProgEvent` *(line 145)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Refight Liberation"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() return LibPlugin.start_game_for_player(player_id` |
| `[6]` | expression/reference | `dialogue.custom_properties["Liberation Map"]) end) end` |

### `GrantLiberationAbility` *(line 154)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Grant Liberation Mission Ability"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() for i = 1` |
| `[6]` | expression/reference | `#liberation_item_list` |
| `[7]` | number literal | `1 do ezmemory.create_or_update_item(liberation_item_list[i].n` |
| `[8]` | expression/reference | `liberation_item_list[i].d` |
| `[9]` | call/expression | `true) local item_count = ezmemory.count_player_item(player_id` |
| `[10]` | call/expression | `liberation_item_list[i].n) if item_count &gt; 0 then ezmemory.remove_player_item(player_id` |
| `[11]` | expression/reference | `liberation_item_list[i].n` |
| `[12]` | call/expression | `item_count) end end if dialogue.custom_properties["Ability Item"] ~= nil then ezmemory.give_player_item(player_id` |
| `[13]` | expression/reference | `dialogue.custom_properties["Ability Item"]` |
| `[14]` | number literal | `1) end end) end` |

### `Steal_Money` *(line 269)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Steal Money"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | call/expression | `dialogue) return async(function() if ezmemory.spend_player_money(player_id` |
| `[5]` | number literal | `999) then await(Async.message_player(player_id` |
| `[6]` | string literal | `"Your money was taken!")) print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA") return dialogue.custom_properties["Next 1"] else return di…` |

### `gift_zenny` *(line 285)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Gift Monies"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | call/expression | `dialogue) return async(function() local zenny_amount = tonumber(dialogue.custom_properties["Amount"]) ezmemory.spend_player_money(player_id` |
| `[5]` | call/expression | `-zenny_amount) Net.play_sound_for_player(player_id` |
| `[6]` | call/expression | `sfx.item_get) await(Async.message_player(player_id` |
| `[7]` | string literal | `"Got " .. zenny_amount .. "$!")) return dialogue.custom_properties["Next 1"] end) end` |

### `event_snow` *(line 299)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Snow"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() local area_id = Net.get_player_area(player_id) ezweather.start_snow_in_area(area_id) return dialogue.c…` |

### `event1` *(line 310)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Punch"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() local player_mugshot = Net.get_player_mugshot(player_id) local next_dialogues = helpers.extract_number…` |
| `[6]` | string literal | `"Next ") Net.play_sound_for_player(player_id` |
| `[7]` | call/expression | `sfx.hurt) await(Async.message_player(player_id` |
| `[8]` | string literal | `"Bruh!"` |
| `[9]` | expression/reference | `player_mugshot.texture_path` |
| `[10]` | call/expression | `player_mugshot.animation_path)) return first_value_from_table(next_dialogues) end) end` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/events/eznpcs_events.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
