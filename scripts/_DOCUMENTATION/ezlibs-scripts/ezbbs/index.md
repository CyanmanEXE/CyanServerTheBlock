# `ezbbs.lua`

> **Source:** `scripts/ezlibs-scripts/ezbbs.lua`  
> **Source lines:** 475  
> **Functions detected:** 21  
> **Table declarations detected:** 16

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezbbs.lua - Bulletin Board System for ezlibs Handles board interaction, posting, pinning, deleting. Uses ezusers for permission checks. Board data stored in memory/board/<board_name>.json (path from ezconfig).

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 6
- `scripts/libs/json` — line 7
- `scripts/ezlibs-scripts/ezusers` — line 8
- `scripts/ezlibs-scripts/helpers` — line 9
- `scripts/ezlibs-scripts/ezconfig` — line 10

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 31 | `shallow_copy` | `original` |
| 37 | `contains_only_whitespace` | `text` |
| 41 | `sanitize_title` | `text, limit` |
| 45 | `bbs_compare_pinned` | `a, b` |
| 55 | `bbs_compare_unpinned` | `a, b` |
| 62 | `bbs_display_order_ids` | `board_data` |
| 85 | `save_board` | `board_name` |
| 108 | `push_post` | `board_name, area_id, post` |
| 127 | `show_post` | `player_id, post_id` |
| 140 | `create_post` | `player_id, state` |
| 187 | `load_board` | `name, callback` |
| 222 | `open_board_with_data` | `board_data, player_id, board_name, color, postable, area_id, board_id` |
| 229 | `add_display_post` | `src` |
| 257 | `load_board_and_open` | `name, player_id, area_id, object, color, postable` |
| 266 | `preload_boards` | `(none)` |
| 292 | `ezbbs.handle_player_join` | `player_id` |
| 296 | `ezbbs.handle_player_disconnect` | `player_id` |
| 301 | `ezbbs.handle_object_interaction` | `player_id, object_id, button` |
| 334 | `ezbbs.handle_post_selection` | `player_id, post_id` |
| 439 | `ezbbs.handle_textbox_response` | `player_id, response` |
| 468 | `ezbbs.handle_board_close` | `player_id` |

### Function notes

- **`shallow_copy(original)`** — ---------------------------------------------------------------------- Helper functions ---------------------------------------------------------------------- *(source line 31)*
- **`contains_only_whitespace(text)`** *(source line 37)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sanitize_title(text, limit)`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bbs_compare_pinned(a, b)`** *(source line 45)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bbs_compare_unpinned(a, b)`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bbs_display_order_ids(board_data)`** *(source line 62)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`save_board(board_name)`** *(source line 85)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`push_post(board_name, area_id, post)`** — ---------------------------------------------------------------------- Post creation and display functions ---------------------------------------------------------------------- *(source line 108)*
- **`show_post(player_id, post_id)`** *(source line 127)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_post(player_id, state)`** *(source line 140)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_board(name, callback)`** — ---------------------------------------------------------------------- Board loading with callback (and auto‑creation) ---------------------------------------------------------------------- *(source line 187)*
- **`open_board_with_data(board_data, player_id, board_name, color, postable, area_id, board_id)`** — ---------------------------------------------------------------------- Board opening (shared) ---------------------------------------------------------------------- *(source line 222)*
- **`add_display_post(src)`** *(source line 229)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_board_and_open(name, player_id, area_id, object, color, postable)`** *(source line 257)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`preload_boards()`** — ---------------------------------------------------------------------- Preload all boards at startup (create missing files) ---------------------------------------------------------------------- *(source line 266)*
- **`ezbbs.handle_player_join(player_id)`** *(source line 292)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbbs.handle_player_disconnect(player_id)`** *(source line 296)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbbs.handle_object_interaction(player_id, object_id, button)`** *(source line 301)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbbs.handle_post_selection(player_id, post_id)`** *(source line 334)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbbs.handle_textbox_response(player_id, response)`** *(source line 439)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbbs.handle_board_close(player_id)`** *(source line 468)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `last_read_time` *(line 21)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_states` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `board_cache` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `copy` *(line 32)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ids` *(line 74)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `saving` *(line 83)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_save` *(line 84)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `new_posts` *(line 121)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `post` |

### `board_data` *(line 144)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `posts` | table | `{}` |
| `next_id` | number literal | `1` |

### `post` *(line 156)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `time` | call/expression | `os.time()` |
| `author` | call/expression | `sanitize_title(player_name` |
| `[3]` | expression/reference | `AUTHOR_LIMIT)` |
| `title` | call/expression | `sanitize_title(title` |
| `[5]` | expression/reference | `TITLE_LIMIT)` |
| `id` | call/expression | `tostring(board_data.next_id)` |
| `body` | call/expression | `string.sub(state.submission_text` |
| `[8]` | number literal | `1` |
| `[9]` | expression/reference | `char_limit)` |
| `pin` | boolean literal | `false` |

### `data` *(line 205)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `posts` | table | `{}` |
| `next_id` | number literal | `1` |

### `posts` *(line 224)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ id = "POST", read = true, title = "POST" }` |

### `board_names` *(line 269)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ezbbs` *(line 290)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `color` *(line 324)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | call/expression | `tonumber(string.sub(color_string` |
| `[2]` | number literal | `4` |
| `[3]` | number literal | `5)` |
| `[4]` | number literal | `16) or 0` |
| `g` | call/expression | `tonumber(string.sub(color_string` |
| `[6]` | number literal | `6` |
| `[7]` | number literal | `7)` |
| `[8]` | number literal | `16) or 0` |
| `b` | call/expression | `tonumber(string.sub(color_string` |
| `[10]` | number literal | `8` |
| `[11]` | number literal | `9)` |
| `[12]` | number literal | `16) or 0` |

### `viewers` *(line 387)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezbbs.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
