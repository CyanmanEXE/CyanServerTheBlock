# `event-emitter.lua`

> **Source:** `scripts/utils/event-emitter.lua`  
> **Source lines:** 265  
> **Functions detected:** 14  
> **Table declarations detected:** 18

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

EventEmitter.lua A flexible event system with async capabilities

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 8 | `EventEmitter.new` | `(none)` |
| 21 | `EventEmitter:on` | `event, callback` |
| 32 | `EventEmitter:once` | `event, callback` |
| 43 | `EventEmitter:on_any` | `callback` |
| 51 | `EventEmitter:on_any_once` | `callback` |
| 59 | `EventEmitter:emit` | `event, ...` |
| 95 | `EventEmitter:remove_listener` | `event, callback` |
| 113 | `EventEmitter:remove_on_any_listener` | `callback` |
| 127 | `EventEmitter:async_iter` | `event` |
| 137 | `on_event` | `...` |
| 169 | `EventEmitter:async_iter_all` | `(none)` |
| 178 | `on_any` | `event, ...` |
| 209 | `EventEmitter:_notify_iterators` | `event, ...` |
| 233 | `EventEmitter:destroy` | `(none)` |

### Function notes

- **`EventEmitter.new()`** — Create a new EventEmitter instance *(source line 8)*
- **`EventEmitter:on(event, callback)`** — Register a listener for a specific event *(source line 21)*
- **`EventEmitter:once(event, callback)`** — Register a one-time listener for a specific event *(source line 32)*
- **`EventEmitter:on_any(callback)`** — Register a listener for any event *(source line 43)*
- **`EventEmitter:on_any_once(callback)`** — Register a one-time listener for any event *(source line 51)*
- **`EventEmitter:emit(event, ...)`** — Emit an event *(source line 59)*
- **`EventEmitter:remove_listener(event, callback)`** — Remove a specific listener *(source line 95)*
- **`EventEmitter:remove_on_any_listener(callback)`** — Remove a specific on_any listener *(source line 113)*
- **`EventEmitter:async_iter(event)`** — Create an async iterator for a specific event *(source line 127)*
- **`on_event(...)`** *(source line 137)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EventEmitter:async_iter_all()`** — Create an async iterator for all events *(source line 169)*
- **`on_any(event, ...)`** *(source line 178)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EventEmitter:_notify_iterators(event, ...)`** — Notify all iterators of an event *(source line 209)*
- **`EventEmitter:destroy()`** — Clean up all resources *(source line 233)*

## Tables and data structures

### `EventEmitter` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._events` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._once_events` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_events` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_once_events` *(line 13)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._iterators` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_iterators` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_once_events` *(line 86)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `iterator` *(line 129)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `event` | expression/reference | `event` |
| `queue` | table | `{}` |
| `waiting` | nil | `nil` |
| `closed` | boolean literal | `false` |

### `queue` *(line 132)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `iterator` *(line 171)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `queue` | table | `{}` |
| `waiting` | nil | `nil` |
| `closed` | boolean literal | `false` |

### `queue` *(line 173)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._events` *(line 237)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._once_events` *(line 238)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_events` *(line 239)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_once_events` *(line 240)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._iterators` *(line 260)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_iterators` *(line 262)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/utils/event-emitter.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
