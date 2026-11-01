# `test_utilities.lua`

> **Source:** `scripts/ezlibs-scripts/tests/test_utilities.lua`  
> **Source lines:** 77  
> **Functions detected:** 2  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Run from the package root with: lua tests/test_utilities.lua

## Dependencies

- `ezutil` — line 6
- `ezvalidate` — line 7
- `ezdebug` — line 8

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 10 | `test` | `name, callback` |
| 64 | `sink` | `message` |

### Function notes

- **`test(name, callback)`** *(source line 10)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sink(message)`** *(source line 64)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `values` *(line 26)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"a"` |
| `[2]` | string literal | `"b"` |
| `[3]` | string literal | `"b"` |
| `[4]` | string literal | `"c"` |

### `source` *(line 34)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `nested` | table | `{value = 7}` |
| `a` | number literal | `1` |

### `target` *(line 38)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `a` | number literal | `1` |

### `messages` *(line 60)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/tests/test_utilities.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
