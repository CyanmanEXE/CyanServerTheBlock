# `enums.lua`

> **Source:** `scripts/libs/enums.lua`  
> **Source lines:** 85  
> **Functions detected:** 0  
> **Table declarations detected:** 6

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Virtual input events and states

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `ColorMode` *(line 1)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `MULT` | number literal | `0` |
| `ADD` | number literal | `1` |
| `COLOR` | number literal | `2` |

### `BattleItem` *(line 6)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `MONEY` | number literal | `0` |
| `CARD` | number literal | `1` |
| `HEALTH` | number literal | `2` |
| `FRAGMENT` | number literal | `3` |

### `InputState` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `NONE` | number literal | `0` |
| `PRESSED` | number literal | `1` |
| `HELD` | number literal | `2` |
| `RELEASED` | number literal | `3` |

### `InputEvent` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `RUN` | string literal | `"Run"` |
| `INTERACT` | string literal | `"Interact"` |
| `MINIMAP` | string literal | `"Minimap"` |
| `SHOOT` | string literal | `"Shoot"` |
| `USE_CARD` | string literal | `"Use Card"` |
| `SPECIAL` | string literal | `"Special"` |
| `CUST_MENU` | string literal | `"Cust Menu"` |
| `PAUSE` | string literal | `"Pause"` |
| `MOVE_UP` | string literal | `"Move Up"` |
| `MOVE_DOWN` | string literal | `"Move Down"` |
| `MOVE_LEFT` | string literal | `"Move Left"` |
| `MOVE_RIGHT` | string literal | `"Move Right"` |
| `SHOULDER_L` | string literal | `"Shoulder L"` |
| `SHOULDER_R` | string literal | `"Shoulder R"` |
| `UI_UP` | string literal | `"UI Up"` |
| `UI_DOWN` | string literal | `"UI Down"` |
| `UI_LEFT` | string literal | `"UI Left"` |
| `UI_RIGHT` | string literal | `"UI Right"` |
| `CONFIRM` | string literal | `"Confirm"` |
| `CANCEL` | string literal | `"Cancel"` |
| `OPTION` | string literal | `"Option"` |
| `LEN` | number literal | `21` |

### `AssetType` *(line 61)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `TEXT` | number literal | `0` |
| `TEXTURE` | number literal | `1` |
| `AUDIO` | number literal | `2` |
| `DATA` | number literal | `3` |

### `PackageType` *(line 68)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `BLOCKS` | number literal | `0` |
| `CARD` | number literal | `1` |
| `ENCOUNTER` | number literal | `2` |
| `CHARACTER` | number literal | `3` |
| `LIBRARY` | number literal | `4` |
| `PLAYER` | number literal | `5` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/libs/enums.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
