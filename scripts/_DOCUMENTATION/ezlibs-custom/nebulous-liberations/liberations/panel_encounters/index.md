# `panel_encounters.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_encounters.lua`  
> **Source lines:** 290  
> **Functions detected:** 9  
> **Table declarations detected:** 12

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

[[

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/ezconfig` — line 3
- `scripts/ezlibs-scripts/ezencounters/main` — line 190

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 65 | `has_dark_panel` | `instance, x, y, z` |
| 69 | `includes` | `values, value` |
| 80 | `PanelEncounters.resolve_terrain` | `instance, player` |
| 109 | `candidate_area_keys` | `base_area_id` |
| 124 | `load_area_encounter_table` | `base_area_id` |
| 152 | `pick_encounter` | `encounter_table, category` |
| 188 | `PanelEncounters.resolve_encounter_value` | `reference` |
| 197 | `PanelEncounters.resolve_encounter` | `base_area_id, category` |
| 248 | `startup_diagnostic` | `(none)` |

### Function notes

- **`has_dark_panel(instance, x, y, z)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`includes(values, value)`** *(source line 69)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PanelEncounters.resolve_terrain(instance, player)`** *(source line 80)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`candidate_area_keys(base_area_id)`** *(source line 109)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_area_encounter_table(base_area_id)`** *(source line 124)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`pick_encounter(encounter_table, category)`** *(source line 152)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PanelEncounters.resolve_encounter_value(reference)`** — Used by instance.lua for the per-panel "Encounter Path" custom property override. Routes through ezencounters.resolve_encounter so named encounters registered via encounters/*.lua resolve to their full definition (with battle data), while raw paths fall back to {path = ref}. *(source line 188)*
- **`PanelEncounters.resolve_encounter(base_area_id, category)`** *(source line 197)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`startup_diagnostic()`** — Startup diagnostic: for every area that looks like a liberation base (has a Liberation Tileset custom property), report whether ezencounters can see an encounter file for it and how many encounters it declares. *(source line 248)*

## Tables and data structures

### `PanelEncounters` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `encounters` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "ACDC4Liberation", path = "scripts/ezlibs-assets/ezencounters/ezencounters.zip", weight = 1, enemies = { { name = "NormalNavi", ran…` |

### `enemies` *(line 20)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "NormalNavi", rank = 1 }` |

### `bosses` *(line 26)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "ShadeManBattle", path = "scripts/ezlibs-assets/ezencounters/ezencounters.zip", weight = 1, enemies = { { name = "ShadeMan", rank =…` |

### `enemies` *(line 31)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "ShadeMan", rank = 1 }` |

### `special_encounters` *(line 37)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "BigBruteBattle", path = "scripts/ezlibs-assets/ezencounters/ezencounters.zip", weight = 1, enemies = { { name = "BigBrute", rank =…` |

### `enemies` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "BigBrute", rank = 1 }` |

### `corner_offsets` *(line 57)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ 1, -1 }` |
| `[2]` | table | `{ 1, 1 }` |
| `[3]` | table | `{ -1, -1 }` |
| `[4]` | table | `{ -1, 1 }` |

### `panel_type_table` *(line 68)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Dark Panel"` |
| `[2]` | string literal | `"Dark Hole"` |
| `[3]` | string literal | `"Indestructible Panel"` |
| `[4]` | string literal | `"Item Panel"` |
| `[5]` | string literal | `"Trap Panel"` |

### `area_table_cache` *(line 107)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keys` *(line 110)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 240)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_encounters.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
