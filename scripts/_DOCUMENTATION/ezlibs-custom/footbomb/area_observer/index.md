# 🗺️ `area_observer.lua` — FootBomb area identity and transfer diagnostics

[⬅ FootBomb index](../index.md) · [📖 Tiled/area setup](../AREA_SETUP.md)

**File:** `scripts/ezlibs-custom/footbomb/area_observer.lua`  
**Required only by:** `scripts/ezlibs-custom/footbomb/main.lua`  
**Lua:** 5.2-compatible module, no network event listeners registered here.

## Contents

- [How area identity is established](#how-area-identity-is-established)
- [Functions and arguments](#functions-and-arguments)
- [Returned diagnostic table](#returned-diagnostic-table)
- [Integration](#integration)

## How area identity is established

A **source** is any area where `object_registry` identified a `FootBomb Controller` or legacy `FootBomb Ref` Tiled object. A **match instance** is an `EzMapInstance` record with `metadata.game == "footbomb"`. Prefixes, hardcoded area names, and per-transfer scans are *not* used for source recognition.

## Functions and arguments

| API | Parameters | Returns | Purpose |
|---|---|---|---|
| `AreaObserver.new(options)` | `options.log` (function, optional); `options.instances` (EzMapInstance module); `options.default_instance_map` (string, optional) | Observer instance | Initializes independent object discovery, transition tracking and diagnostic logging |
| `observer:register_source(area_id, object)` | `area_id` (nonempty string); Tiled `object` (table with `id`, `type`, `custom_properties`) | Boolean | Called once per authored referee by `object_registry`; duplicate registrations by ID are ignored |
| `observer:describe(area_id)` | `area_id` (string or nil) | Diagnostic table | Reads known source objects and instance metadata |
| `observer:role(area_id)` | `area_id` | `"source"`, `"instance"`, or `nil` | Lightweight classification for asset preloading |
| `observer:observe_player(event_name, player_id, area_id)` | Event string, player ID, current area ID | Area role or `nil` | Logs relevant joins/transfers with previous area and instance tracking; remembers last observed area |
| `observer:forget_player(player_id)` | Player ID | — | Discards state on disconnect |

## Returned diagnostic table

`observer:describe(area_id)` returns a table with:

| Key | Type | Meaning |
|---|---|---|
| `area_id` | string/nil | Queried area |
| `role` | string/nil | Source, instance or other |
| `instance_id` | string/nil | FootBomb `EzMapInstance` identifier (instances only) |
| `template_area` | string/nil | Original cloned map (`record.base_area_id`) |
| `source_referees` | string | Comma-separated `object_id:type`, or `none` |
| `source_referee_count` | number | Number of Tiled referee objects registered for this area |
| `source_templates` | string | List of `Instance Map` values configured on source objects |

### Integration

The FootBomb entry point creates one observer and passes actual `EzMapInstance` and logger dependencies. Referee handler registrations call `observer:register_source` at object-cache initialization. Existing `handle_player_join`, `handle_player_transfer`, and `handle_player_disconnect` delegate observation to this module. Other gameplay scripts can use read-only `FootBomb.get_area_role` and `FootBomb.get_area_diagnostic`, without importing the observer itself.

See [AREA_SETUP.md](../AREA_SETUP.md) for actual Tiled properties, map object IDs, train setup and the expected log examples.
