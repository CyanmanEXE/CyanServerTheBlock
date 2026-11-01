# `ezexplosions.lua`

> **Source:** `scripts/ezlibs-scripts/ezexplosions.lua`  
> **Source lines:** 329  
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

How long to keep the effect "alive" after the FINAL blast, so the last bot's EXPLODE/SMOKE animation can finish playing. Historical behavior: each bot slept its own full EXPLOSION_DURATION (0.6s) after its last blast before self-removing. Because blasts are staggered, the last bot's self-check fired 0.6s after the last visible blast, producing a noticeable quiet gap before on_complete (and hence any kick or other post-effect callback) ran. This constant shortens that tail. When the counter hits 0, all other bots are removed immediately (they've already fired) and this bot is removed after EXPLOSION_TAIL_DURATION. Tune if animations are longer.

## Dependencies

- `scripts/ezlibs-scripts/ezbus` — line 1
- `scripts/ezlibs-scripts/ezlogger` — line 2

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 21 | `async` | `fn` |
| 26 | `await` | `value` |
| 34 | `update_tracked_position` | `exploding_effect` |
| 73 | `finish_effect` | `self, reason` |
| 88 | `remove_explosion_bot` | `self, bot_id, reason` |
| 111 | `remove_all_active_bots` | `self, reason` |
| 121 | `explode` | `self, explosion_bot_id` |
| 193 | `spawn` | `self` |
| 242 | `ExplodingEffect:new` | `actor_id, opt_area_id, max_explosions, on_complete` |
| 268 | `ExplodingEffect:remove` | `(none)` |
| 286 | `ezexplosions.explode` | `actor_id, area_id, max_explosions, on_complete` |
| 293 | `ezexplosions.explode_and_wait` | `actor_id, area_id, max_explosions, timeout_seconds` |

### Function notes

- **`async(fn)`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`await(value)`** *(source line 26)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_tracked_position(exploding_effect)`** — Refresh the effect's cached position from the tracked actor when it's still alive. Returns true if the position was refreshed; false if the actor has disappeared. On false, the previous position and area_id are retained so remaining blasts can continue at the last-known location. *(source line 34)*
- **`finish_effect(self, reason)`** *(source line 73)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_explosion_bot(self, bot_id, reason)`** — Idempotent bot removal. Guards against double-counting `active_bots` if the same bot is scheduled for removal through two paths (e.g., its own scheduled self-check AND the coordinated last-blast cleanup). *(source line 88)*
- **`remove_all_active_bots(self, reason)`** — Remove every bot still in _active_bot_ids. Copies the list first since remove_explosion_bot mutates it. *(source line 111)*
- **`explode(self, explosion_bot_id)`** *(source line 121)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`spawn(self)`** *(source line 193)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ExplodingEffect:new(actor_id, opt_area_id, max_explosions, on_complete)`** *(source line 242)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ExplodingEffect:remove()`** — Call this to stop an effect early. on_complete will still fire once all active bots have been removed, with reason "stopped". *(source line 268)*
- **`ezexplosions.explode(actor_id, area_id, max_explosions, on_complete)`** *(source line 286)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezexplosions.explode_and_wait(actor_id, area_id, max_explosions, timeout_seconds)`** — Awaitable variant. Resolves with the completion reason once the effect's on_complete fires, or "timeout" if the effect never completes. Default timeout is 5s, well beyond any reasonable effect duration. *(source line 293)*

## Tables and data structures

### `position` *(line 59)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `object.x` |
| `y` | expression/reference | `object.y` |
| `z` | expression/reference | `object.z or 0` |

### `to_remove` *(line 112)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ExplodingEffect` *(line 239)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `exploding_effect` *(line 243)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `tracked_actor_id` | expression/reference | `actor_id` |
| `position` | nil | `nil` |
| `area_id` | expression/reference | `opt_area_id` |
| `max_explosions` | expression/reference | `max_explosions` |
| `remaining_explosions` | expression/reference | `max_explosions` |
| `total_explosions` | number literal | `3` |
| `stopped` | boolean literal | `false` |
| `on_complete` | expression/reference | `on_complete` |
| `active_bots` | number literal | `0` |
| `_active_bot_ids` | table | `{}` |
| `_finished` | boolean literal | `false` |

### `_active_bot_ids` *(line 253)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ezexplosions` *(line 283)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezexplosions.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
