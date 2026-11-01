# `math-utils.lua`

> **Source:** `scripts/animation-engine/math-utils.lua`  
> **Source lines:** 375  
> **Functions detected:** 53  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

math-utils.lua Reusable mathematical and easing functions

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 13 | `MathUtils.clamp01` | `t` |
| 18 | `MathUtils.lerp` | `a, b, t` |
| 23 | `MathUtils.quadratic_bezier` | `p0, p1, p2, t` |
| 30 | `MathUtils.cubic_bezier` | `p0, p1, p2, p3, t` |
| 37 | `MathUtils.map` | `value, in_min, in_max, out_min, out_max` |
| 42 | `MathUtils.normalize` | `value, min, max` |
| 47 | `MathUtils.round` | `num, numDecimalPlaces` |
| 53 | `MathUtils.approximately` | `a, b, epsilon` |
| 59 | `MathUtils.deg_to_rad` | `degrees` |
| 64 | `MathUtils.rad_to_deg` | `radians` |
| 69 | `MathUtils.sign` | `x` |
| 81 | `instant` | `t` |
| 84 | `linear` | `t` |
| 86 | `square` | `t` |
| 88 | `cubic` | `t` |
| 90 | `ease_in` | `t` |
| 92 | `ease_out` | `t` |
| 94 | `ease_in_out` | `t` |
| 102 | `smoothstep` | `t` |
| 104 | `smootherstep` | `t` |
| 108 | `elastic_in` | `t` |
| 114 | `elastic_out` | `t` |
| 121 | `bounce_out` | `t` |
| 136 | `bounce_in` | `t` |
| 152 | `elastic_in_out` | `t` |
| 168 | `sine_in` | `t` |
| 171 | `sine_out` | `t` |
| 175 | `sine_in_out` | `t` |
| 179 | `circ_in` | `t` |
| 183 | `circ_out` | `t` |
| 188 | `circ_in_out` | `t` |
| 198 | `back_in` | `t` |
| 203 | `back_out` | `t` |
| 209 | `back_in_out` | `t` |
| 223 | `MathUtils.ease` | `t, easing_name` |
| 232 | `MathUtils.ease_clamped` | `t, easing_name` |
| 241 | `MathUtils.calculate_progress` | `elapsed_time, duration` |
| 247 | `MathUtils.interpolate_with_easing` | `start, target, t, easing_name` |
| 253 | `MathUtils.interpolate_color` | `start_r, start_g, start_b, start_a, target_r, target_g, target_b, target_a, t, easing_name` |
| 264 | `MathUtils.calculate_shake_offset` | `time, frequency, intensity, decay` |
| 273 | `MathUtils.calculate_pulse` | `time, frequency, min_value, max_value` |
| 283 | `MathUtils.distance` | `x1, y1, x2, y2` |
| 290 | `MathUtils.distance_squared` | `x1, y1, x2, y2` |
| 297 | `MathUtils.angle_between` | `x1, y1, x2, y2` |
| 302 | `MathUtils.angle_between_degrees` | `x1, y1, x2, y2` |
| 307 | `MathUtils.midpoint` | `x1, y1, x2, y2` |
| 312 | `MathUtils.point_in_rect` | `px, py, rect_x, rect_y, rect_width, rect_height` |
| 322 | `MathUtils.random_float` | `min, max` |
| 327 | `MathUtils.random_int` | `min, max` |
| 332 | `MathUtils.random_sign` | `(none)` |
| 337 | `MathUtils.random_element` | `array` |
| 347 | `MathUtils.deep_copy` | `original` |
| 359 | `MathUtils.merge_tables` | `t1, t2` |

### Function notes

- **`MathUtils.clamp01(t)`** — Clamp a value between 0 and 1 *(source line 13)*
- **`MathUtils.lerp(a, b, t)`** — Linear interpolation between a and b *(source line 18)*
- **`MathUtils.quadratic_bezier(p0, p1, p2, t)`** — Quadratic bezier curve calculation *(source line 23)*
- **`MathUtils.cubic_bezier(p0, p1, p2, p3, t)`** — Cubic bezier curve calculation *(source line 30)*
- **`MathUtils.map(value, in_min, in_max, out_min, out_max)`** — Map a value from one range to another *(source line 37)*
- **`MathUtils.normalize(value, min, max)`** — Normalize a value to 0-1 range *(source line 42)*
- **`MathUtils.round(num, numDecimalPlaces)`** — Round a number to specified decimal places *(source line 47)*
- **`MathUtils.approximately(a, b, epsilon)`** — Check if two numbers are approximately equal *(source line 53)*
- **`MathUtils.deg_to_rad(degrees)`** — Degrees to radians conversion *(source line 59)*
- **`MathUtils.rad_to_deg(radians)`** — Radians to degrees conversion *(source line 64)*
- **`MathUtils.sign(x)`** — Get the sign of a number (-1, 0, or 1) *(source line 69)*
- **`instant(t)`** — Returns 1 for any t > 0, meaning immediate transition to target *(source line 81)*
- **`linear(t)`** *(source line 84)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`square(t)`** *(source line 86)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cubic(t)`** *(source line 88)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ease_in(t)`** *(source line 90)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ease_out(t)`** *(source line 92)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ease_in_out(t)`** *(source line 94)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`smoothstep(t)`** *(source line 102)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`smootherstep(t)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`elastic_in(t)`** — Elastic easing functions *(source line 108)*
- **`elastic_out(t)`** *(source line 114)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bounce_out(t)`** *(source line 121)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bounce_in(t)`** *(source line 136)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`elastic_in_out(t)`** *(source line 152)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sine_in(t)`** — Additional easing functions *(source line 168)*
- **`sine_out(t)`** *(source line 171)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sine_in_out(t)`** *(source line 175)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`circ_in(t)`** *(source line 179)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`circ_out(t)`** *(source line 183)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`circ_in_out(t)`** *(source line 188)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`back_in(t)`** *(source line 198)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`back_out(t)`** *(source line 203)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`back_in_out(t)`** *(source line 209)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MathUtils.ease(t, easing_name)`** — Apply easing function by name *(source line 223)*
- **`MathUtils.ease_clamped(t, easing_name)`** — Apply easing and clamp between 0 and 1 *(source line 232)*
- **`MathUtils.calculate_progress(elapsed_time, duration)`** — Calculate progress based on elapsed time and duration *(source line 241)*
- **`MathUtils.interpolate_with_easing(start, target, t, easing_name)`** — Interpolate between two values with easing *(source line 247)*
- **`MathUtils.interpolate_color(start_r, start_g, start_b, start_a, target_r, target_g, target_b, target_a, t, easing_name)`** — Interpolate between two colors with easing *(source line 253)*
- **`MathUtils.calculate_shake_offset(time, frequency, intensity, decay)`** — Calculate shake offset for screen shake effects *(source line 264)*
- **`MathUtils.calculate_pulse(time, frequency, min_value, max_value)`** — Calculate pulse value for pulsing effects *(source line 273)*
- **`MathUtils.distance(x1, y1, x2, y2)`** — Calculate distance between two points *(source line 283)*
- **`MathUtils.distance_squared(x1, y1, x2, y2)`** — Calculate squared distance (faster, avoids sqrt) *(source line 290)*
- **`MathUtils.angle_between(x1, y1, x2, y2)`** — Calculate angle between two points in radians *(source line 297)*
- **`MathUtils.angle_between_degrees(x1, y1, x2, y2)`** — Calculate angle between two points in degrees *(source line 302)*
- **`MathUtils.midpoint(x1, y1, x2, y2)`** — Calculate midpoint between two points *(source line 307)*
- **`MathUtils.point_in_rect(px, py, rect_x, rect_y, rect_width, rect_height)`** — Check if point is within rectangle *(source line 312)*
- **`MathUtils.random_float(min, max)`** — Random float between min and max *(source line 322)*
- **`MathUtils.random_int(min, max)`** — Random integer between min and max (inclusive) *(source line 327)*
- **`MathUtils.random_sign()`** — Random sign (-1 or 1) *(source line 332)*
- **`MathUtils.random_element(array)`** — Random element from array *(source line 337)*
- **`MathUtils.deep_copy(original)`** — Deep copy a table *(source line 347)*
- **`MathUtils.merge_tables(t1, t2)`** — Merge two tables (second table overwrites first) *(source line 359)*

## Tables and data structures

### `MathUtils` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `MathUtils.easing_functions` *(line 78)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instant` | function | `function(t) return t &gt; 0 and 1 or 0 end` |
| `linear` | function | `function(t) return t end` |
| `square` | function | `function(t) return t*t end` |
| `cubic` | function | `function(t) return t*t*t end` |
| `ease_in` | function | `function(t) return t * t end` |
| `ease_out` | function | `function(t) return t * (2 - t) end` |
| `ease_in_out` | function | `function(t) if t &lt; 0.5 then return 2 * t * t else return -1 + (4 - 2 * t) * t end end` |
| `smoothstep` | function | `function(t) return t * t * (3 - 2 * t) end` |
| `smootherstep` | function | `function(t) return t * t * t * (t * (6 * t - 15) + 10) end` |
| `elastic_in` | function | `function(t) if t == 0 or t == 1 then return t end local p = 0.3 local s = p / 4 return -(2^(10 * (t - 1))) * math.sin((t - 1 - s) * (2 * mat…` |
| `elastic_out` | function | `function(t) if t == 0 or t == 1 then return t end local p = 0.3 local s = p / 4 return 2^(-10 * t) * math.sin((t - s) * (2 * math.pi) / p) +…` |
| `bounce_out` | function | `function(t) if t &lt; 1 / 2.75 then return 7.5625 * t * t elseif t &lt; 2 / 2.75 then t = t - 1.5 / 2.75 return 7.5625 * t * t + 0.75 elseif t &lt; 2…` |
| `bounce_in` | function | `function(t) t = 1 - t if t &lt; 1 / 2.75 then return 1 - 7.5625 * t * t elseif t &lt; 2 / 2.75 then t = t - 1.5 / 2.75 return 1 - (7.5625 * t * t …` |
| `elastic_in_out` | function | `function(t) if t == 0 or t == 1 then return t end local p = 0.3 local s = p / 4 if t &lt; 0.5 then t = t * 2 return -0.5 * (2^(10 * (t - 1))) *…` |
| `sine_in` | function | `function(t) return 1 - math.cos((t * math.pi) / 2) end` |
| `sine_out` | function | `function(t) return math.sin((t * math.pi) / 2) end` |
| `sine_in_out` | function | `function(t) return -(math.cos(math.pi * t) - 1) / 2 end` |
| `circ_in` | function | `function(t) return 1 - math.sqrt(1 - t * t) end` |
| `circ_out` | function | `function(t) t = t - 1 return math.sqrt(1 - t * t) end` |
| `circ_in_out` | function | `function(t) t = t * 2 if t &lt; 1 then return -(math.sqrt(1 - t * t) - 1) / 2 else t = t - 2 return (math.sqrt(1 - t * t) + 1) / 2 end end` |
| `back_in` | function | `function(t) local s = 1.70158 return t * t * ((s + 1) * t - s) end` |
| `back_out` | function | `function(t) local s = 1.70158 t = t - 1 return t * t * ((s + 1) * t + s) + 1 end` |
| `back_in_out` | function | `function(t) local s = 1.70158 * 1.525 t = t * 2 if t &lt; 1 then return 0.5 * (t * t * ((s + 1) * t - s)) else t = t - 2 return 0.5 * (t * t * …` |

### `copy` *(line 348)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/animation-engine/math-utils.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
