# `async.lua`

> **Source:** `scripts/utils/async.lua`  
> **Source lines:** 171  
> **Functions detected:** 9  
> **Table declarations detected:** 11

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Async.lua Async/await and Promise utilities for Lua

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 14 | `Async.create_promise` | `executor` |
| 23 | `resolve` | `...` |
| 38 | `reject` | `error` |
| 54 | `promise:and_then` | `on_fulfilled, on_rejected` |
| 87 | `Async.promisify` | `coroutine_func` |
| 91 | `step` | `...` |
| 119 | `Async.await` | `promise_or_iterator` |
| 154 | `Async.run` | `main_function` |
| 160 | `Async.create_validator` | `expected_values, error_message` |

### Function notes

- **`Async.create_promise(executor)`** — Create a new Promise *(source line 14)*
- **`resolve(...)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`reject(error)`** *(source line 38)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`promise:and_then(on_fulfilled, on_rejected)`** — Add promise methods (defined with colon syntax) *(source line 54)*
- **`Async.promisify(coroutine_func)`** — Convert a coroutine to a promise *(source line 87)*
- **`step(...)`** *(source line 91)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Async.await(promise_or_iterator)`** — Await a promise inside a coroutine *(source line 119)*
- **`Async.run(main_function)`** — Utility function to run async code *(source line 154)*
- **`Async.create_validator(expected_values, error_message)`** — Helper for creating validation functions *(source line 160)*

## Tables and data structures

### `Async` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PROMISE_STATE` *(line 7)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `PENDING` | string literal | `"pending"` |
| `FULFILLED` | string literal | `"fulfilled"` |
| `REJECTED` | string literal | `"rejected"` |

### `promise` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `state` | expression/reference | `PROMISE_STATE.PENDING` |
| `value` | nil | `nil` |
| `error` | nil | `nil` |
| `on_fulfilled` | table | `{}` |
| `on_rejected` | table | `{}` |

### `on_fulfilled` *(line 19)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `on_rejected` *(line 20)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `promise.value` *(line 27)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `...` |

### `promise.on_fulfilled` *(line 33)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `promise.on_rejected` *(line 35)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `promise.on_fulfilled` *(line 48)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `promise.on_rejected` *(line 50)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `args` *(line 162)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `...` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/utils/async.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
