# `ezpushback.lua`

> **Source:** `scripts/ezlibs-scripts/eznpcs/ezpushback.lua`  
> **Source lines:** 858  
> **Functions detected:** 33  
> **Table declarations detected:** 15

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezpushback.lua A Pushback NPC uses the regular eznpcs NPC pipeline, with a moving rectangle trigger that follows its bot. On collision, a temporary bot uses the player's own avatar, plays a movement animation, and carries the player to its endpoint. Visibility during pushback: the real player's scale is set to (0, 0) with Net.animate_player_properties (duration 0). The engine exposes no reader for player scale, so on cleanup we do NOT restore a saved snapshot — instead we recompute the correct scale from world state at that moment: 1. Compression Tile at the player's current position (ezpress.get_tile_state_at) 2. Area "Size Mode" (ezpress.get_area_scale_state, or direct read) 3. Normal (1, 1) as a final fallback We attempt ezpress.set_scale_state(target_state) first — if it returns true, it wrote the physical scale AND updated its own tracked state in one step. If it returns false (no-op) or ezpress is absent, we force-write the target scale directly via Net.animate_player_properties. This bypass is REQUIRED because ezpress's tracked state is stale after our shrink (it thinks the player is at e.g. "normal" while they are physically at 0), so its no-op would otherwise leave the player invisible. Pushback NPCs may also be produced by an NPC Spawner. The spawner emits `npc_spawned_from_spawner` for each successful spawn; ezpushback listens for events whose template_type is "Pushback NPC" and attaches a bot-scoped moving collision zone to the new bot. Entries created this way are torn down automatically on `bot_removed`.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 29
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 30
- `scripts/ezlibs-scripts/ezbus` — line 31
- `scripts/ezlibs-scripts/ezemitter` — line 32
- `scripts/ezlibs-scripts/object_registry` — line 33
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 34
- `scripts/ezlibs-scripts/utils/eztiledutils` — line 35

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 64 | `number_property` | `props, name, default, min_value` |
| 70 | `safe_call` | `fn, ...` |
| 75 | `get_area_players` | `area_id` |
| 81 | `provide_avatar_to_area` | `area_id, avatar` |
| 89 | `remove_bot` | `bot_id` |
| 93 | `event_for` | `entry, player_id, extra` |
| 107 | `emit_entry` | `entry, name, event` |
| 133 | `get_ezpress` | `(none)` |
| 155 | `set_player_scale_immediate` | `player_id, sx, sy` |
| 176 | `read_area_size_mode_state` | `area_id` |
| 191 | `resolve_target_scale_state` | `area_id, pos` |
| 221 | `restore_player_scale` | `player_id, area_id` |
| 292 | `map_vector_to_screen` | `dx, dy` |
| 297 | `screen_vector_to_map` | `sx, sy` |
| 302 | `atan2` | `y, x` |
| 323 | `snap_to_canonical_map` | `dx, dy` |
| 334 | `direction_vector` | `direction` |
| 349 | `get_push_vector` | `entry, player_pos, npc_pos, player_direction` |
| 370 | `calculate_target` | `entry, player_pos, npc_pos, player_direction` |
| 390 | `cleanup_push` | `player_id, state, reason, restore_player` |
| 423 | `perform_pushback` | `entry, player_id` |
| 580 | `update_entry_geometry` | `entry` |
| 605 | `build_pushback_entry` | `area_id, object_id, props, bot_id, trigger_id, template_name, initial_x, initial_y, initial_z` |
| 663 | `ezpushback.attach_behavior` | `area_id, object_id, props, bot_id, x, y, z, name` |
| 691 | `register_pushback_npc` | `area_id, object` |
| 777 | `ezpushback.get_emitter` | `area_id, object_id` |
| 784 | `ezpushback.get_emitter_for_bot` | `bot_id` |
| 794 | `ezpushback.set_collision_enabled` | `area_id, object_id, enabled` |
| 802 | `ezpushback.handle_player_move` | `player_id, x, y, z` |
| 807 | `ezpushback.on_tick` | `delta_time` |
| 829 | `ezpushback.handle_player_join` | `player_id` |
| 836 | `ezpushback.handle_player_transfer` | `player_id` |
| 843 | `ezpushback.handle_player_disconnect` | `player_id` |

### Function notes

- **`number_property(props, name, default, min_value)`** — Same call contract as before; the value parsing lives in tiled_utils. *(source line 64)*
- **`safe_call(fn, ...)`** *(source line 70)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_area_players(area_id)`** *(source line 75)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`provide_avatar_to_area(area_id, avatar)`** *(source line 81)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_bot(bot_id)`** *(source line 89)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`event_for(entry, player_id, extra)`** *(source line 93)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`emit_entry(entry, name, event)`** *(source line 107)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_ezpress()`** *(source line 133)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_player_scale_immediate(player_id, sx, sy)`** — Write the player's scale immediately (duration 0). Returns false if the underlying Net.animate_player_properties API is unavailable or fails, so callers can decide whether to abort an in-progress interaction. *(source line 155)*
- **`read_area_size_mode_state(area_id)`** — Direct Size Mode read used only when ezpress is missing (Compression Tiles are an ezpress feature, so without ezpress there is nothing else to check). *(source line 176)*
- **`resolve_target_scale_state(area_id, pos)`** — Determine the scale state the player should be at, given their current world position. Preference: Compression Tile → Area Size Mode → normal. Returns (state, source_label). *(source line 191)*
- **`restore_player_scale(player_id, area_id)`** — Recompute and apply the player's scale from current world state. Resolves area and position fresh so an area transfer mid-cleanup restores against the new area, not the one captured at push start.  Returns (ok, source) where source is one of: "compression_tile" | "area_size_mode" | "area_size_mode_direct" "fallback_normal" | "no_player" | "failed" *(source line 221)*
- **`map_vector_to_screen(dx, dy)`** *(source line 292)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`screen_vector_to_map(sx, sy)`** *(source line 297)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`atan2(y, x)`** *(source line 302)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`snap_to_canonical_map(dx, dy)`** *(source line 323)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`direction_vector(direction)`** *(source line 334)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_push_vector(entry, player_pos, npc_pos, player_direction)`** *(source line 349)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`calculate_target(entry, player_pos, npc_pos, player_direction)`** *(source line 370)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cleanup_push(player_id, state, reason, restore_player)`** *(source line 390)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`perform_pushback(entry, player_id)`** *(source line 423)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_entry_geometry(entry)`** *(source line 580)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_pushback_entry(area_id, object_id, props, bot_id, trigger_id, template_name, initial_x, initial_y, initial_z)`** — Shared entry builder. Used by both the map-loaded Pushback NPC path (register_pushback_npc) and the spawner-created path (npc_spawned_from_spawner). Callers choose the trigger_id and initial position; everything else (dimensions, timings, enabling, emitter wiring) comes from the props table. *(source line 605)*
- **`ezpushback.attach_behavior(area_id, object_id, props, bot_id, x, y, z, name)`** — Public adapter used by the composable NPC Behavior system. The behavior object owns configuration; this module continues to own trigger mechanics, push animation, cooldowns, and cleanup. Legacy Pushback NPC objects use the same builder below. *(source line 663)*
- **`register_pushback_npc(area_id, object)`** *(source line 691)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.get_emitter(area_id, object_id)`** *(source line 777)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.get_emitter_for_bot(bot_id)`** — Look up the emitter for a spawner-created pushback entry by bot id. Handy for scripted reactions that already track a spawner's bots. *(source line 784)*
- **`ezpushback.set_collision_enabled(area_id, object_id, enabled)`** *(source line 794)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.handle_player_move(player_id, x, y, z)`** *(source line 802)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.on_tick(delta_time)`** *(source line 807)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.handle_player_join(player_id)`** *(source line 829)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.handle_player_transfer(player_id)`** *(source line 836)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpushback.handle_player_disconnect(player_id)`** *(source line 843)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezpushback` *(line 36)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `entries` *(line 38)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `active_by_player` *(line 39)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `cooldowns` *(line 40)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `SCALE_STATES` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `normal` | number literal | `1` |
| `compressed` | number literal | `3 / 8` |
| `enlarged` | number literal | `2` |

### `event` *(line 94)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `area_id` | expression/reference | `entry.area_id` |
| `object_id` | expression/reference | `entry.object_id` |
| `npc_bot_id` | expression/reference | `entry.bot_id` |
| `trigger_id` | expression/reference | `entry.trigger_id` |

### `properties` *(line 164)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "ScaleX", value = sx, ease = "Linear" }` |
| `[2]` | table | `{ property = "ScaleY", value = sy, ease = "Linear" }` |

### `CANONICAL_DIRECTIONS` *(line 306)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = 'DownRight', x = 1, y = 0 }` |
| `[2]` | table | `{ name = 'Down', x = 0.70710678, y = 0.70710678 }` |
| `[3]` | table | `{ name = 'DownLeft', x = 0, y = 1 }` |
| `[4]` | table | `{ name = 'Left', x = -0.70710678, y = 0.70710678 }` |
| `[5]` | table | `{ name = 'UpLeft', x = -1, y = 0 }` |
| `[6]` | table | `{ name = 'Up', x = -0.70710678, y = -0.70710678 }` |
| `[7]` | table | `{ name = 'UpRight', x = 0, y = -1 }` |
| `[8]` | table | `{ name = 'Right', x = 0.70710678, y = -0.70710678 }` |

### `OPPOSITE_DIRECTION` *(line 317)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DownRight` | string literal | `'UpLeft'` |
| `Down` | string literal | `'Up'` |
| `DownLeft` | string literal | `'UpRight'` |
| `Left` | string literal | `'Right'` |
| `UpLeft` | string literal | `'DownRight'` |
| `Up` | string literal | `'Down'` |
| `UpRight` | string literal | `'DownLeft'` |
| `Right` | string literal | `'Left'` |

### `state` *(line 454)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `area_id` | expression/reference | `entry.area_id` |
| `entry` | expression/reference | `entry` |
| `bot_id` | expression/reference | `temp_bot_id` |
| `start_position` | table | `{ x = player_pos.x, y = player_pos.y, z = player_pos.z or 0 }` |
| `target_position` | expression/reference | `target` |
| `original_direction` | expression/reference | `player_direction` |
| `was_input_locked` | call/expression | `(type(Net.is_player_input_locked) == 'function' and Net.is_player_input_locked(player_id)) or false` |
| `avatar` | expression/reference | `avatar` |
| `cleaned` | boolean literal | `false` |
| `transferring` | boolean literal | `false` |
| `shrunk` | boolean literal | `false` |

### `start_position` *(line 459)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `player_pos.x` |
| `y` | expression/reference | `player_pos.y` |
| `z` | expression/reference | `player_pos.z or 0` |

### `properties` *(line 517)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = 'X', value = target.x, ease = 'Out' }` |
| `[2]` | table | `{ property = 'Y', value = target.y, ease = 'Out' }` |
| `[3]` | table | `{ property = 'Z', value = target.z, ease = 'Linear' }` |

### `final_pos` *(line 545)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(bot_pos.x)` |
| `y` | call/expression | `tonumber(bot_pos.y)` |
| `z` | call/expression | `tonumber(bot_pos.z) or target.z` |
| `direction` | expression/reference | `target.direction` |

### `trigger_object` *(line 611)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `trigger_id` |
| `name` | call/expression | `template_name or ('Pushback NPC ' .. tostring(object_id))` |
| `x` | call/expression | `(tonumber(initial_x) or 0) - width / 2` |
| `y` | call/expression | `(tonumber(initial_y) or 0) - height / 2` |
| `z` | call/expression | `tonumber(initial_z) or 0` |
| `width` | expression/reference | `width` |
| `height` | expression/reference | `height` |

### `entry` *(line 622)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `key` | expression/reference | `trigger_id` |
| `trigger_id` | expression/reference | `trigger_id` |
| `area_id` | expression/reference | `area_id` |
| `object_id` | expression/reference | `object_id` |
| `bot_id` | expression/reference | `bot_id` |
| `width` | expression/reference | `width` |
| `height` | expression/reference | `height` |
| `push_distance` | call/expression | `number_property(props` |
| `[9]` | string literal | `'Push Distance'` |
| `[10]` | expression/reference | `DEFAULT_PUSH_DISTANCE` |
| `[11]` | number literal | `0.1)` |
| `push_duration` | call/expression | `number_property(props` |
| `[13]` | string literal | `'Push Duration'` |
| `[14]` | expression/reference | `DEFAULT_PUSH_DURATION` |
| `[15]` | number literal | `0.05)` |
| `cooldown` | call/expression | `number_property(props` |
| `[17]` | string literal | `'Push Cooldown'` |
| `[18]` | expression/reference | `DEFAULT_COOLDOWN` |
| `[19]` | number literal | `0)` |
| `move_state` | expression/reference | `props['Move Animation State'] or DEFAULT_MOVE_STATE` |
| `enabled` | call/expression | `truthy(props['Collision Enabled']` |
| `[22]` | expression/reference | `true)` |
| `trigger_object` | expression/reference | `trigger_object` |
| `emitter` | expression/reference | `emitter` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/eznpcs/ezpushback.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
