# `ui-safe.lua`

> **Source:** `scripts/net-games/ui-safe.lua`  
> **Source lines:** 164  
> **Functions detected:** 12  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/net-games/ui-safe.lua Small hardened sprite helper for reusable net-games UI. Public coordinates are virtual 240x160 coordinates. Production lessons captured here: * arbitrary assets are checked before provide_asset_for_player when possible; * changing a texture/animation allocates a fresh physical sprite id to avoid stale client-side texture caching; * positions are pixel-snapped by default; * unchanged draws are not retransmitted; * all owned sprites are cleaned on disconnect.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- `Net:on("player_disconnect", function(event) ...)` — line 160. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 18 | `player_state` | `player_id` |
| 23 | `confirmed_missing` | `path` |
| 30 | `UISafe.asset_exists` | `path` |
| 34 | `UISafe.safe_provide` | `player_id, path` |
| 39 | `same_draw` | `a, b` |
| 51 | `erase_entry` | `player_id, entry` |
| 57 | `allocate_entry` | `player_id, logical_id, texture_path, anim_path, anim_state` |
| 80 | `virtual_to_screen` | `v, pixel_snap` |
| 86 | `UISafe.draw` | `player_id, logical_id, texture_path, options` |
| 136 | `UISafe.erase` | `player_id, logical_id` |
| 147 | `UISafe.cleanup_player` | `player_id` |
| 154 | `UISafe.invalidate` | `player_id, logical_id` |

### Function notes

- **`player_state(player_id)`** *(source line 18)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`confirmed_missing(path)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`UISafe.asset_exists(path)`** *(source line 30)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`UISafe.safe_provide(player_id, path)`** *(source line 34)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`same_draw(a, b)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_entry(player_id, entry)`** *(source line 51)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`allocate_entry(player_id, logical_id, texture_path, anim_path, anim_state)`** *(source line 57)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`virtual_to_screen(v, pixel_snap)`** *(source line 80)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`UISafe.draw(player_id, logical_id, texture_path, options)`** *(source line 86)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`UISafe.erase(player_id, logical_id)`** *(source line 136)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`UISafe.cleanup_player(player_id)`** *(source line 147)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`UISafe.invalidate(player_id, logical_id)`** *(source line 154)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `UISafe` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `players` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keys` *(line 41)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"x"` |
| `[2]` | string literal | `"y"` |
| `[3]` | string literal | `"z"` |
| `[4]` | string literal | `"sx"` |
| `[5]` | string literal | `"sy"` |
| `[6]` | string literal | `"r"` |
| `[7]` | string literal | `"g"` |
| `[8]` | string literal | `"b"` |
| `[9]` | string literal | `"opacity"` |
| `[10]` | string literal | `"a"` |
| `[11]` | string literal | `"ro"` |
| `[12]` | string literal | `"ox"` |
| `[13]` | string literal | `"oy"` |
| `[14]` | string literal | `"color_mode"` |
| `[15]` | string literal | `"anim_state"` |

### `draw` *(line 106)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `entry.draw_id` |
| `x` | call/expression | `virtual_to_screen(options.x` |
| `[3]` | expression/reference | `options.pixel_snap)` |
| `y` | call/expression | `virtual_to_screen(options.y` |
| `[5]` | expression/reference | `options.pixel_snap)` |
| `z` | expression/reference | `options.z or 100` |
| `sx` | expression/reference | `options.sx or options.scale or 2.0` |
| `sy` | expression/reference | `options.sy or options.scale or options.sx or 2.0` |
| `r` | expression/reference | `options.r or 255` |
| `g` | expression/reference | `options.g or 255` |
| `b` | expression/reference | `options.b or 255` |
| `opacity` | expression/reference | `options.opacity or 255` |
| `a` | expression/reference | `options.a or 255` |
| `ro` | expression/reference | `options.ro or 0` |
| `ox` | expression/reference | `options.ox` |
| `oy` | expression/reference | `options.oy` |
| `color_mode` | expression/reference | `options.color_mode or 0` |
| `anim_state` | expression/reference | `options.anim_state or ""` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/ui-safe.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
