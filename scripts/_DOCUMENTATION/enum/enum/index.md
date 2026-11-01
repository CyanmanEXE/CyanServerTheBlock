# `enum.lua`

> **Source:** `scripts/enum/enum.lua`  
> **Source lines:** 184  
> **Functions detected:** 14  
> **Table declarations detected:** 14

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

enum.lua A reusable Lua 5.2 module for creating enum-like tables. Supports custom key-value definitions, active value validation, and copying for independent instances. No external dependencies.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 18 | `Enum.new` | `...` |
| 74 | `getName` | `self, value` |
| 79 | `getValue` | `self, key` |
| 84 | `isValid` | `self, value` |
| 89 | `names` | `self` |
| 99 | `values` | `self` |
| 108 | `getActive` | `self` |
| 113 | `setActive` | `self, value` |
| 120 | `random` | `self` |
| 126 | `new` | `self` |
| 131 | `copy` | `self` |
| 144 | `__index` | `tbl, key` |
| 158 | `__newindex` | `tbl, key, value` |
| 169 | `__tostring` | `tbl` |

### Function notes

- **`Enum.new(...)`** — Create a new enum. Accepts: 1. A list of names (strings) -> values become 1,2,3,... e.g., Enum.new("RED", "GREEN", "BLUE") 2. A table of key-value pairs (old format) e.g., Enum.new({ RED = "red", GREEN = "green", BLUE = 0x0000FF }) 3. A table with 'options' and optional 'active' (new format) e.g., Enum.new({ options = { RED = "red", GREEN = "green" }, active = "green" }) If 'active' is not provided, the first option becomes active. *(source line 18)*
- **`getName(self, value)`** — Return the key for a given value (requires unique values) *(source line 74)*
- **`getValue(self, key)`** — Return the value for a given key *(source line 79)*
- **`isValid(self, value)`** — Check if a value is valid (exists in enum) *(source line 84)*
- **`names(self)`** — Return a sorted list of all keys (names) *(source line 89)*
- **`values(self)`** — Return a list of all values in insertion order *(source line 99)*
- **`getActive(self)`** — Get the current active value *(source line 108)*
- **`setActive(self, value)`** — Set the active value (validated) *(source line 113)*
- **`random(self)`** — Return a random valid value *(source line 120)*
- **`new(self)`** — Alias for random *(source line 126)*
- **`copy(self)`** — Returns a new independent enum with the same options *(source line 131)*
- **`__index(tbl, key)`** *(source line 144)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__newindex(tbl, key, value)`** *(source line 158)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__tostring(tbl)`** *(source line 169)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Enum` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `args` *(line 19)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `...` |

### `optionsTable` *(line 37)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keyToValue` *(line 43)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `valueToKey` *(line 45)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `orderedKeys` *(line 46)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `orderedValues` *(line 47)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `methods` *(line 72)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `getName` | function | `function(self` |
| `[2]` | expression/reference | `value) return valueToKey[value] end` |
| `getValue` | function | `function(self` |
| `[4]` | expression/reference | `key) return keyToValue[key] end` |
| `isValid` | function | `function(self` |
| `[6]` | expression/reference | `value) return valueToKey[value] ~= nil end` |
| `names` | function | `function(self) local result = {} for key in pairs(keyToValue) do result[#result + 1] = key end table.sort(result) return result end` |
| `values` | function | `function(self) local result = {} for i` |
| `[9]` | call/expression | `v in ipairs(orderedValues) do result[i] = v end return result end` |
| `getActive` | function | `function(self) return activeValue end` |
| `setActive` | function | `function(self` |
| `[12]` | call/expression | `value) assert(valueToKey[value] ~= nil` |
| `[13]` | string literal | `"Invalid active value for enum") activeValue = value return value end` |
| `random` | function | `function(self) if #orderedValues == 0 then return nil end return orderedValues[math.random(#orderedValues)] end` |
| `new` | function | `function(self) return self:random() end` |
| `copy` | function | `function(self) return Enum.new({ options = keyToValue, active = activeValue }) end` |

### `result` *(line 90)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `result` *(line 100)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enum` *(line 137)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mt` *(line 143)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `__index` | function | `function(tbl` |
| `[2]` | expression/reference | `key) if key == "active" then return activeValue elseif key == "options" then local copy = {} for k` |
| `[3]` | call/expression | `v in pairs(keyToValue) do copy[k] = v end return copy else return methods[key] end end` |
| `__newindex` | function | `function(tbl` |
| `[5]` | expression/reference | `key` |
| `[6]` | call/expression | `value) if key == "active" then assert(valueToKey[value] ~= nil` |
| `[7]` | string literal | `"Invalid active value for enum") activeValue = value elseif key == "options" then error("Cannot modify enum options") else error("Cannot mod…` |
| `__tostring` | function | `function(tbl) local parts = {} for i` |
| `[9]` | call/expression | `key in ipairs(orderedKeys) do parts[#parts + 1] = string.format("%s=%s"` |
| `[10]` | expression/reference | `key` |
| `[11]` | call/expression | `tostring(keyToValue[key])) end return "Enum(" .. table.concat(parts` |
| `[12]` | string literal | `", ") .. ")" end` |

### `copy` *(line 149)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parts` *(line 171)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/enum/enum.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
