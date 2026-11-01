# `main.lua`

> **Source:** `scripts/advertise_server/main.lua`  
> **Source lines:** 222  
> **Functions detected:** 15  
> **Table declarations detected:** 14

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

shorthands for async stuff.

## Dependencies

- `scripts/advertise_server/json` — line 1
- `scripts/advertise_server/base64` — line 2
- `scripts/advertise_server/urlencode` — line 3

## Events

- `Net:on("player_connect", function(event) ...)` — line 39. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 44. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 19 | `async` | `p` |
| 23 | `await` | `v` |
| 24 | `load_image_data` | `path` |
| 31 | `save_image_data` | `path,data` |
| 49 | `set_pending_field_for_all_servers` | `field_name,value` |
| 55 | `set_pending_field` | `server_id,field_name,value` |
| 63 | `clear_pending_fields` | `server_id` |
| 67 | `build_payload` | `server_id` |
| 79 | `get_secret_key` | `server_id,listserver_name` |
| 89 | `save_secret_key` | `file_path,server_id,listserver_name,secret_key` |
| 102 | `sync_to_servers` | `server_id` |
| 127 | `read_json` | `file_path` |
| 140 | `load_all_images_for_advertisements` | `advertisements` |
| 152 | `initialize_pending_fields_from_advertisements` | `advertisements` |
| 163 | `build_server_map` | `(none)` |

### Function notes

- **`async(p)`** — shorthands for async stuff. *(source line 19)*
- **`await(v)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_image_data(path)`** *(source line 24)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`save_image_data(path,data)`** *(source line 31)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_pending_field_for_all_servers(field_name,value)`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_pending_field(server_id,field_name,value)`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`clear_pending_fields(server_id)`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_payload(server_id)`** *(source line 67)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_secret_key(server_id,listserver_name)`** *(source line 79)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`save_secret_key(file_path,server_id,listserver_name,secret_key)`** *(source line 89)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sync_to_servers(server_id)`** *(source line 102)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`read_json(file_path)`** *(source line 127)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_all_images_for_advertisements(advertisements)`** *(source line 140)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`initialize_pending_fields_from_advertisements(advertisements)`** *(source line 152)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_server_map()`** *(source line 163)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `public_info` *(line 10)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `pending_fields` | table | `{}` |
| `time_since_last_sync` | table | `{}` |

### `pending_fields` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `time_since_last_sync` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `listservers` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `secret_keys` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `server_ids` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `payload` *(line 68)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `server_id` | expression/reference | `server_id` |
| `fields` | table | `{}` |

### `fields` *(line 70)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `headers` *(line 106)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `data` *(line 129)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `data` *(line 133)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `server_map` *(line 164)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `l` *(line 171)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `r` *(line 172)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/advertise_server/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
