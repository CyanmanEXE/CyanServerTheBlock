# `ezmystery.lua`

> **Source:** `scripts/ezlibs-scripts/ezmystery.lua`  
> **Source lines:** 398  
> **Functions detected:** 12  
> **Table declarations detected:** 11

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Robust boolean checker (case‑insensitive, accepts 1 as true)

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/ezmemory` — line 3
- `scripts/ezlibs-scripts/ezcache` — line 4
- `scripts/ezlibs-scripts/helpers` — line 5
- `scripts/ezlibs-scripts/ezlocks` — line 6
- `scripts/ezlibs-scripts/condition` — line 7
- `scripts/ezlibs-scripts/ezencounters/main` — line 8
- `math` — line 9
- `scripts/ezlibs-scripts/ezbus` — line 10
- `scripts/ezlibs-scripts/avatar_utils/main` — line 12
- `scripts/ezlibs-scripts/avatar_utils/avatar_utils` — line 13

## Events

- `Net:on("player_join", function(event) ...)` — line 74. The event name is taken directly from this source.
- `Net:on("avatar_change", function(event) ...)` — line 79. The event name is taken directly from this source.
- `Net:on("object_interaction", function(event) ...)` — line 84. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 26 | `is_property_true` | `val` |
| 40 | `resource_name` | `cost_type` |
| 47 | `object_is_mystery_data` | `object` |
| 53 | `fetch_player_avatar_and_details` | `player_id` |
| 92 | `ezmystery.handle_player_disconnect` | `player_id` |
| 96 | `ezmystery.hide_random_data` | `player_id` |
| 133 | `ezmystery.handle_player_transfer` | `player_id` |
| 137 | `ezmystery.handle_player_join` | `player_id` |
| 141 | `run_quiz_from_list` | `player_id, area_id, quiz_list_id, failure_message` |
| 201 | `try_collect_datum` | `player_id, area_id, object` |
| 308 | `read_datum_information` | `area_id, object` |
| 323 | `collect_datum` | `player_id, object, datum_id_override, is_quiz` |

### Function notes

- **`is_property_true(val)`** — Robust boolean checker (case‑insensitive, accepts 1 as true) *(source line 26)*
- **`resource_name(cost_type)`** — Helper to get a readable resource name *(source line 40)*
- **`object_is_mystery_data(object)`** *(source line 47)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fetch_player_avatar_and_details(player_id)`** *(source line 53)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmystery.handle_player_disconnect(player_id)`** *(source line 92)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmystery.hide_random_data(player_id)`** *(source line 96)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmystery.handle_player_transfer(player_id)`** *(source line 133)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezmystery.handle_player_join(player_id)`** *(source line 137)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run_quiz_from_list(player_id, area_id, quiz_list_id, failure_message)`** *(source line 141)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_collect_datum(player_id, area_id, object)`** *(source line 201)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`read_datum_information(area_id, object)`** *(source line 308)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`collect_datum(player_id, object, datum_id_override, is_quiz)`** *(source line 323)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezmystery` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `object_cache` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `revealed_mysteries_for_players` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `sfx` *(line 17)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `item_get` | string literal | `'/server/assets/ezlibs-assets/sfx/item_get.ogg'` |

### `player_avatars` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_animations` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `datum_list` *(line 109)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `options` *(line 166)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `check_cond` *(line 228)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | expression/reference | `cost_type` |
| `amount` | expression/reference | `cost_amount` |
| `consume` | boolean literal | `false` |

### `spend_cond` *(line 250)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | expression/reference | `cost_type` |
| `amount` | expression/reference | `cost_amount` |
| `consume` | boolean literal | `true` |

### `item_info` *(line 329)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | expression/reference | `object.custom_properties["Reward Type"] or "item"` |
| `name` | expression/reference | `object.custom_properties["Reward Name"]` |
| `amount` | call/expression | `tonumber(object.custom_properties["Reward Amount"] or 1)` |
| `description` | expression/reference | `object.custom_properties["Reward Description"] or "???"` |
| `price` | number literal | `0` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezmystery.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
