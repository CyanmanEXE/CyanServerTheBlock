# `timer-system.lua`

> **Source:** `scripts/displayer/timer-system.lua`  
> **Source lines:** 486  
> **Functions detected:** 30  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Timer System with Global and Player-specific Timers

## Dependencies

- No `require(...)` dependency was detected.

## Events

- `Net:on("player_join", function(event) ...)` — line 14. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 24. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 35. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `Timer:init` | `(none)` |
| 47 | `Timer:handlePlayerJoin` | `player_id` |
| 62 | `Timer:handlePlayerLeave` | `player_id` |
| 69 | `Timer:updateTimers` | `delta` |
| 209 | `Timer:emitToAllPlayers` | `event_name, data` |
| 223 | `Timer:pausePlayerTimer` | `player_id, timer_id` |
| 229 | `Timer:resumePlayerTimer` | `player_id, timer_id` |
| 235 | `Timer:pausePlayerCountdown` | `player_id, countdown_id` |
| 241 | `Timer:resumePlayerCountdown` | `player_id, countdown_id` |
| 247 | `Timer:removePlayerTimer` | `player_id, timer_id` |
| 252 | `Timer:removePlayerCountdown` | `player_id, countdown_id` |
| 258 | `Timer:createGlobalTimer` | `timer_id, duration, callback, loop` |
| 281 | `Timer:createGlobalCountdown` | `countdown_id, duration, callback, loop` |
| 304 | `Timer:pauseGlobalTimer` | `timer_id` |
| 311 | `Timer:resumeGlobalTimer` | `timer_id` |
| 318 | `Timer:pauseGlobalCountdown` | `countdown_id` |
| 325 | `Timer:resumeGlobalCountdown` | `countdown_id` |
| 332 | `Timer:removeGlobalTimer` | `timer_id` |
| 341 | `Timer:removeGlobalCountdown` | `countdown_id` |
| 350 | `Timer:getGlobalTimer` | `timer_id` |
| 354 | `Timer:getGlobalCountdown` | `countdown_id` |
| 359 | `Timer:syncGlobalTimers` | `player_id` |
| 389 | `Timer:createPlayerTimer` | `player_id, timer_id, duration, callback, loop` |
| 418 | `Timer:createPlayerCountdown` | `player_id, countdown_id, duration, callback, loop` |
| 448 | `Timer:getAllGlobalTimers` | `(none)` |
| 452 | `Timer:getAllGlobalCountdowns` | `(none)` |
| 456 | `Timer:clearAllGlobalTimers` | `(none)` |
| 462 | `Timer:clearAllGlobalCountdowns` | `(none)` |
| 468 | `Timer:getPlayerTimer` | `player_id, timer_id` |
| 475 | `Timer:getPlayerCountdown` | `player_id, countdown_id` |

### Function notes

- **`Timer:init()`** *(source line 6)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:handlePlayerJoin(player_id)`** *(source line 47)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:handlePlayerLeave(player_id)`** *(source line 62)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:updateTimers(delta)`** *(source line 69)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:emitToAllPlayers(event_name, data)`** — Helper function to emit to all connected players (with error protection) *(source line 209)*
- **`Timer:pausePlayerTimer(player_id, timer_id)`** — PLAYER TIMER/COUNTDOWN MANAGEMENT *(source line 223)*
- **`Timer:resumePlayerTimer(player_id, timer_id)`** *(source line 229)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:pausePlayerCountdown(player_id, countdown_id)`** *(source line 235)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:resumePlayerCountdown(player_id, countdown_id)`** *(source line 241)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:removePlayerTimer(player_id, timer_id)`** *(source line 247)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:removePlayerCountdown(player_id, countdown_id)`** *(source line 252)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:createGlobalTimer(timer_id, duration, callback, loop)`** — Global Timer Methods *(source line 258)*
- **`Timer:createGlobalCountdown(countdown_id, duration, callback, loop)`** *(source line 281)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:pauseGlobalTimer(timer_id)`** *(source line 304)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:resumeGlobalTimer(timer_id)`** *(source line 311)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:pauseGlobalCountdown(countdown_id)`** *(source line 318)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:resumeGlobalCountdown(countdown_id)`** *(source line 325)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:removeGlobalTimer(timer_id)`** *(source line 332)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:removeGlobalCountdown(countdown_id)`** *(source line 341)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:getGlobalTimer(timer_id)`** *(source line 350)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:getGlobalCountdown(countdown_id)`** *(source line 354)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:syncGlobalTimers(player_id)`** — Sync methods for new players *(source line 359)*
- **`Timer:createPlayerTimer(player_id, timer_id, duration, callback, loop)`** *(source line 389)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:createPlayerCountdown(player_id, countdown_id, duration, callback, loop)`** *(source line 418)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:getAllGlobalTimers()`** — Additional utility methods *(source line 448)*
- **`Timer:getAllGlobalCountdowns()`** *(source line 452)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:clearAllGlobalTimers()`** *(source line 456)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:clearAllGlobalCountdowns()`** *(source line 462)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:getPlayerTimer(player_id, timer_id)`** *(source line 468)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Timer:getPlayerCountdown(player_id, countdown_id)`** *(source line 475)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Timer` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.timers` *(line 7)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.countdowns` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.global_timers` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.global_countdowns` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.player_data` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `event_data` *(line 211)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/timer-system.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
