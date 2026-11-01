# `timer-display.lua`

> **Source:** `scripts/displayer/timer-display.lua`  
> **Source lines:** 527  
> **Functions detected:** 12  
> **Table declarations detected:** 6

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

- `scripts/displayer/font-system` — line 15
- `scripts/displayer/timer-system` — line 16

## Events

- `Net:on("timer_update", function(event) ...)` — line 38. The event name is taken directly from this source.
- `Net:on("countdown_update", function(event) ...)` — line 49. The event name is taken directly from this source.
- `Net:on("timer_remove", function(event) ...)` — line 60. The event name is taken directly from this source.
- `Net:on("countdown_remove", function(event) ...)` — line 71. The event name is taken directly from this source.
- `Net:on("timer_global_update", function(event) ...)` — line 83. The event name is taken directly from this source.
- `Net:on("countdown_global_update", function(event) ...)` — line 102. The event name is taken directly from this source.
- `Net:on("timer_global_create", function(event) ...)` — line 122. The event name is taken directly from this source.
- `Net:on("countdown_global_create", function(event) ...)` — line 141. The event name is taken directly from this source.
- `Net:on("timer_global_remove", function(event) ...)` — line 161. The event name is taken directly from this source.
- `Net:on("countdown_global_remove", function(event) ...)` — line 177. The event name is taken directly from this source.
- `Net:on("player_join", function(event) ...)` — line 193. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 216. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 19 | `dump` | `o` |
| 32 | `TimerDisplay:init` | `(none)` |
| 249 | `TimerDisplay:createPlayerTimerDisplay` | `player_id, display_id, x, y, options` |
| 259 | `TimerDisplay:createPlayerCountdownDisplay` | `player_id, display_id, x, y, options` |
| 268 | `TimerDisplay:createGlobalTimerDisplay` | `display_id, x, y, options` |
| 290 | `TimerDisplay:createGlobalCountdownDisplay` | `display_id, x, y, options` |
| 312 | `TimerDisplay:_createDisplay` | `player_id, display_id, x, y, type, options` |
| 343 | `TimerDisplay:updateTimerDisplay` | `player_id, display_id, seconds` |
| 350 | `TimerDisplay:updateCountdownDisplay` | `player_id, display_id, seconds` |
| 358 | `TimerDisplay:_updateDisplay` | `player_id, display_id, seconds, is_countdown` |
| 481 | `TimerDisplay:removeDisplay` | `player_id, display_id` |
| 500 | `TimerDisplay:setDisplayPosition` | `player_id, display_id, x, y` |

### Function notes

- **`dump(o)`** — Helper to dump a table for logging *(source line 19)*
- **`TimerDisplay:init()`** *(source line 32)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TimerDisplay:createPlayerTimerDisplay(player_id, display_id, x, y, options)`** — -@param player_id string -@param display_id string -@param x number        # virtual 240×160 coordinate -@param y number        # virtual 240×160 coordinate -@param options? TimerDisplayOptions *(source line 249)*
- **`TimerDisplay:createPlayerCountdownDisplay(player_id, display_id, x, y, options)`** — -@param player_id string -@param display_id string -@param x number        # virtual 240×160 coordinate -@param y number        # virtual 240×160 coordinate -@param options? TimerDisplayOptions *(source line 259)*
- **`TimerDisplay:createGlobalTimerDisplay(display_id, x, y, options)`** — -@param display_id string -@param x number        # virtual 240×160 coordinate -@param y number        # virtual 240×160 coordinate -@param options? TimerDisplayOptions *(source line 268)*
- **`TimerDisplay:createGlobalCountdownDisplay(display_id, x, y, options)`** — -@param display_id string -@param x number        # virtual 240×160 coordinate -@param y number        # virtual 240×160 coordinate -@param options? TimerDisplayOptions *(source line 290)*
- **`TimerDisplay:_createDisplay(player_id, display_id, x, y, type, options)`** — -@param player_id string -@param display_id string -@param x number        # virtual 240×160 coordinate -@param y number        # virtual 240×160 coordinate -@param type string -@param options TimerDisplayOptions *(source line 312)*
- **`TimerDisplay:updateTimerDisplay(player_id, display_id, seconds)`** — -@param player_id string -@param display_id string -@param seconds number *(source line 343)*
- **`TimerDisplay:updateCountdownDisplay(player_id, display_id, seconds)`** — -@param player_id string -@param display_id string -@param seconds number *(source line 350)*
- **`TimerDisplay:_updateDisplay(player_id, display_id, seconds, is_countdown)`** — -@param player_id string -@param display_id string -@param seconds number -@param is_countdown boolean *(source line 358)*
- **`TimerDisplay:removeDisplay(player_id, display_id)`** — -@param player_id string -@param display_id string *(source line 481)*
- **`TimerDisplay:setDisplayPosition(player_id, display_id, x, y)`** — -@param player_id string -@param display_id string -@param x number        # virtual 240×160 coordinate -@param y number        # virtual 240×160 coordinate *(source line 500)*

## Tables and data structures

### `TimerDisplay` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.displays` *(line 34)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.global_displays` *(line 35)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `glyph_data` *(line 335)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `base_opts` *(line 394)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `scale` | expression/reference | `disp.scale` |
| `z` | expression/reference | `disp.z` |
| `r` | expression/reference | `disp.color.r` |
| `g` | expression/reference | `disp.color.g` |
| `b` | expression/reference | `disp.color.b` |
| `opacity` | expression/reference | `disp.opacity` |
| `a` | expression/reference | `disp.a` |
| `ro` | expression/reference | `disp.ro` |
| `color_mode` | expression/reference | `disp.color_mode` |

### `new_data` *(line 407)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/timer-display.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
