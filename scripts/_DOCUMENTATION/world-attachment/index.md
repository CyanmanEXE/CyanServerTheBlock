# `world-attachment.lua`

> **Source:** `scripts/world-attachment.lua`  
> **Source lines:** 428  
> **Functions detected:** 9  
> **Table declarations detected:** 8

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Shared world-attachment coordinate helpers for NetGames and FootBomb. This module intentionally contains only coordinate math. It does not create bots, move actors, subscribe to events, or animate properties. Projection modes: "isometric"  - invert the standard screen/map projection used by FootBomb. "net_games"  - reproduce NetGames' legacy convertOffsets convention. Z correction: The Z correction shifts BOTH map x and map y by the SAME amount so the resulting screen displacement is purely vertical. The engine already handles a bot's absolute Z; the correction here only compensates for a *delta* above the parent (typically `RESULT_BALL_Z_LIFT`). Scale derivation (per-map, dynamic): 1. If `z_correction.scale` is explicitly provided, use it. 2. Otherwise derive from `tile_height / tile_width` (0.5 for the standard 64x32 isometric map). 3. If `z_correction.scale_multiplier` is provided, multiply the base scale. `point_to_map_offset` computes this for sprite actors from the frame's originy/h so a top-anchored sprite gets zero correction and a bottom-anchored sprite gets full correction. Actor kinds: "bot"    (default) - uses map-derived scale directly. "sprite" - computes scale_multiplier from frame.originy / frame.h.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 34 | `number_or_nil` | `value` |
| 39 | `is_flipped` | `value` |
| 43 | `round_fraction` | `value, denominator` |
| 69 | `WorldAttachment.quantize_map_offset` | `offset, options` |
| 120 | `WorldAttachment.point_to_pixel_offset` | `frame, point` |
| 204 | `WorldAttachment.pixel_offset_to_map` | `screen_offset, options` |
| 308 | `WorldAttachment.point_to_map_offset` | `frame, point, options` |
| 369 | `WorldAttachment.target_position` | `parent_position, map_offset, options` |
| 399 | `WorldAttachment.follow_position` | `parent_position, screen_offset, options` |

### Function notes

- **`number_or_nil(value)`** *(source line 34)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_flipped(value)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`round_fraction(value, denominator)`** *(source line 43)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`WorldAttachment.quantize_map_offset(offset, options)`** — --------------------------------------------------------------------------- quantize_map_offset(offset, options) --------------------------------------------------------------------------- Snap the fractional parts of a map-space delta onto a fixed grid so that slow-moving attachments do not shimmer on the isometric grid.  Math: * Split x and y into integer + fractional parts. * Round each fraction to the nearest 1/denominator (default 32). * Compute |x_frac - y_frac|; snap that separation to the nearest 1/difference_steps (default 16) to keep the parallel-edges offset stable across quantized frames.  Operates on: map delta {x, y} (typically the output of pixel_offset_to_map before it is applied to a parent position).  When to use: slow or static attachments (resting items, poses). Do NOT use for fast tracks (ball mid-flight) — the 1/32 snapping is visible as a stair-step under fast motion. *(source line 69)*
- **`WorldAttachment.point_to_pixel_offset(frame, point)`** — --------------------------------------------------------------------------- point_to_pixel_offset(frame, point) --------------------------------------------------------------------------- Convert a labeled point inside an animation frame into a pixel offset from the frame's pivot, with flips handled correctly.  Math: * Mirror point and pivot around the frame center for flipx/flipy so their relative distance is preserved. * Return point - pivot.  Operates on: frame rect from a parsed Boom animation + a labeled point.  Output: pixel offset (relative to the sprite's anchor). NOT absolute screen coordinates — the sprite's own screen position supplies the origin. *(source line 120)*
- **`WorldAttachment.pixel_offset_to_map(screen_offset, options)`** — --------------------------------------------------------------------------- pixel_offset_to_map(screen_offset, options) --------------------------------------------------------------------------- Convert a pixel offset (from point_to_pixel_offset or equivalent) into a map-space delta, using the current world projection. Optionally applies a dynamic Z correction and anti-jitter.  Base projection: isometric  : map_x =  sx/tile_w + sy/tile_h map_y = -sx/tile_w + sy/tile_h net_games  : map_x = (2*sy - sx) / 64 map_y = (2*sy + sx) / 64 (tile_w/tile_h intentionally ignored; legacy fixed 64)  Z correction (added to BOTH map_x and map_y): scale = z_correction.scale            (explicit, if provided) | tile_height / tile_width      (derived from map dims by default) if z_correction.scale_multiplier then scale = scale * scale_multiplier correction = child_z * scale map_x += correction; map_y += correction  Screen effect: screen_dx = 0, screen_dy = correction * tile_h. i.e., a pure vertical screen displacement of (child_z * scale * tile_h) pixels downward, with zero horizontal shift.  `child_z` is the DELTA above the parent, not the parent's absolute Z. The engine already renders the parent at its own Z; we only add the delta needed to lift the child above the parent.  Operates on: pixel offset {x, y} + options.  Output: map delta {x, y}. NOT an absolute position — add it to the parent via target_position to get the child's final position.  Returns (map_delta, error, meta) where meta exposes `tile_width`, `tile_height`, and (when z correction ran) `scale`, `child_z`, `child_z_correction` for diagnostics. *(source line 204)*
- **`WorldAttachment.point_to_map_offset(frame, point, options)`** — --------------------------------------------------------------------------- point_to_map_offset(frame, point, options) --------------------------------------------------------------------------- Convenience: point_to_pixel_offset → pixel_offset_to_map.  Sprite support: If `options.z_correction.actor_kind == "sprite"`, this function computes `scale_multiplier = frame.originy / frame.h` and passes it through, so a bottom-anchored sprite (originy ≈ h) gets full correction and a top-anchored sprite (originy ≈ 0) gets none. Bots use "bot" (default) which relies on the map-derived scale directly.  Operates on: frame + point + options. Output: map delta {x, y} (and merged metadata). *(source line 308)*
- **`WorldAttachment.target_position(parent_position, map_offset, options)`** — --------------------------------------------------------------------------- target_position(parent_position, map_offset, options) --------------------------------------------------------------------------- Compose the child's final map position from the parent's position + the map delta.  Math: target.x = parent.x + offset.x target.y = parent.y + offset.y target.z = parent.z + (options.z_offset or 0)  Operates on: parent map pos + map delta + z_offset. Output: child map pos {x, y, z}.  IMPORTANT: `options.z_offset` here is the child's ACTUAL z separation above the parent. It is NOT the z_correction.z_offset used inside pixel_offset_to_map (that one only controls x/y compensation). Passing the same lift to both keeps the ball visually attached to the ball point while rendered `lift` units higher than the defender. *(source line 369)*
- **`WorldAttachment.follow_position(parent_position, screen_offset, options)`** — --------------------------------------------------------------------------- follow_position(parent_position, screen_offset, options) --------------------------------------------------------------------------- Recompute the attachment position as the parent moves, so the z correction tracks the parent's elevation changes rather than freezing at creation.  The caller supplies `screen_offset` directly (rather than frame + point) because continuous attachment usually samples the animation at multiple elapsed times in a loop.  Bot-friendly: the map-derived scale is used automatically. For sprite actors use point_to_map_offset (which can compute the frame-based scale_multiplier); follow_position does not carry frame data. *(source line 399)*

## Tables and data structures

### `WorldAttachment` *(line 28)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `map_offset` *(line 227)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `sx / tile_width + sy / tile_height` |
| `y` | expression/reference | `-sx / tile_width + sy / tile_height` |

### `map_offset` *(line 232)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `(2 * sy - sx) / 64` |
| `y` | call/expression | `(2 * sy + sx) / 64` |

### `meta` *(line 239)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `tile_width` | expression/reference | `tile_width` |
| `tile_height` | expression/reference | `tile_height` |

### `local_options` *(line 328)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `local_z` *(line 331)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `local_options` *(line 404)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `local_z` *(line 410)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/world-attachment.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
