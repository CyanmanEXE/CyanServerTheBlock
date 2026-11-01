# `ezmapinstance.lua`

> **Source:** `scripts/ezlibs-scripts/ezmapinstance.lua`  
> **Source lines:** 555  
> **Functions detected:** 42  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezmapinstance.lua Reusable map cloning, instance ownership, host/party metadata, and lifecycle. This module intentionally does not register Net event handlers. Call its API from a plugin or game module that owns the instance's gameplay behavior. Event surfaces (backed by ezemitter): EzMapInstance.events            -- global; every instance event, args begin with instance_id record.events / record:on(...)  -- per-instance; args omit instance_id Built-in lifecycle events (emitted on both surfaces): "created"             record: ()                        global: (instance_id) "removed"             record: ()                        global: (instance_id) "player_joined"       record: (player_id)               global: (instance_id, player_id) "player_left"         record: (player_id)               global: (instance_id, player_id) "host_changed"        record: (new, old)                global: (instance_id, new, old) "player_transferred"  record: (player_id, x, y, z)      global: (instance_id, player_id, x, y, z) Custom events may be emitted with EzMapInstance.emit(...) or record:emit(...). Custom events are NOT mirrored across surfaces automatically.

## Dependencies

- `scripts/ezlibs-scripts/ezmemory` — loaded defensively during successful instance removal to clear per-area and per-player memory.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 62 | `error_handler` | `(none)` |
| 65 | `EzMapInstance.set_error_handler` | `handler` |
| 69 | `safe_emit` | `emitter, ...` |
| 78 | `emit_event` | `record, event, ...` |
| 85 | `valid_id` | `value` |
| 89 | `copy_array` | `values` |
| 99 | `area_id_is_listed` | `area_id` |
| 118 | `find_available_id` | `preferred_id` |
| 131 | `forget_player` | `instance_id, player_id` |
| 141 | `record_mt:on` | `event, callback` |
| 146 | `record_mt:once` | `event, callback` |
| 151 | `record_mt:on_any` | `callback` |
| 156 | `record_mt:on_any_once` | `callback` |
| 161 | `record_mt:off` | `event, callback` |
| 166 | `record_mt:off_any` | `callback` |
| 172 | `record_mt:emit` | `event, ...` |
| 180 | `record_mt:async_iter` | `event` |
| 186 | `record_mt:async_iter_all` | `(none)` |
| 195 | `EzMapInstance.on` | `event, callback` |
| 200 | `EzMapInstance.once` | `event, callback` |
| 205 | `EzMapInstance.on_any` | `callback` |
| 210 | `EzMapInstance.on_any_once` | `callback` |
| 215 | `EzMapInstance.off` | `event, callback` |
| 220 | `EzMapInstance.off_any` | `callback` |
| 226 | `EzMapInstance.emit` | `event, ...` |
| 233 | `EzMapInstance.async_iter` | `event` |
| 238 | `EzMapInstance.async_iter_all` | `(none)` |
| 254 | `EzMapInstance.create` | `base_area_id, preferred_instance_id, options` |
| 315 | `EzMapInstance.get` | `instance_id` |
| 320 | `EzMapInstance.exists` | `instance_id` |
| 326 | `EzMapInstance.is_valid` | `instance_id` |
| 338 | `EzMapInstance.get_for_player` | `player_id` |
| 347 | `EzMapInstance.list` | `(none)` |
| 357 | `EzMapInstance.set_host` | `instance_id, player_id` |
| 370 | `EzMapInstance.get_host` | `instance_id` |
| 375 | `EzMapInstance.is_host` | `instance_id, player_id` |
| 382 | `EzMapInstance.register_player` | `instance_id, player_id` |
| 412 | `EzMapInstance.unregister_player` | `instance_id, player_id` |
| 444 | `EzMapInstance.add_player` | `instance_id, player_id` |
| 448 | `EzMapInstance.remove_player` | `instance_id, player_id` |
| 455 | `EzMapInstance.transfer_player` | `instance_id, player_id, x, y, z, warp_in` |
| 490 | `EzMapInstance.remove` | `instance_id` |

### Function notes

- **`error_handler()`** *(source line 62)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.set_error_handler(handler)`** — - Route listener errors somewhere safe. Defaults to silent no-op. *(source line 65)*
- **`safe_emit(emitter, ...)`** *(source line 69)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`emit_event(record, event, ...)`** — - Fire an event on both the per-instance and global emitters. *(source line 78)*
- **`valid_id(value)`** *(source line 85)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`copy_array(values)`** *(source line 89)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`area_id_is_listed(area_id)`** *(source line 99)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`find_available_id(preferred_id)`** *(source line 118)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`forget_player(instance_id, player_id)`** *(source line 131)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`record_mt:on(event, callback)`** — --------------------------------------------------------------------------- Per-record convenience methods (delegate to record.events) --------------------------------------------------------------------------- *(source line 141)*
- **`record_mt:once(event, callback)`** *(source line 146)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`record_mt:on_any(callback)`** *(source line 151)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`record_mt:on_any_once(callback)`** *(source line 156)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`record_mt:off(event, callback)`** *(source line 161)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`record_mt:off_any(callback)`** *(source line 166)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`record_mt:emit(event, ...)`** — - Emit a custom event on this instance only. *(source line 172)*
- **`record_mt:async_iter(event)`** — - Create an async iterator scoped to a single event on this instance. *(source line 180)*
- **`record_mt:async_iter_all()`** — - Create an async iterator for every event on this instance. *(source line 186)*
- **`EzMapInstance.on(event, callback)`** — --------------------------------------------------------------------------- Global convenience methods (delegate to EzMapInstance.events) --------------------------------------------------------------------------- *(source line 195)*
- **`EzMapInstance.once(event, callback)`** *(source line 200)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.on_any(callback)`** *(source line 205)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.on_any_once(callback)`** *(source line 210)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.off(event, callback)`** *(source line 215)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.off_any(callback)`** *(source line 220)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.emit(event, ...)`** — - Emit a custom event on the global surface only. *(source line 226)*
- **`EzMapInstance.async_iter(event)`** — - Async iterator for a single event across all instances. *(source line 233)*
- **`EzMapInstance.async_iter_all()`** — - Async iterator for every instance event. *(source line 238)*
- **`EzMapInstance.create(base_area_id, preferred_instance_id, options)`** — - Clone a source area and register a new logical instance. - Returns instance_record on success, or nil, error_message on failure. - - options: -   host_id     - ID of the instance host/leader -   player_ids  - initial player IDs (ordered; host defaults to first member) -   party_id    - optional external party identifier -   metadata    - optional caller-owned metadata table *(source line 254)*
- **`EzMapInstance.get(instance_id)`** — - Return an instance record by its cloned area ID. *(source line 315)*
- **`EzMapInstance.exists(instance_id)`** — - True when this module currently owns a registered instance record. *(source line 320)*
- **`EzMapInstance.is_valid(instance_id)`** — - True when the record exists and its cloned area is still listed by Net. - If Net.list_areas is unavailable, the registered record remains authoritative. *(source line 326)*
- **`EzMapInstance.get_for_player(player_id)`** — - Return the instance record currently associated with a player ID. *(source line 338)*
- **`EzMapInstance.list()`** — - Return a shallow array of all registered instance records. *(source line 347)*
- **`EzMapInstance.set_host(instance_id, player_id)`** — - Set or change the recorded host. The caller controls host election policy. - Emits "host_changed" when the host actually changes. *(source line 357)*
- **`EzMapInstance.get_host(instance_id)`** *(source line 370)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.is_host(instance_id, player_id)`** *(source line 375)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.register_player(instance_id, player_id)`** — - Add a player to an instance's membership tracking. - Emits "player_joined" only for newly-added members (not for re-registration). *(source line 382)*
- **`EzMapInstance.unregister_player(instance_id, player_id)`** — - Remove a player from membership tracking. This does not transfer the player. - Emits "player_left" if the player was a member, and "host_changed" if the - leaving player was the host. *(source line 412)*
- **`EzMapInstance.add_player(instance_id, player_id)`** — Naming aliases make membership intent clearer for callers while preserving the original register/unregister API used by FootBomb. *(source line 444)*
- **`EzMapInstance.remove_player(instance_id, player_id)`** *(source line 448)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EzMapInstance.transfer_player(instance_id, player_id, x, y, z, warp_in)`** — - Transfer a player to the cloned area at an explicit position. - Coordinates are required because spawn selection belongs to the caller. - Emits "player_joined" (via register_player) and "player_transferred". *(source line 455)*
- **`EzMapInstance.remove(instance_id)`** — Removes the cloned area and its registry entries. After the engine confirms removal, clears the area's global memory files and every loaded player's matching `area_memory` entry, then emits `removed` before registry state is torn down. *(source line 490)*

## Tables and data structures

### `EzMapInstance` *(line 41)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `EzMapInstance.EVENT` *(line 45)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `CREATED` | string literal | `"created"` |
| `REMOVED` | string literal | `"removed"` |
| `PLAYER_JOINED` | string literal | `"player_joined"` |
| `PLAYER_LEFT` | string literal | `"player_left"` |
| `HOST_CHANGED` | string literal | `"host_changed"` |
| `PLAYER_TRANSFERRED` | string literal | `"player_transferred"` |

### `instances` *(line 56)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_to_instance` *(line 59)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `record_mt` *(line 60)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `result` *(line 90)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `result` *(line 348)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezmapinstance.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
