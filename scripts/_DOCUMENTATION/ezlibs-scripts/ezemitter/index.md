# `ezemitter.lua`

> **Source:** `scripts/ezlibs-scripts/ezemitter.lua`  
> **Source lines:** 337  
> **Functions detected:** 24  
> **Table declarations detected:** 19

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

EventEmitter.lua A flexible event system with async capabilities. Design notes: * emit() snapshots callback lists before iterating, so listeners may safely add/remove other listeners during a call. * once-listeners are cleared BEFORE invocation, so a re-emitted event from inside a once-handler does not fire it twice. * Every callback is isolated with pcall when an error handler is installed; by default errors propagate (previous behavior). Install a handler with `set_error_handler(fn)` for non-fatal diagnostics. * async_iter / async_iter_all return (next_fn, close_fn). Calling close_fn tears down the listener and wakes any pending waiter.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 18 | `EventEmitter.new` | `(none)` |
| 34 | `EventEmitter:set_error_handler` | `fn` |
| 40 | `EventEmitter:_call` | `callback, ...` |
| 56 | `EventEmitter:on` | `event, callback` |
| 64 | `EventEmitter:once` | `event, callback` |
| 72 | `EventEmitter:on_any` | `callback` |
| 79 | `EventEmitter:on_any_once` | `callback` |
| 86 | `snapshot` | `list` |
| 93 | `EventEmitter:emit` | `event, ...` |
| 128 | `EventEmitter:remove_listener` | `event, callback` |
| 132 | `prune` | `list` |
| 150 | `EventEmitter:remove_on_any_listener` | `callback` |
| 161 | `EventEmitter:remove_all_listeners` | `event` |
| 176 | `EventEmitter:has_listeners` | `event` |
| 187 | `EventEmitter:listener_count` | `event` |
| 203 | `make_iterator_state` | `(none)` |
| 207 | `iterator_next` | `state` |
| 218 | `EventEmitter:async_iter` | `event` |
| 225 | `on_event` | `...` |
| 242 | `close_fn` | `(none)` |
| 265 | `EventEmitter:async_iter_all` | `(none)` |
| 271 | `on_any` | `event, ...` |
| 286 | `close_fn` | `(none)` |
| 306 | `EventEmitter:destroy` | `(none)` |

### Function notes

- **`EventEmitter.new()`** — Create a new EventEmitter instance *(source line 18)*
- **`EventEmitter:set_error_handler(fn)`** — Install (or clear) an error handler for callbacks. When set, each listener is pcall'd and any failure is forwarded to `fn(err, ...)`; the emit loop continues. When nil (default), errors propagate synchronously. *(source line 34)*
- **`EventEmitter:_call(callback, ...)`** — Internal: dispatch a callback, honoring the current error mode. *(source line 40)*
- **`EventEmitter:on(event, callback)`** — Register a listener for a specific event *(source line 56)*
- **`EventEmitter:once(event, callback)`** — Register a one-time listener for a specific event *(source line 64)*
- **`EventEmitter:on_any(callback)`** — Register a listener for any event *(source line 72)*
- **`EventEmitter:on_any_once(callback)`** — Register a one-time listener for any event *(source line 79)*
- **`snapshot(list)`** — Copy a list so listeners mutating it during emit can't corrupt the loop. *(source line 86)*
- **`EventEmitter:emit(event, ...)`** — Emit an event *(source line 93)*
- **`EventEmitter:remove_listener(event, callback)`** — Remove a specific listener (from both `on` and `once`). Removes every occurrence. Returns (self, removed_any). *(source line 128)*
- **`prune(list)`** *(source line 132)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EventEmitter:remove_on_any_listener(callback)`** — Remove a specific on_any listener *(source line 150)*
- **`EventEmitter:remove_all_listeners(event)`** — Remove every listener for one event (or everything when `event` is nil). *(source line 161)*
- **`EventEmitter:has_listeners(event)`** — Introspection *(source line 176)*
- **`EventEmitter:listener_count(event)`** *(source line 187)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`make_iterator_state()`** — Build the shared (queue + waiter) machinery used by both iterator variants. *(source line 203)*
- **`iterator_next(state)`** *(source line 207)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EventEmitter:async_iter(event)`** — Create an async iterator for a specific event. Returns (next_fn, close_fn). close_fn unregisters the underlying listener and wakes any pending waiter with nil. *(source line 218)*
- **`on_event(...)`** *(source line 225)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`close_fn()`** *(source line 242)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EventEmitter:async_iter_all()`** — Create an async iterator for all events. Returns (next_fn, close_fn) just like async_iter. *(source line 265)*
- **`on_any(event, ...)`** *(source line 271)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`close_fn()`** *(source line 286)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EventEmitter:destroy()`** — Clean up all resources *(source line 306)*

## Tables and data structures

### `EventEmitter` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._events` *(line 20)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._once_events` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_events` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_once_events` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._iterators` *(line 25)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_iterators` *(line 26)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `s` *(line 87)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_once_events` *(line 118)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._events` *(line 164)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._once_events` *(line 165)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_events` *(line 166)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_once_events` *(line 167)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._events` *(line 309)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._once_events` *(line 310)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_events` *(line 311)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_once_events` *(line 312)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._iterators` *(line 332)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self._any_iterators` *(line 334)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezemitter.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
