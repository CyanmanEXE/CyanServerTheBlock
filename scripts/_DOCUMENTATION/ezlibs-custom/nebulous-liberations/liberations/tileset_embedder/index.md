# `tileset_embedder.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/tileset_embedder.lua`  
> **Source lines:** 356  
> **Functions detected:** 12  
> **Table declarations detected:** 8

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

tileset_embedder.lua Ensures maps containing a Tiled "Liberation Config" object reference the shared Nebulous Liberations tilesets. Shared TSX/PNG assets are published before TMX files are modified. The caller can await Embedder.run().

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 7

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 41 | `basename` | `path` |
| 45 | `source_to_file_path` | `source` |
| 55 | `parse_tilesets` | `tmx` |
| 73 | `get_liberation_config` | `area_id` |
| 85 | `publish_shared_assets` | `(none)` |
| 129 | `read_tileset_tilecount` | `entry` |
| 158 | `next_gid_after_existing_tilesets` | `entries` |
| 172 | `normalize_shared_sources` | `tmx, entries` |
| 191 | `insert_declarations` | `tmx, declarations` |
| 208 | `write_updated_map` | `area_id, map_path, original, updated` |
| 250 | `process_map` | `area_id` |
| 322 | `Embedder.run` | `(none)` |

### Function notes

- **`basename(path)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`source_to_file_path(source)`** *(source line 45)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_tilesets(tmx)`** — Tiled map tilesets are usually external, self-closing declarations. This parser also records inline tilesets so their tile ranges are not overlapped. *(source line 55)*
- **`get_liberation_config(area_id)`** *(source line 73)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`publish_shared_assets()`** *(source line 85)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`read_tileset_tilecount(entry)`** *(source line 129)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`next_gid_after_existing_tilesets(entries)`** *(source line 158)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_shared_sources(tmx, entries)`** *(source line 172)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`insert_declarations(tmx, declarations)`** *(source line 191)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`write_updated_map(area_id, map_path, original, updated)`** *(source line 208)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`process_map(area_id)`** *(source line 250)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Embedder.run()`** *(source line 322)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Embedder` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `SHARED_TILESETS` *(line 8)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ filename = "Liberation Collision.tsx", source = "../assets/ezlibs-custom/nebulous-liberations/Liberation Collision.tsx", file_path = "asse…` |
| `[2]` | table | `{ filename = "selected tile.tsx", source = "../assets/ezlibs-custom/nebulous-liberations/selected tile.tsx", file_path = "assets/ezlibs-cust…` |
| `[3]` | table | `{ filename = "attack indicator.tsx", source = "../assets/ezlibs-custom/nebulous-liberations/attack indicator.tsx", file_path = "assets/ezlib…` |

### `TARGET_BY_FILENAME` *(line 35)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `entries` *(line 56)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `asset_files` *(line 88)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ file_path = tileset.file_path, asset_path = tileset.asset_path }` |
| `[2]` | table | `{ file_path = "assets/ezlibs-custom/nebulous-liberations/" .. tileset.image_filename, asset_path = "/server/assets/ezlibs-custom/nebulous-li…` |

### `found` *(line 174)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `missing` *(line 277)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `declarations` *(line 298)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/tileset_embedder.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
