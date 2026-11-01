# `state.lua`

> **Source:** `scripts/ezlibs-custom/footbomb/state.lua`  
> **Source lines:** 27  
> **Functions detected:** 0  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

FootBomb state store. Mutable match/NPC/player registries live here instead of in the entry point. Keep this module data-only so main.lua remains responsible for game behavior.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `State` *(line 4)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `npc_refs` | table | `{}` |
| `pending_interactions` | table | `{}` |
| `waiting_matches` | table | `{}` |
| `player_representations` | table | `{}` |
| `instance_bots` | table | `{}` |
| `instance_spawn_points` | table | `{}` |
| `npc_direction_sequence_index` | number literal | `0` |

### `npc_refs` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_interactions` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `waiting_matches` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_representations` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instance_bots` *(line 18)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instance_spawn_points` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/footbomb/state.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
