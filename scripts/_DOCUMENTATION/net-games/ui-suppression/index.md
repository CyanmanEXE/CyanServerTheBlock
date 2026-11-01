# `ui-suppression.lua`

> **Source:** `scripts/net-games/ui-suppression.lua`  
> **Source lines:** 128  
> **Functions detected:** 14  
> **Table declarations detected:** 11

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Shared reference-counted suppression for engine HUD, engine input lock, and custom UI handlers. Engine HUD is separate from all sprites/text/panels created by our UI scripts.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `state_for` | `store, pid` |
| 10 | `net_call` | `name, pid` |
| 17 | `acquire_engine` | `store, pid, owner, kind, fn_name` |
| 30 | `M.acquire_engine_hud` | `pid, owner` |
| 35 | `M.acquire_input_lock` | `pid, owner` |
| 38 | `M.register_handler` | `name, handler` |
| 42 | `M.acquire_element` | `pid, name, owner, options` |
| 52 | `M.release` | `h` |
| 88 | `M.register_profile` | `name, entries` |
| 92 | `M.acquire_profile` | `pid, name, owner, options` |
| 109 | `M.release_profile` | `b` |
| 116 | `M.cleanup_player` | `pid` |
| 121 | `M.get_debug_state` | `pid` |
| 122 | `summary` | `s` |

### Function notes

- **`state_for(store, pid)`** *(source line 6)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`net_call(name, pid)`** *(source line 10)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`acquire_engine(store, pid, owner, kind, fn_name)`** *(source line 17)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.acquire_engine_hud(pid, owner)`** *(source line 30)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.acquire_input_lock(pid, owner)`** *(source line 35)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.register_handler(name, handler)`** *(source line 38)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.acquire_element(pid, name, owner, options)`** *(source line 42)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.release(h)`** *(source line 52)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.register_profile(name, entries)`** *(source line 88)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.acquire_profile(pid, name, owner, options)`** *(source line 92)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.release_profile(b)`** *(source line 109)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.cleanup_player(pid)`** *(source line 116)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.get_debug_state(pid)`** *(source line 121)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`summary(s)`** *(source line 122)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `M` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `h` *(line 26)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `next_id` |
| `player_id` | expression/reference | `pid` |
| `kind` | expression/reference | `kind` |
| `released` | boolean literal | `false` |

### `h` *(line 48)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `next_id` |
| `player_id` | expression/reference | `pid` |
| `kind` | string literal | `"element"` |
| `handler` | expression/reference | `name` |
| `resource` | expression/reference | `resource` |
| `released` | boolean literal | `false` |

### `profiles` *(line 82)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `menu` | table | `{ "engine_hud", "input_lock" }` |
| `cinematic` | table | `{ "engine_hud", "input_lock" }` |
| `engine_hud_only` | table | `{ "engine_hud" }` |
| `input_locked` | table | `{ "input_lock" }` |

### `menu` *(line 83)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"engine_hud"` |
| `[2]` | string literal | `"input_lock"` |

### `cinematic` *(line 84)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"engine_hud"` |
| `[2]` | string literal | `"input_lock"` |

### `engine_hud_only` *(line 85)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"engine_hud"` |

### `input_locked` *(line 86)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"input_lock"` |

### `b` *(line 95)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | number literal | `0` |
| `player_id` | expression/reference | `pid` |
| `kind` | string literal | `"bundle"` |
| `handles` | table | `{}` |
| `released` | boolean literal | `false` |

### `list` *(line 117)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `r` *(line 123)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/ui-suppression.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
