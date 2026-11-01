# `ezlocks.lua`

> **Source:** `scripts/ezlibs-scripts/ezlocks.lua`  
> **Source lines:** 65  
> **Functions detected:** 3  
> **Table declarations detected:** 1

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezlocks.lua - Reusable lock/unlock behaviors

## Dependencies

- `scripts/ezlibs-scripts/helpers` — line 2
- `scripts/ezlibs-scripts/ezmemory` — line 3
- `scripts/ezlibs-scripts/ezbus` — line 4

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 9 | `ezlocks.check_password` | `player_id, prompt_message, correct_password` |
| 22 | `ezlocks.check_money` | `player_id, prompt_message, amount, consume` |
| 43 | `ezlocks.check_item` | `player_id, prompt_message, required_item, amount, consume` |

### Function notes

- **`ezlocks.check_password(player_id, prompt_message, correct_password)`** — Password check *(source line 9)*
- **`ezlocks.check_money(player_id, prompt_message, amount, consume)`** — Money check *(source line 22)*
- **`ezlocks.check_item(player_id, prompt_message, required_item, amount, consume)`** — Item check *(source line 43)*

## Tables and data structures

### `ezlocks` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezlocks.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
