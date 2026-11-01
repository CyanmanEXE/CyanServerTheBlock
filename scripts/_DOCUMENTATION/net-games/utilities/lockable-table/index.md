# `lockable-table.lua`

> **Source:** `scripts/net-games/utilities/lockable-table.lua`  
> **Source lines:** 352  
> **Functions detected:** 35  
> **Table declarations detected:** 14

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

lockable_table.lua

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 4 | `is_lockable` | `t` |
| 8 | `create_lockable_table` | `t` |
| 19 | `can_modify` | `key, new_value` |
| 44 | `__index` | `tbl, key` |
| 53 | `__newindex` | `tbl, key, value` |
| 72 | `__pairs` | `(none)` |
| 78 | `__len` | `(none)` |
| 91 | `methods:add` | `key, value, recursive` |
| 109 | `methods:remove` | `key, recursive` |
| 128 | `methods:addMany` | `pairs, recursive` |
| 138 | `methods:removeMany` | `keys, recursive` |
| 148 | `methods:canAdd` | `key` |
| 152 | `methods:canRemove` | `key` |
| 156 | `methods:update` | `key, value, recursive` |
| 170 | `methods:replace` | `new_data, recursive` |
| 197 | `methods:clear` | `recursive` |
| 202 | `methods:getRaw` | `key` |
| 206 | `methods:setRaw` | `key, value` |
| 211 | `methods:lockKey` | `key, recursive` |
| 220 | `methods:unlockKey` | `key, recursive` |
| 229 | `methods:lockValue` | `value, recursive` |
| 240 | `methods:unlockValue` | `value, recursive` |
| 251 | `methods:lockAll` | `recursive` |
| 264 | `methods:unlockAll` | `recursive` |
| 279 | `methods:isKeyLocked` | `key` |
| 283 | `methods:isValueLocked` | `value` |
| 287 | `methods:isFullyLocked` | `(none)` |
| 291 | `methods:getLockedKeys` | `(none)` |
| 299 | `methods:getLockedValues` | `(none)` |
| 307 | `methods:size` | `(none)` |
| 315 | `methods:keys` | `(none)` |
| 323 | `methods:values` | `(none)` |
| 335 | `LockableTable.new` | `t` |
| 340 | `LockableTable.isLockable` | `t` |
| 345 | `LockableTable.wrap` | `t` |

### Function notes

- **`is_lockable(t)`** *(source line 4)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_lockable_table(t)`** *(source line 8)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`can_modify(key, new_value)`** — Helper function to check if we can modify *(source line 19)*
- **`__index(tbl, key)`** *(source line 44)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__newindex(tbl, key, value)`** *(source line 53)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__pairs()`** *(source line 72)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__len()`** *(source line 78)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:add(key, value, recursive)`** — Define methods *(source line 91)*
- **`methods:remove(key, recursive)`** *(source line 109)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:addMany(pairs, recursive)`** *(source line 128)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:removeMany(keys, recursive)`** *(source line 138)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:canAdd(key)`** *(source line 148)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:canRemove(key)`** *(source line 152)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:update(key, value, recursive)`** *(source line 156)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:replace(new_data, recursive)`** *(source line 170)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:clear(recursive)`** *(source line 197)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:getRaw(key)`** *(source line 202)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:setRaw(key, value)`** *(source line 206)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:lockKey(key, recursive)`** *(source line 211)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:unlockKey(key, recursive)`** *(source line 220)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:lockValue(value, recursive)`** *(source line 229)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:unlockValue(value, recursive)`** *(source line 240)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:lockAll(recursive)`** *(source line 251)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:unlockAll(recursive)`** *(source line 264)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:isKeyLocked(key)`** *(source line 279)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:isValueLocked(value)`** *(source line 283)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:isFullyLocked()`** *(source line 287)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:getLockedKeys()`** *(source line 291)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:getLockedValues()`** *(source line 299)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:size()`** *(source line 307)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:keys()`** *(source line 315)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`methods:values()`** *(source line 323)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LockableTable.new(t)`** — Module function *(source line 335)*
- **`LockableTable.isLockable(t)`** — Check if a table is lockable *(source line 340)*
- **`LockableTable.wrap(t)`** — Make a regular table lockable (shallow) *(source line 345)*

## Tables and data structures

### `LockableTable` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `locked_keys` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `locked_values` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `methods` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `public` *(line 37)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mt` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `__index` | function | `function(tbl` |
| `[2]` | expression/reference | `key) local method = methods[key] if method then return method end return data[key] end` |
| `__newindex` | function | `function(tbl` |
| `[4]` | expression/reference | `key` |
| `[5]` | call/expression | `value) if methods[key] then error("Cannot overwrite method: " .. tostring(key)) end local ok` |
| `err` | call/expression | `can_modify(key` |
| `[7]` | call/expression | `value) if not ok then error(err) end if is_lockable(value) then value._parent = public end data[key] = value end` |
| `__pairs` | function | `function() return function(tbl` |
| `[9]` | call/expression | `k) return next(data` |
| `[10]` | expression/reference | `k) end` |
| `[11]` | nil | `nil` |
| `[12]` | expression/reference | `nil end` |
| `__len` | function | `function() local count = 0 for _ in pairs(data) do count = count + 1 end return count end` |

### `results` *(line 130)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `results` *(line 140)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `locked_keys` *(line 267)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `locked_values` *(line 268)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keys` *(line 292)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `values` *(line 300)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keys` *(line 316)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `values` *(line 324)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/utilities/lockable-table.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
