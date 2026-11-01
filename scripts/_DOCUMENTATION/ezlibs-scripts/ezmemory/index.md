# `ezmemory.lua`

> **Source:** `scripts/ezlibs-scripts/ezmemory.lua`  
> **Source lines:** 1233  
> **Functions detected:** 65  
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
| 167 | `is_instance_area_id` | `area_id` |
| 173 | `remove_area_memory_files` | `area_id` |
| 195 | `prune_stale_instance_memory` | `active_area_ids` |
| 229 | `initialize_area_memory_file` | `area_id` |
| 236 | `_read` | `path` |
| 275 | `load_all_memory` | `(none)` |
| 317 | `update_player_health` | `player_id` |
| 353 | `ezmemory.wait_until_loaded` | `(none)` |
| 361 | `ezmemory.is_loaded` | `(none)` |
| 370 | `ezmemory.get_item_info` | `item_id` |
| 377 | `ezmemory.create_or_update_item` | `item_name, item_description, is_key` |
| 402 | `ezmemory.get_item_id_by_name` | `item_name` |
| 413 | `ezmemory.get_or_create_item` | `item_name, item_description, is_key` |
| 421 | `ezmemory.save_items` | `(none)` |
| 425 | `ezmemory.save_area_memory` | `area_id` |
| 429 | `ezmemory.save_player_memory` | `safe_secret` |
| 436 | `ezmemory.clear_area_memory` | `area_id` |
| 460 | `ezmemory.dangerously_override_player_memory` | `safe_secret, new_memory` |
| 466 | `ezmemory.get_area_memory` | `area_id` |
| 473 | `_read` | `path` |
| 510 | `ezmemory.get_player_memory` | `safe_secret` |
| 530 | `ezmemory.get_player_area_memory` | `safe_secret, area_id` |
| 544 | `ezmemory.update_player_list` | `safe_secret, name` |
| 549 | `ezmemory.get_player_name_from_safesecret` | `safe_secret` |
| 558 | `ezmemory.give_player_item` | `player_id, name, amount` |
| 594 | `ezmemory.remove_player_item` | `player_id, name, remove_quant` |
| 629 | `ezmemory.get_player_money` | `player_id` |
| 654 | `ezmemory.spend_player_money` | `player_id, amount` |
| 672 | `ezmemory.set_player_money` | `player_id, money` |
| 684 | `ezmemory.get_player_fragments` | `player_id` |
| 709 | `ezmemory.set_player_fragments` | `player_id, fragments` |
| 725 | `ezmemory.add_player_fragments` | `player_id, amount` |
| 741 | `ezmemory.spend_player_fragments` | `player_id, amount` |
| 766 | `_normalize_tokens` | `value` |
| 773 | `ezmemory.get_player_tokens` | `player_id` |
| 783 | `ezmemory.set_player_tokens` | `player_id, tokens` |
| 796 | `ezmemory.add_player_tokens` | `player_id, amount` |
| 811 | `ezmemory.spend_player_tokens` | `player_id, amount` |
| 842 | `ezmemory.count_player_item` | `player_id, item_name` |
| 855 | `ezmemory.open_shop_async` | `player_id, shop_items, mugshot_texture_path, mugshot_animation_path` |
| 876 | `ezmemory.hide_object_from_player_till_disconnect` | `player_id, area_id, object_id` |
| 900 | `get_player_area_safely` | `player_id` |
| 919 | `ezmemory.unhide_object_from_player_till_disconnect` | `player_id, area_id, object_id` |
| 941 | `ezmemory.unhide_object_from_player` | `player_id, area_id, object_id` |
| 969 | `ezmemory.hide_object_from_player` | `player_id, area_id, object_id` |
| 989 | `ezmemory.object_is_hidden_from_player` | `player_id, area_id, object_id` |
| 1006 | `ezmemory.object_is_hidden_from_player_till_disconnect` | `player_id, area_id, object_id` |
| 1015 | `ezmemory.handle_player_disconnect` | `player_id` |
| 1019 | `ezmemory.handle_player_join` | `player_id` |
| 1061 | `ezmemory.handle_player_transfer` | `player_id` |
| 1101 | `ezmemory.calculate_player_modified_max_hp` | `player_id, base_max_hp, hp_memory_modifier, hp_memory_item` |
| 1107 | `ezmemory.get_player_max_health` | `player_id` |
| 1113 | `ezmemory.get_player_health` | `player_id` |
| 1119 | `ezmemory.set_player_max_health` | `player_id, new_max_health, should_heal_by_increase` |
| 1146 | `ezmemory.set_player_health` | `player_id, new_health` |
| 1165 | `ezmemory.handle_player_avatar_change` | `player_id, details` |
| 1170 | `ezmemory.give_item_with_optional_notify` | `player_id, area_id, item_object_id, item_info, notify_player` |
| 1209 | `ezmemory.play_anim_get` | `player_id` |
| 1226 | `ezmemory.set_direction_anim` | `player_id, direction` |

### Function notes

- **`is_instance_area_id(area_id)`** — Identifies cloned Liberation and FootBomb area IDs for targeted stale-memory pruning. *(source line 167)*
- **`remove_area_memory_files(area_id)`** — Removes an area's main and backup memory files after validating the area ID as a safe filename component. *(source line 173)*
- **`prune_stale_instance_memory(active_area_ids)`** — Removes persisted Liberation/FootBomb memory for clone IDs not present in the active engine area list, including each affected player's area-memory entry. *(source line 195)*
- **`ensure_file(path, default_content)`** — Helper to create a file with default content if it doesn't exist *(source line 59)*
- **`get_file_paths(base)`** — Given a base path, returns the main file path and backup file path. If base already ends with ".json", backup is base with "_backup" inserted before .json. Otherwise, main is base .. ".json", backup is base .. "_backup.json". *(source line 90)*
- **`ezmemory_load_file(file_path)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory_save_file(file_path, value)`** *(source line 123)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`printd(...)`** *(source line 149)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_player_memory(mem)`** *(source line 154)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`initialize_area_memory_file(area_id)`** *(source line 230)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_read(path)`** *(source line 236)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_all_memory()`** *(source line 276)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_player_health(player_id)`** *(source line 317)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.wait_until_loaded()`** *(source line 353)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.is_loaded()`** *(source line 361)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_item_info(item_id)`** *(source line 370)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.create_or_update_item(item_name, item_description, is_key)`** *(source line 377)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_item_id_by_name(item_name)`** *(source line 402)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_or_create_item(item_name, item_description, is_key)`** *(source line 413)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.save_items()`** *(source line 421)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.save_area_memory(area_id)`** *(source line 425)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.save_player_memory(safe_secret)`** *(source line 429)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.clear_area_memory(area_id)`** — Removes the area's in-memory record, main/backup files, and matching `area_memory` entries from every loaded player; saves changed player records. Used after cloned-area removal. *(source line 436)*
- **`ezmemory.dangerously_override_player_memory(safe_secret, new_memory)`** *(source line 460)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_area_memory(area_id)`** *(source line 466)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_read(path)`** *(source line 473)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_memory(safe_secret)`** *(source line 510)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_area_memory(safe_secret, area_id)`** *(source line 530)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.update_player_list(safe_secret, name)`** *(source line 544)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_name_from_safesecret(safe_secret)`** *(source line 549)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.give_player_item(player_id, name, amount)`** *(source line 558)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.remove_player_item(player_id, name, remove_quant)`** *(source line 594)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_money(player_id)`** *(source line 629)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.spend_player_money(player_id, amount)`** *(source line 654)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_money(player_id, money)`** *(source line 672)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_fragments(player_id)`** *(source line 684)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_fragments(player_id, fragments)`** *(source line 709)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.add_player_fragments(player_id, amount)`** *(source line 725)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.spend_player_fragments(player_id, amount)`** *(source line 741)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_normalize_tokens(value)`** *(source line 766)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_tokens(player_id)`** *(source line 773)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_tokens(player_id, tokens)`** *(source line 783)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.add_player_tokens(player_id, amount)`** *(source line 796)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.spend_player_tokens(player_id, amount)`** *(source line 811)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.count_player_item(player_id, item_name)`** *(source line 842)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.open_shop_async(player_id, shop_items, mugshot_texture_path, mugshot_animation_path)`** *(source line 855)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.hide_object_from_player_till_disconnect(player_id, area_id, object_id)`** *(source line 876)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_player_area_safely(player_id)`** — Net player IDs can become stale while a delayed button/group callback is running. Keep these cleanup paths defensive: get_player_area can throw for an ID that has already disconnected. *(source line 900)*
- **`ezmemory.unhide_object_from_player_till_disconnect(player_id, area_id, object_id)`** *(source line 919)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.unhide_object_from_player(player_id, area_id, object_id)`** *(source line 941)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.hide_object_from_player(player_id, area_id, object_id)`** *(source line 969)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.object_is_hidden_from_player(player_id, area_id, object_id)`** *(source line 989)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.object_is_hidden_from_player_till_disconnect(player_id, area_id, object_id)`** *(source line 1006)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.handle_player_disconnect(player_id)`** *(source line 1015)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.handle_player_join(player_id)`** *(source line 1019)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.handle_player_transfer(player_id)`** *(source line 1061)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.calculate_player_modified_max_hp(player_id, base_max_hp, hp_memory_modifier, hp_memory_item)`** *(source line 1101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_max_health(player_id)`** *(source line 1107)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.get_player_health(player_id)`** *(source line 1113)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_max_health(player_id, new_max_health, should_heal_by_increase)`** *(source line 1119)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.set_player_health(player_id, new_health)`** *(source line 1146)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.handle_player_avatar_change(player_id, details)`** *(source line 1165)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.give_item_with_optional_notify(player_id, area_id, item_object_id, item_info, notify_player)`** *(source line 1170)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmemory.play_anim_get(player_id)`** — ===================== Missing Animation Helpers ===================== *(source line 1209)*
- **`ezmemory.set_direction_anim(player_id, direction)`** *(source line 1226)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

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

- On startup, stale `liberation_` and `footbomb_` area-memory entries are pruned when their cloned area IDs are absent from `Net.list_areas()`. Matching area files and player-memory references are removed; active clones are preserved.
- `ezmemory.clear_area_memory(area_id)` is called by `EzMapInstance.remove()` after the engine confirms area removal.
- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezmemory.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
