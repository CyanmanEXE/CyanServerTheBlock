# `enumset.lua`

> **Source:** `scripts/enum/enumset.lua`  
> **Source lines:** 72  
> **Functions detected:** 6  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

enumset.lua A container that holds multiple enums and returns a fresh copy of an enum when accessed by key. Requires enum.lua

## Dependencies

- `scripts/enum/enum` — line 6

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 14 | `EnumSet.new` | `definitions` |
| 29 | `keys` | `self` |
| 39 | `getOriginal` | `self, key` |
| 44 | `get` | `self, key` |
| 54 | `__index` | `tbl, key` |
| 64 | `__newindex` | `tbl, key, value` |

### Function notes

- **`EnumSet.new(definitions)`** — Create a new EnumSet from a table of enums. The input `definitions` is a table mapping string keys to enum objects created by Enum.new(). Accessing a key in the returned set returns a fresh copy of that enum. *(source line 14)*
- **`keys(self)`** — Returns a list of all keys in the set *(source line 29)*
- **`getOriginal(self, key)`** — Returns the original enum (without copying) – use with caution *(source line 39)*
- **`get(self, key)`** — Returns a copy of the enum for the given key (same as set[key]) *(source line 44)*
- **`__index(tbl, key)`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__newindex(tbl, key, value)`** — Prevent modification of the set's enum definitions via assignment *(source line 64)*

## Tables and data structures

### `EnumSet` *(line 7)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `set` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `internalEnums` *(line 17)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `methods` *(line 27)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `keys` | function | `function(self) local result = {} for key in pairs(internalEnums) do result[#result + 1] = key end table.sort(result) return result end` |
| `getOriginal` | function | `function(self` |
| `[3]` | expression/reference | `key) return internalEnums[key] end` |
| `get` | function | `function(self` |
| `[5]` | call/expression | `key) local enum = internalEnums[key] if enum then return enum:copy() end return nil end` |

### `result` *(line 30)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/enum/enumset.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
