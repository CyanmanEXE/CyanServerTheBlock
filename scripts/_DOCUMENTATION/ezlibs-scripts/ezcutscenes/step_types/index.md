# `step_types.lua`

> **Source:** `scripts/ezlibs-scripts/ezcutscenes/step_types.lua`  
> **Source lines:** 322  
> **Functions detected:** 14  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezcutscenes/step_types.lua Step implementations. Each handler is function(context, props, step_object) -> async<result> where step_object is the resolved Cutscene Step object in Tiled. The runner awaits the returned promise, inspects `result`, and chooses the next step from the step's `Next Step` / `Next N` / `Fail Next` properties. Engine bug workaround: Async.quiz_player, Async.question_player, and Async.prompt_player corrupt their choices when a message/option text is passed inline. Every interactive dialog step here therefore: 1. Sends the prompt text via Async.message_player first (modal, awaits the player closing it). 2. Invokes the dialog API with an EMPTY message and only the options. Long option texts trigger the same engine bug, so map makers should keep individual option strings short (one or two words).

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 17
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 18
- `scripts/ezlibs-scripts/ezbus` — line 19
- `scripts/ezlibs-scripts/utils/eztiledutils` — line 20

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 28 | `resolve_actor_bot` | `context, actor_ref` |
| 52 | `resolve_point` | `context, target_ref` |
| 64 | `resolve_target` | `context, props, step_object` |
| 89 | `resolve_speaker_mugshot` | `context, props` |
| 110 | `StepTypes.wait` | `context, props` |
| 120 | `StepTypes.move_actor` | `context, props, step_object` |
| 154 | `StepTypes.set_pose` | `context, props` |
| 180 | `StepTypes.show_message` | `context, props` |
| 197 | `StepTypes.ask_quiz` | `context, props` |
| 225 | `StepTypes.prompt_player` | `context, props` |
| 248 | `StepTypes.play_sound` | `context, props` |
| 257 | `StepTypes.fade_camera` | `context, props` |
| 273 | `StepTypes.move_camera` | `context, props, step_object` |
| 296 | `StepTypes.emit_event` | `context, props` |

### Function notes

- **`resolve_actor_bot(context, actor_ref)`** — -------------------------------------------------------------------------- Shared helpers -------------------------------------------------------------------------- *(source line 28)*
- **`resolve_point(context, target_ref)`** *(source line 52)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_target(context, props, step_object)`** *(source line 64)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_speaker_mugshot(context, props)`** *(source line 89)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`StepTypes.wait(context, props)`** — -------------------------------------------------------------------------- Step handlers -------------------------------------------------------------------------- *(source line 110)*
- **`StepTypes.move_actor(context, props, step_object)`** *(source line 120)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`StepTypes.set_pose(context, props)`** *(source line 154)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`StepTypes.show_message(context, props)`** *(source line 180)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`StepTypes.ask_quiz(context, props)`** — Ask Quiz: three-option dialog.  Engine bug workaround: quiz_player corrupts the option list when a non-empty question string or long option text is passed inline. Send the question via message_player first (awaited until the player closes it), then invoke quiz_player with an empty question string so only the options render. *(source line 197)*
- **`StepTypes.prompt_player(context, props)`** — Prompt Player: free-text input.  Already uses the split pattern: Message via message_player first, then prompt_player with no message argument. Kept as-is; documented so a future change doesn't accidentally re-inline the message. *(source line 225)*
- **`StepTypes.play_sound(context, props)`** *(source line 248)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`StepTypes.fade_camera(context, props)`** *(source line 257)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`StepTypes.move_camera(context, props, step_object)`** *(source line 273)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`StepTypes.emit_event(context, props)`** *(source line 296)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `StepTypes` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `fake_dialogue` *(line 100)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `custom_properties` | table | `{ ["Mugshot"] = override }` |

### `options` *(line 135)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | call/expression | `tu.get_string_from(props` |
| `[2]` | string literal | `"Move Animation"` |
| `[3]` | expression/reference | `nil)` |
| `direction` | call/expression | `tu.get_string_from(props` |
| `[5]` | string literal | `"Move Direction"` |
| `[6]` | expression/reference | `nil)` |
| `speed` | call/expression | `tu.get_number_from(props` |
| `[8]` | string literal | `"Move Speed"` |
| `[9]` | number literal | `3)` |
| `hold_animation` | call/expression | `tu.get_string_from(props` |
| `[11]` | string literal | `"End Animation"` |
| `[12]` | expression/reference | `nil)` |
| `hold_direction` | call/expression | `tu.get_string_from(props` |
| `[14]` | string literal | `"End Direction"` |
| `[15]` | expression/reference | `nil)` |
| `hold_seconds` | call/expression | `tu.get_number_from(props` |
| `[17]` | string literal | `"End Hold Seconds"` |
| `[18]` | number literal | `0)` |
| `hold_loop` | call/expression | `tu.get_boolean_from(props` |
| `[20]` | string literal | `"End Loop"` |
| `[21]` | expression/reference | `true)` |
| `hold_reassert` | boolean literal | `true` |

### `options` *(line 168)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | expression/reference | `animation` |
| `direction` | call/expression | `tu.get_string_from(props` |
| `[3]` | string literal | `"Direction"` |
| `[4]` | expression/reference | `nil)` |
| `loop` | call/expression | `tu.get_boolean_from(props` |
| `[6]` | string literal | `"Loop"` |
| `[7]` | expression/reference | `true)` |
| `hold` | boolean literal | `true` |
| `hold_seconds` | call/expression | `tu.get_number_from(props` |
| `[10]` | string literal | `"Hold Seconds"` |
| `[11]` | number literal | `0)` |

### `StepTypes.DISPATCH` *(line 308)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Wait]` | expression/reference | `StepTypes.wait` |
| `[Move Actor]` | expression/reference | `StepTypes.move_actor` |
| `[Set Pose]` | expression/reference | `StepTypes.set_pose` |
| `[Show Message]` | expression/reference | `StepTypes.show_message` |
| `[Ask Quiz]` | expression/reference | `StepTypes.ask_quiz` |
| `[Prompt Player]` | expression/reference | `StepTypes.prompt_player` |
| `[Play Sound]` | expression/reference | `StepTypes.play_sound` |
| `[Fade Camera]` | expression/reference | `StepTypes.fade_camera` |
| `[Move Camera]` | expression/reference | `StepTypes.move_camera` |
| `[Emit Event]` | expression/reference | `StepTypes.emit_event` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezcutscenes/step_types.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
