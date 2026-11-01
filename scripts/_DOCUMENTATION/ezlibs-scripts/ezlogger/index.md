# `ezlogger.lua`

> **Source:** `scripts/ezlibs-scripts/ezlogger.lua`  
> **Source lines:** 456  
> **Functions detected:** 33  
> **Table declarations detected:** 13

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezlogger.lua Shared append-only JSONL logging for ezlibs modules. Lua 5.2 compatible. Log files are written below: scripts/ezlibs-scripts/_DEBUGGING/<module>/ Default module log: debugging.log Player log:         <safe-player-secret>.log Area/map log:       <area-id>.log

## Dependencies

- `scripts/ezlibs-scripts/json` — line 10
- `scripts/ezlibs-scripts/urlencode` — line 356

## Events

- `Net:on("player_join", function(event) ...)` — line 433. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 439. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 34 | `safe_component` | `value, fallback` |
| 46 | `copy_options` | `source` |
| 54 | `timestamp` | `(none)` |
| 58 | `join_arguments` | `...` |
| 68 | `normalize_path` | `path` |
| 72 | `directory_of` | `path` |
| 77 | `mkdir_recursive_lfs` | `path, lfs` |
| 101 | `ensure_directory` | `path` |
| 131 | `encode_string` | `value` |
| 139 | `encode_entry` | `entry` |
| 163 | `Logger:_should_log` | `level` |
| 169 | `Logger:flush` | `(none)` |
| 218 | `Logger:_log` | `level, message, data` |
| 241 | `Logger:debug` | `...` |
| 245 | `Logger:info` | `...` |
| 249 | `Logger:warn` | `...` |
| 253 | `Logger:error` | `...` |
| 257 | `Logger:debug_data` | `message, data` |
| 261 | `Logger:info_data` | `message, data` |
| 265 | `Logger:warn_data` | `message, data` |
| 269 | `Logger:error_data` | `message, data` |
| 273 | `Logger:forceFlush` | `(none)` |
| 277 | `Logger:set_min_level` | `level` |
| 285 | `cache_key` | `module_name, scope, path` |
| 289 | `make_logger` | `module_name, scope, file_path, options` |
| 315 | `module_name_of` | `name` |
| 319 | `ezlogger.get` | `module_name, options` |
| 328 | `Logger:for_safe_secret` | `safe_secret, options` |
| 349 | `resolve_safe_player_secret` | `player_id` |
| 369 | `Logger:for_player` | `player_id, options` |
| 378 | `Logger:for_area` | `area_id, options` |
| 392 | `ezlogger.configure` | `options` |
| 421 | `ezlogger.flush_all` | `(none)` |

### Function notes

- **`safe_component(value, fallback)`** *(source line 34)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`copy_options(source)`** *(source line 46)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`timestamp()`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`join_arguments(...)`** *(source line 58)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_path(path)`** *(source line 68)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`directory_of(path)`** *(source line 72)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`mkdir_recursive_lfs(path, lfs)`** *(source line 77)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_directory(path)`** *(source line 101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_string(value)`** *(source line 131)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_entry(entry)`** *(source line 139)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:_should_log(level)`** *(source line 163)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:flush()`** *(source line 169)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:_log(level, message, data)`** *(source line 218)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:debug(...)`** *(source line 241)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:info(...)`** *(source line 245)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:warn(...)`** *(source line 249)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:error(...)`** *(source line 253)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:debug_data(message, data)`** *(source line 257)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:info_data(message, data)`** *(source line 261)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:warn_data(message, data)`** *(source line 265)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:error_data(message, data)`** *(source line 269)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:forceFlush()`** *(source line 273)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:set_min_level(level)`** *(source line 277)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cache_key(module_name, scope, path)`** *(source line 285)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`make_logger(module_name, scope, file_path, options)`** *(source line 289)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`module_name_of(name)`** *(source line 315)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezlogger.get(module_name, options)`** *(source line 319)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:for_safe_secret(safe_secret, options)`** — Returns a logger whose file is keyed by the stable safe player secret. The secret is used only as a sanitized filename; it is not automatically copied into the log message or structured record. *(source line 328)*
- **`resolve_safe_player_secret(player_id)`** — Resolve the safe secret using the same extraction/URL-encoding convention as helpers.get_safe_player_secret(), without requiring helpers.lua (which itself may use ezlogger and would create a dependency cycle). Cache the session-ID -> safe-secret mapping so disconnect handlers can still select the stable player log after the engine stops resolving the live session. *(source line 349)*
- **`Logger:for_player(player_id, options)`** *(source line 369)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Logger:for_area(area_id, options)`** — Area/map identifiers are sanitized into a single filename component. *(source line 378)*
- **`ezlogger.configure(options)`** *(source line 392)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezlogger.flush_all()`** *(source line 421)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezlogger` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `LEVEL_PRIORITY` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `debug` | number literal | `1` |
| `info` | number literal | `2` |
| `warn` | number literal | `3` |
| `error` | number literal | `4` |

### `instances` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `all_instances` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `defaults` *(line 24)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `minLevel` | string literal | `'debug'` |
| `flushInterval` | number literal | `2.0` |
| `maxBufferSize` | number literal | `100` |
| `console` | boolean literal | `true` |

### `safe_secret_by_player_id` *(line 32)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 47)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parts` *(line 59)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `fields` *(line 140)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `'"timestamp":' .. encode_string(entry.timestamp)` |
| `[2]` | string literal | `'"level":' .. encode_string(entry.level)` |
| `[3]` | string literal | `'"module":' .. encode_string(entry.module)` |
| `[4]` | string literal | `'"scope":' .. encode_string(entry.scope or 'module')` |
| `[5]` | string literal | `'"msg":' .. encode_string(entry.msg)` |

### `Logger` *(line 159)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.buffer` *(line 212)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `entry` *(line 220)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `timestamp` | call/expression | `timestamp()` |
| `level` | expression/reference | `level` |
| `module` | expression/reference | `self.moduleName` |
| `scope` | expression/reference | `self.scope` |
| `msg` | call/expression | `tostring(message or '')` |
| `data` | expression/reference | `data` |

### `buffer` *(line 306)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezlogger.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
