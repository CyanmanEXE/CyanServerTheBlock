# `condition.lua`

> **Source:** `scripts/ezlibs-scripts/condition.lua`  
> **Source lines:** 93  
> **Functions detected:** 8  
> **Table declarations detected:** 1

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

No module-level description was present in the source. The reference below documents the symbols and behavior visible in this file.

## Dependencies

- `scripts/ezlibs-scripts/ezmemory` — line 2
- `scripts/ezlibs-scripts/ezquests` — line 3
- `scripts/ezlibs-scripts/helpers` — line 4

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `condition.date_before` | `date_string` |
| 10 | `condition.date_after` | `date_string` |
| 14 | `condition.item` | `player_id, item_name, amount, consume` |
| 23 | `condition.money` | `player_id, amount, consume` |
| 32 | `condition.fragments` | `player_id, amount, consume` |
| 41 | `condition.tokens` | `player_id, amount, consume` |
| 50 | `condition.quest_flag` | `player_id, quest_name, flag_name, expected, op` |
| 73 | `condition.evaluate` | `player_id, cond` |

### Function notes

- **`condition.date_before(date_string)`** *(source line 6)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`condition.date_after(date_string)`** *(source line 10)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`condition.item(player_id, item_name, amount, consume)`** *(source line 14)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`condition.money(player_id, amount, consume)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`condition.fragments(player_id, amount, consume)`** *(source line 32)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`condition.tokens(player_id, amount, consume)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`condition.quest_flag(player_id, quest_name, flag_name, expected, op)`** *(source line 50)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`condition.evaluate(player_id, cond)`** *(source line 73)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `condition` *(line 1)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/condition.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
