# `points_gauge.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/points_gauge.lua`  
> **Source lines:** 495  
> **Functions detected:** 16  
> **Table declarations detected:** 15

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

points_gauge.lua Screen HUD for a liberation's order points. Composed of three 3-slice sprites drawn through Displayer.SlicedSprite: * base-guage-3slice  -- the empty bar behind everything (widest) * points-3slice      -- pips drawn *inside* the base gauge * point-total-3slice -- centered badge showing "value/max" as text BADGE PLACEMENT: the badge is drawn below the base gauge on the Y axis, horizontally centered on it, and its top edge overlaps the gauge's bottom edge by LAYOUT.badge_overlap px. The z-indices (base=200, badge=202) only control draw order so the badge appears on top where they overlap; the vertical overlap itself is purely a Y-position calculation. COORDINATE SPACES: * SlicedSprite.draw3 operates in 480x320 raw-pixel space. * Displayer.Text.drawStatic operates in 240x160 text space. The badge rectangle is drawn with draw3 at 480-space; its text is placed at 240-space by halving the badge center and offsetting by half the measured 240-space text extents. SLICED-SPRITE VALIDATION: this displayer's sliced-sprite implementation requires every strip part of a horizontal 3-slice to have the SAME native frame height. If LEFT_h, CENTER_h, and RIGHT_h are not equal, draw3 returns nil,"[SlicedSprite] all strip parts must have the same native height" and the sprite does not render. The base gauge is well-formed (16/16/16), which is why it works; the badge and points animations must be edited at the asset level so their three parts match too. The startup diagnostic below names the exact mismatch. IMPORTANT: Displayer draws per player. The gauge assets MUST be delivered via Net.provide_asset_for_player before :show() is called. See Preloader.provide_gauge_assets_to_player.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 36
- `scripts/displayer/displayer` — line 39
- `scripts/displayer/text-layout` — line 40

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 83 | `get_animation_insights` | `(none)` |
| 130 | `get_styles` | `(none)` |
| 154 | `run_startup_diagnostic` | `(none)` |
| 226 | `round_pixel` | `value` |
| 230 | `id_safe` | `value` |
| 234 | `measure_text_240` | `text, opts` |
| 252 | `PointsGauge:new` | `player_id, max_points` |
| 290 | `PointsGauge:_warn_once` | `tag, message, extra` |
| 298 | `safe_draw3` | `player_id, lid, x, y, w, h, style, opts, tag, gauge` |
| 321 | `PointsGauge:_draw_base` | `(none)` |
| 340 | `PointsGauge:_draw_fill` | `(none)` |
| 387 | `PointsGauge:_draw_badge` | `(none)` |
| 454 | `PointsGauge:show` | `(none)` |
| 470 | `PointsGauge:set_value` | `value` |
| 479 | `PointsGauge:hide` | `(none)` |
| 490 | `PointsGauge:destroy` | `(none)` |

### Function notes

- **`get_animation_insights()`** *(source line 83)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_styles()`** *(source line 130)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run_startup_diagnostic()`** *(source line 154)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`round_pixel(value)`** — Match the integer-boundary snapping used by sliced-sprite's 9-slice renderer. Adjacent point pips must derive their edges from the same calculation so fractional widths cannot accumulate gaps or overlaps. *(source line 226)*
- **`id_safe(value)`** *(source line 230)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`measure_text_240(text, opts)`** *(source line 234)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:new(player_id, max_points)`** *(source line 252)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:_warn_once(tag, message, extra)`** — One-time-per-tag warning helper so a broken asset warns once, not once per redraw of every pip. *(source line 290)*
- **`safe_draw3(player_id, lid, x, y, w, h, style, opts, tag, gauge)`** *(source line 298)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:_draw_base()`** *(source line 321)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:_draw_fill()`** *(source line 340)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:_draw_badge()`** *(source line 387)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:show()`** *(source line 454)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:set_value(value)`** *(source line 470)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:hide()`** *(source line 479)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PointsGauge:destroy()`** *(source line 490)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `PointsGauge` *(line 41)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `LAYOUT` *(line 53)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `screen_w` | number literal | `480` |
| `screen_h` | number literal | `320` |
| `max_gauge_w_screen` | number literal | `120` |
| `gauge_h_screen` | number literal | `12` |
| `gauge_y` | number literal | `4` |
| `gauge_inner_padding_x` | number literal | `12` |
| `gauge_inner_padding_y` | number literal | `4` |
| `badge_w` | number literal | `80` |
| `badge_h` | number literal | `24` |
| `badge_overlap` | number literal | `6` |
| `z_base` | number literal | `200` |
| `z_fill` | number literal | `201` |
| `z_badge` | number literal | `202` |
| `z_text` | number literal | `203` |
| `text_font` | string literal | `"THICK"` |
| `text_scale` | number literal | `1.0` |
| `text_color` | table | `{ r = 255, g = 255, b = 255, a = 255 }` |

### `text_color` *(line 77)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `a` | number literal | `255` |

### `animation_insights` *(line 85)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `specs` *(line 90)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "base", anim = ASSET_ROOT .. "/base-guage-3slice.animation" }` |
| `[2]` | table | `{ name = "points", anim = ASSET_ROOT .. "/points-3slice.animation" }` |
| `[3]` | table | `{ name = "badge", anim = ASSET_ROOT .. "/point-total-3slice.animation" }` |

### `insight` *(line 99)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `loaded` | boolean literal | `true` |
| `states` | table | `{}` |
| `parts` | table | `{}` |

### `styles` *(line 132)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `base` | call/expression | `Displayer.Builder.sliceStyle3( ASSET_ROOT .. "/base-guage-3slice.png"` |
| `[2]` | expression/reference | `ASSET_ROOT .. "/base-guage-3slice.animation" )` |
| `points` | call/expression | `Displayer.Builder.sliceStyle3( ASSET_ROOT .. "/points-3slice.png"` |
| `[4]` | expression/reference | `ASSET_ROOT .. "/points-3slice.animation" )` |
| `badge` | call/expression | `Displayer.Builder.sliceStyle3( ASSET_ROOT .. "/point-total-3slice.png"` |
| `[6]` | expression/reference | `ASSET_ROOT .. "/point-total-3slice.animation" )` |

### `required` *(line 158)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"LEFT"` |
| `[2]` | string literal | `"CENTER"` |
| `[3]` | string literal | `"RIGHT"` |

### `specs` *(line 159)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "base", anim = ASSET_ROOT .. "/base-guage-3slice.animation" }` |
| `[2]` | table | `{ name = "points", anim = ASSET_ROOT .. "/points-3slice.animation" }` |
| `[3]` | table | `{ name = "badge", anim = ASSET_ROOT .. "/point-total-3slice.animation" }` |

### `missing` *(line 173)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `available` *(line 174)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `gauge._warned` *(line 268)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `gauge.fill_lids` *(line 281)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `payload` *(line 293)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `tag` | expression/reference | `tag` |
| `player_id` | expression/reference | `self.player_id` |
| `message` | expression/reference | `message` |

### `text_opts` *(line 390)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | expression/reference | `LAYOUT.text_font` |
| `scale` | expression/reference | `LAYOUT.text_scale` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/points_gauge.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
