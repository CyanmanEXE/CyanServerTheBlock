# `urlencode.lua`

> **Source:** `scripts/ezlibs-scripts/urlencode.lua`  
> **Source lines:** 46  
> **Functions detected:** 2  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Module table

## Dependencies

- `string` — line 1
- `table` — line 2

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 8 | `encode` | `str` |
| 29 | `urlencode.table` | `t` |

### Function notes

- **`encode(str)`** — URL encode a string. *(source line 8)*
- **`urlencode.table(t)`** — URL encode a table as a series of parameters. *(source line 29)*

## Tables and data structures

### `urlencode` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `argts` *(line 32)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/urlencode.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
