# `save-game.lua`

> **Source:** `scripts/persistence/save-game.lua`  
> **Source lines:** 250  
> **Functions detected:** 14  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

game_save.lua Extension of persistence.lua that provides a staging area for changes. Allows you to make multiple edits, then either commit them (save) or discard them (revert) back to the last saved state. This version supports per‑player save files using the player's secret: scripts/save-files/<player_secret>/save<index>.json where <index> is from 1 to MAX_SAVE_INSTANCES (configurable below). The factory function accepts a player_id (string) and an index. The secret is sanitized to be filesystem‑safe across platforms.

## Dependencies

- `scripts/persistence/persistence` — line 12
- `scripts/utils/utility` — line 13

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 26 | `sanitize_filename_component` | `str` |
| 40 | `escape_path_for_shell` | `path` |
| 53 | `ensure_directory_exists` | `filePath` |
| 89 | `ensure_save_file_exists` | `filePath` |
| 108 | `deep_copy` | `orig` |
| 118 | `new` | `filePath` |
| 131 | `self:load` | `(none)` |
| 145 | `self:edit` | `func` |
| 155 | `self:save` | `(none)` |
| 178 | `self:revert` | `(none)` |
| 187 | `self:getData` | `(none)` |
| 199 | `self:isModified` | `(none)` |
| 205 | `self:getWorkingTable` | `(none)` |
| 219 | `get_game_save` | `player_id, index` |

### Function notes

- **`sanitize_filename_component(str)`** — Characters that are invalid in filenames on common platforms: Windows: \ / : * ? " < > | Unix: / and null We'll replace any problematic characters with an underscore. *(source line 26)*
- **`escape_path_for_shell(path)`** — Safe path quoting for os.execute (escape double quotes) *(source line 40)*
- **`ensure_directory_exists(filePath)`** — Ensures that the directory portion of a file path exists. Uses Garry's Mod's file.CreateDir if available (recommended), otherwise falls back to os.execute with proper escaping. *(source line 53)*
- **`ensure_save_file_exists(filePath)`** — Ensure that the file at the given path exists and contains an empty JSON object. If the file does not exist, it is created with the content "{}". *(source line 89)*
- **`deep_copy(orig)`** — Deep copy a table (simple recursive copy, assumes no cycles) *(source line 108)*
- **`new(filePath)`** — Creates a new game_save instance for the given file path *(source line 118)*
- **`self:load()`** — Load data from disk and initialise both saved and working copies *(source line 131)*
- **`self:edit(func)`** — Apply a modification to the working copy. func receives the working data table and should modify it in place. *(source line 145)*
- **`self:save()`** — Commit the working copy to disk. Returns a promise that resolves when the write completes. *(source line 155)*
- **`self:revert()`** — Discard all changes made since the last save. Resets working_data to a copy of the last saved state. *(source line 178)*
- **`self:getData()`** — Return a shallow copy of the current working data (for reading only). *(source line 187)*
- **`self:isModified()`** — Check whether there are unsaved modifications. *(source line 199)*
- **`self:getWorkingTable()`** — (Optional) Direct access to the working table – use with caution. Modifying the returned table will mark it dirty automatically. *(source line 205)*
- **`get_game_save(player_id, index)`** — Factory: returns the singleton game_save instance for a given player and save slot. player_id : string – the player's ID index     : number – save slot index (1 .. MAX_SAVE_INSTANCES) The corresponding file is automatically created if it does not exist. *(source line 219)*

## Tables and data structures

### `instances` *(line 19)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `copy` *(line 110)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self` *(line 120)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `filePath` | expression/reference | `filePath` |
| `persistence` | expression/reference | `p` |
| `saved_data` | nil | `nil` |
| `working_data` | nil | `nil` |
| `loaded` | boolean literal | `false` |
| `dirty` | boolean literal | `false` |

### `copy` *(line 191)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/persistence/save-game.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
