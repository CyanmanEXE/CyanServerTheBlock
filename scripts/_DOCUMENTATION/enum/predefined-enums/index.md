# `predefined-enums.lua`

> **Source:** `scripts/enum/predefined-enums.lua`  
> **Source lines:** 38  
> **Functions detected:** 0  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

predefined_enums.lua Central place to define your enums for easy reuse. You can add as many as you like.

## Dependencies

- `scripts/enum/enum` — line 5

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `PredefinedEnums` *(line 6)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `CameraMode` | call/expression | `Enum.new({ active = "minimap", options = { MiniMap = "minimap", PlayerControlled = "player", ServerControlled = "server", Custom = "custom" …` |
| `Status` | call/expression | `Enum.new({ ACTIVE = "active", INACTIVE = "inactive", PENDING = { code = 0, label = "pending" }, })` |
| `LogLevel` | call/expression | `Enum.new({Debug = "DEBUG", Info = "INFO", Warn = "WARN", Error = "ERROR"})` |
| `DefaultPlayerAnimNames` | call/expression | `Enum.new({ IdleDL = "IDLE_DL", IdleDR = "IDLE_DR", IdleUL = "IDLE_UL", IdleUR = "IDLE_UR", IdleU = "IDLE_U", IdleD = "IDLE_D", IdleR = "IDLE…` |

### `options` *(line 10)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `MiniMap` | string literal | `"minimap"` |
| `PlayerControlled` | string literal | `"player"` |
| `ServerControlled` | string literal | `"server"` |
| `Custom` | string literal | `"custom"` |

### `PENDING` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `code` | number literal | `0` |
| `label` | string literal | `"pending"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/enum/predefined-enums.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
