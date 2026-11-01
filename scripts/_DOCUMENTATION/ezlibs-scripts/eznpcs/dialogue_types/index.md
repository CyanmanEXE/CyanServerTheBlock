# `dialogue_types.lua`

> **Source:** `scripts/ezlibs-scripts/eznpcs/dialogue_types.lua`  
> **Source lines:** 651  
> **Functions detected:** 22  
> **Table declarations detected:** 21

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Canonical boolean normalizer. Identical contract to the old local is_property_true; centralized in tiled_utils so eznpcs, eznpcs/dialogue_types, ezpushback, and FootBomb all agree on how Tiled properties are read.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/helpers` — line 2
- `scripts/ezlibs-scripts/ezmemory` — line 3
- `scripts/ezlibs-scripts/ezquests` — line 4
- `scripts/ezlibs-scripts/ezemail` — line 5
- `scripts/ezlibs-scripts/condition` — line 6
- `scripts/ezlibs-scripts/ezbus` — line 7
- `scripts/ezlibs-scripts/ezencounters/main` — line 8
- `scripts/ezlibs-scripts/ezexplosions` — line 9
- `scripts/ezlibs-scripts/utils/eztiledutils` — line 10

## Events

- `Net:on("tick", function(event) ...)` — line 32. The event name is taken directly from this source.
- `Net:on("battle_results", function(event) ...)` — line 48. The event name is taken directly from this source.
- `Net:on("battle_results", function(event) ...)` — line 638. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 39 | `now` | `(none)` |
| 70 | `player_won_from_stats` | `stats` |
| 103 | `merge_result_fields` | `stats, exit_results` |
| 116 | `action` | `npc, player_id, dialogue, relay_object` |
| 129 | `action` | `npc, player_id, dialogue, relay_object` |
| 142 | `action` | `npc, player_id, dialogue, relay_object` |
| 155 | `action` | `npc, player_id, dialogue, relay_object` |
| 169 | `action` | `npc, player_id, dialogue, relay_object` |
| 200 | `action` | `npc, player_id, dialogue, relay_object` |
| 219 | `action` | `npc, player_id, dialogue, relay_object` |
| 237 | `action` | `npc, player_id, dialogue, relay_object` |
| 255 | `action` | `npc, player_id, dialogue, relay_object` |
| 284 | `action` | `npc, player_id, dialogue, relay_object` |
| 298 | `action` | `npc, player_id, dialogue, relay_object` |
| 312 | `action` | `npc, player_id, dialogue, relay_object` |
| 329 | `action` | `npc, player_id, dialogue, relay_object` |
| 343 | `action` | `npc, player_id, dialogue, relay_object` |
| 350 | `has_asset` | `path` |
| 359 | `ensure_ext` | `p, ext` |
| 365 | `resolve_texture` | `raw` |
| 375 | `resolve_anim` | `raw` |
| 459 | `action` | `npc, player_id, dialogue, relay_object` |

### Function notes

- **`now()`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`player_won_from_stats(stats)`** — ========================================================================== Battle result classification  Mirrors net-game-tourney/tournament-flow.lua (stats_says_player_won_encounter). That module is the authoritative consumer of Net:on("battle_results") in this codebase, so its rules are reproduced here verbatim so battle_npc and tournaments agree on win/loss semantics.  Fields available on the battle_results payload:  reason      1  → player won (definitive; health is ignored) 2  → player lost 3  → player lost 4  → player lost 0 / nil → unknown; fall back to health + enemies ran         true → player fled; treated as loss fled        alias for ran in some code paths escape      alias for ran in some code paths health      Player's post-battle HP (aliased player_hp / hp) enemies     Array of { health = N, ... }; any > 0 means an enemy survived → loss time        Battle duration, informational only emotion     Battle end emotion, informational only turns       Turn count, informational only score       Battle score, informational only ========================================================================== *(source line 70)*
- **`merge_result_fields(stats, exit_results)`** *(source line 103)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 116)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 129)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 142)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 155)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 169)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 200)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 219)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 237)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 255)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 284)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 298)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 312)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 329)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 343)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`has_asset(path)`** *(source line 350)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_ext(p, ext)`** *(source line 359)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_texture(raw)`** *(source line 365)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_anim(raw)`** *(source line 375)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 459)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `RESULT_FIELDS` *(line 98)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"reason"` |
| `[2]` | string literal | `"health"` |
| `[3]` | string literal | `"player_hp"` |
| `[4]` | string literal | `"hp"` |
| `[5]` | string literal | `"ran"` |
| `[6]` | string literal | `"fled"` |
| `[7]` | string literal | `"escape"` |
| `[8]` | string literal | `"enemies"` |

### `dialogue_types` *(line 113)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `first` | table | `{ name = "first", action = function(npc, player_id, dialogue, relay_object) return async(function() local dialogue_texts = helpers.extract_n…` |
| `question` | table | `{ name = "question", action = function(npc, player_id, dialogue, relay_object) return async(function () local dialogue_texts = helpers.extra…` |
| `quiz` | table | `{ name = "quiz", action = function(npc, player_id, dialogue, relay_object) return async(function () local dialogue_texts = helpers.extract_n…` |
| `random` | table | `{ name = "random", action = function(npc, player_id, dialogue, relay_object) return async(function () local dialogue_texts = helpers.extract…` |
| `itemcheck` | table | `{ name = 'itemcheck', action = function(npc, player_id, dialogue, relay_object) return async(function () local area_id = Net.get_player_area…` |
| `questcheck` | table | `{ name = "questcheck", action = function(npc, player_id, dialogue, relay_object) return async(function () local next_dialogues = helpers.ext…` |
| `before` | table | `{ name = "before", action = function(npc, player_id, dialogue, relay_object) return async(function () local dialogue_texts = helpers.extract…` |
| `after` | table | `{ name = "after", action = function(npc, player_id, dialogue, relay_object) return async(function () local dialogue_texts = helpers.extract_…` |
| `shop` | table | `{ name = "shop", action = function(npc, player_id, dialogue, relay_object) return async(function () local area_id = Net.get_player_area(play…` |
| `password` | table | `{ name = "password", action = function(npc, player_id, dialogue, relay_object) return async(function () local correct_password = dialogue.cu…` |
| `quest_switch` | table | `{ name = "quest_switch", action = function(npc, player_id, dialogue, relay_object) return async(function () local quest_name = dialogue.cust…` |
| `quest_event` | table | `{ name = "quest_event", action = function(npc, player_id, dialogue, relay_object) return async(function () local quest_name = dialogue.custo…` |
| `item` | table | `{ name = "item", action = function(npc, player_id, dialogue, relay_object) return async(function () local area_id = Net.get_player_area(play…` |
| `email` | table | `{ name = "email", action = function(npc, player_id, dialogue, relay_object) return async(function() local next_dialogues = helpers.extract_n…` |
| `battle_npc` | table | `{ name = "battle_npc", action = function(npc, player_id, dialogue, relay_object) return async(function() local area_id = Net.get_player_area…` |

### `first` *(line 114)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"first"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() local dialogue_texts = helpers.extract_numbered_properties(dialogue` |
| `[6]` | string literal | `"Text ") local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[7]` | string literal | `"Next ") local mugshot = eznpcs.get_dialogue_mugshot(npc` |
| `[8]` | expression/reference | `player_id` |
| `[9]` | call/expression | `dialogue) local res = await(Async.message_player(player_id` |
| `[10]` | expression/reference | `dialogue_texts[1]` |
| `[11]` | expression/reference | `mugshot.texture_path` |
| `[12]` | call/expression | `mugshot.animation_path)) local next_id = first_value_from_table(next_dialogues) return next_id end) end` |

### `question` *(line 127)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"question"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local dialogue_texts = helpers.extract_numbered_properties(dialogue` |
| `[6]` | string literal | `"Text ") local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[7]` | string literal | `"Next ") local mugshot = eznpcs.get_dialogue_mugshot(npc` |
| `[8]` | expression/reference | `player_id` |
| `[9]` | call/expression | `dialogue) local res = await(Async.question_player(player_id` |
| `[10]` | expression/reference | `dialogue_texts[1]` |
| `[11]` | expression/reference | `mugshot.texture_path` |
| `[12]` | expression/reference | `mugshot.animation_path)) local next_id = next_dialogues[2-res] return next_id end) end` |

### `quiz` *(line 140)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"quiz"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local dialogue_texts = helpers.extract_numbered_properties(dialogue` |
| `[6]` | string literal | `"Text ") local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[7]` | string literal | `"Next ") local mugshot = eznpcs.get_dialogue_mugshot(npc` |
| `[8]` | expression/reference | `player_id` |
| `[9]` | call/expression | `dialogue) local res = await(Async.quiz_player(player_id` |
| `[10]` | expression/reference | `dialogue_texts[1]` |
| `[11]` | expression/reference | `dialogue_texts[2]` |
| `[12]` | expression/reference | `dialogue_texts[3]` |
| `[13]` | expression/reference | `mugshot.texture_path` |
| `[14]` | expression/reference | `mugshot.animation_path)) local next_id = next_dialogues[res+1] return next_id end) end` |

### `random` *(line 153)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"random"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local dialogue_texts = helpers.extract_numbered_properties(dialogue` |
| `[6]` | string literal | `"Text ") local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[7]` | string literal | `"Next ") local mugshot = eznpcs.get_dialogue_mugshot(npc` |
| `[8]` | expression/reference | `player_id` |
| `[9]` | call/expression | `dialogue) local rnd_text_index = math.random( #dialogue_texts) local res = await(Async.message_player(player_id` |
| `[10]` | expression/reference | `dialogue_texts[rnd_text_index]` |
| `[11]` | expression/reference | `mugshot.texture_path` |
| `[12]` | expression/reference | `mugshot.animation_path)) local next_id = next_dialogues[rnd_text_index] or next_dialogues[1] return next_id end) end` |

### `itemcheck` *(line 167)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `'itemcheck'` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local area_id = Net.get_player_area(player_id) local required_items = helpers.extract_numbered_proper…` |
| `[6]` | string literal | `"Item ") local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[7]` | string literal | `"Next ") local take_item = tu.is_true(dialogue.custom_properties["Take Item"]) local next_dialogue_id = nil local all_passed = true for inde…` |
| `[8]` | call/expression | `item_object_id in ipairs(required_items) do local item_info = helpers.read_item_information(area_id` |
| `[9]` | call/expression | `item_object_id) if item_info then if item_info.type == "money" then if not condition.money(player_id` |
| `[10]` | expression/reference | `item_info.amount` |
| `[11]` | call/expression | `take_item) then all_passed = false end else if not condition.item(player_id` |
| `[12]` | expression/reference | `item_info.name` |
| `[13]` | expression/reference | `item_info.amount` |
| `[14]` | expression/reference | `take_item) then all_passed = false end end end end next_dialogue_id = all_passed and next_dialogues[1] or next_dialogues[2] return next_dial…` |

### `questcheck` *(line 198)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"questcheck"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[6]` | string literal | `"Next ") local cond = { type = "quest_flag", quest = dialogue.custom_properties["Quest Name"], flag = dialogue.custom_properties["Flag Name"…` |
| `[7]` | expression/reference | `cond) if invert then passed = not passed end return passed and next_dialogues[1] or next_dialogues[2] end) end` |

### `cond` *(line 203)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"quest_flag"` |
| `quest` | expression/reference | `dialogue.custom_properties["Quest Name"]` |
| `flag` | expression/reference | `dialogue.custom_properties["Flag Name"]` |
| `value` | expression/reference | `dialogue.custom_properties["Flag Value"]` |
| `op` | expression/reference | `dialogue.custom_properties["Operator"] or dialogue.custom_properties["Op"]` |

### `before` *(line 217)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"before"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local dialogue_texts = helpers.extract_numbered_properties(dialogue` |
| `[6]` | string literal | `"Text ") local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[7]` | string literal | `"Next ") local mugshot = eznpcs.get_dialogue_mugshot(npc` |
| `[8]` | expression/reference | `player_id` |
| `[9]` | call/expression | `dialogue) local date_str = dialogue.custom_properties['Date'] local is_before = condition.date_before(date_str) local message = is_before an…` |
| `[10]` | expression/reference | `message` |
| `[11]` | expression/reference | `mugshot.texture_path` |
| `[12]` | expression/reference | `mugshot.animation_path)) end return next_id end) end` |

### `after` *(line 235)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"after"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local dialogue_texts = helpers.extract_numbered_properties(dialogue` |
| `[6]` | string literal | `"Text ") local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[7]` | string literal | `"Next ") local mugshot = eznpcs.get_dialogue_mugshot(npc` |
| `[8]` | expression/reference | `player_id` |
| `[9]` | call/expression | `dialogue) local date_str = dialogue.custom_properties['Date'] local is_after = condition.date_after(date_str) local message = is_after and d…` |
| `[10]` | expression/reference | `message` |
| `[11]` | expression/reference | `mugshot.texture_path` |
| `[12]` | expression/reference | `mugshot.animation_path)) end return next_id end) end` |

### `shop` *(line 253)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"shop"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local area_id = Net.get_player_area(player_id) local shop_item_object_ids = helpers.extract_numbered_…` |
| `[6]` | string literal | `"Item ") local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[7]` | string literal | `"Next ") local mugshot = eznpcs.get_dialogue_mugshot(npc` |
| `[8]` | expression/reference | `player_id` |
| `[9]` | expression/reference | `dialogue) local shop_items = {} for i` |
| `[10]` | call/expression | `item_object_id in ipairs(shop_item_object_ids) do local item_info = helpers.read_item_information(area_id` |
| `[11]` | call/expression | `item_object_id) if item_info then local shop_item = { name=item_info.name, price=item_info.price, description=item_info.description or "???"…` |
| `[12]` | call/expression | `shop_item) end end await(ezmemory.open_shop_async(player_id` |
| `[13]` | expression/reference | `shop_items` |
| `[14]` | expression/reference | `mugshot.texture_path` |
| `[15]` | call/expression | `mugshot.animation_path)) local next_id = first_value_from_table(next_dialogues) return next_id end) end` |

### `shop_items` *(line 261)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `shop_item` *(line 266)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | expression/reference | `item_info.name` |
| `price` | expression/reference | `item_info.price` |
| `description` | expression/reference | `item_info.description or "???"` |
| `is_key` | expression/reference | `item_info.type == 'keyitem'` |

### `password` *(line 282)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"password"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local correct_password = dialogue.custom_properties["Text 1"] local user_input = await(Async.prompt_p…` |

### `quest_switch` *(line 296)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"quest_switch"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local quest_name = dialogue.custom_properties["Quest Name"] local quest_state = ezquests.get_player_q…` |
| `[6]` | call/expression | `quest_name) if dialogue.custom_properties[quest_state] then return dialogue.custom_properties[quest_state] else logger:warn('[eznpcs] dialog…` |
| `[7]` | expression/reference | `dialogue.id` |
| `[8]` | string literal | `'has no custom property for quest state'` |
| `[9]` | expression/reference | `quest_state) end end) end` |

### `quest_event` *(line 310)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"quest_event"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local quest_name = dialogue.custom_properties["Quest Name"] local event_value = dialogue.custom_prope…` |
| `[6]` | string literal | `"Next ") await(ezquests.quest_event(player_id` |
| `[7]` | expression/reference | `quest_name` |
| `[8]` | call/expression | `event_value)) ezbus:emit("quest_event"` |
| `[9]` | table | `{ player_id = player_id, quest_name = quest_name, event_value = event_value }) return first_value_from_table(next_dialogues) end) end` |

### `item` *(line 327)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"item"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function () local area_id = Net.get_player_area(player_id) local gift_item_ids = helpers.extract_numbered_propert…` |
| `[6]` | string literal | `"Item ") local notify_player = not tu.is_true(dialogue.custom_properties["Dont Notify"]) for index` |
| `[7]` | call/expression | `item_id in ipairs(gift_item_ids) do ezmemory.give_item_with_optional_notify(player_id` |
| `[8]` | expression/reference | `area_id` |
| `[9]` | expression/reference | `item_id` |
| `[10]` | nil | `nil` |
| `[11]` | expression/reference | `notify_player) end return dialogue.custom_properties["Next 1"] end) end` |

### `email` *(line 341)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"email"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() local next_dialogues = helpers.extract_numbered_properties(dialogue` |
| `[6]` | string literal | `"Next ") local next_id = first_value_from_table(next_dialogues) local MUG_DIR = "/server/assets/ezlibs-assets/eznpcs/mug/" local function ha…` |
| `res` | call/expression | `pcall(Net.has_asset` |
| `[8]` | call/expression | `path) if ok and res == true then return true end if ok and res == false then return false end return true end local function ensure_ext(p` |
| `[9]` | call/expression | `ext) if not p or p == "" then return nil end if p:match("%.[%w]+$") then return p end return p .. ext end local function resolve_texture(raw…` |
| `[10]` | string literal | `".png") end local name = raw if not name:match("%.png$") then name = name .. ".png" end return MUG_DIR .. name end local function resolve_an…` |
| `[11]` | string literal | `".animation") end local name = raw if not name:match("%.animation$") then name = name .. ".animation" end return MUG_DIR .. name end local i…` |
| `[12]` | call/expression | `dialogue.id) return next_id end local icon = tu.get_number_from(dialogue.custom_properties` |
| `[13]` | string literal | `"Email Icon"` |
| `[14]` | number literal | `1) local title = dialogue.custom_properties["Email Title"] or "Mail" local from = dialogue.custom_properties["Email From"] or "???" local bo…` |
| `[15]` | string literal | `"Body ") local body = "" if body_lines and #body_lines &gt; 0 then body = table.concat(body_lines` |
| `[16]` | string literal | `"\n\n") else body = dialogue.custom_properties["Email Body"] or "" end local notify = not tu.is_true(dialogue.custom_properties["Dont Notify…` |
| `[17]` | call/expression | `nil) local msg = dialogue.custom_properties["Notify Message"] or "Looks like you got an e-mail." local persist = tu.is_true(dialogue.custom_…` |
| `[18]` | call/expression | `true) local tex_raw = dialogue.custom_properties["Mug Texture Path"] local anim_raw = dialogue.custom_properties["Mug Animation Path"] local…` |
| `[19]` | expression/reference | `tex_path` |
| `[20]` | string literal | `"anim="` |
| `[21]` | expression/reference | `anim_path` |
| `[22]` | string literal | `" -&gt; sending without mug") tex_path = nil anim_path = nil end end local mail = { id = tostring(id), icon = icon, title = title, from = from,…` |
| `[23]` | expression/reference | `mail` |
| `[24]` | table | `{ notify = notify, notify_message = msg, notify_delay = delay }) else ezemail.send_temp(player_id` |
| `[25]` | expression/reference | `mail` |
| `[26]` | table | `{ notify = notify, notify_message = msg, notify_delay = delay }) end return next_id end) end` |

### `mail` *(line 425)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | call/expression | `tostring(id)` |
| `icon` | expression/reference | `icon` |
| `title` | expression/reference | `title` |
| `from` | expression/reference | `from` |
| `body` | expression/reference | `body` |

### `battle_npc` *(line 457)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"battle_npc"` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | expression/reference | `dialogue` |
| `[5]` | call/expression | `relay_object) return async(function() local area_id = Net.get_player_area(player_id) local intro_message = dialogue.custom_properties["Text …` |
| `[6]` | string literal | `"Kick On Loss"` |
| `[7]` | call/expression | `true) if not encounter_name then logger:warn("[eznpcs] battle_npc missing Encounter Name") return end if intro_message and intro_message ~= …` |
| `[8]` | expression/reference | `player_id` |
| `[9]` | call/expression | `dialogue) await(Async.message_player(player_id` |
| `[10]` | expression/reference | `intro_message` |
| `[11]` | expression/reference | `mugshot.texture_path` |
| `[12]` | call/expression | `mugshot.animation_path)) end local choice = await(Async.question_player(player_id` |
| `[13]` | call/expression | `question)) if choice == 0 then return end eznpcs.prepare_battle_exit_wait(player_id) local stats = await(ezencounters.begin_encounter_by_nam…` |
| `[14]` | call/expression | `encounter_name)) if not stats then eznpcs.cancel_battle_exit_wait(player_id) await(Async.message_player(player_id` |
| `[15]` | string literal | `"The challenge could not be initiated.")) return end logger:for_player(player_id):info(string.format( "[battle_npc] encounter completed t=%.…` |
| `[16]` | call/expression | `now()` |
| `[17]` | call/expression | `tostring(stats.reason)` |
| `[18]` | call/expression | `tostring(stats.health or stats.player_hp or stats.hp)` |
| `[19]` | call/expression | `tostring(stats.ran or stats.fled or stats.escape))) local exit_results` |
| `exit_event` | call/expression | `await(eznpcs.wait_for_battle_exit(player_id)) logger:for_player(player_id):info(string.format( "[battle_npc] battle_exit received t=%.3f had…` |
| `[21]` | call/expression | `now()` |
| `[22]` | call/expression | `tostring(exit_results ~= nil))) merge_result_fields(stats` |
| `[23]` | call/expression | `exit_results) if not exit_results then local reason_num = tonumber(stats.reason or 0) or 0 local ran_flag = stats.ran or stats.fled or stats…` |
| `[24]` | call/expression | `tostring(reason_num)` |
| `[25]` | call/expression | `tostring(ran_flag))) return end end local won = player_won_from_stats(stats) logger:for_player(player_id):info(string.format( "[battle_npc] …` |
| `[26]` | call/expression | `tostring(won)` |
| `[27]` | call/expression | `tostring(stats.reason)` |
| `[28]` | call/expression | `tostring(stats.ran)` |
| `[29]` | call/expression | `tostring(stats.fled)` |
| `[30]` | call/expression | `tostring(stats.escape)` |
| `[31]` | call/expression | `tostring(stats.health or stats.player_hp or stats.hp)` |
| `[32]` | call/expression | `tostring(stats.enemies and #stats.enemies or 0)` |
| `[33]` | call/expression | `tostring(exit_results ~= nil)` |
| `[34]` | call/expression | `tostring(kick_on_loss)` |
| `[35]` | call/expression | `tostring(npc.bot_id)` |
| `[36]` | call/expression | `tostring(npc.placeholder_id))) if won then if Net.is_player(player_id) then local t_start = now() logger:for_player(player_id):info(string.f…` |
| `[37]` | call/expression | `t_start)) await(ezexplosions.explode_and_wait(npc.bot_id` |
| `[38]` | expression/reference | `area_id` |
| `[39]` | number literal | `3)) logger:for_player(player_id):info(string.format( "[battle_npc] win explosion done t=%.3f duration=%.3f"` |
| `[40]` | call/expression | `now()` |
| `[41]` | call/expression | `now() - t_start)) end local npc_properties = npc.placeholder_custom_properties or {} if is_property_true(npc_properties["Player Exclusive"])…` |
| `[42]` | expression/reference | `player_id` |
| `[43]` | call/expression | `npc.placeholder_id) end pcall(ezmemory.hide_object_from_player` |
| `[44]` | expression/reference | `player_id` |
| `[45]` | expression/reference | `area_id` |
| `[46]` | call/expression | `npc.placeholder_id) else if not Net.is_player(player_id) then logger:for_player(player_id):info( "[battle_npc] player disconnected after los…` |
| `[47]` | call/expression | `t_explode_start)) await(ezexplosions.explode_and_wait(player_id` |
| `[48]` | expression/reference | `area_id` |
| `[49]` | number literal | `3)) logger:for_player(player_id):info(string.format( "[battle_npc] loss explosion done t=%.3f duration=%.3f"` |
| `[50]` | call/expression | `now()` |
| `[51]` | call/expression | `now() - t_explode_start)) if kick_on_loss then local t_kick_start = now() logger:for_player(player_id):info(string.format( "[battle_npc] kic…` |
| `[52]` | call/expression | `t_kick_start)) local kicked = false if Net.is_player(player_id) then local ok_pcall` |
| `result` | call/expression | `pcall( Net.kick_player` |
| `[54]` | expression/reference | `player_id` |
| `[55]` | string literal | `"You were defeated!"` |
| `[56]` | call/expression | `true) kicked = ok_pcall and (result ~= false) end logger:for_player(player_id):info(string.format( "[battle_npc] kick done t=%.3f duration=%…` |
| `[57]` | call/expression | `now()` |
| `[58]` | call/expression | `now() - t_kick_start` |
| `[59]` | call/expression | `tostring(kicked))) if not kicked then if Net.is_player(player_id) then logger:for_player(player_id):warn( "[battle_npc] kick did not run or …` |
| `[60]` | call/expression | `player_id) else logger:for_player(player_id):info( "[battle_npc] player disconnected during loss explosion; " .. "no live player to unlock")…` |
| `[61]` | expression/reference | `player_id) end end end) end` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/eznpcs/dialogue_types.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
