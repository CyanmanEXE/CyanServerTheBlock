# `ezusers.lua`

> **Source:** `scripts/ezlibs-scripts/ezusers.lua`  
> **Source lines:** 346  
> **Functions detected:** 15  
> **Table declarations detected:** 10

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezusers.lua A flexible user/role/permission system for your server. Stores each player's role and a full copy of their permissions in ezmemory. Permissions are defined per role in the global `permissions` table. Per‑user permissions can be overridden without changing the role. Integrates with ezlibs via standard plugin hooks: handle_player_join, handle_player_disconnect.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 8
- `scripts/ezlibs-scripts/helpers` — line 9
- `scripts/ezlibs-scripts/ezmemory` — line 10
- `scripts/ezlibs-scripts/sha256` — line 11
- `scripts/ezlibs-scripts/ezconfig` — line 12
- `scripts/ezlibs-scripts/object_registry` — line 302
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 303

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 65 | `async` | `p` |
| 70 | `await` | `v` |
| 75 | `deep_copy` | `orig` |
| 91 | `get_safe_secret` | `player_id` |
| 100 | `get_role` | `player_id` |
| 115 | `assign_role` | `player_id, role` |
| 135 | `get_user_permissions` | `player_id` |
| 151 | `set_user_permission` | `player_id, permission_path, value` |
| 187 | `reset_user_permissions` | `player_id` |
| 201 | `has_permission` | `player_id, permission_path` |
| 232 | `check_password_and_grant_admin` | `player_id, password_attempt` |
| 245 | `add_role` | `role_name, permission_table` |
| 252 | `update_permissions` | `role_name, permission_updates` |
| 270 | `handle_player_join` | `player_id` |
| 295 | `handle_player_disconnect` | `player_id` |

### Function notes

- **`async(p)`** — ============================================================================ Internal helpers ============================================================================ *(source line 65)*
- **`await(v)`** *(source line 70)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`deep_copy(orig)`** — Deep copy a table (for copying permission structures) *(source line 75)*
- **`get_safe_secret(player_id)`** — Get player safe secret (urlencoded) for ezmemory *(source line 91)*
- **`get_role(player_id)`** — Returns the role string for a player (defaults to "user") *(source line 100)*
- **`assign_role(player_id, role)`** — Assign a role to a player. This also resets their permissions to the new role's defaults. Returns true if successful, false if player_id invalid *(source line 115)*
- **`get_user_permissions(player_id)`** — Get a player's full permission table (for inspection or direct use) *(source line 135)*
- **`set_user_permission(player_id, permission_path, value)`** — Set a specific permission for a player. permission_path can be a dot‑separated string (e.g., "BBS.CanPost") or a table of keys. value is the new permission value (usually boolean). *(source line 151)*
- **`reset_user_permissions(player_id)`** — Reset a player's permissions to their role's defaults (discarding any overrides) *(source line 187)*
- **`has_permission(player_id, permission_path)`** — Check if a player has a specific permission. permission_path can be a dot‑separated string (e.g., "BBS.CanPost") or a table of keys (e.g., {"BBS", "CanPost"}). Returns the permission value (usually boolean) or nil if not found. *(source line 201)*
- **`check_password_and_grant_admin(player_id, password_attempt)`** — Verify a password attempt; if correct, grant the player the "admin" role. Returns true if password correct and role assigned, false otherwise. *(source line 232)*
- **`add_role(role_name, permission_table)`** — (Optional) Add a new role with its permission table. Use this to extend the system dynamically. *(source line 245)*
- **`update_permissions(role_name, permission_updates)`** — (Optional) Update permissions for an existing role (merges with current). If a permission path exists, it is overwritten; otherwise added. *(source line 252)*
- **`handle_player_join(player_id)`** — Called when a player joins: ensure they have a role and permissions. *(source line 270)*
- **`handle_player_disconnect(player_id)`** — Called when a player disconnects: nothing needed *(source line 295)*

## Tables and data structures

### `permissions` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `user` | table | `{ BBS = { CanRead = true, CanPost = false, CanEdit = false, CanDelete = false, CanPin = false, }, Commands = { CanAccess = false, }, }` |
| `admin` | table | `{ BBS = { CanRead = true, CanPost = true, CanEdit = true, CanDelete = true, CanPin = true, }, Commands = { CanAccess = true, CanWarp = true,…` |

### `user` *(line 30)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `BBS` | table | `{ CanRead = true, CanPost = false, CanEdit = false, CanDelete = false, CanPin = false, }` |
| `Commands` | table | `{ CanAccess = false, }` |

### `BBS` *(line 31)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `CanRead` | boolean literal | `true` |
| `CanPost` | boolean literal | `false` |
| `CanEdit` | boolean literal | `false` |
| `CanDelete` | boolean literal | `false` |
| `CanPin` | boolean literal | `false` |

### `Commands` *(line 38)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `CanAccess` | boolean literal | `false` |

### `admin` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `BBS` | table | `{ CanRead = true, CanPost = true, CanEdit = true, CanDelete = true, CanPin = true, }` |
| `Commands` | table | `{ CanAccess = true, CanWarp = true, CanGiftItem = true, CanTakeItem = true, CanKickUser = true, }` |

### `BBS` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `CanRead` | boolean literal | `true` |
| `CanPost` | boolean literal | `true` |
| `CanEdit` | boolean literal | `true` |
| `CanDelete` | boolean literal | `true` |
| `CanPin` | boolean literal | `true` |

### `Commands` *(line 50)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `CanAccess` | boolean literal | `true` |
| `CanWarp` | boolean literal | `true` |
| `CanGiftItem` | boolean literal | `true` |
| `CanTakeItem` | boolean literal | `true` |
| `CanKickUser` | boolean literal | `true` |

### `copy` *(line 79)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `path` *(line 163)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `path` *(line 208)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezusers.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
