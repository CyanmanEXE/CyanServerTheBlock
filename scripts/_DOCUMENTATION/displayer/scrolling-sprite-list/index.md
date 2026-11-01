# `scrolling-sprite-list.lua`

> **Source:** `scripts/displayer/scrolling-sprite-list.lua`  
> **Source lines:** 645  
> **Functions detected:** 35  
> **Table declarations detected:** 15

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

- `scripts/animation-engine/animation-engine` — line 9
- `scripts/boom/main` — line 13

## Events

- `Net:on("player_join", function(event) ...)` — line 216. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 220. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 224. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 22 | `SpriteEntry:new` | `list_obj, player_id, list_id, index, def` |
| 53 | `SpriteEntry:setPosition` | `x, y` |
| 59 | `SpriteEntry:setColor` | `r, g, b, a` |
| 67 | `SpriteEntry:setScale` | `sx, sy` |
| 73 | `SpriteEntry:setAnimationState` | `state` |
| 78 | `SpriteEntry:redraw` | `(none)` |
| 118 | `SpriteEntry:destroy` | `(none)` |
| 132 | `SpriteEntry:startScroll` | `delay, distance, speed` |
| 146 | `SpriteEntry:_beginScroll` | `distance, speed` |
| 176 | `on_update` | `values` |
| 180 | `on_complete` | `(none)` |
| 198 | `ScrollingSpriteList:init` | `(none)` |
| 231 | `ScrollingSpriteList:setupPlayer` | `player_id` |
| 244 | `ScrollingSpriteList:cleanupPlayer` | `player_id` |
| 264 | `getFirstState` | `anim_path` |
| 288 | `ScrollingSpriteList:ensureSpriteAsset` | `player_id, sprite_def` |
| 327 | `ScrollingSpriteList:_computeGridPositions` | `config` |
| 367 | `ScrollingSpriteList:_drawBackdrop` | `player_id, list_id, config` |
| 394 | `ScrollingSpriteList:createScrollingList` | `player_id, list_id, x, y, width, height, config` |
| 479 | `list_object:onEntryFinished` | `(none)` |
| 491 | `list_object:getEntry` | `index` |
| 495 | `list_object:addSprite` | `sprite_def` |
| 502 | `list_object:setSprites` | `sprites` |
| 507 | `list_object:setSpeed` | `speed` |
| 511 | `list_object:setPosition` | `x, y` |
| 542 | `list_object:destroy` | `(none)` |
| 558 | `list_object:_recreateEntries` | `(none)` |
| 588 | `ScrollingSpriteList:updateAll` | `delta` |
| 591 | `ScrollingSpriteList:getList` | `player_id, list_id` |
| 596 | `ScrollingSpriteList:removeScrollingList` | `player_id, list_id` |
| 601 | `ScrollingSpriteList:setListPosition` | `player_id, list_id, x, y` |
| 607 | `ScrollingSpriteList:setListSpeed` | `player_id, list_id, speed` |
| 613 | `ScrollingSpriteList:addSpriteToList` | `player_id, list_id, sprite_def` |
| 619 | `ScrollingSpriteList:setListSprites` | `player_id, list_id, sprites` |
| 625 | `ScrollingSpriteList:getListState` | `player_id, list_id` |

### Function notes

- **`SpriteEntry:new(list_obj, player_id, list_id, index, def)`** *(source line 22)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SpriteEntry:setPosition(x, y)`** *(source line 53)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SpriteEntry:setColor(r, g, b, a)`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SpriteEntry:setScale(sx, sy)`** *(source line 67)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SpriteEntry:setAnimationState(state)`** *(source line 73)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SpriteEntry:redraw()`** *(source line 78)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SpriteEntry:destroy()`** *(source line 118)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SpriteEntry:startScroll(delay, distance, speed)`** *(source line 132)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`SpriteEntry:_beginScroll(distance, speed)`** *(source line 146)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 176)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 180)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:init()`** — -------------------------------------------------------------------- ScrollingSpriteList main class (unchanged except where noted) -------------------------------------------------------------------- *(source line 198)*
- **`ScrollingSpriteList:setupPlayer(player_id)`** *(source line 231)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:cleanupPlayer(player_id)`** *(source line 244)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`getFirstState(anim_path)`** — Helper: get first available animation state from an animation file *(source line 264)*
- **`ScrollingSpriteList:ensureSpriteAsset(player_id, sprite_def)`** *(source line 288)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:_computeGridPositions(config)`** *(source line 327)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:_drawBackdrop(player_id, list_id, config)`** *(source line 367)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:createScrollingList(player_id, list_id, x, y, width, height, config)`** *(source line 394)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:onEntryFinished()`** *(source line 479)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:getEntry(index)`** *(source line 491)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:addSprite(sprite_def)`** *(source line 495)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:setSprites(sprites)`** *(source line 502)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:setSpeed(speed)`** *(source line 507)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:setPosition(x, y)`** *(source line 511)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:destroy()`** *(source line 542)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`list_object:_recreateEntries()`** *(source line 558)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:updateAll(delta)`** *(source line 588)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:getList(player_id, list_id)`** — Legacy API wrappers *(source line 591)*
- **`ScrollingSpriteList:removeScrollingList(player_id, list_id)`** *(source line 596)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:setListPosition(player_id, list_id, x, y)`** *(source line 601)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:setListSpeed(player_id, list_id, speed)`** *(source line 607)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:addSpriteToList(player_id, list_id, sprite_def)`** *(source line 613)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:setListSprites(player_id, list_id, sprites)`** *(source line 619)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ScrollingSpriteList:getListState(player_id, list_id)`** *(source line 625)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ScrollingSpriteList` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `anim_cache` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `SpriteEntry` *(line 19)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o.props` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `r` | expression/reference | `def.r or 255` |
| `g` | expression/reference | `def.g or 255` |
| `b` | expression/reference | `def.b or 255` |
| `a` | expression/reference | `def.a or 255` |
| `opacity` | expression/reference | `def.opacity or 255` |
| `sx` | expression/reference | `def.sx or 1` |
| `sy` | expression/reference | `def.sy or 1` |
| `ro` | expression/reference | `def.ro or 0` |
| `color_mode` | expression/reference | `def.color_mode or 0` |
| `anim_state` | expression/reference | `def.anim_state` |

### `draw` *(line 84)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | call/expression | `self.instance_id or (self.list_id .. "_entry_" .. self.index)` |
| `x` | expression/reference | `self.props.x` |
| `y` | expression/reference | `self.props.y` |
| `z` | expression/reference | `self.list.config.z_order` |
| `sx` | expression/reference | `self.props.sx` |
| `sy` | expression/reference | `self.props.sy` |
| `r` | expression/reference | `self.props.r` |
| `g` | expression/reference | `self.props.g` |
| `b` | expression/reference | `self.props.b` |
| `opacity` | expression/reference | `self.props.opacity` |
| `a` | expression/reference | `self.props.a` |
| `ro` | expression/reference | `self.props.ro` |
| `color_mode` | expression/reference | `self.props.color_mode` |
| `ox` | number literal | `0` |
| `oy` | number literal | `0` |

### `self.player_lists` *(line 199)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.player_assets` *(line 200)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.player_backdrop_sprite` *(line 201)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.default_config` *(line 202)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `z_order` | number literal | `100` |
| `scroll_speed` | number literal | `30` |
| `entry_delay` | number literal | `1.0` |
| `loop` | boolean literal | `false` |
| `destroy_when_finished` | boolean literal | `true` |
| `destroy_delay` | number literal | `1.0` |
| `max_columns` | number literal | `1` |
| `column_spacing` | number literal | `5` |
| `row_spacing` | number literal | `5` |
| `align` | string literal | `"left"` |

### `alloc_params` *(line 305)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | expression/reference | `sprite_def.texture_path` |
| `anim_path` | expression/reference | `anim_path or ""` |

### `positions` *(line 354)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `list_config` *(line 398)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `list_object` *(line 449)*

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

### `entries` *(line 456)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.entries` *(line 565)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/scrolling-sprite-list.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
