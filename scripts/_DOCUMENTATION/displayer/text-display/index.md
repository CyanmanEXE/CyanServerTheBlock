# `text-display.lua`

> **Source:** `scripts/displayer/text-display.lua`  
> **Source lines:** 757  
> **Functions detected:** 58  
> **Table declarations detected:** 14

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Unified text renderer for static text, marquee text, and BN-style typewriter boxes. Public coordinates are virtual 240x160 coordinates. Hardened with deterministic marquee IDs, pixel-snapped updates, real paging, explicit teardown, and a public layout/measurement API.

## Dependencies

- `scripts/displayer/font-system` — line 9
- `scripts/animation-engine/animation-engine` — line 10
- `scripts/displayer/text-layout` — line 11

## Events

- `Net:on("tick", function(event) ...)` — line 551. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 555. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 15 | `normalize_loops` | `value` |
| 23 | `normalize_scale` | `value, fallback` |
| 29 | `pixel_snap_virtual` | `value` |
| 34 | `copy_table` | `src` |
| 40 | `safe_call` | `fn, ...` |
| 46 | `deterministic_glyph_id` | `text_id, index` |
| 53 | `DisplayInstance:new` | `owner, player_id, text_id, text, x, y, options` |
| 134 | `DisplayInstance:relayout` | `(none)` |
| 149 | `DisplayInstance:_glyphOptions` | `glyph, extra` |
| 175 | `DisplayInstance:_eraseGlyphId` | `id` |
| 180 | `DisplayInstance:_eraseAllGlyphs` | `(none)` |
| 196 | `DisplayInstance:_drawStatic` | `(none)` |
| 214 | `DisplayInstance:_drawBackdrop` | `(none)` |
| 253 | `DisplayInstance:_eraseBackdrop` | `force` |
| 261 | `DisplayInstance:_marqueeGlyphs` | `(none)` |
| 274 | `DisplayInstance:_drawMarqueeAt` | `offset, elapsed` |
| 308 | `DisplayInstance:_cleanupMarquee` | `done` |
| 314 | `pass` | `n` |
| 326 | `DisplayInstance:_startMarquee` | `(none)` |
| 348 | `on_update` | `values` |
| 354 | `on_complete` | `_, interrupted` |
| 366 | `DisplayInstance:_pageMeta` | `page_index` |
| 370 | `DisplayInstance:_currentGlyph` | `(none)` |
| 378 | `DisplayInstance:_cancelPendingCharacter` | `(none)` |
| 385 | `DisplayInstance:_scheduleNextChar` | `delay` |
| 394 | `DisplayInstance:_startCurrentPage` | `(none)` |
| 406 | `DisplayInstance:_pageFinished` | `(none)` |
| 411 | `DisplayInstance:_drawTypewriterGlyph` | `glyph` |
| 429 | `DisplayInstance:_printNextChar` | `(none)` |
| 456 | `DisplayInstance:_finishCurrentPageImmediately` | `(none)` |
| 473 | `DisplayInstance:_eraseCurrentPage` | `(none)` |
| 488 | `DisplayInstance:advance` | `(none)` |
| 503 | `DisplayInstance:reset` | `text, options` |
| 534 | `DisplayInstance:close` | `(none)` |
| 545 | `TextDisplay:init` | `(none)` |
| 561 | `TextDisplay:layout` | `text, options` |
| 565 | `TextDisplay:measure` | `text, options` |
| 569 | `TextDisplay:cleanupPlayer` | `player_id` |
| 576 | `TextDisplay:updateAll` | `_dt` |
| 589 | `TextDisplay:draw` | `player_id, text_id, text, x, y, options` |
| 599 | `TextDisplay:remove` | `player_id, text_id` |
| 606 | `TextDisplay:get` | `player_id, text_id` |
| 610 | `TextDisplay:getState` | `player_id, text_id` |
| 615 | `TextDisplay:getData` | `player_id, text_id` |
| 662 | `TextDisplay:setKeepAlive` | `player_id, text_id, value` |
| 669 | `TextDisplay:advance` | `player_id, text_id` |
| 676 | `TextDisplay:reset` | `player_id, text_id, text, options` |
| 688 | `copy_options` | `options` |
| 694 | `TextDisplay:drawStatic` | `player_id, text_id, text, x, y, options` |
| 701 | `TextDisplay:removeStatic` | `player_id, text_id` |
| 705 | `TextDisplay:drawMarquee` | `player_id, marquee_id, text, y, options` |
| 713 | `TextDisplay:removeMarquee` | `player_id, marquee_id` |
| 717 | `TextDisplay:createTextBox` | `player_id, box_id, text, x, y, width, height, options` |
| 726 | `TextDisplay:advanceTextBox` | `player_id, box_id` |
| 730 | `TextDisplay:closeTextBox` | `player_id, box_id` |
| 734 | `TextDisplay:getTextBoxState` | `player_id, box_id` |
| 747 | `TextDisplay:getTextBoxData` | `player_id, box_id` |
| 751 | `TextDisplay:resetTextBox` | `player_id, box_id, text, options` |

### Function notes

- **`normalize_loops(value)`** *(source line 15)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_scale(value, fallback)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`pixel_snap_virtual(value)`** *(source line 29)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`copy_table(src)`** *(source line 34)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`safe_call(fn, ...)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`deterministic_glyph_id(text_id, index)`** *(source line 46)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:new(owner, player_id, text_id, text, x, y, options)`** *(source line 53)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:relayout()`** *(source line 134)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_glyphOptions(glyph, extra)`** *(source line 149)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_eraseGlyphId(id)`** *(source line 175)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_eraseAllGlyphs()`** *(source line 180)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_drawStatic()`** *(source line 196)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_drawBackdrop()`** *(source line 214)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_eraseBackdrop(force)`** *(source line 253)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_marqueeGlyphs()`** *(source line 261)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_drawMarqueeAt(offset, elapsed)`** *(source line 274)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_cleanupMarquee(done)`** *(source line 308)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`pass(n)`** *(source line 314)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_startMarquee()`** *(source line 326)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 348)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(_, interrupted)`** *(source line 354)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_pageMeta(page_index)`** *(source line 366)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_currentGlyph()`** *(source line 370)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_cancelPendingCharacter()`** *(source line 378)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_scheduleNextChar(delay)`** *(source line 385)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_startCurrentPage()`** *(source line 394)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_pageFinished()`** *(source line 406)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_drawTypewriterGlyph(glyph)`** *(source line 411)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_printNextChar()`** *(source line 429)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_finishCurrentPageImmediately()`** *(source line 456)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:_eraseCurrentPage()`** *(source line 473)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:advance()`** *(source line 488)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:reset(text, options)`** *(source line 503)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`DisplayInstance:close()`** *(source line 534)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:init()`** *(source line 545)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:layout(text, options)`** *(source line 561)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:measure(text, options)`** *(source line 565)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:cleanupPlayer(player_id)`** *(source line 569)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:updateAll(_dt)`** *(source line 576)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:draw(player_id, text_id, text, x, y, options)`** *(source line 589)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:remove(player_id, text_id)`** *(source line 599)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:get(player_id, text_id)`** *(source line 606)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:getState(player_id, text_id)`** *(source line 610)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:getData(player_id, text_id)`** *(source line 615)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:setKeepAlive(player_id, text_id, value)`** *(source line 662)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:advance(player_id, text_id)`** *(source line 669)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:reset(player_id, text_id, text, options)`** *(source line 676)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`copy_options(options)`** — -------------------------------------------------------------------- Compatibility/public convenience wrappers used by the current Displayer facade. -------------------------------------------------------------------- *(source line 688)*
- **`TextDisplay:drawStatic(player_id, text_id, text, x, y, options)`** *(source line 694)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:removeStatic(player_id, text_id)`** *(source line 701)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:drawMarquee(player_id, marquee_id, text, y, options)`** *(source line 705)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:removeMarquee(player_id, marquee_id)`** *(source line 713)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:createTextBox(player_id, box_id, text, x, y, width, height, options)`** *(source line 717)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:advanceTextBox(player_id, box_id)`** *(source line 726)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:closeTextBox(player_id, box_id)`** *(source line 730)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:getTextBoxState(player_id, box_id)`** *(source line 734)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:getTextBoxData(player_id, box_id)`** *(source line 747)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextDisplay:resetTextBox(player_id, box_id, text, options)`** *(source line 751)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `TextDisplay` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 35)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `DisplayInstance` *(line 49)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o.global` *(line 71)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | call/expression | `tonumber(options.r) or 255` |
| `g` | call/expression | `tonumber(options.g) or 255` |
| `b` | call/expression | `tonumber(options.b) or 255` |
| `opacity` | call/expression | `tonumber(options.opacity) or 255` |
| `a` | call/expression | `tonumber(options.a) or 255` |
| `ro` | call/expression | `tonumber(options.ro) or 0` |
| `color_mode` | call/expression | `tonumber(options.color_mode) or 0` |

### `o.glyph_ids` *(line 84)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o.drawn` *(line 85)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `opts` *(line 150)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `scale` | expression/reference | `self.scale` |
| `z` | expression/reference | `self.z` |
| `r` | expression/reference | `self.global.r` |
| `g` | expression/reference | `self.global.g` |
| `b` | expression/reference | `self.global.b` |
| `opacity` | expression/reference | `self.global.opacity` |
| `a` | expression/reference | `self.global.a` |
| `ro` | expression/reference | `self.global.ro` |
| `color_mode` | expression/reference | `self.global.color_mode` |

### `self.glyph_ids` *(line 192)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.drawn` *(line 193)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.backdrop` *(line 250)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `asset_id` | expression/reference | `asset_id` |
| `draw_id` | expression/reference | `draw_id` |
| `keep` | expression/reference | `cfg.keep_backdrop == true` |

### `out` *(line 262)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `remove` *(line 578)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `line_x_offsets` *(line 618)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 689)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/text-display.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
