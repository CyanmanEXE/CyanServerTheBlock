# `font-system.lua`

> **Source:** `scripts/displayer/font-system.lua`  
> **Source lines:** 678  
> **Functions detected:** 18  
> **Table declarations detected:** 33

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

- `scripts/boom/main` — line 14
- `scripts/utils/async` — line 15

## Events

- `Net:on("player_request", function(event) ...)` — line 650. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 663. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 154 | `load_animation_metrics` | `anim_path` |
| 190 | `FontSystem:loadAllFonts` | `(none)` |
| 207 | `FontSystem:getGlyphState` | `font_name, char` |
| 283 | `FontSystem:getGlyphDimensions` | `font_name, char` |
| 298 | `FontSystem:isBattleFont` | `font_name` |
| 310 | `FontSystem:getVirtualAdvance` | `font_name, char, scale` |
| 323 | `FontSystem:getScreenAdvance` | `font_name, char, scale` |
| 335 | `FontSystem:setupPlayer` | `player_id` |
| 350 | `FontSystem:provideAllFontAssets` | `player_id` |
| 358 | `FontSystem:cleanupPlayer` | `player_id` |
| 382 | `FontSystem:ensureAssetAllocated` | `player_id, font_name` |
| 416 | `FontSystem:nextInstanceId` | `player_id, prefix` |
| 449 | `FontSystem:drawGlyph` | `player_id, font_name, char, x, y, options` |
| 524 | `FontSystem:updateGlyph` | `player_id, instance_id, updates` |
| 594 | `FontSystem:eraseGlyph` | `player_id, instance_id` |
| 604 | `FontSystem:eraseGlyphsByPrefix` | `player_id, prefix` |
| 616 | `FontSystem:allocateAllFontsForPlayer` | `player_id` |
| 647 | `FontSystem:init` | `(none)` |

### Function notes

- **`load_animation_metrics(anim_path)`** — -------------------------------------------------------------------- Helper: load animation data using boom (strip "/server/" prefix) -------------------------------------------------------------------- -@param anim_path string   # full path with "/server/" -@return table<string, {w:number, h:number, ox:number, oy:number}> metrics -@return table<string, boolean> states *(source line 154)*
- **`FontSystem:loadAllFonts()`** — -------------------------------------------------------------------- Initialize global font data (call once on server start) -------------------------------------------------------------------- *(source line 190)*
- **`FontSystem:getGlyphState(font_name, char)`** — -------------------------------------------------------------------- Determine the correct animation state for a given font and character -------------------------------------------------------------------- -@param font_name string -@param char string -@return string|nil   -- animation state name, or nil if no glyph *(source line 207)*
- **`FontSystem:getGlyphDimensions(font_name, char)`** — -------------------------------------------------------------------- Get glyph dimensions (after scale) for spacing calculations -------------------------------------------------------------------- -@param font_name string -@param char string -@return number width, number height *(source line 283)*
- **`FontSystem:isBattleFont(font_name)`** — - Check if a font name is a battle variant (no extra spacing). -@param font_name string -@return boolean *(source line 298)*
- **`FontSystem:getVirtualAdvance(font_name, char, scale)`** — -------------------------------------------------------------------- Glyph advance helpers (single source of truth for text layout) -------------------------------------------------------------------- - Get glyph advance in virtual 240x160 units (matches TextLayout). -@param font_name string -@param char string -@param scale number -@return number *(source line 310)*
- **`FontSystem:getScreenAdvance(font_name, char, scale)`** — - Get glyph advance in screen (480x320) units. -@param font_name string -@param char string -@param scale number -@return number *(source line 323)*
- **`FontSystem:setupPlayer(player_id)`** — -------------------------------------------------------------------- Per‑player asset management -------------------------------------------------------------------- -@param player_id string *(source line 335)*
- **`FontSystem:provideAllFontAssets(player_id)`** — - Provide all font textures and animation files for a player. -@param player_id string *(source line 350)*
- **`FontSystem:cleanupPlayer(player_id)`** — -@param player_id string *(source line 358)*
- **`FontSystem:ensureAssetAllocated(player_id, font_name)`** — Ensure the sprite asset for a given font is allocated for the player -@param player_id string -@param font_name string -@return string? sprite_id *(source line 382)*
- **`FontSystem:nextInstanceId(player_id, prefix)`** — Generate a unique instance ID for a player -@param player_id string -@param prefix string -@return string *(source line 416)*
- **`FontSystem:drawGlyph(player_id, font_name, char, x, y, options)`** — Draw a single glyph. -@param player_id string -@param font_name string -@param char string -@param x number       # virtual 240×160 coordinate -@param y number       # virtual 240×160 coordinate -@param options? GlyphOptions -@return string|nil instance_id *(source line 449)*
- **`FontSystem:updateGlyph(player_id, instance_id, updates)`** — Update an existing glyph. -@param player_id string -@param instance_id string -@param updates GlyphOptions   -- can include 'char', 'x', 'y' in virtual space *(source line 524)*
- **`FontSystem:eraseGlyph(player_id, instance_id)`** — Erase a glyph instance. -@param player_id string -@param instance_id string *(source line 594)*
- **`FontSystem:eraseGlyphsByPrefix(player_id, prefix)`** — Erase all glyphs with a given prefix. -@param player_id string -@param prefix string *(source line 604)*
- **`FontSystem:allocateAllFontsForPlayer(player_id)`** — -------------------------------------------------------------------- Asynchronous font allocation (one font every 0.5 seconds) -------------------------------------------------------------------- *(source line 616)*
- **`FontSystem:init()`** — -------------------------------------------------------------------- Initialization and event hooks -------------------------------------------------------------------- *(source line 647)*

## Tables and data structures

### `FontSystem` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `FONTS` *(line 23)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `THICK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_thick.animation", …` |
| `THIN` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_thin.animation", p…` |
| `WIDE` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_wide.animation", p…` |
| `TINY` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_tiny.animation", p…` |
| `BATTLE` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_battle.animation",…` |
| `GRADIENT` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.animation…` |
| `GRADIENT_GOLD` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.animation…` |
| `GRADIENT_ORANGE` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.animation…` |
| `GRADIENT_GREEN` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.animation…` |
| `GRADIENT_TALL` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.animation…` |
| `SHIMMER` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_shimmer.png", anim_path = "/server/assets/net-games/fonts/fonts_shimmer.animation", p…` |
| `THICK_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_thick.animati…` |
| `THIN_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_thin.animatio…` |
| `WIDE_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_wide.animatio…` |
| `TINY_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_tiny.animatio…` |
| `BATTLE_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_battle.animat…` |
| `GRADIENT_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.anim…` |
| `GRADIENT_GOLD_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.anim…` |
| `GRADIENT_ORANGE_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.anim…` |
| `GRADIENT_GREEN_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.anim…` |
| `GRADIENT_TALL_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_dark_compressed.png", anim_path = "/server/assets/net-games/fonts/fonts_gradient.anim…` |
| `SHIMMER_BLACK` | table | `{ texture_path = "/server/assets/net-games/fonts/fonts_black_shimmer.png", anim_path = "/server/assets/net-games/fonts/fonts_shimmer.animati…` |

### `THICK` *(line 25)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_thick.animation"` |
| `prefix` | string literal | `"THICK"` |

### `THIN` *(line 30)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_thin.animation"` |
| `prefix` | string literal | `"THIN"` |

### `WIDE` *(line 35)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_wide.animation"` |
| `prefix` | string literal | `"WIDE"` |

### `TINY` *(line 40)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_tiny.animation"` |
| `prefix` | string literal | `"TINY"` |

### `BATTLE` *(line 45)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_battle.animation"` |
| `prefix` | string literal | `"BATTLE"` |

### `GRADIENT` *(line 50)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT"` |

### `GRADIENT_GOLD` *(line 55)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT_GOLD"` |

### `GRADIENT_ORANGE` *(line 60)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT_ORANGE"` |

### `GRADIENT_GREEN` *(line 65)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT_GREEN"` |

### `GRADIENT_TALL` *(line 70)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT_TALL"` |

### `SHIMMER` *(line 76)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_shimmer.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_shimmer.animation"` |
| `prefix` | string literal | `"SHIMMER"` |

### `THICK_BLACK` *(line 83)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_thick.animation"` |
| `prefix` | string literal | `"THICK"` |

### `THIN_BLACK` *(line 88)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_thin.animation"` |
| `prefix` | string literal | `"THIN"` |

### `WIDE_BLACK` *(line 93)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_wide.animation"` |
| `prefix` | string literal | `"WIDE"` |

### `TINY_BLACK` *(line 98)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_tiny.animation"` |
| `prefix` | string literal | `"TINY"` |

### `BATTLE_BLACK` *(line 103)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_battle.animation"` |
| `prefix` | string literal | `"BATTLE"` |

### `GRADIENT_BLACK` *(line 108)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT"` |

### `GRADIENT_GOLD_BLACK` *(line 113)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT_GOLD"` |

### `GRADIENT_ORANGE_BLACK` *(line 118)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT_ORANGE"` |

### `GRADIENT_GREEN_BLACK` *(line 123)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT_GREEN"` |

### `GRADIENT_TALL_BLACK` *(line 128)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `prefix` | string literal | `"GRADIENT_TALL"` |

### `SHIMMER_BLACK` *(line 134)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/net-games/fonts/fonts_black_shimmer.png"` |
| `anim_path` | string literal | `"/server/assets/net-games/fonts/fonts_shimmer.animation"` |
| `prefix` | string literal | `"SHIMMER"` |

### `GLYPH_METRICS` *(line 143)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `AVAILABLE_STATES` *(line 146)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `metrics` *(line 166)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `states` *(line 168)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.font_char_map` *(line 198)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `draw` *(line 472)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `instance_id` |
| `x` | expression/reference | `screen_x` |
| `y` | expression/reference | `screen_y` |
| `z` | expression/reference | `z` |
| `sx` | expression/reference | `scale` |
| `sy` | expression/reference | `scale` |
| `anim_state` | expression/reference | `state` |
| `r` | expression/reference | `options.r or 255` |
| `g` | expression/reference | `options.g or 255` |
| `b` | expression/reference | `options.b or 255` |
| `opacity` | expression/reference | `options.opacity or 255` |
| `a` | expression/reference | `options.a or 255` |
| `ro` | expression/reference | `options.ro or 0` |
| `color_mode` | expression/reference | `options.color_mode or 0` |

### `props` *(line 501)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `screen_x` |
| `y` | expression/reference | `screen_y` |
| `z` | expression/reference | `z` |
| `scale` | expression/reference | `scale` |
| `state` | expression/reference | `state` |
| `r` | expression/reference | `draw.r` |
| `g` | expression/reference | `draw.g` |
| `b` | expression/reference | `draw.b` |
| `opacity` | expression/reference | `draw.opacity` |
| `a` | expression/reference | `draw.a` |
| `ro` | expression/reference | `draw.ro` |
| `color_mode` | expression/reference | `draw.color_mode` |
| `ox` | expression/reference | `draw.ox` |
| `oy` | expression/reference | `draw.oy` |

### `draw` *(line 569)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `instance_id` |
| `x` | expression/reference | `inst.props.x` |
| `y` | expression/reference | `inst.props.y` |
| `z` | expression/reference | `inst.props.z` |
| `sx` | expression/reference | `inst.props.scale` |
| `sy` | expression/reference | `inst.props.scale` |
| `anim_state` | expression/reference | `inst.props.state` |
| `r` | expression/reference | `inst.props.r or 255` |
| `g` | expression/reference | `inst.props.g or 255` |
| `b` | expression/reference | `inst.props.b or 255` |
| `opacity` | expression/reference | `inst.props.opacity or 255` |
| `a` | expression/reference | `inst.props.a or 255` |
| `ro` | expression/reference | `inst.props.ro or 0` |
| `color_mode` | expression/reference | `inst.props.color_mode or 0` |

### `font_names` *(line 620)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/font-system.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
