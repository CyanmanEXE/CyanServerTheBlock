# `logger.lua`

> **Source:** `scripts/persistence/logger.lua`  
> **Source lines:** 189  
> **Functions detected:** 10  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

[[

## Dependencies

- `scripts/persistence/persistence` — line 7

## Events

- `Net:on("tick", function(event) ...)` — line 173. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 14 | `timestamp` | `(none)` |
| 30 | `createLogger` | `config` |
| 73 | `LoggerMT:shouldLog` | `level` |
| 80 | `LoggerMT:addEntry` | `level, msg, data` |
| 110 | `LoggerMT:flush` | `(none)` |
| 144 | `LoggerMT:debug` | `msg, data` |
| 148 | `LoggerMT:info` | `msg, data` |
| 152 | `LoggerMT:warn` | `msg, data` |
| 156 | `LoggerMT:error` | `msg, data` |
| 161 | `LoggerMT:forceFlush` | `(none)` |

### Function notes

- **`timestamp()`** — Helper to get current timestamp as string *(source line 14)*
- **`createLogger(config)`** — Create a new logger instance -@param config table -@field filePath string           # required: path to log file -@field minLevel? string          # "debug", "info", "warn", "error" (default "info") -@field flushInterval? number     # seconds between writes (default 2.0) -@field maxBufferSize? number     # max messages before forcing flush (default 100) -@field logIfChanged? boolean     # only log if message differs from last (default false) -@field pretty? boolean           # pretty‑print JSON (default true) *(source line 30)*
- **`LoggerMT:shouldLog(level)`** — Internal method to check if a message should be logged based on level *(source line 73)*
- **`LoggerMT:addEntry(level, msg, data)`** — Internal method to add an entry to buffer *(source line 80)*
- **`LoggerMT:flush()`** — Flush buffered entries to persistence *(source line 110)*
- **`LoggerMT:debug(msg, data)`** — Public logging methods *(source line 144)*
- **`LoggerMT:info(msg, data)`** *(source line 148)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LoggerMT:warn(msg, data)`** *(source line 152)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LoggerMT:error(msg, data)`** *(source line 156)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LoggerMT:forceFlush()`** — Force flush now (useful before shutdown) *(source line 161)*

## Tables and data structures

### `loggers` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `LoggerMT` *(line 19)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.levelPriority` *(line 45)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `debug` | number literal | `1` |
| `info` | number literal | `2` |
| `warn` | number literal | `3` |
| `error` | number literal | `4` |

### `self.buffer` *(line 53)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.lastMessages` *(line 57)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `entry` *(line 91)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `timestamp` | call/expression | `timestamp()` |
| `level` | expression/reference | `level` |
| `msg` | expression/reference | `msg` |

### `self.buffer` *(line 129)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/persistence/logger.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
