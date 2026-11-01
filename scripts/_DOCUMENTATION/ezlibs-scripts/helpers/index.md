# `helpers.lua`

> **Source:** `scripts/ezlibs-scripts/helpers.lua`  
> **Source lines:** 228  
> **Functions detected:** 19  
> **Table declarations detected:** 8

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

No module-level description was present in the source. The reference below documents the symbols and behavior visible in this file.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/utils/ezutil` — line 3
- `scripts/ezlibs-scripts/urlencode` — line 4
- `scripts/ezlibs-scripts/ezcache` — line 5

## Events

- `Net:on("player_disconnect", function(event) ...)` — line 220. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 9 | `async` | `p` |
| 14 | `await` | `v` |
| 16 | `first_value_from_table` | `tbl` |
| 23 | `get_table_length` | `tbl` |
| 27 | `helpers.indexOf` | `array, value` |
| 36 | `helpers.extract_numbered_properties` | `object,property_prefix` |
| 47 | `helpers.clear_table` | `tbl` |
| 54 | `helpers.create_bbs_option` | `text,id` |
| 61 | `helpers.deep_copy` | `orig` |
| 65 | `helpers.split` | `string, delimiter` |
| 73 | `helpers.get_safe_player_secret` | `player_id` |
| 79 | `helpers.safe_require` | `script_path` |
| 93 | `helpers.date_string_to_timestamp` | `date_string` |
| 109 | `helpers.is_now_before_date` | `date_string` |
| 118 | `helpers.position_overlaps_something` | `position,area_id` |
| 135 | `helpers.get_lock` | `player_id,lock_id,timeout` |
| 141 | `release` | `(none)` |
| 160 | `helpers.read_item_information` | `area_id, item_object_id` |
| 183 | `helpers.ensure_directory` | `path` |

### Function notes

- **`async(p)`** *(source line 9)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`await(v)`** *(source line 14)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`first_value_from_table(tbl)`** *(source line 16)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_table_length(tbl)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.indexOf(array, value)`** *(source line 27)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.extract_numbered_properties(object,property_prefix)`** *(source line 36)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.clear_table(tbl)`** *(source line 47)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.create_bbs_option(text,id)`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.deep_copy(orig)`** *(source line 61)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.split(string, delimiter)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.get_safe_player_secret(player_id)`** *(source line 73)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.safe_require(script_path)`** *(source line 79)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.date_string_to_timestamp(date_string)`** *(source line 93)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.is_now_before_date(date_string)`** *(source line 109)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.position_overlaps_something(position,area_id)`** *(source line 118)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.get_lock(player_id,lock_id,timeout)`** *(source line 135)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`release()`** *(source line 141)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.read_item_information(area_id, item_object_id)`** *(source line 160)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`helpers.ensure_directory(path)`** — ============================================================================ Cross‑platform directory creation ============================================================================ *(source line 183)*

## Tables and data structures

### `helpers` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `locks` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `locks_by_player` *(line 7)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out_table` *(line 37)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `table` *(line 66)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `date_part_keys` *(line 99)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"sec"` |
| `[2]` | string literal | `"min"` |
| `[3]` | string literal | `"hour"` |
| `[4]` | string literal | `"day"` |
| `[5]` | string literal | `"month"` |
| `[6]` | string literal | `"year"` |

### `lock` *(line 140)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `release` | function | `function() if locks_by_player[player_id] then locks_by_player[player_id][lock_id] = nil end locks[lock_id] = nil end` |

### `item` *(line 163)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/helpers.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
