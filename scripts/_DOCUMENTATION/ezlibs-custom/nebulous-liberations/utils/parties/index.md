# `parties.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/utils/parties.lua`  
> **Source lines:** 148  
> **Functions detected:** 9  
> **Table declarations detected:** 5

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

- `scripts/libs/emotes` — line 1

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `internal_find` | `player_id` |
| 26 | `Parties.find` | `player_id` |
| 36 | `Parties.is_in_same_party` | `player_a, player_b` |
| 54 | `Parties.on_tick` | `elapsed` |
| 82 | `Parties.request` | `requester, recruit` |
| 91 | `internal_find_request` | `requester, recruit` |
| 100 | `Parties.has_request` | `recruit, requester` |
| 104 | `Parties.accept` | `recruit, requester` |
| 131 | `Parties.leave` | `player_id` |

### Function notes

- **`internal_find(player_id)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Parties.find(player_id)`** *(source line 26)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Parties.is_in_same_party(player_a, player_b)`** *(source line 36)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Parties.on_tick(elapsed)`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Parties.request(requester, recruit)`** *(source line 82)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`internal_find_request(requester, recruit)`** *(source line 91)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Parties.has_request(recruit, requester)`** *(source line 100)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Parties.accept(recruit, requester)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Parties.leave(player_id)`** *(source line 131)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Parties` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parties` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_requests` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `dead_requests` *(line 59)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `members` *(line 120)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `requester` |
| `[2]` | expression/reference | `recruit` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/utils/parties.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
