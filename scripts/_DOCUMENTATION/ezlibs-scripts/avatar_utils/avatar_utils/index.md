# `avatar_utils.lua`

> **Source:** `scripts/ezlibs-scripts/avatar_utils/avatar_utils.lua`  
> **Source lines:** 236  
> **Functions detected:** 9  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

avatar_utils.lua Utility functions for handling player avatars and mugshots

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 4
- `scripts/ezlibs-scripts/avatar_utils/lua_yes_parser/lib` — line 5
- `scripts/ezlibs-scripts/avatar_utils/base64` — line 6

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `parse_duration` | `duration_str` |
| 23 | `get_arg_by_key` | `args, key, transform` |
| 41 | `assert_no_nils` | `expected_args` |
| 52 | `ensure_directory` | `filepath` |
| 66 | `set_or_update_asset` | `asset_path, asset_content` |
| 80 | `avatar_utils.copy_player_avatar_to` | `player_id, new_texture_path, new_animation_path, mug_texture_path, mug_animation_path` |
| 145 | `write_temp_file` | `content` |
| 161 | `avatar_utils.parse_animation_data` | `data` |
| 222 | `avatar_utils.parse_animation_file` | `filepath` |

### Function notes

- **`parse_duration(duration_str)`** — Helper: parse duration from .animation file (e.g., "10f" → 166ms) *(source line 11)*
- **`get_arg_by_key(args, key, transform)`** — Helper: extract argument value from YES parser args *(source line 23)*
- **`assert_no_nils(expected_args)`** — Helper: ensure all required arguments are present *(source line 41)*
- **`ensure_directory(filepath)`** — Helper: create directory for a given file path (if it doesn't exist) *(source line 52)*
- **`set_or_update_asset(asset_path, asset_content)`** — Helper: register/update an asset with the server *(source line 66)*
- **`avatar_utils.copy_player_avatar_to(player_id, new_texture_path, new_animation_path, mug_texture_path, mug_animation_path)`** — - Copy a player's avatar and mugshot to local files and register them as assets. - @param player_id string - @param new_texture_path string destination path for avatar texture (e.g., "assets/avatars/sheet/secret.png") - @param new_animation_path string destination path for avatar animation - @param mug_texture_path string destination path for mugshot texture - @param mug_animation_path string destination path for mugshot animation - @return boolean success *(source line 80)*
- **`write_temp_file(content)`** — - Write content to a temporary file and return its path. - @param content string - @return string|nil temp file path, or nil on error *(source line 145)*
- **`avatar_utils.parse_animation_data(data)`** — - Parse animation data from a string (content of .animation file) into a Lua table. - This function writes the content to a temporary file and uses lua_yes_parser. - @param data string The content of the .animation file - @return table|nil parsed animation structure, or nil on failure *(source line 161)*
- **`avatar_utils.parse_animation_file(filepath)`** — - Parse an animation file (.animation) from disk into a Lua table. - This function works for any .animation file path, not just those belonging to an avatar. - @param filepath string path to the .animation file - @return table|nil parsed animation structure, or nil on failure *(source line 222)*

## Tables and data structures

### `avatar_utils` *(line 7)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `avatar` *(line 178)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animations` | table | `{}` |

### `expected_args` *(line 186)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | call/expression | `get_arg_by_key(value.args` |
| `[2]` | string literal | `"state")` |

### `frames` *(line 191)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `expected_args` *(line 198)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `duration` | call/expression | `get_arg_by_key(value.args` |
| `[2]` | string literal | `"duration"` |
| `[3]` | expression/reference | `parse_duration)` |
| `x` | call/expression | `get_arg_by_key(value.args` |
| `[5]` | string literal | `"x"` |
| `[6]` | expression/reference | `tonumber)` |
| `y` | call/expression | `get_arg_by_key(value.args` |
| `[8]` | string literal | `"y"` |
| `[9]` | expression/reference | `tonumber)` |
| `width` | call/expression | `get_arg_by_key(value.args` |
| `[11]` | string literal | `"w"` |
| `[12]` | expression/reference | `tonumber)` |
| `height` | call/expression | `get_arg_by_key(value.args` |
| `[14]` | string literal | `"h"` |
| `[15]` | expression/reference | `tonumber)` |
| `originx` | call/expression | `get_arg_by_key(value.args` |
| `[17]` | string literal | `"originx"` |
| `[18]` | expression/reference | `tonumber)` |
| `originy` | call/expression | `get_arg_by_key(value.args` |
| `[20]` | string literal | `"originy"` |
| `[21]` | expression/reference | `tonumber)` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/avatar_utils/avatar_utils.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
