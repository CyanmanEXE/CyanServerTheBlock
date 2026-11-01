# `ezemail.lua`

> **Source:** `scripts/ezlibs-scripts/ezemail.lua`  
> **Source lines:** 346  
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

tweak these

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/helpers` — line 2
- `scripts/ezlibs-scripts/ezmemory` — line 3
- `scripts/ezlibs-scripts/ezbus` — line 4
- `scripts/ezlibs-scripts/ezconfig` — line 5
- `scripts/ezlibs-scripts/ezannounce/ezannounce` — line 327

## Events

- `Net:on("player_join", function(event) ...)` — line 317. The event name is taken directly from this source.
- `Net:on("email_read", function(event) ...)` — line 336. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 16 | `_preload_email_assets` | `player_id, mail` |
| 30 | `_get_bucket` | `player_id` |
| 38 | `_dbg` | `...` |
| 44 | `_dbg_player` | `player_id, ...` |
| 50 | `_percent_decode` | `s` |
| 57 | `_get_tombstone_set` | `(none)` |
| 89 | `_find_mail_in_bucket` | `bucket, email_id` |
| 114 | `_mark_email_read` | `player_id, email_id` |
| 134 | `_notify_new_mail` | `player_id, msg, delay_seconds` |
| 148 | `send_msg` | `(none)` |
| 163 | `ezemail.resend_all` | `player_id` |
| 225 | `ezemail.send_once` | `player_id, mail, opts` |
| 271 | `ezemail.send_temp` | `player_id, mail, opts` |
| 293 | `ezemail.send_test_email` | `player_id, delay_seconds` |

### Function notes

- **`_preload_email_assets(player_id, mail)`** *(source line 16)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_get_bucket(player_id)`** *(source line 30)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_dbg(...)`** *(source line 38)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_dbg_player(player_id, ...)`** *(source line 44)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_percent_decode(s)`** *(source line 50)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_get_tombstone_set()`** *(source line 57)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_find_mail_in_bucket(bucket, email_id)`** *(source line 89)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_mark_email_read(player_id, email_id)`** *(source line 114)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_notify_new_mail(player_id, msg, delay_seconds)`** *(source line 134)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`send_msg()`** *(source line 148)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezemail.resend_all(player_id)`** *(source line 163)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezemail.send_once(player_id, mail, opts)`** — Sends + saves (only notifies the FIRST time this mail id is ever sent to this player) opts = { notify=true/false, notify_message="...", notify_use_player_mug=true/false } *(source line 225)*
- **`ezemail.send_temp(player_id, mail, opts)`** — Sends an email WITHOUT saving it (session-only). Still supports notify timing (ring -> wait -> message). *(source line 271)*
- **`ezemail.send_test_email(player_id, delay_seconds)`** *(source line 293)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezemail` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `set` *(line 67)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `to_delete` *(line 182)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `mail` *(line 299)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | string literal | `"EZTEST_" .. tostring(safe_secret) .. "_" .. tostring(os.time())` |
| `icon` | number literal | `1` |
| `title` | string literal | `"Test"` |
| `from` | string literal | `"MailSys"` |
| `body` | string literal | `"Testing email notification delay.\n\nDelay: " .. tostring(delay_seconds or TEST_EMAIL_DELAY) .. " seconds."` |
| `mug_texture_path` | string literal | `"/server/assets/ezlibs-assets/eznpcs/mug/denpa-warp-sf2.png"` |
| `mug_animation_path` | string literal | `"/server/assets/ezlibs-assets/eznpcs/mug/mug.animation"` |
| `read` | boolean literal | `false` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezemail.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
