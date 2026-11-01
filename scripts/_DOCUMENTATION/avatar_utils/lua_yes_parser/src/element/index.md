# `element.lua`

> **Source:** `scripts/avatar_utils/lua_yes_parser/src/element.lua`  
> **Source lines:** 419  
> **Functions detected:** 18  
> **Table declarations detected:** 8

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Perform a sanity check

## Dependencies

- `scripts/avatar_utils/lua_yes_parser/src/enums` — line 1
- `scripts/avatar_utils/lua_yes_parser/src/keyval` — line 2
- `scripts/avatar_utils/lua_yes_parser/src/utils/trim` — line 3

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `Element.new` | `(none)` |
| 13 | `__tostring` | `self` |
| 22 | `this.setAttributes` | `attrs` |
| 36 | `findKey` | `key` |
| 48 | `this.upsert` | `keyval` |
| 61 | `this.hasKey` | `key` |
| 65 | `this.hasKeys` | `keyList` |
| 75 | `this.getKeyValue` | `key, orValue` |
| 86 | `this.getKeyValueAsInt` | `key, orValue` |
| 94 | `this.getKeyValueAsBool` | `key, orValue` |
| 106 | `this.getKeyValueAsNumber` | `key, orValue` |
| 115 | `this.printArgs` | `(none)` |
| 137 | `ElementParser.new` | `(none)` |
| 144 | `setDelimiterType` | `type` |
| 153 | `evaluateDelimiter` | `input, start` |
| 267 | `evaluateToken` | `input, start, nd` |
| 286 | `parseTokenStep` | `input, start` |
| 312 | `self.parseTokens` | `input, start` |

### Function notes

- **`Element.new()`** *(source line 6)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__tostring(self)`** *(source line 13)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`this.setAttributes(attrs)`** *(source line 22)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`findKey(key)`** — helper func *(source line 36)*
- **`this.upsert(keyval)`** — public funcs *(source line 48)*
- **`this.hasKey(key)`** *(source line 61)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`this.hasKeys(keyList)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`this.getKeyValue(key, orValue)`** *(source line 75)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`this.getKeyValueAsInt(key, orValue)`** *(source line 86)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`this.getKeyValueAsBool(key, orValue)`** *(source line 94)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`this.getKeyValueAsNumber(key, orValue)`** *(source line 106)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`this.printArgs()`** *(source line 115)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ElementParser.new()`** *(source line 137)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setDelimiterType(type)`** *(source line 144)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`evaluateDelimiter(input, start)`** *(source line 153)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`evaluateToken(input, start, nd)`** *(source line 267)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parseTokenStep(input, start)`** *(source line 286)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`self.parseTokens(input, start)`** — public *(source line 312)*

## Tables and data structures

### `Element` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `this` *(line 7)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `attributes` | table | `{}` |
| `text` | string literal | `''` |
| `args` | table | `{}` |
| `type` | expression/reference | `enums.ElementTypes.STANDARD` |

### `attributes` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `args` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `this.attributes` *(line 24)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mt` *(line 128)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `__tostring` | expression/reference | `__tostring` |

### `ElementParser` *(line 135)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self` *(line 138)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `delimiter` | expression/reference | `enums.Delimiters.UNSET` |
| `element` | nil | `nil` |
| `error` | nil | `nil` |
| `lineNumber` | number literal | `-1` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/avatar_utils/lua_yes_parser/src/element.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
