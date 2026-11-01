# `sfx_driver.lua`

> **Source:** `scripts/ezlibs-custom/footbomb/sfx_driver.lua`  
> **Source lines:** 71  
> **Functions detected:** 2  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Sound driver for FootBomb round events. Reacts to semantic round events by playing sounds. All timing lives in the round's event emitters; this module only decides WHAT to play, not WHEN. Adding a new sound effect is a one-line addition here — no changes needed to `resolve_round_winner` or any animation code. The driver is attached once per round (see `SfxDriver.attach`). It does NOT subscribe to per-instance lifecycle events; those are handled centrally in main.lua. The driver only cares about round-phase events.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 34 | `SfxDriver.attach` | `round_events, event_names, play_sound_for_inst, instance_id, file_exists` |
| 40 | `safe_play` | `path, reason` |

### Function notes

- **`SfxDriver.attach(round_events, event_names, play_sound_for_inst, instance_id, file_exists)`** — Attach listeners to a round event bus.  Parameters: round_events         : EzBus instance for this round event_names          : ROUND_EVENT table from main.lua play_sound_for_inst  : function(instance_id, path, reason) instance_id          : the current round's instance id file_exists          : optional function(path) -> boolean; when supplied, used to skip obvious missing-file plays at the event level instead of logging a failure inside play_sound_for_inst. Optional so callers that don't need it can omit the 5th argument.  All listeners are safe to call multiple times per round; they only fire once per event emit, and the bus is destroyed at round end. *(source line 34)*
- **`safe_play(path, reason)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `SfxDriver` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `SFX` *(line 14)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `THUD` | string literal | `"/server/assets/net-game-footbomb/sfx/item-thud.ogg"` |
| `EXPLOSION` | string literal | `"/server/assets/net-game-footbomb/sfx/explosion.ogg"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/footbomb/sfx_driver.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
