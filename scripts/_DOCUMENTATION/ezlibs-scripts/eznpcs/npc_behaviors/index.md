# `npc_behaviors.lua`

> **Source:** `scripts/ezlibs-scripts/eznpcs/npc_behaviors.lua`  
> **Source lines:** 202  
> **Functions detected:** 6  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

npc_behaviors.lua Composable behavior objects for eznpcs. Tiled object type: NPC Behavior Attached NPC: object reference to an NPC or NPC template Behavior: registered behavior key (currently Pushback) This module intentionally does not create bots. It attaches behavior to bots created and owned by eznpcs, or to each instance spawned from a template.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 11
- `scripts/ezlibs-scripts/ezbus` — line 12
- `scripts/ezlibs-scripts/ezcache` — line 13
- `scripts/ezlibs-scripts/object_registry` — line 14
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 15
- `scripts/ezlibs-scripts/eznpcs/ezpushback` — line 16
- `scripts/ezlibs-scripts/utils/eztiledutils` — line 17

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 26 | `key` | `area_id, behavior_object_id, bot_id` |
| 30 | `npc_behaviors.register` | `name, implementation` |
| 40 | `attach_one` | `area_id, behavior_object, bot_id, context` |
| 76 | `attach_for_target` | `area_id, target_object_id, bot_id, context` |
| 97 | `attach` | `args` |
| 125 | `npc_behaviors.attach_all` | `(none)` |

### Function notes

- **`key(area_id, behavior_object_id, bot_id)`** *(source line 26)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`npc_behaviors.register(name, implementation)`** *(source line 30)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`attach_one(area_id, behavior_object, bot_id, context)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`attach_for_target(area_id, target_object_id, bot_id, context)`** *(source line 76)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`attach(args)`** *(source line 97)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`npc_behaviors.attach_all()`** — Static NPCs are created during object_registry.load_all(). Since the behavior object can appear earlier or later in Tiled's object order, attach_all() is called after eznpcs.load_npcs() has completed the map scan. *(source line 125)*

## Tables and data structures

### `npc_behaviors` *(line 18)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `implementations` | table | `{}` |
| `objects_by_area` | table | `{}` |
| `attached` | table | `{}` |
| `spawned_instances` | table | `{}` |

### `implementations` *(line 20)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `objects_by_area` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `attached` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `spawned_instances` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/eznpcs/npc_behaviors.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
