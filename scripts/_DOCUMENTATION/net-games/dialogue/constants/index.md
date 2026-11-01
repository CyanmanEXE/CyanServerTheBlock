# `constants.lua`

> **Source:** `scripts/net-games/dialogue/constants.lua`  
> **Source lines:** 21  
> **Functions detected:** 0  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/net-games/dialogue/constants.lua

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `C` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `C.AdvanceMode` *(line 4)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `INPUT` | string literal | `"input"` |
| `TIMER` | string literal | `"timer"` |

### `C.PageAdvance` *(line 9)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `WAIT_FOR_CONFIRM` | string literal | `"wait_for_confirm"` |
| `AUTO_ADVANCE` | string literal | `"auto_advance"` |
| `AUTO_ADVANCE_OR_CONFIRM` | string literal | `"auto_advance_or_confirm"` |

### `C.InputMode` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DIALOGUE_OWNS_INPUT` | string literal | `"dialogue_owns_input"` |
| `OVERLAY_ONLY` | string literal | `"overlay_only"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/dialogue/constants.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
