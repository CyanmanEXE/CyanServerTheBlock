# `custom.lua`

> **Source:** `scripts/ezlibs-custom/custom.lua`  
> **Source lines:** 54  
> **Functions detected:** 1  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Custom plugin aggregator. Keep custom gameplay modules here so ezlibs' main dispatcher can fan out event callbacks to each module without duplicate Net:on subscriptions.

## Dependencies

- `scripts/ezlibs-custom/nebulous-liberations/main` — line 6
- `scripts/ezlibs-custom/footbomb/main` — line 7

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 12 | `dispatch` | `method_name, ...` |

### Function notes

- **`dispatch(method_name, ...)`** *(source line 12)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `plugins` *(line 4)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `require("scripts/ezlibs-custom/nebulous-liberations/main")` |
| `[2]` | call/expression | `require("scripts/ezlibs-custom/footbomb/main")` |

### `custom` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `forwarded_methods` *(line 25)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"on_tick"` |
| `[2]` | string literal | `"handle_tile_interaction"` |
| `[3]` | string literal | `"handle_object_interaction"` |
| `[4]` | string literal | `"handle_actor_interaction"` |
| `[5]` | string literal | `"handle_textbox_response"` |
| `[6]` | string literal | `"handle_battle_results"` |
| `[7]` | string literal | `"handle_battle_exit"` |
| `[8]` | string literal | `"handle_player_avatar_change"` |
| `[9]` | string literal | `"handle_player_transfer"` |
| `[10]` | string literal | `"handle_player_request"` |
| `[11]` | string literal | `"handle_player_disconnect"` |
| `[12]` | string literal | `"handle_player_move"` |
| `[13]` | string literal | `"handle_player_join"` |
| `[14]` | string literal | `"handle_post_selection"` |
| `[15]` | string literal | `"handle_board_close"` |
| `[16]` | string literal | `"handle_shop_purchase"` |
| `[17]` | string literal | `"handle_shop_close"` |
| `[18]` | string literal | `"handle_custom_warp"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/custom.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
