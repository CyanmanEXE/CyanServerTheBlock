# `ezdebug.lua`

> **Source:** `scripts/ezlibs-scripts/utils/ezdebug.lua`  
> **Source lines:** 47  
> **Functions detected:** 6  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezdebug.lua Small logger wrapper. By default it writes to standard output. Host-specific logging can be supplied as a callback.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `ezdebug.configure` | `options` |
| 28 | `write` | `level, ...` |
| 39 | `ezdebug.info` | `...` |
| 40 | `ezdebug.warn` | `...` |
| 41 | `ezdebug.error` | `...` |
| 43 | `ezdebug.traceback` | `message, level` |

### Function notes

- **`ezdebug.configure(options)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`write(level, ...)`** *(source line 28)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezdebug.info(...)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezdebug.warn(...)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezdebug.error(...)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezdebug.traceback(message, level)`** *(source line 43)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezdebug` *(line 4)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `prefix` | string literal | `"[ezlibs]"` |
| `sink` | expression/reference | `print` |

### `parts` *(line 30)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/utils/ezdebug.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
