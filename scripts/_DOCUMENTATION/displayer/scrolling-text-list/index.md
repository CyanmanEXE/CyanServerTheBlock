# `scrolling-text-list.lua`

> **Source:** `scripts/displayer/scrolling-text-list.lua`  
> **Source lines:** 569  
> **Functions detected:** 36  
> **Table declarations detected:** 14

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

[[

## Dependencies

- `scripts/displayer/font-system` — line 9
- `scripts/animation-engine/animation-engine` — line 10

## Events

- `Net:on("player_join", function(event) ...)` — line 235. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 239. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 245. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 14 | `normalize_scale` | `value, fallback` |
| 20 | `getFontHeight` | `font_name, scale` |
| 32 | `TextEntry:new` | `list_obj, player_id, list_id, index, text, config` |
| 54 | `TextEntry:_createGlyphs` | `y_offset` |
| 113 | `TextEntry:_updatePositions` | `y_offset` |
| 121 | `TextEntry:setPosition` | `x, y` |
| 129 | `TextEntry:setColor` | `r, g, b, a` |
| 146 | `TextEntry:setScale` | `scale` |
| 153 | `TextEntry:destroy` | `(none)` |
| 171 | `TextEntry:startScroll` | `delay, distance, speed` |
| 185 | `TextEntry:_beginScroll` | `distance, speed` |
| 198 | `on_update` | `values` |
| 201 | `on_complete` | `(none)` |
| 217 | `ScrollingTextList:init` | `(none)` |
| 252 | `ScrollingTextList:setupPlayer` | `player_id` |
| 264 | `ScrollingTextList:cleanupPlayer` | `player_id` |
| 279 | `ScrollingTextList:_drawBackdrop` | `player_id, list_id, config` |
| 302 | `ScrollingTextList:_computeGridPositions` | `config` |
| 316 | `ScrollingTextList:createScrollingList` | `player_id, list_id, x, y, width, height, config` |
| 397 | `list_object:onEntryFinished` | `(none)` |
| 409 | `list_object:getEntry` | `index` |
| 413 | `list_object:addText` | `text` |
| 419 | `list_object:setTexts` | `texts` |
| 424 | `list_object:setScale` | `scale` |
| 430 | `list_object:setSpeed` | `speed` |
| 435 | `list_object:setPosition` | `x, y` |
| 458 | `list_object:destroy` | `(none)` |
| 478 | `list_object:_recreateEntries` | `(none)` |
| 512 | `ScrollingTextList:updateAll` | `delta` |
| 515 | `ScrollingTextList:getList` | `player_id, list_id` |
| 520 | `ScrollingTextList:removeScrollingList` | `player_id, list_id` |
| 525 | `ScrollingTextList:setListPosition` | `player_id, list_id, x, y` |
| 531 | `ScrollingTextList:setListSpeed` | `player_id, list_id, speed` |
| 537 | `ScrollingTextList:addTextToList` | `player_id, list_id, text` |
| 543 | `ScrollingTextList:setListTexts` | `player_id, list_id, texts` |
| 549 | `ScrollingTextList:getListState` | `player_id, list_id` |

### Function notes

- **`normalize_scale(value, fallback)`** *(source line 14)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`getFontHeight(font_name, scale)`** *(source line 20)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextEntry:new(list_obj, player_id, list_id, index, text, config)`** *(source line 32)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextEntry:_createGlyphs(y_offset)`** — Create glyphs at current position (grid_x, grid_y + y_offset) *(source line 54)*
- **`TextEntry:_updatePositions(y_offset)`** — Update glyph positions (used during scrolling) *(source line 113)*
- **`TextEntry:setPosition(x, y)`** *(source line 121)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextEntry:setColor(r, g, b, a)`** *(source line 129)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextEntry:setScale(scale)`** *(source line 146)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextEntry:destroy()`** *(source line 153)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextEntry:startScroll(delay, distance, speed)`** — Start scrolling: after delay, animate y_offset from 0 to -distance *(source line 171)*
- **`TextEntry:_beginScroll(distance, speed)`** *(source line 185)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 198)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 201)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:init()`** — -------------------------------------------------------------------- ScrollingTextList main class -------------------------------------------------------------------- *(source line 217)*
- **`ScrollingTextList:setupPlayer(player_id)`** *(source line 252)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:cleanupPlayer(player_id)`** *(source line 264)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:_drawBackdrop(player_id, list_id, config)`** *(source line 279)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:_computeGridPositions(config)`** *(source line 302)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:createScrollingList(player_id, list_id, x, y, width, height, config)`** *(source line 316)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:onEntryFinished()`** — Method to handle entry finished *(source line 397)*
- **`list_object:getEntry(index)`** *(source line 409)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:addText(text)`** *(source line 413)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:setTexts(texts)`** *(source line 419)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:setScale(scale)`** *(source line 424)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:setSpeed(speed)`** *(source line 430)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:setPosition(x, y)`** *(source line 435)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:destroy()`** *(source line 458)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:_recreateEntries()`** *(source line 478)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:updateAll(delta)`** — updateAll is now a no‑op (kept for compatibility) *(source line 512)*
- **`ScrollingTextList:getList(player_id, list_id)`** — Legacy API wrappers (unchanged, but now use list_object methods) *(source line 515)*
- **`ScrollingTextList:removeScrollingList(player_id, list_id)`** *(source line 520)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:setListPosition(player_id, list_id, x, y)`** *(source line 525)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:setListSpeed(player_id, list_id, speed)`** *(source line 531)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:addTextToList(player_id, list_id, text)`** *(source line 537)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:setListTexts(player_id, list_id, texts)`** *(source line 543)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingTextList:getListState(player_id, list_id)`** *(source line 549)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ScrollingTextList` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `TextEntry` *(line 29)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o.props` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `a` | number literal | `255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |

### `glyph_data` *(line 84)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `opts` *(line 92)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `scale` | expression/reference | `self.scale` |
| `z` | expression/reference | `self.z` |
| `r` | expression/reference | `self.props.r` |
| `g` | expression/reference | `self.props.g` |
| `b` | expression/reference | `self.props.b` |
| `a` | expression/reference | `self.props.a` |
| `ro` | expression/reference | `self.props.ro` |
| `color_mode` | expression/reference | `self.props.color_mode` |

### `self.player_lists` *(line 218)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.player_backdrop_sprite` *(line 219)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.default_config` *(line 220)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `1.0` |
| `z_order` | number literal | `100` |
| `scroll_speed` | number literal | `30` |
| `line_spacing` | number literal | `15` |
| `entry_delay` | number literal | `1.0` |
| `loop` | boolean literal | `false` |
| `destroy_when_finished` | boolean literal | `true` |
| `destroy_delay` | number literal | `1.0` |

### `self.states` *(line 232)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `waiting` | string literal | `"waiting"` |
| `scrolling` | string literal | `"scrolling"` |
| `finished` | string literal | `"finished"` |

### `positions` *(line 303)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `list_config` *(line 320)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `list_object` *(line 369)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `parent` | expression/reference | `self` |
| `player_id` | expression/reference | `player_id` |
| `list_id` | expression/reference | `list_id` |
| `config` | expression/reference | `list_config` |
| `backdrop_id` | expression/reference | `backdrop_id` |
| `entries` | table | `{}` |
| `active_count` | number literal | `0` |
| `finished` | boolean literal | `false` |
| `remove_delay_id` | nil | `nil` |

### `entries` *(line 375)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.entries` *(line 490)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/scrolling-text-list.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
