# `utility.lua`

> **Source:** `scripts/utils/utility.lua`  
> **Source lines:** 53  
> **Functions detected:** 4  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Net.lua Main module that integrates EventEmitter and Async

## Dependencies

- `scripts/utils/event-emitter` — line 7
- `scripts/utils/async` — line 8

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 17 | `Utility.create_event_test` | `(none)` |
| 21 | `start_listening` | `(none)` |
| 37 | `Utility.resolve_multi` | `...` |
| 45 | `Utility.event_to_promise` | `emitter, event_name` |

### Function notes

- **`Utility.create_event_test()`** — Example usage pattern from the original code *(source line 17)*
- **`start_listening()`** — Example of async iteration *(source line 21)*
- **`Utility.resolve_multi(...)`** — Helper for multi-value promises *(source line 37)*
- **`Utility.event_to_promise(emitter, event_name)`** — Event-driven promise *(source line 45)*

## Tables and data structures

### `Utility` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `args` *(line 38)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `...` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/utils/utility.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
