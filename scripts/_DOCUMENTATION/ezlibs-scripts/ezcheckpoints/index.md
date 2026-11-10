# `ezcheckpoints.lua`

> **Source:** `scripts/ezlibs-scripts/ezcheckpoints.lua`  
> **Source lines:** 528  
> **Functions detected:** 12  
> **Table declarations detected:** 11

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Optional schema-driven validation. If the generated schema file is not present yet (user hasn't run generate-ezlibs-tiled.lua), validation is skipped silently so the module continues to load.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/ezmemory` — line 2
- `scripts/ezlibs-scripts/helpers` — line 3
- `scripts/ezlibs-scripts/condition` — line 4
- `scripts/ezlibs-scripts/ezbus` — line 5
- `scripts/ezlibs-scripts/utils/eztiledutils` — line 6

## Events

- `Net:on("player_avatar_change", function(event) ...)` — line 56. The event name is taken directly from this source.
- `Net:on("player_avatar_change", function(event) ...)` — line 62. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 78. The event name is taken directly from this source.
- `Net:on("player_avatar_change", function(event) ...)` — line 133. The event name is taken directly from this source.
- `Net:on("object_interaction", function(event) ...)` — line 328. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 33 | `is_player_alive` | `player_id` |
| 44 | `safe_net` | `fn, ...` |
| 85 | `ezcheckpoints.handle_player_disconnect` | `player_id` |
| 93 | `ezcheckpoints.get_player_navi_info` | `player_id` |
| 101 | `names_equal` | `a, b` |
| 106 | `ezcheckpoints.player_has_navi` | `player_id, name` |
| 111 | `ezcheckpoints.player_has_navi_element` | `player_id, element` |
| 116 | `ezcheckpoints.player_has_any_navi` | `player_id, names` |
| 125 | `evaluate_navi_check` | `player_id, navi_check` |
| 179 | `ezcheckpoints.unlock_checkpoint_for_player` | `player_id, area_id, object_id, unlocking_asset_name, unlocking_sound_path, unlocking_animation_time, once, opts` |
| 263 | `ezcheckpoints.force_unlock_checkpoint` | `player_id, area_id, object_id, once, opts` |
| 285 | `ezcheckpoints.relock_checkpoint` | `player_id, area_id, object_id` |

### Function notes

- **`is_player_alive(player_id)`** — Returns true if the player is still connected. Conservative: if the check itself fails or Net.is_player is missing, we assume the player is alive rather than silently skipping the action. *(source line 33)*
- **`safe_net(fn, ...)`** — Run a Net function under pcall; return true on success. Logs failures at info level so they're visible without crashing the server or being spammy as a warning. *(source line 44)*
- **`ezcheckpoints.handle_player_disconnect(player_id)`** *(source line 85)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcheckpoints.get_player_navi_info(player_id)`** — Public accessor. Override at startup if your game derives navi data from a different source than the avatar_change event. *(source line 93)*
- **`names_equal(a, b)`** — ========================================================================== Navi check helpers ========================================================================== *(source line 101)*
- **`ezcheckpoints.player_has_navi(player_id, name)`** *(source line 106)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcheckpoints.player_has_navi_element(player_id, element)`** *(source line 111)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcheckpoints.player_has_any_navi(player_id, names)`** *(source line 116)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`evaluate_navi_check(player_id, navi_check)`** *(source line 125)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezcheckpoints.unlock_checkpoint_for_player(player_id, area_id, object_id, unlocking_asset_name, unlocking_sound_path, unlocking_animation_time, once, opts)`** — Helper that unlocks the checkpoint for a player.  Persistent state (the hide) is ALWAYS applied, even when the player is no longer connected: that is what their reconnect state is driven from, and silently skipping it would leave a checkpoint unlocked across reconnects because a button fired just as they dropped.  Live effects (input lock, sound, animation bot, input unlock) run only when the player is confirmed connected, and every Net call is pcall-guarded so a mid-await disconnect cannot crash the coroutine.  `opts` (optional) may contain: * lock_input (boolean, default true) — when false, the player's input is neither locked nor unlocked around the unlocking animation. Use this when a bot / group effect / script is the initiator and the player is only a viewer: sound and the world animation bot still play so the player sees the checkpoint change, but their movement / battle is not interrupted for an action they did not take. *(source line 179)*
- **`ezcheckpoints.force_unlock_checkpoint(player_id, area_id, object_id, once, opts)`** — Public shortcut to force-unlock a checkpoint using its own properties.  `opts` is forwarded verbatim to unlock_checkpoint_for_player. Bot-driven callers should pass { lock_input = false }. *(source line 263)*
- **`ezcheckpoints.relock_checkpoint(player_id, area_id, object_id)`** — Re-lock a checkpoint for a player.  Persistent unhide always runs (that is how the player's reconnect state is cleared). The live object include runs only when the player is confirmed connected and still in the checkpoint's area. All memory/Net access is guarded so callers wrapping this in pcall isn't required for safety.  Note: relock does not lock player input in either path, so no opt-out flag is needed here. *(source line 285)*

## Tables and data structures

### `ezcheckpoints` *(line 18)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `navi_cache` *(line 60)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `new_bot_props` *(line 219)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `object.x` |
| `y` | expression/reference | `object.y` |
| `z` | expression/reference | `object.z` |
| `texture_path` | string literal | `"/server/assets/ezlibs-assets/ezcheckpoints/bots/" .. unlocking_asset_name .. ".png"` |
| `animation_path` | string literal | `"/server/assets/ezlibs-assets/ezcheckpoints/bots/" .. unlocking_asset_name .. ".animation"` |
| `animation` | string literal | `"UNLOCKING"` |
| `warp_in` | boolean literal | `false` |
| `area_id` | expression/reference | `area_id` |

### `cond` *(line 401)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"money"` |
| `amount` | expression/reference | `required_keys` |
| `consume` | expression/reference | `consume` |

### `cond` *(line 405)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"fragments"` |
| `amount` | expression/reference | `required_keys` |
| `consume` | expression/reference | `consume` |

### `cond` *(line 409)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"tokens"` |
| `amount` | expression/reference | `required_keys` |
| `consume` | expression/reference | `consume` |

### `cond` *(line 419)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"item"` |
| `name` | expression/reference | `key_item_name` |
| `amount` | expression/reference | `required_keys` |
| `consume` | expression/reference | `consume` |

### `navi_check` *(line 436)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `kind` | string literal | `"navi_name"` |
| `required` | expression/reference | `required_navi` |

### `navi_check` *(line 447)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `kind` | string literal | `"navi_element"` |
| `required` | expression/reference | `required_elem` |

### `navi_list` *(line 451)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `navi_check` *(line 464)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `kind` | string literal | `"navi_list"` |
| `names` | expression/reference | `navi_list` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezcheckpoints.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
