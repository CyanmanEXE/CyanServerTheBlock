# `d-pad.lua`

> **Source:** `scripts/input-controller/d-pad.lua`  
> **Source lines:** 190  
> **Functions detected:** 6  
> **Table declarations detected:** 23

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Direction definitions

## Dependencies

- `scripts/utils/utility` — line 1

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 7 | `DPad.EmitButtonPressed` | `button, player_id` |
| 39 | `getPressedDirectionSet` | `pressedButtons` |
| 51 | `getPressedDirections` | `pressedButtons` |
| 65 | `DPad.getActiveDirectionWithMemory` | `pressedButtons, player_id` |
| 171 | `DPad.resetPlayerState` | `player_id` |
| 180 | `DPad.getAllDirectionRawNames` | `(none)` |

### Function notes

- **`DPad.EmitButtonPressed(button, player_id)`** *(source line 7)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`getPressedDirectionSet(pressedButtons)`** — Helper: get set of currently pressed direction names *(source line 39)*
- **`getPressedDirections(pressedButtons)`** — Helper: get array of pressed direction names *(source line 51)*
- **`DPad.getActiveDirectionWithMemory(pressedButtons, player_id)`** — Main stateful direction detection *(source line 65)*
- **`DPad.resetPlayerState(player_id)`** — Reset player state *(source line 171)*
- **`DPad.getAllDirectionRawNames()`** — Get all raw direction button names (for filtering in InputController) *(source line 180)*

## Tables and data structures

### `DPad` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `DPad.Directions` *(line 12)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Left` | table | `{ "Move Left", "UI Left" }` |
| `Right` | table | `{ "Move Right", "UI Right" }` |
| `Up` | table | `{ "Move Up", "UI Up" }` |
| `Down` | table | `{ "Move Down", "UI Down" }` |

### `Left` *(line 13)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Left"` |
| `[2]` | string literal | `"UI Left"` |

### `Right` *(line 14)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Right"` |
| `[2]` | string literal | `"UI Right"` |

### `Up` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Up"` |
| `[2]` | string literal | `"UI Up"` |

### `Down` *(line 16)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Down"` |
| `[2]` | string literal | `"UI Down"` |

### `DPad.ComboDirections` *(line 20)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DownLeft` | table | `{ "Down", "Left" }` |
| `UpLeft` | table | `{ "Up", "Left" }` |
| `UpRight` | table | `{ "Up", "Right" }` |
| `DownRight` | table | `{ "Down", "Right" }` |

### `DownLeft` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Down"` |
| `[2]` | string literal | `"Left"` |

### `UpLeft` *(line 22)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Up"` |
| `[2]` | string literal | `"Left"` |

### `UpRight` *(line 23)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Up"` |
| `[2]` | string literal | `"Right"` |

### `DownRight` *(line 24)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Down"` |
| `[2]` | string literal | `"Right"` |

### `buttonToDirection` *(line 28)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `DPad.PlayerState` *(line 36)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `dirSet` *(line 40)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `dirs` *(line 52)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `seen` *(line 53)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `lastComboDirs` *(line 76)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `state.lastComboDirs` *(line 86)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `state.lastComboDirs` *(line 109)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `state.lastComboDirs` *(line 142)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `state.lastComboDirs` *(line 155)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `DPad.PlayerState` *(line 175)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `names` *(line 181)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/input-controller/d-pad.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
