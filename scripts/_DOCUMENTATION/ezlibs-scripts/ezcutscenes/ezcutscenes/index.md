# `ezcutscenes.lua`

> **Source:** `scripts/ezlibs-scripts/ezcutscenes/ezcutscenes.lua`  
> **Source lines:** 349  
> **Functions detected:** 12  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezcutscenes.lua Tiled-authored cutscene system. A Cutscene object names a chain of Cutscene Step objects. Each step performs one action (move an actor, show a message, ask a quiz, etc.). Steps chain via `Next Step` refs; branching steps use `Next 1/2/3` and `Fail Next`. Interactive vs non-interactive: Show Message / Ask Quiz / Prompt Player are interactive. They run through Async.message_player / quiz_player / prompt_player, which are modal dialogs. Net.lock_player_input only blocks world interaction and movement; those dialog APIs run their own input path, so the cutscene works while input is locked. Wait / Set Pose / Move Actor / Play Sound / Fade Camera / Move Camera / Emit Event are non-interactive. They animate actors, play audio, or emit bus events without touching player input. Player input is locked at cutscene start and unconditionally unlocked before the cutscene promise resolves. The chain runner is wrapped in pcall so an unexpected error mid-cutscene still reaches the unlock. Movement targets: Move Actor / Move Camera resolve their destination in this order: 1. `Target` (point object reference) 2. `Target X/Y/Z` (explicit numbers) 3. The Cutscene Step object's own (x, y, z) in Tiled The third option means map makers can place the step node at the destination and skip the separate target point.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 32
- `scripts/ezlibs-scripts/object_registry` — line 33
- `scripts/ezlibs-scripts/ezcache` — line 34
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 35
- `scripts/ezlibs-scripts/ezbus` — line 36
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 37
- `scripts/ezlibs-scripts/utils/eztiledutils` — line 38
- `scripts/ezlibs-scripts/ezcutscenes/step_types` — line 39

## Events

- `Net:on("player_disconnect", function(event) ...)` — line 321. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 49 | `get_props` | `object` |
| 53 | `resolve_object_cached` | `area_id, object_id` |
| 65 | `choose_next_step_ref` | `step_props, step_type_name, result` |
| 88 | `run_step_chain` | `context, first_step_ref` |
| 132 | `run_cutscene` | `player_id, area_id, cutscene_object, trigger_context` |
| 150 | `resolve_object` | `id` |
| 205 | `ezcutscenes.start` | `player_id, area_id, cutscene_ref, trigger_context` |
| 240 | `ezcutscenes.cancel` | `player_id` |
| 245 | `ezcutscenes.is_active` | `player_id` |
| 249 | `ezcutscenes.get_cutscene` | `area_id, name` |
| 330 | `ezcutscenes.handle_player_disconnect` | `player_id` |
| 338 | `ezcutscenes.handle_player_transfer` | `player_id` |

### Function notes

- **`get_props(object)`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_object_cached(area_id, object_id)`** *(source line 53)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`choose_next_step_ref(step_props, step_type_name, result)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run_step_chain(context, first_step_ref)`** — Step handlers receive (context, props, step_object). The third argument lets movement / camera steps fall back to the step node's own Tiled placement when no explicit target is configured. *(source line 88)*
- **`run_cutscene(player_id, area_id, cutscene_object, trigger_context)`** *(source line 132)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_object(id)`** *(source line 150)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcutscenes.start(player_id, area_id, cutscene_ref, trigger_context)`** *(source line 205)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcutscenes.cancel(player_id)`** *(source line 240)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcutscenes.is_active(player_id)`** *(source line 245)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcutscenes.get_cutscene(area_id, name)`** *(source line 249)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcutscenes.handle_player_disconnect(player_id)`** *(source line 330)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcutscenes.handle_player_transfer(player_id)`** *(source line 338)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezcutscenes` *(line 40)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `registered_cutscenes` *(line 42)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `active_cutscenes` *(line 44)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `once_state` *(line 45)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `context` *(line 142)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `area_id` | expression/reference | `area_id` |
| `cutscene_name` | expression/reference | `cutscene_name` |
| `cutscene_object` | expression/reference | `cutscene_object` |
| `trigger_object_id` | expression/reference | `trigger_context and trigger_context.trigger_object_id or nil` |
| `trigger_bot_id` | expression/reference | `trigger_context and trigger_context.trigger_bot_id or nil` |
| `resolve_object` | function | `function(id) return resolve_object_cached(area_id` |
| `[8]` | expression/reference | `id) end` |
| `variables` | table | `{}` |
| `cancelled` | boolean literal | `false` |

### `variables` *(line 151)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `cleanup_bot_ids` *(line 155)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezcutscenes/ezcutscenes.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
