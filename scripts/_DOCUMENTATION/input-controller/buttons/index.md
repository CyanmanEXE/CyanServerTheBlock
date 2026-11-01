# `buttons.lua`

> **Source:** `scripts/input-controller/buttons.lua`  
> **Source lines:** 12  
> **Functions detected:** 0  
> **Table declarations detected:** 9

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

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `Buttons` *(line 1)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `ShoulderL` | table | `{"Shoulder L"}` |
| `ShoulderR` | table | `{"Shoulder R"}` |
| `Start` | table | `{"Pause"}` |
| `Minimap` | table | `{"Minimap"}` |
| `Confirm` | table | `{ "Confirm", "A", "Interact", "Use Card"}` |
| `Cancel` | table | `{ "Cancel", "Shoot", "Run" }` |
| `Options` | table | `{"Option", "Special"}` |
| `CustomMenu` | table | `{"Cust"}` |

### `ShoulderL` *(line 2)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Shoulder L"` |

### `ShoulderR` *(line 3)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Shoulder R"` |

### `Start` *(line 4)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Pause"` |

### `Minimap` *(line 5)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Minimap"` |

### `Confirm` *(line 6)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Confirm"` |
| `[2]` | string literal | `"A"` |
| `[3]` | string literal | `"Interact"` |
| `[4]` | string literal | `"Use Card"` |

### `Cancel` *(line 7)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Cancel"` |
| `[2]` | string literal | `"Shoot"` |
| `[3]` | string literal | `"Run"` |

### `Options` *(line 8)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Option"` |
| `[2]` | string literal | `"Special"` |

### `CustomMenu` *(line 9)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Cust"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/input-controller/buttons.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
