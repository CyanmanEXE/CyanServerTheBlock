# `logger.lua`

> **Source:** `scripts/logger/logger.lua`  
> **Source lines:** 198  
> **Functions detected:** 13  
> **Table declarations detected:** 8

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

logger.lua – Flexible logging module with per‑logger configuration. Uses append‑only JSON Lines format – each entry is written as a new line. Supports buffering, periodic writes, and optional deduplication of repeated messages. No longer depends on persistence.lua.

## Dependencies

- `scripts/libs/json` — line 6
- `scripts/enum/predefined-enums` — line 7

## Events

- `Net:on("tick", function(event) ...)` — line 183. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 16 | `ensure_directory_exists` | `filePath` |
| 36 | `timestamp` | `(none)` |
| 43 | `encode_entry` | `entry` |
| 45 | `escape` | `s` |
| 75 | `createLogger` | `config` |
| 108 | `LoggerMT:shouldLog` | `level` |
| 115 | `LoggerMT:addEntry` | `level, msg, data` |
| 145 | `LoggerMT:flush` | `(none)` |
| 171 | `LoggerMT:debug` | `msg, data` |
| 172 | `LoggerMT:info` | `msg, data` |
| 173 | `LoggerMT:warn` | `msg, data` |
| 174 | `LoggerMT:error` | `msg, data` |
| 177 | `LoggerMT:forceFlush` | `(none)` |

### Function notes

- **`ensure_directory_exists(filePath)`** *(source line 16)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`timestamp()`** — Helper to get current timestamp as string *(source line 36)*
- **`encode_entry(entry)`** — ============================================================ NEW: Custom JSON encoder with fixed field order ============================================================ *(source line 43)*
- **`escape(s)`** — Escape JSON string characters *(source line 45)*
- **`createLogger(config)`** — Create a new logger instance -@param config table -@field filePath string           # required: path to log file -@field minLevel? string          # "debug", "info", "warn", "error" (default "info") -@field flushInterval? number     # seconds between writes (default 2.0) -@field maxBufferSize? number     # max messages before forcing flush (default 100) -@field logIfChanged? boolean     # only log if message differs from last (default false) *(source line 75)*
- **`LoggerMT:shouldLog(level)`** — Internal method to check if a message should be logged based on level *(source line 108)*
- **`LoggerMT:addEntry(level, msg, data)`** — Internal method to add an entry to buffer *(source line 115)*
- **`LoggerMT:flush()`** — Flush buffered entries to file (append‑only) *(source line 145)*
- **`LoggerMT:debug(msg, data)`** — Public logging methods *(source line 171)*
- **`LoggerMT:info(msg, data)`** *(source line 172)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LoggerMT:warn(msg, data)`** *(source line 173)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LoggerMT:error(msg, data)`** *(source line 174)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LoggerMT:forceFlush()`** — Force flush now (useful before shutdown) *(source line 177)*

## Tables and data structures

### `loggers` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `fields` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `string.format('"timestamp":"%s"'` |
| `[2]` | call/expression | `escape(entry.timestamp))` |
| `[3]` | call/expression | `string.format('"level":"%s"'` |
| `[4]` | call/expression | `escape(entry.level))` |
| `[5]` | call/expression | `string.format('"msg":"%s"'` |
| `[6]` | call/expression | `escape(entry.msg))` |

### `LoggerMT` *(line 65)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.levelPriority` *(line 89)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `debug` | number literal | `1` |
| `info` | number literal | `2` |
| `warn` | number literal | `3` |
| `error` | number literal | `4` |

### `self.buffer` *(line 97)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.lastMessages` *(line 99)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `entry` *(line 126)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `timestamp` | call/expression | `timestamp()` |
| `level` | expression/reference | `level` |
| `msg` | expression/reference | `msg` |

### `self.buffer` *(line 165)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/logger/logger.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
