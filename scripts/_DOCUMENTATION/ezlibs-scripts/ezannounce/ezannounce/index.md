# `ezannounce.lua`

> **Source:** `scripts/ezlibs-scripts/ezannounce/ezannounce.lua`  
> **Source lines:** 199  
> **Functions detected:** 9  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Your server's announcement feed (edit this list to publish new posts)

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/helpers` — line 2
- `scripts/ezlibs-scripts/ezmemory` — line 3
- `scripts/ezlibs-scripts/ezemail` — line 4
- `scripts/ezlibs-scripts/ezbus` — line 5

## Events

- `Net:on("player_disconnect", function(event) ...)` — line 168. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 45 | `_get_email_bucket` | `player_id` |
| 53 | `_is_active` | `ann, now` |
| 60 | `_feed_signature` | `feed` |
| 69 | `_reload_feed` | `(none)` |
| 92 | `ezannounce.get_feed` | `(none)` |
| 99 | `ezannounce.send_missing` | `player_id` |
| 172 | `ezannounce.broadcast_missing_to_online` | `(none)` |
| 178 | `ezannounce.start_watch` | `interval` |
| 183 | `loop` | `(none)` |

### Function notes

- **`_get_email_bucket(player_id)`** *(source line 45)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_is_active(ann, now)`** *(source line 53)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_feed_signature(feed)`** *(source line 60)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_reload_feed()`** *(source line 69)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezannounce.get_feed()`** *(source line 92)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezannounce.send_missing(player_id)`** *(source line 99)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezannounce.broadcast_missing_to_online()`** *(source line 172)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezannounce.start_watch(interval)`** *(source line 178)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`loop()`** *(source line 183)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezannounce` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `_online` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ezannounce.ANNOUNCEMENTS` *(line 17)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ids` *(line 62)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `tomb` *(line 111)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending` *(line 124)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mail` *(line 143)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `ann.id` |
| `icon` | expression/reference | `ann.icon or 1` |
| `title` | expression/reference | `ann.title or "Announcement"` |
| `from` | expression/reference | `ann.from or "Server"` |
| `body` | expression/reference | `ann.body or ""` |
| `mug_texture_path` | expression/reference | `ann.mug_texture_path` |
| `mug_animation_path` | expression/reference | `ann.mug_animation_path` |
| `read` | boolean literal | `false` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezannounce/ezannounce.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
