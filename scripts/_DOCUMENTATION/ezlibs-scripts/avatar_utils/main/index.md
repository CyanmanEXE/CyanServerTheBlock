# `main.lua`

> **Source:** `scripts/ezlibs-scripts/avatar_utils/main.lua`  
> **Source lines:** 204  
> **Functions detected:** 9  
> **Table declarations detected:** 8

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

NaviSpot.lua Module to cache player and bot avatar/mugshot assets. For players: copies assets from engine to local files on avatar change. For bots: registers existing local asset paths (no copying).

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 6
- `scripts/ezlibs-scripts/avatar_utils/avatar_utils` — line 7

## Events

- `Net:on("player_avatar_change", function(event) ...)` — line 87. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 22 | `get_player_secret` | `player_id` |
| 29 | `resolve_secret` | `input` |
| 43 | `update_player_avatar` | `player_id` |
| 99 | `get_player_avatar_paths` | `input` |
| 111 | `refresh_player_avatar` | `player_id` |
| 120 | `parse_player_animation` | `input, type` |
| 149 | `register_bot_avatar` | `bot_id, sheet_texture_path, sheet_animation_path, mug_texture_path, mug_animation_path` |
| 167 | `get_bot_avatar_paths` | `bot_id` |
| 175 | `parse_bot_animation` | `bot_id, type` |

### Function notes

- **`get_player_secret(player_id)`** *(source line 22)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_secret(input)`** — - Internal helper: resolve input to a player secret. - @param input string|number player ID or existing secret - @return string|nil secret or nil if cannot resolve *(source line 29)*
- **`update_player_avatar(player_id)`** — - Copies the player's current avatar and mugshot to local files and registers them as assets. - @param player_id string - @return table|nil cached entry or nil on failure *(source line 43)*
- **`get_player_avatar_paths(input)`** — - Public API: retrieve cached player avatar paths. - Accepts either a player ID or a player secret. - @param input string|number player ID or secret - @return table|nil the cached sheet/mug paths or nil if not yet cached *(source line 99)*
- **`refresh_player_avatar(player_id)`** — - Public API: force an immediate refresh for a player ID (useful if you need the data right away). - @param player_id string - @return table|nil the updated cached entry *(source line 111)*
- **`parse_player_animation(input, type)`** — - Public API: parse a player's animation file to get frame data. - Accepts either a player ID or a player secret. - @param input string|number player ID or secret - @param type string "sheet" or "mug" - @return table|nil parsed animation structure or nil if missing/error *(source line 120)*
- **`register_bot_avatar(bot_id, sheet_texture_path, sheet_animation_path, mug_texture_path, mug_animation_path)`** — - Register or update a bot's avatar and mugshot asset paths. - These are assumed to be existing local files or server assets; no copying is performed. - @param bot_id string Unique identifier for the bot (e.g., bot name) - @param sheet_texture_path string Path to the bot's sheet texture - @param sheet_animation_path string Path to the bot's sheet animation file - @param mug_texture_path string Path to the bot's mugshot texture - @param mug_animation_path string Path to the bot's mugshot animation file - @return table the stored entry *(source line 149)*
- **`get_bot_avatar_paths(bot_id)`** — - Retrieve cached bot avatar paths. - @param bot_id string - @return table|nil the cached sheet/mug paths or nil if not registered *(source line 167)*
- **`parse_bot_animation(bot_id, type)`** — - Optionally parse a bot's animation file to get frame data. - @param bot_id string - @param type string "sheet" or "mug" to specify which animation to parse - @return table|nil parsed animation structure or nil if missing/error *(source line 175)*

## Tables and data structures

### `player_cache` *(line 13)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bot_cache` *(line 20)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `entry` *(line 71)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `sheet` | table | `{ texture = sheet_texture_path, animation = sheet_animation_path }` |
| `mug` | table | `{ texture = mug_texture_path, animation = mug_animation_path }` |

### `sheet` *(line 72)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `sheet_texture_path` |
| `animation` | expression/reference | `sheet_animation_path` |

### `mug` *(line 76)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `mug_texture_path` |
| `animation` | expression/reference | `mug_animation_path` |

### `entry` *(line 150)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `sheet` | table | `{ texture = sheet_texture_path, animation = sheet_animation_path }` |
| `mug` | table | `{ texture = mug_texture_path, animation = mug_animation_path }` |

### `sheet` *(line 151)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `sheet_texture_path` |
| `animation` | expression/reference | `sheet_animation_path` |

### `mug` *(line 155)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `mug_texture_path` |
| `animation` | expression/reference | `mug_animation_path` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/avatar_utils/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
