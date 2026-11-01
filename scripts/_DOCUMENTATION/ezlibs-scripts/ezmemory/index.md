# `ezmemory.lua`

> **Source:** `scripts/ezlibs-scripts/ezmemory.lua`  
> **Source lines:** 1143  
> **Functions detected:** 61  
> **Table declarations detected:** 18

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

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/json` — line 2
- `scripts/ezlibs-scripts/helpers` — line 3
- `table` — line 4
- `scripts/ezlibs-scripts/ezbus` — line 5
- `scripts/ezlibs-scripts/ezconfig` — line 6
- `scripts/ezlibs-scripts/avatar_utils/main` — line 7
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 1000

## Events

- `Net:on("handle_player_join", function(event) ...)` — line 136. The event name is taken directly from this source.
- `Net:on("player_request", function(event) ...)` — line 142. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 59 | `ensure_file` | `path, default_content` |
| 90 | `get_file_paths` | `base` |
| 104 | `ezmemory_load_file` | `file_path` |
| 123 | `ezmemory_save_file` | `file_path, value` |
| 149 | `printd` | `...` |
| 154 | `normalize_player_memory` | `mem` |
| 167 | `initialize_area_memory_file` | `area_id` |
| 173 | `_read` | `path` |
| 213 | `load_all_memory` | `(none)` |
| 254 | `update_player_health` | `player_id` |
| 290 | `ezmemory.wait_until_loaded` | `(none)` |
| 298 | `ezmemory.is_loaded` | `(none)` |
| 307 | `ezmemory.get_item_info` | `item_id` |
| 314 | `ezmemory.create_or_update_item` | `item_name, item_description, is_key` |
| 339 | `ezmemory.get_item_id_by_name` | `item_name` |
| 350 | `ezmemory.get_or_create_item` | `item_name, item_description, is_key` |
| 358 | `ezmemory.save_items` | `(none)` |
| 362 | `ezmemory.save_area_memory` | `area_id` |
| 366 | `ezmemory.save_player_memory` | `safe_secret` |
| 370 | `ezmemory.dangerously_override_player_memory` | `safe_secret, new_memory` |
| 376 | `ezmemory.get_area_memory` | `area_id` |
| 383 | `_read` | `path` |
| 420 | `ezmemory.get_player_memory` | `safe_secret` |
| 440 | `ezmemory.get_player_area_memory` | `safe_secret, area_id` |
| 454 | `ezmemory.update_player_list` | `safe_secret, name` |
| 459 | `ezmemory.get_player_name_from_safesecret` | `safe_secret` |
| 468 | `ezmemory.give_player_item` | `player_id, name, amount` |
| 504 | `ezmemory.remove_player_item` | `player_id, name, remove_quant` |
| 539 | `ezmemory.get_player_money` | `player_id` |
| 564 | `ezmemory.spend_player_money` | `player_id, amount` |
| 582 | `ezmemory.set_player_money` | `player_id, money` |
| 594 | `ezmemory.get_player_fragments` | `player_id` |
| 619 | `ezmemory.set_player_fragments` | `player_id, fragments` |
| 635 | `ezmemory.add_player_fragments` | `player_id, amount` |
| 651 | `ezmemory.spend_player_fragments` | `player_id, amount` |
| 676 | `_normalize_tokens` | `value` |
| 683 | `ezmemory.get_player_tokens` | `player_id` |
| 693 | `ezmemory.set_player_tokens` | `player_id, tokens` |
| 706 | `ezmemory.add_player_tokens` | `player_id, amount` |
| 721 | `ezmemory.spend_player_tokens` | `player_id, amount` |
| 752 | `ezmemory.count_player_item` | `player_id, item_name` |
| 765 | `ezmemory.open_shop_async` | `player_id, shop_items, mugshot_texture_path, mugshot_animation_path` |
| 786 | `ezmemory.hide_object_from_player_till_disconnect` | `player_id, area_id, object_id` |
| 810 | `get_player_area_safely` | `player_id` |
| 829 | `ezmemory.unhide_object_from_player_till_disconnect` | `player_id, area_id, object_id` |
| 851 | `ezmemory.unhide_object_from_player` | `player_id, area_id, object_id` |
| 879 | `ezmemory.hide_object_from_player` | `player_id, area_id, object_id` |
| 899 | `ezmemory.object_is_hidden_from_player` | `player_id, area_id, object_id` |
| 916 | `ezmemory.object_is_hidden_from_player_till_disconnect` | `player_id, area_id, object_id` |
| 925 | `ezmemory.handle_player_disconnect` | `player_id` |
| 929 | `ezmemory.handle_player_join` | `player_id` |
| 971 | `ezmemory.handle_player_transfer` | `player_id` |
| 1011 | `ezmemory.calculate_player_modified_max_hp` | `player_id, base_max_hp, hp_memory_modifier, hp_memory_item` |
| 1017 | `ezmemory.get_player_max_health` | `player_id` |
| 1023 | `ezmemory.get_player_health` | `player_id` |
| 1029 | `ezmemory.set_player_max_health` | `player_id, new_max_health, should_heal_by_increase` |
| 1056 | `ezmemory.set_player_health` | `player_id, new_health` |
| 1075 | `ezmemory.handle_player_avatar_change` | `player_id, details` |
| 1080 | `ezmemory.give_item_with_optional_notify` | `player_id, area_id, item_object_id, item_info, notify_player` |
| 1119 | `ezmemory.play_anim_get` | `player_id` |
| 1136 | `ezmemory.set_direction_anim` | `player_id, direction` |

### Function notes

- **`ensure_file(path, default_content)`** — Helper to create a file with default content if it doesn't exist *(source line 59)*
- **`get_file_paths(base)`** — Given a base path, returns the main file path and backup file path. If base already ends with ".json", backup is base with "_backup" inserted before .json. Otherwise, main is base .. ".json", backup is base .. "_backup.json". *(source line 90)*
- **`ezmemory_load_file(file_path)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory_save_file(file_path, value)`** *(source line 123)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`printd(...)`** *(source line 149)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_player_memory(mem)`** *(source line 154)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`initialize_area_memory_file(area_id)`** *(source line 167)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_read(path)`** *(source line 173)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_all_memory()`** *(source line 213)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_player_health(player_id)`** *(source line 254)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.wait_until_loaded()`** *(source line 290)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.is_loaded()`** *(source line 298)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_item_info(item_id)`** *(source line 307)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.create_or_update_item(item_name, item_description, is_key)`** *(source line 314)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_item_id_by_name(item_name)`** *(source line 339)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_or_create_item(item_name, item_description, is_key)`** *(source line 350)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.save_items()`** *(source line 358)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.save_area_memory(area_id)`** *(source line 362)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.save_player_memory(safe_secret)`** *(source line 366)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.dangerously_override_player_memory(safe_secret, new_memory)`** *(source line 370)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_area_memory(area_id)`** *(source line 376)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_read(path)`** *(source line 383)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_memory(safe_secret)`** *(source line 420)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_area_memory(safe_secret, area_id)`** *(source line 440)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.update_player_list(safe_secret, name)`** *(source line 454)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_name_from_safesecret(safe_secret)`** *(source line 459)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.give_player_item(player_id, name, amount)`** *(source line 468)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.remove_player_item(player_id, name, remove_quant)`** *(source line 504)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_money(player_id)`** *(source line 539)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.spend_player_money(player_id, amount)`** *(source line 564)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_money(player_id, money)`** *(source line 582)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_fragments(player_id)`** *(source line 594)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_fragments(player_id, fragments)`** *(source line 619)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.add_player_fragments(player_id, amount)`** *(source line 635)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.spend_player_fragments(player_id, amount)`** *(source line 651)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_normalize_tokens(value)`** *(source line 676)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_tokens(player_id)`** *(source line 683)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_tokens(player_id, tokens)`** *(source line 693)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.add_player_tokens(player_id, amount)`** *(source line 706)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.spend_player_tokens(player_id, amount)`** *(source line 721)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.count_player_item(player_id, item_name)`** *(source line 752)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.open_shop_async(player_id, shop_items, mugshot_texture_path, mugshot_animation_path)`** *(source line 765)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.hide_object_from_player_till_disconnect(player_id, area_id, object_id)`** *(source line 786)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_player_area_safely(player_id)`** — Net player IDs can become stale while a delayed button/group callback is running. Keep these cleanup paths defensive: get_player_area can throw for an ID that has already disconnected. *(source line 810)*
- **`ezmemory.unhide_object_from_player_till_disconnect(player_id, area_id, object_id)`** *(source line 829)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.unhide_object_from_player(player_id, area_id, object_id)`** *(source line 851)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.hide_object_from_player(player_id, area_id, object_id)`** *(source line 879)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.object_is_hidden_from_player(player_id, area_id, object_id)`** *(source line 899)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.object_is_hidden_from_player_till_disconnect(player_id, area_id, object_id)`** *(source line 916)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.handle_player_disconnect(player_id)`** *(source line 925)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.handle_player_join(player_id)`** *(source line 929)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.handle_player_transfer(player_id)`** *(source line 971)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.calculate_player_modified_max_hp(player_id, base_max_hp, hp_memory_modifier, hp_memory_item)`** *(source line 1011)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_max_health(player_id)`** *(source line 1017)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_health(player_id)`** *(source line 1023)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_max_health(player_id, new_max_health, should_heal_by_increase)`** *(source line 1029)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_health(player_id, new_health)`** *(source line 1056)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.handle_player_avatar_change(player_id, details)`** *(source line 1075)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.give_item_with_optional_notify(player_id, area_id, item_object_id, item_info, notify_player)`** *(source line 1080)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.play_anim_get(player_id)`** — ===================== Missing Animation Helpers ===================== *(source line 1119)*
- **`ezmemory.set_direction_anim(player_id, direction)`** *(source line 1136)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezmemory` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_memory` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `area_memory` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_list` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_avatar_details` *(line 13)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `items` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `item_name_table` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `objects_hidden_till_disconnect_for_player` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `idle_map` *(line 23)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Down Right]` | string literal | `"IDLE_DR"` |
| `[Down Left]` | string literal | `"IDLE_DL"` |
| `[Up Right]` | string literal | `"IDLE_UR"` |
| `[Up Left]` | string literal | `"IDLE_UL"` |
| `[Up]` | string literal | `"IDLE_U"` |
| `[Down]` | string literal | `"IDLE_D"` |
| `[Left]` | string literal | `"IDLE_L"` |
| `[Right]` | string literal | `"IDLE_R"` |

### `memory_loaded_flags` *(line 34)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_memory` | boolean literal | `false` |
| `player_memory` | boolean literal | `false` |
| `items` | boolean literal | `false` |

### `sfx` *(line 40)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `item_get` | string literal | `'/server/assets/ezlibs-assets/sfx/item_get.ogg'` |

### `arg` *(line 150)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `...` |

### `new_item` *(line 328)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | expression/reference | `item_name` |
| `description` | expression/reference | `item_description` |
| `key_item` | expression/reference | `is_key` |

### `items` *(line 428)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `meta` *(line 432)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `joins` | number literal | `0` |

### `area_memory` *(line 433)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `shop_items_by_name` *(line 769)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `objects_hidden_till_disconnect_for_player` *(line 926)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezmemory.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
