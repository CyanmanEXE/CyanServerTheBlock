# `sliced-sprite.lua`

> **Source:** `scripts/displayer/sliced-sprite.lua`  
> **Source lines:** 1306  
> **Functions detected:** 43  
> **Table declarations detected:** 55

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/displayer/sliced-sprite.lua Reusable 3-slice, configurable 5-slice, and 9-slice sprite rendering. Also provides a text panel that combines slices with automatic mixed text + sprite layout (vertical stacking or horizontal row). IMPORTANT: Net.player_draw_sprite has no source-rectangle / UV / crop fields here. A slice therefore has to be either: 1) its own texture, with explicit width/height metadata, or 2) an animation state whose frame selects the rectangle from an atlas. Coordinates and target sizes in this module are raw Net screen pixels (the same coordinate space passed directly to Net.player_draw_sprite).

## Dependencies

- `scripts/boom/main` — line 16
- `scripts/displayer/text-layout` — line 17
- `scripts/displayer/font-system` — line 24

## Events

- `Net:on("player_disconnect", function(event) ...)` — line 742. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 19 | `normalize_text_scale` | `value, fallback` |
| 41 | `round` | `value` |
| 49 | `fail` | `message` |
| 53 | `player_state` | `player_id` |
| 65 | `load_animation` | `anim_path` |
| 85 | `animation_state_metrics` | `anim_path, anim_state` |
| 142 | `copy_part` | `raw` |
| 152 | `resolve_part` | `style, raw, label` |
| 193 | `ensure_asset` | `player_id, part` |
| 232 | `erase_object_ids` | `player_id, object_ids` |
| 242 | `sprite_native_dimensions` | `def` |
| 259 | `sprite_rendered_dimensions` | `def, sprite_scale` |
| 266 | `draw_sprite_instance` | `player_id, object_id, def, x, y, sprite_scale, options` |
| 328 | `begin_instance` | `player_id, logical_id, signature, suffixes` |
| 356 | `draw_piece` | `player_id, object_id, part, x, y, width, height, options` |
| 396 | `resolve_strip_parts` | `style, count, default_middle_stretch` |
| 424 | `strip_signature` | `kind, orientation, parts` |
| 438 | `draw_strip` | `player_id, logical_id, x, y, width, height, style, options, count, kind, default_middle_stretch` |
| 539 | `SlicedSprite.draw3` | `player_id, logical_id, x, y, width, height, style, options` |
| 543 | `SlicedSprite.draw5` | `player_id, logical_id, x, y, width, height, style, options` |
| 547 | `resolve_nine` | `style` |
| 563 | `nine_signature` | `parts` |
| 576 | `same_number` | `a, b` |
| 580 | `SlicedSprite.draw9` | `player_id, logical_id, x, y, width, height, style, options` |
| 711 | `SlicedSprite.erase` | `player_id, logical_id` |
| 724 | `SlicedSprite.cleanupPlayer` | `player_id` |
| 755 | `normalize_edges` | `value, fallback` |
| 777 | `normalize_alignment` | `value, fallback` |
| 786 | `alignment_offset` | `alignment, available, used` |
| 797 | `main_axis_distribution` | `alignment, available, used, count, base_spacing` |
| 820 | `TextPanel:new` | `player_id, logical_id, x, y, text, style, options` |
| 844 | `TextPanel:_measure_child` | `child, inner_max_width` |
| 936 | `TextPanel:_draw_text_child` | `player_id, child, m, base_x, base_y, z, glyph_ids` |
| 974 | `TextPanel:_draw_sprites_child` | `player_id, child, m, base_x, base_y, z, sprite_ids, child_idx` |
| 1014 | `TextPanel:_redraw` | `(none)` |
| 1160 | `draw_child` | `m, slot_x, slot_y, slot_w, slot_h` |
| 1233 | `TextPanel:getSize` | `(none)` |
| 1237 | `TextPanel:setText` | `new_text` |
| 1244 | `TextPanel:setChildren` | `children` |
| 1250 | `TextPanel:setPosition` | `x, y` |
| 1257 | `TextPanel:setOptions` | `new_options` |
| 1273 | `TextPanel:destroy` | `(none)` |
| 1294 | `SlicedSprite.drawTextPanel` | `player_id, logical_id, x, y, text, style, options` |

### Function notes

- **`normalize_text_scale(value, fallback)`** *(source line 19)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`round(value)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fail(message)`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`player_state(player_id)`** *(source line 53)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_animation(anim_path)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation_state_metrics(anim_path, anim_state)`** *(source line 85)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`copy_part(raw)`** *(source line 142)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_part(style, raw, label)`** *(source line 152)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_asset(player_id, part)`** *(source line 193)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_object_ids(player_id, object_ids)`** *(source line 232)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sprite_native_dimensions(def)`** — ========================================================================= Sprite child helpers ========================================================================= *(source line 242)*
- **`sprite_rendered_dimensions(def, sprite_scale)`** *(source line 259)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_sprite_instance(player_id, object_id, def, x, y, sprite_scale, options)`** *(source line 266)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`begin_instance(player_id, logical_id, signature, suffixes)`** — ========================================================================= Strip / nine-slice primitives ========================================================================= *(source line 328)*
- **`draw_piece(player_id, object_id, part, x, y, width, height, options)`** *(source line 356)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_strip_parts(style, count, default_middle_stretch)`** *(source line 396)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`strip_signature(kind, orientation, parts)`** *(source line 424)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_strip(player_id, logical_id, x, y, width, height, style, options, count, kind, default_middle_stretch)`** *(source line 438)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SlicedSprite.draw3(player_id, logical_id, x, y, width, height, style, options)`** *(source line 539)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SlicedSprite.draw5(player_id, logical_id, x, y, width, height, style, options)`** *(source line 543)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_nine(style)`** *(source line 547)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`nine_signature(parts)`** *(source line 563)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`same_number(a, b)`** *(source line 576)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SlicedSprite.draw9(player_id, logical_id, x, y, width, height, style, options)`** *(source line 580)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SlicedSprite.erase(player_id, logical_id)`** *(source line 711)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SlicedSprite.cleanupPlayer(player_id)`** *(source line 724)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_edges(value, fallback)`** — Normalize Flutter-style EdgeInsets-like padding. Values are in physical screen pixels, matching the sliced-sprite and sprite-child coordinate space. *(source line 755)*
- **`normalize_alignment(value, fallback)`** *(source line 777)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`alignment_offset(alignment, available, used)`** *(source line 786)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`main_axis_distribution(alignment, available, used, count, base_spacing)`** *(source line 797)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:new(player_id, logical_id, x, y, text, style, options)`** *(source line 820)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:_measure_child(child, inner_max_width)`** *(source line 844)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:_draw_text_child(player_id, child, m, base_x, base_y, z, glyph_ids)`** *(source line 936)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:_draw_sprites_child(player_id, child, m, base_x, base_y, z, sprite_ids, child_idx)`** *(source line 974)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:_redraw()`** *(source line 1014)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_child(m, slot_x, slot_y, slot_w, slot_h)`** *(source line 1160)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:getSize()`** *(source line 1233)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:setText(new_text)`** *(source line 1237)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:setChildren(children)`** *(source line 1244)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:setPosition(x, y)`** *(source line 1250)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:setOptions(new_options)`** *(source line 1257)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextPanel:destroy()`** *(source line 1273)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SlicedSprite.drawTextPanel(player_id, logical_id, x, y, text, style, options)`** *(source line 1294)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `SlicedSprite` *(line 25)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `animation_cache` *(line 27)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `players` *(line 29)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `panels` *(line 33)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `NINE_ORDER` *(line 34)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"top_left"` |
| `[2]` | string literal | `"top"` |
| `[3]` | string literal | `"top_right"` |
| `[4]` | string literal | `"left"` |
| `[5]` | string literal | `"center"` |
| `[6]` | string literal | `"right"` |
| `[7]` | string literal | `"bottom_left"` |
| `[8]` | string literal | `"bottom"` |
| `[9]` | string literal | `"bottom_right"` |

### `state` *(line 56)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `assets` | table | `{}` |
| `instances` | table | `{}` |

### `assets` *(line 57)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instances` *(line 58)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 143)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `raw` *(line 154)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `anim_state` | expression/reference | `raw` |

### `alloc` *(line 214)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | expression/reference | `part.texture_path` |

### `part` *(line 277)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | expression/reference | `def.texture_path` |
| `anim_path` | expression/reference | `anim_path` |
| `anim_state` | expression/reference | `def.anim_state` |
| `width` | expression/reference | `native_w` |
| `height` | expression/reference | `native_h` |
| `asset_key` | expression/reference | `def.texture_path .. "\|" .. anim_path` |

### `draw` *(line 293)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `object_id` |
| `x` | call/expression | `round(x)` |
| `y` | call/expression | `round(y)` |
| `z` | call/expression | `tonumber(options and options.z) or 100` |
| `sx` | expression/reference | `final_sx` |
| `sy` | expression/reference | `final_sy` |
| `r` | call/expression | `tonumber(def.r) or 255` |
| `g` | call/expression | `tonumber(def.g) or 255` |
| `b` | call/expression | `tonumber(def.b) or 255` |
| `opacity` | call/expression | `tonumber(def.opacity) or 255` |
| `a` | call/expression | `tonumber(def.a) or 255` |
| `ro` | call/expression | `tonumber(def.ro) or 0` |
| `color_mode` | call/expression | `tonumber(def.color_mode) or 0` |

### `object_ids` *(line 342)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instance` *(line 347)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `signature` | expression/reference | `signature` |
| `object_ids` | expression/reference | `object_ids` |

### `draw` *(line 365)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `object_id` |
| `x` | call/expression | `round(x)` |
| `y` | call/expression | `round(y)` |
| `z` | call/expression | `tonumber(options.z) or 100` |
| `sx` | expression/reference | `width / part.width` |
| `sy` | expression/reference | `height / part.height` |
| `r` | call/expression | `tonumber(part.r or options.r) or 255` |
| `g` | call/expression | `tonumber(part.g or options.g) or 255` |
| `b` | call/expression | `tonumber(part.b or options.b) or 255` |
| `opacity` | call/expression | `tonumber(part.opacity or options.opacity) or 255` |
| `a` | call/expression | `tonumber(part.a or options.a) or 255` |
| `color_mode` | call/expression | `tonumber(part.color_mode or options.color_mode) or 0` |

### `parts` *(line 400)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `fields` *(line 425)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `kind` |
| `[2]` | expression/reference | `orientation` |

### `suffixes` *(line 499)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parts` *(line 551)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `fields` *(line 564)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"9-slice"` |

### `rectangles` *(line 644)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `top_left` | table | `{ x0, y0, x1 - x0, y1 - y0 }` |
| `top` | table | `{ x1, y0, x2 - x1, y1 - y0 }` |
| `top_right` | table | `{ x2, y0, x3 - x2, y1 - y0 }` |
| `left` | table | `{ x0, y1, x1 - x0, y2 - y1 }` |
| `center` | table | `{ x1, y1, x2 - x1, y2 - y1 }` |
| `right` | table | `{ x2, y1, x3 - x2, y2 - y1 }` |
| `bottom_left` | table | `{ x0, y2, x1 - x0, y3 - y2 }` |
| `bottom` | table | `{ x1, y2, x2 - x1, y3 - y2 }` |
| `bottom_right` | table | `{ x2, y2, x3 - x2, y3 - y2 }` |

### `top_left` *(line 646)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x0` |
| `[2]` | expression/reference | `y0` |
| `[3]` | expression/reference | `x1 - x0` |
| `[4]` | expression/reference | `y1 - y0` |

### `top` *(line 647)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x1` |
| `[2]` | expression/reference | `y0` |
| `[3]` | expression/reference | `x2 - x1` |
| `[4]` | expression/reference | `y1 - y0` |

### `top_right` *(line 648)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x2` |
| `[2]` | expression/reference | `y0` |
| `[3]` | expression/reference | `x3 - x2` |
| `[4]` | expression/reference | `y1 - y0` |

### `left` *(line 649)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x0` |
| `[2]` | expression/reference | `y1` |
| `[3]` | expression/reference | `x1 - x0` |
| `[4]` | expression/reference | `y2 - y1` |

### `center` *(line 650)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x1` |
| `[2]` | expression/reference | `y1` |
| `[3]` | expression/reference | `x2 - x1` |
| `[4]` | expression/reference | `y2 - y1` |

### `right` *(line 651)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x2` |
| `[2]` | expression/reference | `y1` |
| `[3]` | expression/reference | `x3 - x2` |
| `[4]` | expression/reference | `y2 - y1` |

### `bottom_left` *(line 652)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x0` |
| `[2]` | expression/reference | `y2` |
| `[3]` | expression/reference | `x1 - x0` |
| `[4]` | expression/reference | `y3 - y2` |

### `bottom` *(line 653)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x1` |
| `[2]` | expression/reference | `y2` |
| `[3]` | expression/reference | `x2 - x1` |
| `[4]` | expression/reference | `y3 - y2` |

### `bottom_right` *(line 654)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `x2` |
| `[2]` | expression/reference | `y2` |
| `[3]` | expression/reference | `x3 - x2` |
| `[4]` | expression/reference | `y3 - y2` |

### `grid_positions` *(line 662)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `top_left` | table | `{ 1, 1 }` |
| `top` | table | `{ 2, 1 }` |
| `top_right` | table | `{ 3, 1 }` |
| `left` | table | `{ 1, 2 }` |
| `center` | table | `{ 2, 2 }` |
| `right` | table | `{ 3, 2 }` |
| `bottom_left` | table | `{ 1, 3 }` |
| `bottom` | table | `{ 2, 3 }` |
| `bottom_right` | table | `{ 3, 3 }` |

### `top_left` *(line 663)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `1` |
| `[2]` | number literal | `1` |

### `top` *(line 664)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `2` |
| `[2]` | number literal | `1` |

### `top_right` *(line 665)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `3` |
| `[2]` | number literal | `1` |

### `left` *(line 666)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `1` |
| `[2]` | number literal | `2` |

### `center` *(line 667)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `2` |
| `[2]` | number literal | `2` |

### `right` *(line 668)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `3` |
| `[2]` | number literal | `2` |

### `bottom_left` *(line 669)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `1` |
| `[2]` | number literal | `3` |

### `bottom` *(line 670)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `2` |
| `[2]` | number literal | `3` |

### `bottom_right` *(line 671)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `3` |
| `[2]` | number literal | `3` |

### `TextPanel` *(line 816)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o._glyph_ids` *(line 829)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o._sprite_ids` *(line 830)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `layout_opts` *(line 871)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | expression/reference | `font` |
| `scale` | expression/reference | `scale` |
| `halign` | expression/reference | `halign` |
| `valign` | expression/reference | `valign` |
| `line_spacing` | expression/reference | `line_spacing` |
| `width` | expression/reference | `layout_width` |
| `height` | nil | `nil` |

### `sizes` *(line 910)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._glyph_ids` *(line 1023)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._sprite_ids` *(line 1025)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `children` *(line 1029)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ kind = "text", text = self._text or "", font = options.font, scale = options.scale, color = options.color, halign = options.halign, valign…` |

### `measured` *(line 1049)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `slice_options` *(line 1141)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._options.padding` *(line 1261)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `left` | expression/reference | `v` |
| `right` | expression/reference | `v` |
| `top` | expression/reference | `v` |
| `bottom` | expression/reference | `v` |

### `self._options.color` *(line 1263)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `v.r or 255` |
| `g` | expression/reference | `v.g or 255` |
| `b` | expression/reference | `v.b or 255` |
| `a` | expression/reference | `v.a or 255` |

### `self._glyph_ids` *(line 1283)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._sprite_ids` *(line 1287)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/sliced-sprite.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
