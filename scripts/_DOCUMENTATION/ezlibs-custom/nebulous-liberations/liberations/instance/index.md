# `instance.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/instance.lua`  
> **Source lines:** 1715  
> **Functions detected:** 34  
> **Table declarations detected:** 47

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

instance.lua

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 2
- `scripts/libs/direction` — line 5
- `scripts/ezlibs-custom/nebulous-liberations/liberations/player_session` — line 6
- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy` — line 7
- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers` — line 8
- `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_encounters` — line 9
- `scripts/ezlibs-custom/nebulous-liberations/liberations/loot` — line 10
- `scripts/ezlibs-custom/nebulous-liberations/liberations/preloader` — line 11
- `scripts/ezlibs-custom/nebulous-liberations/liberations/constants` — line 12
- `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_registry` — line 13
- `scripts/ezlibs-custom/nebulous-liberations/liberations/camera_sequence` — line 14
- `scripts/ezlibs-custom/nebulous-liberations/liberations/points_gauge` — line 15
- `scripts/ezlibs-custom/nebulous-liberations/liberations/hp_indicators` — line 16
- `scripts/libs/emotes` — line 17
- `scripts/ezlibs-scripts/ezmemory` — line 18
- `scripts/ezlibs-scripts/helpers` — line 19

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 21 | `includes` | `table, value` |
| 34 | `normalize_enemy_name` | `value` |
| 39 | `build_encounter_data` | `encounter_definition, overrides, persistent_enemy` |
| 101 | `is_panel` | `self, object` |
| 105 | `is_adjacent` | `position_a, position_b` |
| 114 | `boot_player` | `player, isVictory, mapName` |
| 120 | `liberate` | `self` |
| 162 | `normalized_reference` | `value` |
| 167 | `boss_group_ids_from_properties` | `properties` |
| 186 | `object_is_associated_with_boss` | `properties, boss_group_id` |
| 195 | `count_dark_holes_for_boss` | `self, boss_definition` |
| 205 | `convert_indestructible_panels` | `self` |
| 311 | `liberate_panel` | `self, player_session` |
| 610 | `take_enemy_turn` | `self` |
| 764 | `Mission:new` | `base_area_id, new_area_id, players, max_order_points` |
| 1129 | `Mission:spawn_boss` | `boss_id, force, triggered` |
| 1212 | `Mission:spawn_bosses_for_cleared_dark_holes` | `(none)` |
| 1222 | `Mission:handle_boss_defeated` | `enemy` |
| 1279 | `Mission:set_order_points` | `value` |
| 1287 | `Mission:clean_up` | `(none)` |
| 1314 | `Mission:cleaning_up` | `(none)` |
| 1318 | `Mission:begin` | `(none)` |
| 1405 | `Mission:on_tick` | `elapsed` |
| 1441 | `Mission:handle_tile_interaction` | `player_id, x, y, z, button` |
| 1463 | `Mission:handle_object_interaction` | `player_id, object_id, button` |
| 1571 | `Mission:handle_player_avatar_change` | `player_id` |
| 1581 | `Mission:handle_player_transfer` | `player_id` |
| 1619 | `Mission:handle_player_disconnect` | `player_id` |
| 1643 | `Mission:get_players` | `(none)` |
| 1647 | `Mission:get_spawn_position` | `(none)` |
| 1651 | `Mission:get_next_spawn_from_object` | `object_id` |
| 1663 | `Mission:get_panel_at` | `x, y, z` |
| 1678 | `Mission:remove_panel` | `panel` |
| 1704 | `Mission:get_enemy_at` | `x, y, z` |

### Function notes

- **`includes(table, value)`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_enemy_name(value)`** — Build a per-battle copy of an encounter definition. Enemy entries are copied individually because persistent liberation enemies may override `health`; mutating the cached area encounter definition would leak that HP into later encounters that use the same definition. *(source line 34)*
- **`build_encounter_data(encounter_definition, overrides, persistent_enemy)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_panel(self, object)`** *(source line 101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_adjacent(position_a, position_b)`** *(source line 105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`boot_player(player, isVictory, mapName)`** *(source line 114)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`liberate(self)`** *(source line 120)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalized_reference(value)`** *(source line 162)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`boss_group_ids_from_properties(properties)`** *(source line 167)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`object_is_associated_with_boss(properties, boss_group_id)`** *(source line 186)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`count_dark_holes_for_boss(self, boss_definition)`** *(source line 195)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`convert_indestructible_panels(self)`** *(source line 205)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`liberate_panel(self, player_session)`** *(source line 311)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`take_enemy_turn(self)`** *(source line 610)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:new(base_area_id, new_area_id, players, max_order_points)`** *(source line 764)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:spawn_boss(boss_id, force, triggered)`** *(source line 1129)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:spawn_bosses_for_cleared_dark_holes()`** *(source line 1212)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:handle_boss_defeated(enemy)`** *(source line 1222)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:set_order_points(value)`** *(source line 1279)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:clean_up()`** *(source line 1287)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:cleaning_up()`** *(source line 1314)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:begin()`** *(source line 1318)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:on_tick(elapsed)`** *(source line 1405)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:handle_tile_interaction(player_id, x, y, z, button)`** *(source line 1441)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:handle_object_interaction(player_id, object_id, button)`** *(source line 1463)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:handle_player_avatar_change(player_id)`** *(source line 1571)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:handle_player_transfer(player_id)`** *(source line 1581)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:handle_player_disconnect(player_id)`** *(source line 1619)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:get_players()`** *(source line 1643)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:get_spawn_position()`** *(source line 1647)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:get_next_spawn_from_object(object_id)`** *(source line 1651)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:get_panel_at(x, y, z)`** *(source line 1663)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:remove_panel(panel)`** *(source line 1678)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Mission:get_enemy_at(x, y, z)`** *(source line 1704)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `data` *(line 40)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `data.enemies` *(line 45)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enemy_copy` *(line 47)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `data.freedom_mission` *(line 54)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mission` *(line 66)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.panels` *(line 131)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.enemies` *(line 135)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ids` *(line 168)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `seen` *(line 169)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `converting` *(line 208)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `remaining` *(line 209)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `DARK_HOLE_SHAPE` *(line 304)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1, 1, 1}` |
| `[2]` | table | `{1, 1, 1}` |
| `[3]` | table | `{1, 1, 1}` |

### `data` *(line 349)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `terrain` | call/expression | `PanelEncounters.resolve_terrain(self` |
| `[2]` | expression/reference | `player)` |

### `data` *(line 429)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `terrain` | call/expression | `PanelEncounters.resolve_terrain(self` |
| `[2]` | expression/reference | `player)` |

### `panels` *(line 556)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `panels` *(line 567)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `panel_summary` *(line 569)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `neighbor_offsets` *(line 694)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1, -1}` |
| `[2]` | table | `{1, 0}` |
| `[3]` | table | `{1, 1}` |
| `[4]` | table | `{-1, -1}` |
| `[5]` | table | `{-1, 0}` |
| `[6]` | table | `{-1, 1}` |
| `[7]` | table | `{0, 1}` |
| `[8]` | table | `{0, -1}` |

### `neighbors` *(line 697)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `Mission` *(line 760)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mission` *(line 843)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `new_area_id` |
| `base_area_id` | expression/reference | `base_area_id` |
| `area_name` | call/expression | `Net.get_area_name(base_area_id)` |
| `emote_timer` | number literal | `0` |
| `target_phase` | call/expression | `math.max(minimum_phases` |
| `[6]` | call/expression | `math.ceil(solo_target / math.max(1` |
| `[7]` | expression/reference | `player_difference)))` |
| `phase` | number literal | `1` |
| `ready_count` | number literal | `0` |
| `order_points` | number literal | `3` |
| `MAX_ORDER_POINTS` | expression/reference | `MAX_ORDER_POINTS` |
| `points_gauges` | table | `{}` |
| `points_of_interest` | table | `{}` |
| `players` | expression/reference | `players` |
| `player_sessions` | table | `{}` |
| `pending_transfer_players` | table | `{}` |
| `begin_started` | boolean literal | `false` |
| `boss` | nil | `nil` |
| `bosses` | table | `{}` |
| `boss_definitions` | table | `{}` |
| `enemies` | table | `{}` |
| `panels` | table | `{}` |
| `dark_holes` | table | `{}` |
| `indestructible_panels` | table | `{}` |
| `panel_gates` | table | `{}` |
| `FIRST_PANEL_GID` | expression/reference | `FIRST_PANEL_GID` |
| `BASIC_PANEL_GID_LIST` | table | `{}` |
| `ITEM_PANEL_GID_LIST` | table | `{}` |
| `DARK_HOLE_GID_LIST` | table | `{}` |
| `INDESTRUCTIBLE_PANEL_GID_LIST` | table | `{}` |
| `BONUS_PANEL_GID_LIST` | table | `{}` |
| `TRAP_PANEL_GID_LIST` | table | `{}` |
| `PANEL_GATE_GID_LIST` | table | `{}` |
| `LAST_PANEL_GID` | expression/reference | `FIRST_PANEL_GID + TOTAL_PANEL_GIDS - 1` |
| `updating` | boolean literal | `false` |
| `needs_disposal` | boolean literal | `false` |
| `disposal_promise` | nil | `nil` |
| `honor_hp_mem` | call/expression | `Net.get_area_custom_property(base_area_id` |
| `[39]` | expression/reference | `Constants.CustomProperties.HonorHPMem) == "true"` |

### `points_gauges` *(line 853)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `points_of_interest` *(line 854)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_sessions` *(line 856)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_transfer_players` *(line 859)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bosses` *(line 862)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `boss_definitions` *(line 863)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enemies` *(line 864)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `panels` *(line 865)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `dark_holes` *(line 866)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `indestructible_panels` *(line 867)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `panel_gates` *(line 868)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `BASIC_PANEL_GID_LIST` *(line 870)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ITEM_PANEL_GID_LIST` *(line 871)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `DARK_HOLE_GID_LIST` *(line 872)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `INDESTRUCTIBLE_PANEL_GID_LIST` *(line 873)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `BONUS_PANEL_GID_LIST` *(line 874)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `TRAP_PANEL_GID_LIST` *(line 875)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PANEL_GATE_GID_LIST` *(line 876)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `new_panel` *(line 963)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `""` |
| `type` | expression/reference | `panel_type` |
| `visible` | boolean literal | `true` |
| `x` | expression/reference | `object.x` |
| `y` | expression/reference | `object.y` |
| `z` | expression/reference | `object.z` |
| `width` | expression/reference | `object.width` |
| `height` | expression/reference | `object.height` |
| `data` | table | `{ type = "tile", gid = Net.get_tileset(base_area_id, "/server/assets/ezlibs-custom/nebulous-liberations/Liberation Collision.tsx").first_gid…` |
| `custom_properties` | expression/reference | `object.custom_properties` |
| `visual_object_id` | expression/reference | `object.id` |
| `visual_gid` | expression/reference | `object.data.gid` |

### `data` *(line 966)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"tile"` |
| `gid` | call/expression | `Net.get_tileset(base_area_id` |
| `[3]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/Liberation Collision.tsx").first_gid` |

### `definition` *(line 1035)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `object_id` | expression/reference | `object.id` |
| `boss_id` | expression/reference | `configured_boss_id or object_id_string` |
| `group_id` | expression/reference | `configured_boss_id or object_id_string` |
| `enemy_name` | call/expression | `tostring(configured_boss_name)` |
| `direction` | expression/reference | `properties[Constants.CustomProperties.Direction] or "Down"` |
| `spawn_mode` | expression/reference | `properties[Constants.CustomProperties.SpawnMode] or "Immediate"` |
| `trigger_boss_object_id` | call/expression | `normalized_reference(properties[Constants.CustomProperties.TriggerBoss])` |
| `x` | expression/reference | `object.x` |
| `y` | expression/reference | `object.y` |
| `z` | expression/reference | `object.z` |
| `offset_x` | call/expression | `tonumber(properties[Constants.CustomProperties.SpawnOffsetX]) or 0` |
| `offset_y` | call/expression | `tonumber(properties[Constants.CustomProperties.SpawnOffsetY]) or 0` |
| `offset_z` | call/expression | `tonumber(properties[Constants.CustomProperties.SpawnOffsetZ]) or 0` |
| `auto_face_player` | expression/reference | `properties[Constants.CustomProperties.AutoFacePlayer] == true or properties[Constants.CustomProperties.AutoFacePlayer] == "true"` |
| `max_health_override` | call/expression | `tonumber(properties[Constants.CustomProperties.BossHealthOverride]) or 0` |
| `spawn_enabled` | call/expression | `not (properties[Constants.CustomProperties.SpawnEnabled] == false or properties[Constants.CustomProperties.SpawnEnabled] == "false")` |
| `display_name` | call/expression | `tostring(properties[Constants.CustomProperties.BossDisplayName] or "")` |
| `panel` | expression/reference | `new_panel` |
| `spawned` | boolean literal | `false` |
| `defeated` | boolean literal | `false` |

### `position` *(line 1062)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `object.x` |
| `y` | expression/reference | `object.y` |
| `z` | expression/reference | `object.z` |

### `position` *(line 1157)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `definition.x + definition.offset_x` |
| `y` | expression/reference | `definition.y + definition.offset_y` |
| `z` | expression/reference | `definition.z + definition.offset_z` |

### `self.points_gauges` *(line 1304)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_ids` *(line 1333)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_session.shadowsteps` *(line 1434)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/instance.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
