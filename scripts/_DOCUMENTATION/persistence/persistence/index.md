# `persistence.lua`

> **Source:** `scripts/persistence/persistence.lua`  
> **Source lines:** 373  
> **Functions detected:** 21  
> **Table declarations detected:** 11

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

persistence.lua Persistent JSON file storage with automatic debounced saving and per‑file instance management. Supports chained updates and waiting for save completion via promise‑returning save(). Automatically creates missing directories when saving.

## Dependencies

- `scripts/libs/json` — line 6
- `scripts/utils/utility` — line 7

## Events

- `Net:on("tick", function(event) ...)` — line 85. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 22 | `split` | `str, delim` |
| 32 | `get_os` | `(none)` |
| 42 | `mkdir_p` | `dir` |
| 76 | `async_ensure_dir` | `filePath` |
| 102 | `new` | `filePath` |
| 115 | `self:_mark_dirty` | `(none)` |
| 125 | `self:load` | `(none)` |
| 152 | `self:getData` | `(none)` |
| 164 | `self:setData` | `newData` |
| 173 | `self:update` | `func` |
| 182 | `self:removeKey` | `key` |
| 189 | `self:setKey` | `key, value` |
| 196 | `self:clear` | `(none)` |
| 205 | `resolve_path` | `data, path, create` |
| 234 | `self:removePath` | `path` |
| 244 | `self:setPath` | `path, value` |
| 254 | `self:_save_internal` | `(none)` |
| 326 | `self:save` | `(none)` |
| 348 | `self:ready` | `callback` |
| 353 | `self:updateAndSave` | `func` |
| 361 | `get_instance` | `filePath` |

### Function notes

- **`split(str, delim)`** — Simple split function (splits string on a delimiter) *(source line 22)*
- **`get_os()`** — OS detection (copied from utils.lua for self‑containment) *(source line 32)*
- **`mkdir_p(dir)`** — Synchronously create a directory (and all parents) if it does not exist. Returns true on success, false on failure (errors are printed). *(source line 42)*
- **`async_ensure_dir(filePath)`** — Promise‑based directory creation: extracts directory part from file path, creates it synchronously, and returns an already‑resolved promise. *(source line 76)*
- **`new(filePath)`** — Creates a new instance (internal) *(source line 102)*
- **`self:_mark_dirty()`** — Mark data as dirty and schedule a save (debounced) *(source line 115)*
- **`self:load()`** — Load data from file. Returns a promise that resolves when loaded. *(source line 125)*
- **`self:getData()`** — Get current data (returns a shallow copy) *(source line 152)*
- **`self:setData(newData)`** — Replace entire data *(source line 164)*
- **`self:update(func)`** — Apply a function to modify data in place *(source line 173)*
- **`self:removeKey(key)`** — Convenience: remove a top‑level key *(source line 182)*
- **`self:setKey(key, value)`** — Convenience: set a top‑level key (replaces if exists) *(source line 189)*
- **`self:clear()`** — Clear all data (reset to empty table) *(source line 196)*
- **`resolve_path(data, path, create)`** — Robust helper to resolve a dot‑separated path (e.g., "user.profile.name") or table of keys *(source line 205)*
- **`self:removePath(path)`** — Remove a nested key (path can be dot‑string or table of keys) *(source line 234)*
- **`self:setPath(path, value)`** — Set a nested key (creates intermediate tables if needed) *(source line 244)*
- **`self:_save_internal()`** — Internal save (called by timer or manually). Returns a promise. *(source line 254)*
- **`self:save()`** — Public save: forces an immediate save (bypasses timer). Returns a promise. *(source line 326)*
- **`self:ready(callback)`** — Convenience: load and then call a callback *(source line 348)*
- **`self:updateAndSave(func)`** — Update and schedule save (same as update, but name indicates auto‑save) *(source line 353)*
- **`get_instance(filePath)`** — Manager: returns the instance for a given file path (creates if not exist) *(source line 361)*

## Tables and data structures

### `instances` *(line 10)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `result` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self` *(line 103)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `filePath` | expression/reference | `filePath` |
| `data` | nil | `nil` |
| `loaded` | boolean literal | `false` |
| `saving` | boolean literal | `false` |
| `dirty` | boolean literal | `false` |
| `save_delay` | nil | `nil` |
| `pending` | boolean literal | `false` |
| `after_save` | table | `{}` |

### `after_save` *(line 111)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.data` *(line 143)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `copy` *(line 156)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.data` *(line 200)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.after_save` *(line 275)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.after_save` *(line 301)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.after_save` *(line 306)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.after_save` *(line 314)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/persistence/persistence.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
