# `animation-enums.lua`

> **Source:** `scripts/animation-engine/animation-enums.lua`  
> **Source lines:** 80  
> **Functions detected:** 0  
> **Table declarations detected:** 6

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

animation-enums.lua (enhanced)

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `AnimationEnums` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `AnimationEnums.easing_function_names` *(line 5)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instant` | string literal | `"instant"` |
| `linear` | string literal | `"linear"` |
| `ease_in` | string literal | `"ease_in"` |
| `ease_out` | string literal | `"ease_out"` |
| `ease_in_out` | string literal | `"ease_in_out"` |
| `smoothstep` | string literal | `"smoothstep"` |
| `smootherstep` | string literal | `"smootherstep"` |
| `elastic_in` | string literal | `"elastic_in"` |
| `elastic_out` | string literal | `"elastic_out"` |
| `bounce_out` | string literal | `"bounce_out"` |
| `bounce_in` | string literal | `"bounce_in"` |
| `elastic_in_out` | string literal | `"elastic_in_out"` |
| `square` | string literal | `"square"` |
| `cubic` | string literal | `"cubic"` |

### `AnimationEnums.animation_types` *(line 24)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `SUMMON` | string literal | `"summon"` |
| `SET` | string literal | `"set"` |
| `POSITION_CHANGE` | string literal | `"position_change"` |
| `ATTACK` | string literal | `"attack"` |
| `SLIDE` | string literal | `"slide"` |
| `BOB` | string literal | `"bob"` |
| `PULSE` | string literal | `"pulse"` |
| `SHAKE` | string literal | `"shake"` |
| `FADE` | string literal | `"fade"` |
| `TINT` | string literal | `"tint"` |
| `COLOR_PULSE` | string literal | `"color_pulse"` |
| `SERIES` | string literal | `"series"` |

### `AnimationEnums.animation_properties` *(line 40)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `POSITION_X` | string literal | `"x"` |
| `POSITION_Y` | string literal | `"y"` |
| `SCALE` | string literal | `"scale"` |
| `SCALE_X` | string literal | `"scaleX"` |
| `SCALE_Y` | string literal | `"scaleY"` |
| `ROTATION` | string literal | `"rotation"` |
| `ALPHA` | string literal | `"alpha"` |
| `COLOR_R` | string literal | `"r"` |
| `COLOR_G` | string literal | `"g"` |
| `COLOR_B` | string literal | `"b"` |
| `COLOR_A` | string literal | `"a"` |

### `AnimationEnums.directions` *(line 55)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `UP` | string literal | `"up"` |
| `DOWN` | string literal | `"down"` |
| `LEFT` | string literal | `"left"` |
| `RIGHT` | string literal | `"right"` |
| `IN` | string literal | `"in"` |
| `OUT` | string literal | `"out"` |

### `AnimationEnums.triggers` *(line 65)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `ON_CLICK` | string literal | `"on_click"` |
| `ON_HOVER` | string literal | `"on_hover"` |
| `ON_SHOW` | string literal | `"on_show"` |
| `ON_HIDE` | string literal | `"on_hide"` |
| `ON_COMPLETE` | string literal | `"on_complete"` |
| `ON_START` | string literal | `"on_start"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/animation-engine/animation-enums.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
