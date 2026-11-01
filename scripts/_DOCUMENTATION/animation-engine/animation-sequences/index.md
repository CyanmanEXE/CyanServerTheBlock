# `animation-sequences.lua`

> **Source:** `scripts/animation-engine/animation-sequences.lua`  
> **Source lines:** 1248  
> **Functions detected:** 53  
> **Table declarations detected:** 23

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

animation-sequences.lua General purpose animation sequences that mimic duels.lua behaviors Works with any sprite_id and object properties

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 124 | `AnimationSequences.summon` | `object, start_x, start_y, start_scale, end_x, end_y, end_scale, options` |
| 148 | `on_update` | `values, t, phase` |
| 193 | `AnimationSequences.set` | `object, start_x, start_y, start_scale, start_rotation, end_x, end_y, end_scale, end_rotation, options` |
| 212 | `on_update` | `values, t, phase` |
| 257 | `AnimationSequences.positionChange` | `object, start_rotation, end_rotation, options` |
| 279 | `on_update` | `values, t, phase` |
| 311 | `AnimationSequences.attack` | `object, recoil_offset, lunge_offset, options` |
| 332 | `on_update` | `values, t, phase` |
| 377 | `AnimationSequences.slideIn` | `object, start_x, start_y, end_x, end_y, options` |
| 394 | `on_update` | `values` |
| 411 | `AnimationSequences.bob` | `object, options` |
| 436 | `on_update` | `values` |
| 448 | `AnimationSequences.pulse` | `object, options` |
| 481 | `on_update` | `values` |
| 494 | `AnimationSequences.color_pulse` | `object, start_color, target_color, options` |
| 527 | `on_update` | `values` |
| 555 | `AnimationSequences.color_pulse_from_current` | `object, target_color, options` |
| 570 | `AnimationSequences.shake` | `object, options` |
| 591 | `on_update` | `values, t, phase` |
| 626 | `AnimationSequences.fade` | `object, target_alpha, options` |
| 644 | `on_update` | `values` |
| 663 | `AnimationSequences.tint` | `object, target_r, target_g, target_b, options` |
| 680 | `on_update` | `values` |
| 701 | `AnimationSequences.complexSummon` | `object, start_x, start_y, start_scale, end_x, end_y, end_scale, options` |
| 713 | `on_update` | `values, t, phase` |
| 747 | `on_update` | `values, t, phase` |
| 763 | `on_update` | `values, t, phase` |
| 779 | `AnimationSequences.menuCursor` | `object, options` |
| 809 | `AnimationSequences.highlightCard` | `object, options` |
| 827 | `on_update` | `values` |
| 839 | `AnimationSequences.tween` | `object, target_props, duration, options` |
| 848 | `AnimationSequences.move_to` | `object, target_x, target_y, duration, options` |
| 856 | `AnimationSequences.scale_to` | `object, target_scale, duration, options` |
| 864 | `AnimationSequences.rotate_to` | `object, target_angle, duration, options` |
| 872 | `AnimationSequences.fade_to` | `object, target_alpha, duration, options` |
| 880 | `AnimationSequences.tint_to` | `object, target_r, target_g, target_b, duration, options` |
| 888 | `AnimationSequences.color_pulse_to` | `object, target_r, target_g, target_b, target_a, duration, easing, on_complete, loop, ping_pong, easing_back, discrete, tag` |
| 919 | `AnimationSequences.move_to_discrete_first` | `object, target_x, target_y, duration, options` |
| 932 | `on_update` | `values` |
| 955 | `AnimationSequences.series` | `objects, animator, options` |
| 1000 | `run` | `done` |
| 1002 | `safe_done` | `(none)` |
| 1026 | `anim_opts.on_complete` | `...` |
| 1074 | `AnimationSequences.marquee` | `object, distance, duration, options` |
| 1103 | `on_update` | `values, t, phase` |
| 1109 | `on_complete` | `values, interrupted` |
| 1127 | `AnimationSequences.typewriter` | `sprites, options` |
| 1153 | `on_update` | `v` |
| 1167 | `run` | `done` |
| 1203 | `on_complete` | `(none)` |
| 1217 | `AnimationSequences.stopAll` | `tag` |
| 1227 | `AnimationSequences.isAnimating` | `tag` |
| 1233 | `AnimationSequences.reset` | `object, initial_values` |

### Function notes

- **`AnimationSequences.summon(object, start_x, start_y, start_scale, end_x, end_y, end_scale, options)`** — Create a summon animation (card flies from start to end with arc) *(source line 124)*
- **`on_update(values, t, phase)`** *(source line 148)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.set(object, start_x, start_y, start_scale, start_rotation, end_x, end_y, end_scale, end_rotation, options)`** — Create a set animation (similar to summon but with flip and rotation) *(source line 193)*
- **`on_update(values, t, phase)`** *(source line 212)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.positionChange(object, start_rotation, end_rotation, options)`** — Create a position change animation (rotate and reveal) *(source line 257)*
- **`on_update(values, t, phase)`** *(source line 279)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.attack(object, recoil_offset, lunge_offset, options)`** — Create an attack animation (recoil then lunge) *(source line 311)*
- **`on_update(values, t, phase)`** *(source line 332)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.slideIn(object, start_x, start_y, end_x, end_y, options)`** — Create a slide animation (move from offscreen to position) *(source line 377)*
- **`on_update(values)`** *(source line 394)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.bob(object, options)`** — Create a bob animation (up and down movement) *(source line 411)*
- **`on_update(values)`** *(source line 436)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.pulse(object, options)`** — Create a pulse animation (scale and alpha pulsing) *(source line 448)*
- **`on_update(values)`** *(source line 481)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.color_pulse(object, start_color, target_color, options)`** — Create a color pulse animation (transition between two color sets) *(source line 494)*
- **`on_update(values)`** *(source line 527)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.color_pulse_from_current(object, target_color, options)`** — Alternative version that uses the object's current color as starting point *(source line 555)*
- **`AnimationSequences.shake(object, options)`** — Create a shake animation (screen shake effect) *(source line 570)*
- **`on_update(values, t, phase)`** *(source line 591)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.fade(object, target_alpha, options)`** — Create a fade animation (fade in/out) *(source line 626)*
- **`on_update(values)`** *(source line 644)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.tint(object, target_r, target_g, target_b, options)`** — Create a color tint animation *(source line 663)*
- **`on_update(values)`** *(source line 680)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.complexSummon(object, start_x, start_y, start_scale, end_x, end_y, end_scale, options)`** — Create a complex sequence that mimics duels.lua summon with all effects *(source line 701)*
- **`on_update(values, t, phase)`** *(source line 713)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values, t, phase)`** *(source line 747)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values, t, phase)`** *(source line 763)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.menuCursor(object, options)`** — Create a menu cursor animation (bob + pulse) *(source line 779)*
- **`AnimationSequences.highlightCard(object, options)`** — Create a card highlight animation (lift + glow) *(source line 809)*
- **`on_update(values)`** *(source line 827)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.tween(object, target_props, duration, options)`** — --------------------------------------------------------------------------- Tween: Simple property animation for any object --------------------------------------------------------------------------- *(source line 839)*
- **`AnimationSequences.move_to(object, target_x, target_y, duration, options)`** — Simple move animation with looping support *(source line 848)*
- **`AnimationSequences.scale_to(object, target_scale, duration, options)`** — Scale animation with looping support *(source line 856)*
- **`AnimationSequences.rotate_to(object, target_angle, duration, options)`** — Rotation animation with looping support *(source line 864)*
- **`AnimationSequences.fade_to(object, target_alpha, duration, options)`** — Fade animation with looping support *(source line 872)*
- **`AnimationSequences.tint_to(object, target_r, target_g, target_b, duration, options)`** — Color tint animation with looping support *(source line 880)*
- **`AnimationSequences.color_pulse_to(object, target_r, target_g, target_b, target_a, duration, easing, on_complete, loop, ping_pong, easing_back, discrete, tag)`** — Color pulse animation with looping support (convenience wrapper) *(source line 888)*
- **`AnimationSequences.move_to_discrete_first(object, target_x, target_y, duration, options)`** — Discrete-first move animation *(source line 919)*
- **`on_update(values)`** *(source line 932)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.series(objects, animator, options)`** — Apply an animation to many objects in series (one after another). *(source line 955)*
- **`run(done)`** *(source line 1000)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`safe_done()`** *(source line 1002)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`anim_opts.on_complete(...)`** *(source line 1026)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.marquee(object, distance, duration, options)`** — - Move an object horizontally, optionally looping (ping‑pong). *(source line 1074)*
- **`on_update(values, t, phase)`** *(source line 1103)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 1109)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.typewriter(sprites, options)`** — - Reveal a list of sprite objects in sequence (like a typewriter). *(source line 1127)*
- **`on_update(v)`** *(source line 1153)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run(done)`** *(source line 1167)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 1203)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationSequences.stopAll(tag)`** — Stop all animations for an object (by tag) *(source line 1217)*
- **`AnimationSequences.isAnimating(tag)`** — Check if any animations are running for a tag *(source line 1227)*
- **`AnimationSequences.reset(object, initial_values)`** — Reset object to its initial state *(source line 1233)*

## Tables and data structures

### `AnimationSequences` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `AnimationSequences.config` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `default_duration` | number literal | `0.25` |
| `default_easing` | string literal | `"ease_in_out"` |
| `summon` | table | `{ arc_height = 24, peak_scale_mul = 1.35, wobble_ro_deg = 5, duration = 0.25, z_offset = 10 }` |
| `position_change` | table | `{ duration = 0.18, peak_scale_mul = 1.15, flip_min = 0.06, swap_t = 0.5 }` |
| `attack` | table | `{ duration = 0.22, recoil_distance = 5, lunge_distance = 15, t1 = 0.25, t2 = 0.60, z_offset = 12 }` |
| `slide` | table | `{ duration = 0.15, easing = "ease_out" }` |
| `bob` | table | `{ duration = 1.0, distance = 3, easing = "smoothstep", loop = true, ping_pong = true }` |
| `pulse` | table | `{ duration = 0.8, scale_from = 1.0, scale_to = 1.1, alpha_from = 255, alpha_to = 200, easing = "elastic_out", loop = true, ping_pong = true …` |
| `shake` | table | `{ duration = 0.15, intensity = 3, frequency = 15, easing = "elastic_out" }` |
| `fade` | table | `{ duration = 0.3, easing = "ease_in_out" }` |
| `color_pulse` | table | `{ duration = 0.8, easing = "ease_in_out", loop = true, ping_pong = true }` |
| `marquee` | table | `{ duration = 2.0, distance = 100, easing = "linear", loop = true, ping_pong = true }` |
| `typewriter` | table | `{ char_delay = 0.1, appear_duration = 0.15, easing = "ease_out" }` |

### `summon` *(line 27)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `arc_height` | number literal | `24` |
| `peak_scale_mul` | number literal | `1.35` |
| `wobble_ro_deg` | number literal | `5` |
| `duration` | number literal | `0.25` |
| `z_offset` | number literal | `10` |

### `position_change` *(line 36)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `0.18` |
| `peak_scale_mul` | number literal | `1.15` |
| `flip_min` | number literal | `0.06` |
| `swap_t` | number literal | `0.5` |

### `attack` *(line 44)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `0.22` |
| `recoil_distance` | number literal | `5` |
| `lunge_distance` | number literal | `15` |
| `t1` | number literal | `0.25` |
| `t2` | number literal | `0.60` |
| `z_offset` | number literal | `12` |

### `slide` *(line 54)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `0.15` |
| `easing` | string literal | `"ease_out"` |

### `bob` *(line 60)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `1.0` |
| `distance` | number literal | `3` |
| `easing` | string literal | `"smoothstep"` |
| `loop` | boolean literal | `true` |
| `ping_pong` | boolean literal | `true` |

### `pulse` *(line 69)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `0.8` |
| `scale_from` | number literal | `1.0` |
| `scale_to` | number literal | `1.1` |
| `alpha_from` | number literal | `255` |
| `alpha_to` | number literal | `200` |
| `easing` | string literal | `"elastic_out"` |
| `loop` | boolean literal | `true` |
| `ping_pong` | boolean literal | `true` |

### `shake` *(line 81)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `0.15` |
| `intensity` | number literal | `3` |
| `frequency` | number literal | `15` |
| `easing` | string literal | `"elastic_out"` |

### `fade` *(line 89)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `0.3` |
| `easing` | string literal | `"ease_in_out"` |

### `color_pulse` *(line 95)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `0.8` |
| `easing` | string literal | `"ease_in_out"` |
| `loop` | boolean literal | `true` |
| `ping_pong` | boolean literal | `true` |

### `marquee` *(line 103)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | number literal | `2.0` |
| `distance` | number literal | `100` |
| `easing` | string literal | `"linear"` |
| `loop` | boolean literal | `true` |
| `ping_pong` | boolean literal | `true` |

### `typewriter` *(line 112)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `char_delay` | number literal | `0.1` |
| `appear_duration` | number literal | `0.15` |
| `easing` | string literal | `"ease_out"` |

### `start` *(line 390)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `start_x` |
| `y` | expression/reference | `start_y` |

### `target` *(line 391)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `end_x` |
| `y` | expression/reference | `end_y` |

### `current_color` *(line 559)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `object.r or 255` |
| `g` | expression/reference | `object.g or 255` |
| `b` | expression/reference | `object.b or 255` |
| `a` | expression/reference | `object.alpha or 255` |

### `sequence_steps` *(line 704)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `options` *(line 889)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | expression/reference | `duration or 0.8` |
| `easing` | expression/reference | `easing or "ease_in_out"` |
| `loop` | expression/reference | `loop ~= nil and loop or true` |
| `ping_pong` | expression/reference | `ping_pong ~= nil and ping_pong or true` |
| `easing_back` | expression/reference | `easing_back` |
| `discrete` | expression/reference | `discrete` |
| `tag` | expression/reference | `tag` |
| `on_complete` | expression/reference | `on_complete` |

### `current_color` *(line 901)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `object.r or 255` |
| `g` | expression/reference | `object.g or 255` |
| `b` | expression/reference | `object.b or 255` |
| `a` | expression/reference | `object.alpha or 255` |

### `target_color` *(line 907)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `target_r` |
| `g` | expression/reference | `target_g` |
| `b` | expression/reference | `target_b` |
| `a` | expression/reference | `target_a or current_color.a` |

### `list` *(line 979)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `steps` *(line 992)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `steps` *(line 1162)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/animation-engine/animation-sequences.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
