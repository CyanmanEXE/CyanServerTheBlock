# `animation-engine.lua`

> **Source:** `scripts/animation-engine/animation-engine.lua`  
> **Source lines:** 612  
> **Functions detected:** 44  
> **Table declarations detected:** 23

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Reusable animation and interpolation engine. Hardened for server UI use: all timing is driven by Net tick delta_time. No visible animation timing depends on os.clock().

## Dependencies

- `scripts/animation-engine/animation-enums` — line 9
- `scripts/animation-engine/math-utils` — line 10
- `scripts/animation-engine/animation-sequences` — line 609

## Events

- `Net:on("tick", function(event) ...)` — line 605. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 33 | `now` | `(none)` |
| 37 | `copy_table` | `src` |
| 43 | `log` | `message` |
| 49 | `generate_animation_id` | `(none)` |
| 54 | `generate_sequence_id` | `(none)` |
| 59 | `remove_from_tag_sets` | `collection, id` |
| 63 | `AnimationEngine.get_time` | `(none)` |
| 67 | `AnimationEngine.interpolate` | `start, target, t, easing, discrete` |
| 102 | `normalized_loop` | `loop_value` |
| 110 | `AnimationEngine.animate` | `start_values, target_values, duration, options` |
| 169 | `complete_animation` | `id, anim, interrupted` |
| 178 | `AnimationEngine.update` | `_dt` |
| 231 | `AnimationEngine.stop_animation` | `id` |
| 239 | `AnimationEngine.stop_animations_by_tag` | `tag` |
| 249 | `AnimationEngine.tween` | `object, target_props, duration, options` |
| 252 | `read_prop` | `key` |
| 258 | `apply_prop` | `key, value` |
| 277 | `on_update` | `values, t, phase` |
| 281 | `on_complete` | `_, interrupted` |
| 287 | `resolve_sequence_value` | `seq, step_index, value` |
| 297 | `AnimationEngine.create_sequence` | `steps, options` |
| 320 | `AnimationEngine.start_sequence` | `id` |
| 332 | `resolve_step_table` | `seq, step_index, source` |
| 354 | `AnimationEngine._execute_sequence_step` | `seq_id` |
| 375 | `on_complete` | `values, interrupted` |
| 386 | `done` | `(none)` |
| 409 | `AnimationEngine._sequence_step_complete` | `seq_id` |
| 431 | `AnimationEngine.update_sequences` | `_dt` |
| 446 | `AnimationEngine.stop_sequence` | `id` |
| 456 | `AnimationEngine.stop_sequences_by_tag` | `tag` |
| 466 | `AnimationEngine.animate_discrete_first` | `start_values, target_values, duration, options` |
| 478 | `on_update` | `values, t, phase` |
| 494 | `AnimationEngine.set_to` | `object, values` |
| 518 | `AnimationEngine.delay` | `duration, callback` |
| 527 | `AnimationEngine.cancel_delay` | `id` |
| 532 | `AnimationEngine.update_callbacks` | `(none)` |
| 548 | `AnimationEngine.get_active_count` | `(none)` |
| 554 | `AnimationEngine.get_sequence_count` | `(none)` |
| 560 | `AnimationEngine.clear_all` | `(none)` |
| 574 | `AnimationEngine.tick` | `dt` |
| 584 | `AnimationEngine.set_debug` | `enabled` |
| 588 | `AnimationEngine.set_max_tick_dt` | `seconds` |
| 593 | `AnimationEngine.set_interpolation_speeds` | `position, ro, color, scale` |
| 600 | `AnimationEngine.add_easing_function` | `name, func` |

### Function notes

- **`now()`** *(source line 33)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`copy_table(src)`** *(source line 37)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`log(message)`** *(source line 43)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`generate_animation_id()`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`generate_sequence_id()`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_from_tag_sets(collection, id)`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.get_time()`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.interpolate(start, target, t, easing, discrete)`** *(source line 67)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalized_loop(loop_value)`** *(source line 102)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.animate(start_values, target_values, duration, options)`** *(source line 110)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`complete_animation(id, anim, interrupted)`** *(source line 169)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.update(_dt)`** *(source line 178)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.stop_animation(id)`** *(source line 231)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.stop_animations_by_tag(tag)`** *(source line 239)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.tween(object, target_props, duration, options)`** *(source line 249)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`read_prop(key)`** *(source line 252)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`apply_prop(key, value)`** *(source line 258)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values, t, phase)`** *(source line 277)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(_, interrupted)`** *(source line 281)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_sequence_value(seq, step_index, value)`** *(source line 287)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.create_sequence(steps, options)`** *(source line 297)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.start_sequence(id)`** *(source line 320)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_step_table(seq, step_index, source)`** *(source line 332)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine._execute_sequence_step(seq_id)`** *(source line 354)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 375)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`done()`** *(source line 386)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine._sequence_step_complete(seq_id)`** *(source line 409)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.update_sequences(_dt)`** *(source line 431)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.stop_sequence(id)`** *(source line 446)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.stop_sequences_by_tag(tag)`** *(source line 456)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.animate_discrete_first(start_values, target_values, duration, options)`** *(source line 466)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values, t, phase)`** *(source line 478)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.set_to(object, values)`** *(source line 494)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.delay(duration, callback)`** *(source line 518)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.cancel_delay(id)`** *(source line 527)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.update_callbacks()`** *(source line 532)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.get_active_count()`** *(source line 548)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.get_sequence_count()`** *(source line 554)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.clear_all()`** *(source line 560)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.tick(dt)`** *(source line 574)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.set_debug(enabled)`** *(source line 584)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.set_max_tick_dt(seconds)`** *(source line 588)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.set_interpolation_speeds(position, ro, color, scale)`** *(source line 593)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationEngine.add_easing_function(name, func)`** *(source line 600)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `AnimationEngine` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `cfg` *(line 12)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `default_interp_speed` | number literal | `10` |
| `default_ro_speed` | number literal | `180` |
| `default_color_speed` | number literal | `5` |
| `default_scale_speed` | number literal | `2` |
| `easing_functions` | expression/reference | `MathUtils.easing_functions` |
| `debug` | boolean literal | `false` |
| `log_prefix` | string literal | `"[AnimationEngine] "` |
| `max_tick_dt` | number literal | `0.25` |

### `animations` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `sequences` *(line 25)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `callbacks` *(line 26)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `tagged_animations` *(line 27)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `tagged_sequences` *(line 28)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 38)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `discrete_set` *(line 71)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `result` *(line 80)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ids` *(line 180)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ids` *(line 242)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `start_props` *(line 262)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `step_data` *(line 309)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 333)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ready` *(line 433)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ids` *(line 459)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ready` *(line 534)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `anim_ids` *(line 561)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `seq_ids` *(line 564)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `callbacks` *(line 568)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `tagged_animations` *(line 570)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `tagged_sequences` *(line 571)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/animation-engine/animation-engine.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
