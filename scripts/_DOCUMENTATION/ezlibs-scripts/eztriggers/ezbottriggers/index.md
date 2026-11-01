# `ezbottriggers.lua`

> **Source:** `scripts/ezlibs-scripts/eztriggers/ezbottriggers.lua`  
> **Source lines:** 292  
> **Functions detected:** 9  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezbottriggers.lua Bot-only variant of eztriggers. Mirrors the rectangle/ellipse trigger API of eztriggers, but tracks bots instead of players. It does not touch eztriggers or its player-only state, so the two modules can be used side by side on the same source objects. Fed by eznpcs via ezbus events: bot_created { bot_id, area_id, x, y, z } bot_moved   { bot_id, area_id, x, y, z } bot_removed { bot_id } Each returned emitter fires: entered  { bot_id = ..., object = ..., reason = ..., x, y, z } departed { bot_id = ..., object = ..., reason = ..., x, y, z } The x/y/z values describe the position that caused the transition, so listeners can reconcile overlapping triggers without any Net lookup.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 19
- `scripts/ezlibs-scripts/ezbus` — line 20

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 29 | `resolve_trigger_key` | `trigger_object, trigger_id` |
| 35 | `ezbottriggers.add_radius_trigger` | `area_id, trigger_object, diameter_x, diameter_y, center_x, center_y, trigger_id` |
| 86 | `ezbottriggers.add_rectangle_trigger` | `area_id, trigger_object, width, height, trigger_id` |
| 135 | `set_bot_overlap` | `trigger_info, bot_id, is_inside, reason, x, y, z` |
| 166 | `ezbottriggers.handle_bot_move` | `bot_id, x, y, z, area_id` |
| 238 | `ezbottriggers.clear_radius_overlaps_for_bot` | `bot_id, reason` |
| 246 | `ezbottriggers.clear_rectangle_overlaps_for_bot` | `bot_id, reason` |
| 254 | `ezbottriggers.handle_bot_created` | `bot_id, area_id, x, y, z` |
| 269 | `ezbottriggers.handle_bot_removed` | `bot_id` |

### Function notes

- **`resolve_trigger_key(trigger_object, trigger_id)`** *(source line 29)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbottriggers.add_radius_trigger(area_id, trigger_object, diameter_x, diameter_y, center_x, center_y, trigger_id)`** *(source line 35)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbottriggers.add_rectangle_trigger(area_id, trigger_object, width, height, trigger_id)`** *(source line 86)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_bot_overlap(trigger_info, bot_id, is_inside, reason, x, y, z)`** — x/y/z describe the position that caused the transition, so listeners can resolve overlapping triggers from the same authoritative state. *(source line 135)*
- **`ezbottriggers.handle_bot_move(bot_id, x, y, z, area_id)`** — Reconcile a single bot's occupancy against the triggers in its current area. *(source line 166)*
- **`ezbottriggers.clear_radius_overlaps_for_bot(bot_id, reason)`** *(source line 238)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbottriggers.clear_rectangle_overlaps_for_bot(bot_id, reason)`** *(source line 246)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbottriggers.handle_bot_created(bot_id, area_id, x, y, z)`** *(source line 254)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbottriggers.handle_bot_removed(bot_id)`** *(source line 269)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezbottriggers` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ezbottriggers.radius_triggers` *(line 25)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ezbottriggers.rectangle_triggers` *(line 27)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `trigger_info` *(line 64)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `trigger_key` |
| `object` | expression/reference | `trigger_object` |
| `emitter` | expression/reference | `emitter` |
| `overlapping_bots` | table | `{}` |
| `radius_x` | expression/reference | `width / 2` |
| `radius_y` | expression/reference | `height / 2` |
| `center_x` | expression/reference | `object_x + center_x` |
| `center_y` | expression/reference | `object_y + center_y` |

### `overlapping_bots` *(line 68)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `trigger_info` *(line 113)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `trigger_key` |
| `object` | expression/reference | `trigger_object` |
| `emitter` | expression/reference | `emitter` |
| `overlapping_bots` | table | `{}` |
| `width` | expression/reference | `trigger_width` |
| `height` | expression/reference | `trigger_height` |

### `overlapping_bots` *(line 117)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/eztriggers/ezbottriggers.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
