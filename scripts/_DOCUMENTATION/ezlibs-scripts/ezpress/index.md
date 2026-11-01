# `ezpress.lua`

> **Source:** `scripts/ezlibs-scripts/ezpress.lua`  
> **Source lines:** 829  
> **Functions detected:** 39  
> **Table declarations detected:** 18

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezpress.lua Player compression/decompression driven by Tiled object properties and area properties. Uses eztriggers for player tile events, ezbottriggers for bot tile events, ezemitter for module-local events, and ezbus for cross-module notifications. Scale states: normal     -> ScaleX/Y = 1 compressed -> ScaleX/Y = 3/8  (Minish-size) enlarged   -> ScaleX/Y = 2    (Giant-size) Area properties: "Size Mode" (enum CompressionMode: Compress | Normalize | Enlarge) Sets the default scale state for the whole area. Unset -> normal. "Size Mode Scope" (enum SizeModeScope: Player | Area Wide) "Player"    -> area default affects players only. (default) "Area Wide" -> area default also applies to NPCs / bots in the area. Compression Tile object properties: "Mode" = "Compress" | "Normalize" | "Enlarge"   (CompressionMode enum) Legacy boolean "Compress"/"Decompress" is still supported for old maps. Each Compression Tile registers TWO triggers, both at the same rectangle: * A player trigger via eztriggers (affects the player standing in it). * A bot trigger    via ezbottriggers (affects NPCs standing in it). Departing a tile falls back to the area's Size Mode when its scope is Area Wide, and to normal otherwise. Overlapping tiles are resolved by re-checking the entity's current position, mirroring eztriggers/ezbottriggers.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 30
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 31
- `scripts/ezlibs-scripts/ezbus` — line 32
- `scripts/ezlibs-scripts/ezemitter` — line 33

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 72 | `is_true` | `value` |
| 82 | `normalize_size_mode` | `value` |
| 92 | `normalize_size_mode_scope` | `value` |
| 101 | `emit_event` | `name, payload` |
| 106 | `ezpress:on` | `event_name, callback` |
| 111 | `ezpress:once` | `event_name, callback` |
| 120 | `ezpress.get_area_scale_state` | `area_id` |
| 130 | `ezpress.get_area_size_mode_scope` | `area_id` |
| 144 | `animate_scale` | `player_id, scale, immediate` |
| 157 | `ezpress.set_scale_state` | `player_id, state, immediate, metadata` |
| 203 | `ezpress.get_scale_state` | `player_id` |
| 208 | `ezpress.is_compressed` | `player_id` |
| 212 | `ezpress.is_enlarged` | `player_id` |
| 216 | `ezpress.compress` | `player_id, immediate, metadata` |
| 220 | `ezpress.decompress` | `player_id, immediate, metadata` |
| 224 | `ezpress.enlarge` | `player_id, immediate, metadata` |
| 232 | `animate_bot_scale` | `bot_id, scale, immediate` |
| 254 | `ezpress.set_bot_scale_state` | `bot_id, state, immediate, metadata` |
| 296 | `ezpress.get_bot_scale_state` | `bot_id` |
| 305 | `position_matches_trigger` | `pos, trigger` |
| 316 | `get_matching_tile` | `area_id, pos` |
| 334 | `ezpress.get_tile_state_at` | `area_id, pos` |
| 344 | `ezpress.check_and_apply` | `player_id, area_id, pos, immediate` |
| 367 | `reconcile_from_current_position` | `player_id, source, immediate` |
| 387 | `on_trigger_transition` | `area_id, trigger, transition, event` |
| 414 | `apply_bot_area_fallback` | `bot_id, area_id, immediate, source` |
| 431 | `reconcile_bot_from_position` | `bot_id, area_id, pos, source, immediate` |
| 465 | `on_bot_trigger_transition` | `area_id, trigger, transition, event` |
| 497 | `add_area_trigger` | `area_id, object_id, obj, target_state` |
| 577 | `read_tile_state_from_properties` | `props` |
| 591 | `ezpress.apply_area_scale_to_bots` | `area_id, immediate, metadata` |
| 644 | `ezpress.apply_map_property` | `player_id, area_id, immediate, extra_metadata` |
| 665 | `ezpress.handle_bot_created` | `bot_id, area_id, x, y, z` |
| 709 | `ezpress.handle_bot_removed` | `bot_id` |
| 734 | `ezpress.handle_player_join` | `player_id` |
| 750 | `ezpress.handle_player_transfer` | `player_id` |
| 764 | `ezpress.handle_player_move` | `player_id, x, y, z` |
| 787 | `ezpress.handle_player_disconnect` | `player_id` |
| 798 | `scan_areas` | `(none)` |

### Function notes

- **`is_true(value)`** *(source line 72)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_size_mode(value)`** — Normalize any CompressionMode enum value (or loose spelling) to a scale state. *(source line 82)*
- **`normalize_size_mode_scope(value)`** — Normalize the SizeModeScope enum value ("Player" | "Area Wide"). *(source line 92)*
- **`emit_event(name, payload)`** *(source line 101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress:on(event_name, callback)`** *(source line 106)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress:once(event_name, callback)`** *(source line 111)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.get_area_scale_state(area_id)`** — --------------------------------------------------------------------------- Area property helpers --------------------------------------------------------------------------- *(source line 120)*
- **`ezpress.get_area_size_mode_scope(area_id)`** *(source line 130)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animate_scale(player_id, scale, immediate)`** — --------------------------------------------------------------------------- Player scale state machine --------------------------------------------------------------------------- *(source line 144)*
- **`ezpress.set_scale_state(player_id, state, immediate, metadata)`** *(source line 157)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.get_scale_state(player_id)`** *(source line 203)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.is_compressed(player_id)`** *(source line 208)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.is_enlarged(player_id)`** *(source line 212)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.compress(player_id, immediate, metadata)`** *(source line 216)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.decompress(player_id, immediate, metadata)`** *(source line 220)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.enlarge(player_id, immediate, metadata)`** *(source line 224)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animate_bot_scale(bot_id, scale, immediate)`** — --------------------------------------------------------------------------- Bot (NPC) scale state machine --------------------------------------------------------------------------- *(source line 232)*
- **`ezpress.set_bot_scale_state(bot_id, state, immediate, metadata)`** *(source line 254)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.get_bot_scale_state(bot_id)`** *(source line 296)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`position_matches_trigger(pos, trigger)`** — --------------------------------------------------------------------------- Tile lookup helpers --------------------------------------------------------------------------- *(source line 305)*
- **`get_matching_tile(area_id, pos)`** *(source line 316)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.get_tile_state_at(area_id, pos)`** — Public: read-only lookup for external modules that need to know what scale a player "should" be at for a given world position. Returns the tile's scale state ("normal" | "compressed" | "enlarged"), or nil when no tile overlaps the position. Does not mutate any internal state, does not write to the player, and does not fire events. ezpushback uses this to compute the correct restore scale after a pushback teleport, since the engine has no reader for the player's actual ScaleX/ScaleY. *(source line 334)*
- **`ezpress.check_and_apply(player_id, area_id, pos, immediate)`** — --------------------------------------------------------------------------- Player tile reconciliation --------------------------------------------------------------------------- *(source line 344)*
- **`reconcile_from_current_position(player_id, source, immediate)`** *(source line 367)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_trigger_transition(area_id, trigger, transition, event)`** *(source line 387)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`apply_bot_area_fallback(bot_id, area_id, immediate, source)`** — Fallback used when a bot leaves a tile: apply the area's Size Mode when the area's scope includes bots, and normalize otherwise. *(source line 414)*
- **`reconcile_bot_from_position(bot_id, area_id, pos, source, immediate)`** — Reconcile a bot's scale from a known position (from an ezbottriggers event) so overlapping tiles resolve correctly. If pos is nil, the caller should have supplied the position from the trigger event. *(source line 431)*
- **`on_bot_trigger_transition(area_id, trigger, transition, event)`** *(source line 465)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`add_area_trigger(area_id, object_id, obj, target_state)`** — --------------------------------------------------------------------------- Trigger registration (both player and bot) --------------------------------------------------------------------------- *(source line 497)*
- **`read_tile_state_from_properties(props)`** — --------------------------------------------------------------------------- Tile property parsing (new enum + legacy booleans) --------------------------------------------------------------------------- *(source line 577)*
- **`ezpress.apply_area_scale_to_bots(area_id, immediate, metadata)`** — --------------------------------------------------------------------------- Apply area default (Size Mode + Size Mode Scope) --------------------------------------------------------------------------- *(source line 591)*
- **`ezpress.apply_map_property(player_id, area_id, immediate, extra_metadata)`** *(source line 644)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.handle_bot_created(bot_id, area_id, x, y, z)`** — --------------------------------------------------------------------------- Bot lifecycle (from ezbus) --------------------------------------------------------------------------- *(source line 665)*
- **`ezpress.handle_bot_removed(bot_id)`** *(source line 709)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.handle_player_join(player_id)`** — --------------------------------------------------------------------------- Player lifecycle handlers --------------------------------------------------------------------------- *(source line 734)*
- **`ezpress.handle_player_transfer(player_id)`** *(source line 750)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.handle_player_move(player_id, x, y, z)`** *(source line 764)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezpress.handle_player_disconnect(player_id)`** *(source line 787)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`scan_areas()`** — --------------------------------------------------------------------------- Startup: scan for Compression Tiles --------------------------------------------------------------------------- *(source line 798)*

## Tables and data structures

### `ezpress` *(line 42)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_scale_state` *(line 47)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bot_scale_state` *(line 49)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bots_by_area` *(line 51)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `active_tile_by_player` *(line 53)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `active_tile_by_bot` *(line 55)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `area_triggers` *(line 56)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `SCALE_STATES` *(line 63)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `normal` | expression/reference | `SCALE_NORMAL` |
| `compressed` | expression/reference | `SCALE_COMPRESSED` |
| `enlarged` | expression/reference | `SCALE_ENLARGED` |

### `properties` *(line 148)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "ScaleX", value = scale, ease = "Linear" }` |
| `[2]` | table | `{ property = "ScaleY", value = scale, ease = "Linear" }` |

### `payload` *(line 180)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `area_id` | call/expression | `(metadata and metadata.area_id) or Net.get_player_area(player_id)` |
| `state` | expression/reference | `state` |
| `previous_state` | expression/reference | `previous_state` |
| `source` | expression/reference | `metadata and metadata.source or "api"` |
| `object_id` | expression/reference | `metadata and metadata.object_id or nil` |
| `trigger_type` | expression/reference | `metadata and metadata.trigger_type or nil` |
| `immediate` | expression/reference | `immediate == true` |

### `config` *(line 234)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "ScaleX", value = scale, ease = "Linear" }, { property = "ScaleY", value = scale, ease = "Linear" } }, duratio…` |

### `properties` *(line 236)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "ScaleX", value = scale, ease = "Linear" }` |
| `[2]` | table | `{ property = "ScaleY", value = scale, ease = "Linear" }` |

### `payload` *(line 276)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `bot_id` | expression/reference | `bot_id` |
| `area_id` | expression/reference | `metadata and metadata.area_id or nil` |
| `state` | expression/reference | `state` |
| `previous_state` | expression/reference | `previous_state` |
| `source` | expression/reference | `metadata and metadata.source or "api"` |
| `immediate` | expression/reference | `immediate == true` |

### `metadata` *(line 356)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `source` | string literal | `"tile_trigger"` |
| `object_id` | expression/reference | `tile.object_id` |
| `trigger_type` | expression/reference | `tile.type` |

### `pos` *(line 488)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `event.x` |
| `y` | expression/reference | `event.y` |
| `z` | call/expression | `tonumber(event.z) or 0` |

### `trigger` *(line 498)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `object_id` | expression/reference | `object_id` |
| `x` | call/expression | `tonumber(obj.x)` |
| `y` | call/expression | `tonumber(obj.y)` |
| `z` | call/expression | `tonumber(obj.z) or 0` |
| `width` | call/expression | `tonumber(obj.width)` |
| `height` | call/expression | `tonumber(obj.height)` |
| `type` | expression/reference | `target_state` |

### `pos` *(line 680)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | call/expression | `tonumber(z) or 0` |

### `pos` *(line 768)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(x)` |
| `y` | call/expression | `tonumber(y)` |
| `z` | call/expression | `tonumber(z) or 0` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezpress.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
