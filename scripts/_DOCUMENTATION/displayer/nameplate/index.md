# `nameplate.lua`

> **Source:** `scripts/displayer/nameplate.lua`  
> **Source lines:** 628  
> **Functions detected:** 14  
> **Table declarations detected:** 9

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

- `scripts/animation-engine/animation-engine` — line 10

## Events

- `Net:on("player_disconnect", function(event) ...)` — line 36. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `ceil_div` | `a, b` |
| 13 | `Nameplate:new` | `font_system` |
| 52 | `Nameplate:setTextAPI` | `api` |
| 57 | `Nameplate:ensureAssets` | `player_id` |
| 97 | `Nameplate:cleanupPlayer` | `player_id` |
| 117 | `Nameplate:_redraw` | `player_id, np, assets` |
| 260 | `Nameplate:attach` | `player_id, player_data, box_id, box_data, cfg` |
| 419 | `on_update` | `values` |
| 438 | `on_update` | `values` |
| 448 | `Nameplate:erase` | `player_id, player_data, box_data` |
| 547 | `Nameplate:begin_close` | `player_id, player_data, box_data, cfg` |
| 604 | `on_update` | `values` |
| 608 | `on_complete` | `(none)` |
| 624 | `Nameplate:update` | `player_id, player_data, box_data, dt` |

### Function notes

- **`ceil_div(a, b)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Nameplate:new(font_system)`** *(source line 13)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Nameplate:setTextAPI(api)`** — Inject the Text API (called from displayer:init() after Text is ready) *(source line 52)*
- **`Nameplate:ensureAssets(player_id)`** — Ensure all required sprite assets are allocated for a player. *(source line 57)*
- **`Nameplate:cleanupPlayer(player_id)`** — Deallocate all nameplate assets for a player. *(source line 97)*
- **`Nameplate:_redraw(player_id, np, assets)`** — Redraw the nameplate based on current np.mids_drawn, np.y, etc. *(source line 117)*
- **`Nameplate:attach(player_id, player_data, box_id, box_data, cfg)`** — Attach a nameplate to a text box. *(source line 260)*
- **`on_update(values)`** *(source line 419)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 438)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Nameplate:erase(player_id, player_data, box_data)`** — Erase a nameplate *(source line 448)*
- **`Nameplate:begin_close(player_id, player_data, box_data, cfg)`** — Begin the closing animation *(source line 547)*
- **`on_update(values)`** *(source line 604)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 608)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Nameplate:update(player_id, player_data, box_data, dt)`** *(source line 624)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Nameplate` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o.player_assets` *(line 32)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o.nameplate_registry` *(line 34)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `assets` *(line 59)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `assets.base_mid` *(line 73)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `assets.frame_mid` *(line 85)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `glyph_ids` *(line 230)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `frame_tint` *(line 348)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | call/expression | `tonumber(f.r) or 255` |
| `g` | call/expression | `tonumber(f.g) or 255` |
| `b` | call/expression | `tonumber(f.b) or 255` |
| `a` | call/expression | `tonumber(f.a) or 255` |
| `color_mode` | call/expression | `tonumber(f.color_mode) or 2` |

### `np` *(line 360)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `box_id` | expression/reference | `box_id` |
| `idp` | expression/reference | `idp` |
| `text` | expression/reference | `text` |
| `font` | expression/reference | `font_name` |
| `text_scale` | expression/reference | `text_scale` |
| `pad_px` | expression/reference | `pad_px` |
| `scale` | expression/reference | `scale` |
| `base_x` | expression/reference | `x` |
| `base_y` | expression/reference | `y` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |
| `frame` | expression/reference | `frame_tint` |
| `bob_amp` | call/expression | `(type(cfg) == "table" and cfg.bob_amp) or (3 * scale)` |
| `bob_speed` | call/expression | `(type(cfg) == "table" and cfg.bob_speed) or 1.0` |
| `bob_offset` | number literal | `0` |
| `mids_target` | expression/reference | `mids_target` |
| `mid_w` | expression/reference | `mid_w` |
| `total_w_full` | expression/reference | `total_w` |
| `center_x` | expression/reference | `center_x` |
| `mids_drawn` | number literal | `0` |
| `complete` | boolean literal | `false` |
| `text_glyph_ids` | nil | `nil` |
| `closing` | boolean literal | `false` |
| `unfold_anim_id` | nil | `nil` |
| `bob_anim_id` | nil | `nil` |
| `close_anim_id` | nil | `nil` |
| `erasing` | boolean literal | `false` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/nameplate.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
