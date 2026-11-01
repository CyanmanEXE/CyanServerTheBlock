# `event_emitter.lua`

> **Source:** `scripts/tests/event_emitter.lua`  
> **Source lines:** 103  
> **Functions detected:** 0  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

functions tested: Net.EventEmitter.new :on :once :on_any :on_any_once :remove_listener :remove_on_any_listener :destroy

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `emitted_events` *(line 19)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{"b", 2, '?'}` |
| `[2]` | table | `{"a", 1, '?'}` |
| `[3]` | table | `{"a", 3, '?'}` |
| `[4]` | table | `{"c", 5, '?'}` |
| `[5]` | table | `{"a", 4, '?'}` |
| `[6]` | table | `{"d", 6, '?'}` |
| `[7]` | table | `{"a", 7, '?'}` |
| `[8]` | table | `{"e", 8, '?'}` |

### `a_events` *(line 29)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/tests/event_emitter.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
