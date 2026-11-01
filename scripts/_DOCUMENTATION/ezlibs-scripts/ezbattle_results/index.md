# `ezbattle_results.lua`

> **Source:** `scripts/ezlibs-scripts/ezbattle_results.lua`  
> **Source lines:** 31  
> **Functions detected:** 4  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Stores the most recent battle_results payload per player so later lifecycle events (such as battle_exit) can inspect or consume it.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `ezbattle_results.store` | `player_id, event` |
| 17 | `ezbattle_results.peek` | `player_id` |
| 21 | `ezbattle_results.consume` | `player_id` |
| 27 | `ezbattle_results.clear` | `player_id` |

### Function notes

- **`ezbattle_results.store(player_id, event)`** *(source line 6)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbattle_results.peek(player_id)`** *(source line 17)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbattle_results.consume(player_id)`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbattle_results.clear(player_id)`** *(source line 27)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezbattle_results` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `results_by_player` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezbattle_results.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
