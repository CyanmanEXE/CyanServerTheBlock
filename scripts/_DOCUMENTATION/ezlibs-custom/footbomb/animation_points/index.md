# `animation_points.lua`

> **Source:** `scripts/ezlibs-custom/footbomb/animation_points.lua`  
> **Source lines:** 20  
> **Functions detected:** 2  
> **Table declarations detected:** 1

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Backwards-compatible FootBomb animation-point helpers. Coordinate conversion is implemented centrally by world-attachment.lua so FootBomb and Net Games cannot drift into separate flip/projection math.

## Dependencies

- `scripts/world-attachment` — line 4

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 7 | `AnimationPoints.offset` | `frame, point` |
| 11 | `AnimationPoints.to_map_offset` | `screen_offset, tile_width, tile_height` |

### Function notes

- **`AnimationPoints.offset(frame, point)`** *(source line 7)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AnimationPoints.to_map_offset(screen_offset, tile_width, tile_height)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `AnimationPoints` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/footbomb/animation_points.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
