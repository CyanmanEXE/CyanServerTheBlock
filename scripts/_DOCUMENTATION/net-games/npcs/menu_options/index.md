# `menu_options.lua`

> **Source:** `scripts/net-games/npcs/menu_options.lua`  
> **Source lines:** 52  
> **Functions detected:** 3  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/net-games/npcs/menu_options.lua Purpose: Build PromptVertical option tables without loops/math in each NPC file.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `pad2` | `n` |
| 14 | `M.count` | `count, cfg` |
| 38 | `M.list` | `items, cfg` |

### Function notes

- **`pad2(n)`** *(source line 6)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.count(count, cfg)`** — Build numbered options from a count. Example: MenuOptions.count(40, { prefix="Lime Option ", pad=2, start=1, exit_text="Exit" }) *(source line 14)*
- **`M.list(items, cfg)`** — Build from a list of strings. IDs become 1..N by default. Example: MenuOptions.list({ "Potion", "Antidote" }, { exit_text="Exit" }) *(source line 38)*

## Tables and data structures

### `M` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `t` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `t` *(line 42)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/menu_options.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
