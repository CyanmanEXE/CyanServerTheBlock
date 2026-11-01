# `ezbus.lua`

> **Source:** `scripts/ezlibs-scripts/ezbus.lua`  
> **Source lines:** 107  
> **Functions detected:** 7  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezbus.lua - Named event-bus registry. Three usage modes are supported: 1. Named emitters (recommended for cross-script communication) local EzBus = require("scripts/ezlibs-scripts/ezbus") local round_bus = EzBus.get("footbomb:round:" .. instance_id) round_bus:emit("round_complete", { ... }) Any other script can call EzBus.get(name) to reach the SAME emitter. Call EzBus.destroy(name) when the consumer is finished (e.g. instance removal) so the entry does not leak. 2. Fresh per-use emitters (per-round, per-response, etc.) local round_events = EzBus.new() 3. Backward-compatible default emitter local EzBus = require("scripts/ezlibs-scripts/ezbus") EzBus:on("some_event", cb) EzBus:emit("some_event", data) Every EzEmitter method (on/once/emit/... ) proxies to an unnamed default emitter, so code that treated ezbus as a single global bus keeps working. Use `:` method-call syntax as with any Lua object. Lifecycle helpers: EzBus.get(name)          -> emitter  (creates on first use) EzBus.destroy(name)      -> true if a bus existed and was destroyed EzBus.destroy_all()      -> destroys and forgets every named bus EzBus.exists(name)       -> boolean EzBus.list()             -> sorted array of registered names EzBus.new()              -> fresh, unregistered emitter (old factory)

## Dependencies

- `scripts/ezlibs-scripts/ezbus` — line 6
- `scripts/ezlibs-scripts/ezbus` — line 18
- `scripts/ezlibs-scripts/ezemitter` — line 34

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 46 | `ezbus.get` | `name` |
| 58 | `ezbus.destroy` | `name` |
| 68 | `ezbus.destroy_all` | `(none)` |
| 75 | `ezbus.exists` | `name` |
| 80 | `ezbus.list` | `(none)` |
| 92 | `__index` | `_, key` |
| 101 | `__newindex` | `_, key, value` |

### Function notes

- **`ezbus.get(name)`** — Retrieve (or lazily create) a named emitter. `nil`/"" returns the default unnamed emitter so callers can pass an optional name. *(source line 46)*
- **`ezbus.destroy(name)`** — Destroy a named bus and drop the registry entry. Does NOT touch the default emitter. Returns true if a bus was actually removed. *(source line 58)*
- **`ezbus.destroy_all()`** — Destroy every named bus. The default emitter is preserved. *(source line 68)*
- **`ezbus.exists(name)`** *(source line 75)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbus.list()`** *(source line 80)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__index(_, key)`** *(source line 92)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`__newindex(_, key, value)`** *(source line 101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `named` *(line 35)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ezbus` *(line 38)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `snapshot` *(line 69)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `named` *(line 71)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `names` *(line 81)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezbus.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
