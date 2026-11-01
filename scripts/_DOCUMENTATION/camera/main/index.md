# `main.lua`

> **Source:** `scripts/camera/main.lua`  
> **Source lines:** 105  
> **Functions detected:** 3  
> **Table declarations detected:** 0

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

main.lua (Entry Point)

## Dependencies

- `scripts/camera/camera-manager` — line 2
- `scripts/camera/camera-controller` — line 3
- `scripts/enum/predefined-enums` — line 4
- `scripts/input-controller/main` — line 5

## Events

- `Net:on("player_join", function(event) ...)` — line 20. The event name is taken directly from this source.
- `Net:on("tile_interaction", function(event) ...)` — line 47. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 9 | `dbg` | `...` |
| 18 | `setupPlayerJoin` | `(none)` |
| 45 | `setupTileInteraction` | `(none)` |

### Function notes

- **`dbg(...)`** *(source line 9)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setupPlayerJoin()`** *(source line 18)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setupTileInteraction()`** *(source line 45)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

No simple named table initializer was detected. Tables created dynamically or returned inline may not appear in this inventory.

## Implementation notes

- This reference is generated from the exact archived source `scripts/camera/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
