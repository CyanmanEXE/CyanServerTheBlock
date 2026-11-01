# `main.lua`

> **Source:** `scripts/avatar_utils/main.lua`  
> **Source lines:** 158  
> **Functions detected:** 7  
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

- `scripts/avatar_utils/avatar_utils` — line 6

## Events

- `Net:on("player_avatar_change", function(event) ...)` — line 72. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 21 | `get_player_secret` | `player_id` |
| 28 | `update_player_avatar` | `player_id` |
| 83 | `get_player_avatar_paths` | `secret` |
| 90 | `refresh_player_avatar` | `player_id` |
| 104 | `register_bot_avatar` | `bot_id, sheet_texture_path, sheet_animation_path, mug_texture_path, mug_animation_path` |
| 122 | `get_bot_avatar_paths` | `bot_id` |
| 130 | `parse_bot_animation` | `bot_id, type` |

### Function notes

- **`get_player_secret(player_id)`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_player_avatar(player_id)`** — - Copies the player's current avatar and mugshot to local files and registers them as assets. - @param player_id string - @return table|nil cached entry or nil on failure *(source line 28)*
- **`get_player_avatar_paths(secret)`** — - Public API: retrieve cached player avatar paths for a given player secret. - @param secret string the player's secret (from Net.get_player_secret) - @return table|nil the cached sheet/mug paths or nil if not yet cached *(source line 83)*
- **`refresh_player_avatar(player_id)`** — - Public API: force an immediate refresh for a player ID (useful if you need the data right away). - @param player_id string - @return table|nil the updated cached entry *(source line 90)*
- **`register_bot_avatar(bot_id, sheet_texture_path, sheet_animation_path, mug_texture_path, mug_animation_path)`** — - Register or update a bot's avatar and mugshot asset paths. - These are assumed to be existing local files or server assets; no copying is performed. - @param bot_id string Unique identifier for the bot (e.g., bot name) - @param sheet_texture_path string Path to the bot's sheet texture - @param sheet_animation_path string Path to the bot's sheet animation file - @param mug_texture_path string Path to the bot's mugshot texture - @param mug_animation_path string Path to the bot's mugshot animation file - @return table the stored entry *(source line 104)*
- **`get_bot_avatar_paths(bot_id)`** — - Retrieve cached bot avatar paths. - @param bot_id string - @return table|nil the cached sheet/mug paths or nil if not registered *(source line 122)*
- **`parse_bot_animation(bot_id, type)`** — - Optionally parse a bot's animation file to get frame data. - @param bot_id string - @param type string "sheet" or "mug" to specify which animation to parse - @return table|nil parsed animation structure or nil if missing/error *(source line 130)*

## Tables and data structures

### `player_cache` *(line 12)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bot_cache` *(line 19)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `entry` *(line 56)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `sheet` | table | `{ texture = sheet_texture_path, animation = sheet_animation_path }` |
| `mug` | table | `{ texture = mug_texture_path, animation = mug_animation_path }` |

### `sheet` *(line 57)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `sheet_texture_path` |
| `animation` | expression/reference | `sheet_animation_path` |

### `mug` *(line 61)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `mug_texture_path` |
| `animation` | expression/reference | `mug_animation_path` |

### `entry` *(line 105)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `sheet` | table | `{ texture = sheet_texture_path, animation = sheet_animation_path }` |
| `mug` | table | `{ texture = mug_texture_path, animation = mug_animation_path }` |

### `sheet` *(line 106)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `sheet_texture_path` |
| `animation` | expression/reference | `sheet_animation_path` |

### `mug` *(line 110)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `mug_texture_path` |
| `animation` | expression/reference | `mug_animation_path` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/avatar_utils/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
