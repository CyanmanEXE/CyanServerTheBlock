# `eztriggers.lua`

> **Source:** `scripts/ezlibs-scripts/eztriggers/eztriggers.lua`  
> **Source lines:** 436  
> **Functions detected:** 14  
> **Table declarations detected:** 10

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Geometry diagnostics are disabled in normal operation.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/helpers` — line 2
- `scripts/ezlibs-scripts/object_registry` — line 3

## Events

- `Net:on("tick", function(event) ...)` — line 421. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 428. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 10 | `is_button_trigger` | `trigger_info` |
| 26 | `eztriggers.add_location_event_trigger` | `area_id,object` |
| 74 | `eztriggers.add_interact_trigger` | `area_id,trigger_object` |
| 90 | `eztriggers.add_radius_trigger` | `area_id, trigger_object, diameter_x, diameter_y, center_x, center_y, trigger_id` |
| 149 | `eztriggers.add_rectangle_trigger` | `area_id, trigger_object, width, height, trigger_id` |
| 200 | `eztriggers.handle_object_interaction` | `player_id,object_id,button` |
| 217 | `set_player_overlap` | `trigger_info, player_id, is_inside, reason` |
| 245 | `eztriggers.handle_player_move` | `player_id, x, y, z` |
| 326 | `eztriggers.add_event` | `event_object` |
| 341 | `eztriggers.clear_radius_overlaps_for_player` | `player_id, reason` |
| 349 | `eztriggers.clear_rectangle_overlaps_for_player` | `player_id, reason` |
| 357 | `eztriggers.handle_player_transfer` | `player_id` |
| 370 | `eztriggers.handle_player_disconnect` | `player_id` |
| 395 | `tick_check_player_triggers` | `(none)` |

### Function notes

- **`is_button_trigger(trigger_info)`** *(source line 10)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.add_location_event_trigger(area_id,object)`** *(source line 26)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.add_interact_trigger(area_id,trigger_object)`** *(source line 74)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.add_radius_trigger(area_id, trigger_object, diameter_x, diameter_y, center_x, center_y, trigger_id)`** *(source line 90)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.add_rectangle_trigger(area_id, trigger_object, width, height, trigger_id)`** *(source line 149)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.handle_object_interaction(player_id,object_id,button)`** *(source line 200)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_player_overlap(trigger_info, player_id, is_inside, reason)`** — Emit a transition only when the player's recorded overlap state changes. Update the overlap table before emitting so re-entrant listeners cannot observe the old state or cause duplicate transitions. *(source line 217)*
- **`eztriggers.handle_player_move(player_id, x, y, z)`** *(source line 245)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.add_event(event_object)`** *(source line 326)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.clear_radius_overlaps_for_player(player_id, reason)`** *(source line 341)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.clear_rectangle_overlaps_for_player(player_id, reason)`** *(source line 349)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.handle_player_transfer(player_id)`** *(source line 357)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eztriggers.handle_player_disconnect(player_id)`** *(source line 370)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`tick_check_player_triggers()`** — ========================================================================= Player movement tick  Historically the only caller of `handle_player_move` was `ezpushback.on_tick`, and only when a Pushback NPC moved. That meant no player triggers ever fired on maps without pushback NPCs.  This tick owns the check. To avoid iterating every trigger against every player every frame, we cache each player's last-seen position/area and skip the containment pass when nothing changed. A stationary player costs one `Net.get_player_position` and three comparisons per frame. ========================================================================= *(source line 395)*

## Tables and data structures

### `eztriggers` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `eztriggers.interact_triggers` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `eztriggers.radius_triggers` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `eztriggers.rectangle_triggers` *(line 17)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `eztriggers._event_table` *(line 18)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `last_player_positions` *(line 24)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `trigger_info` *(line 122)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `trigger_key` |
| `object` | expression/reference | `trigger_object` |
| `emitter` | expression/reference | `emitter` |
| `overlapping_players` | table | `{}` |
| `radius_x` | expression/reference | `width / 2` |
| `radius_y` | expression/reference | `height / 2` |
| `center_x` | expression/reference | `object_x + center_x` |
| `center_y` | expression/reference | `object_y + center_y` |

### `overlapping_players` *(line 126)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `trigger_info` *(line 178)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `trigger_key` |
| `object` | expression/reference | `trigger_object` |
| `emitter` | expression/reference | `emitter` |
| `overlapping_players` | table | `{}` |
| `width` | expression/reference | `trigger_width` |
| `height` | expression/reference | `trigger_height` |

### `overlapping_players` *(line 182)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/eztriggers/eztriggers.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
