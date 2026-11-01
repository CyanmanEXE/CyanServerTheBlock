# `main.lua`

> **Source:** `scripts/ezlibs-scripts/main.lua`  
> **Source lines:** 255  
> **Functions detected:** 0  
> **Table declarations detected:** 4

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
- `scripts/ezlibs-scripts/helpers` — line 4
- `scripts/ezlibs-scripts/ezbus` — line 5
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 6
- `scripts/ezlibs-scripts/ezcache` — line 7
- `scripts/ezlibs-scripts/ezencounters/main` — line 8
- `scripts/ezlibs-scripts/ezbattle_results` — line 9
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 10
- `scripts/ezlibs-scripts/ezmemory` — line 11
- `scripts/ezlibs-scripts/ezmystery` — line 12
- `scripts/ezlibs-scripts/ezweather` — line 13
- `scripts/ezlibs-scripts/ezwarps/main` — line 14
- `scripts/ezlibs-scripts/ezfarms` — line 15
- `scripts/events/eznpcs_onceitem` — line 16
- `scripts/ezlibs-scripts/ezcheckpoints` — line 17
- `scripts/ezlibs-scripts/ezannounce/ezannounce` — line 18
- `scripts/ezlibs-scripts/ezemail` — line 19
- `scripts/ezlibs-scripts/ezexplosions` — line 20
- `scripts/ezlibs-scripts/ezrushroads` — line 21
- `scripts/ezlibs-scripts/ezpress` — line 22
- `scripts/ezlibs-scripts/ezusers` — line 23
- `scripts/ezlibs-scripts/ezbbs` — line 24
- `scripts/ezlibs-scripts/ezbuttons` — line 25
- `scripts/ezlibs-scripts/eznpcs/ezpushback` — line 26
- `scripts/ezlibs-scripts/eznpcs/npc_behaviors` — line 27
- `scripts/ezlibs-scripts/eztriggers/ezbottriggers` — line 28
- `scripts/ezlibs-scripts/ezcutscenes/ezcutscenes` — line 29
- `scripts/ezlibs-scripts/object_registry` — line 68

## Events

- `Net:on("battle_results", function(event) ...)` — line 75. The event name is taken directly from this source.
- `Net:on("battle_exit", function(event) ...)` — line 98. The event name is taken directly from this source.
- `Net:on("shop_purchase", function(event) ...)` — line 113. The event name is taken directly from this source.
- `Net:on("shop_close", function(event) ...)` — line 121. The event name is taken directly from this source.
- `Net:on("custom_warp", function(event) ...)` — line 129. The event name is taken directly from this source.
- `Net:on("player_move", function(event) ...)` — line 137. The event name is taken directly from this source.
- `Net:on("player_request", function(event) ...)` — line 145. The event name is taken directly from this source.
- `Net:on("tile_interaction", function(event) ...)` — line 154. The event name is taken directly from this source.
- `Net:on("post_selection", function(event) ...)` — line 162. The event name is taken directly from this source.
- `Net:on("board_close", function(event) ...)` — line 170. The event name is taken directly from this source.
- `Net:on("player_avatar_change", function(event) ...)` — line 178. The event name is taken directly from this source.
- `Net:on("player_join", function(event) ...)` — line 194. The event name is taken directly from this source.
- `Net:on("actor_interaction", function(event) ...)` — line 206. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 214. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 222. The event name is taken directly from this source.
- `Net:on("object_interaction", function(event) ...)` — line 231. The event name is taken directly from this source.
- `Net:on("player_area_transfer", function(event) ...)` — line 239. The event name is taken directly from this source.
- `Net:on("textbox_response", function(event) ...)` — line 247. The event name is taken directly from this source.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `plugins` *(line 30)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `ezweather` |
| `[2]` | expression/reference | `eznpcs` |
| `[3]` | expression/reference | `ezmemory` |
| `[4]` | expression/reference | `ezmystery` |
| `[5]` | expression/reference | `ezwarps` |
| `[6]` | expression/reference | `ezencounters` |
| `[7]` | expression/reference | `eztriggers` |
| `[8]` | expression/reference | `ezemail` |
| `[9]` | expression/reference | `ezannouncement` |
| `[10]` | expression/reference | `ezcheckpoints` |
| `[11]` | expression/reference | `ezrushroads` |
| `[12]` | expression/reference | `ezpress` |
| `[13]` | expression/reference | `ezusers` |
| `[14]` | expression/reference | `ezbbs` |
| `[15]` | expression/reference | `ezbuttons` |
| `[16]` | expression/reference | `ezpushback` |
| `[17]` | expression/reference | `ezbottriggers` |
| `[18]` | expression/reference | `ezcutscenes` |

### `sfx` *(line 51)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `hurt` | string literal | `'/server/assets/ezlibs-assets/sfx/hurt.ogg'` |
| `item_get` | string literal | `'/server/assets/ezlibs-assets/sfx/item_get.ogg'` |
| `recover` | string literal | `'/server/assets/ezlibs-assets/sfx/recover.ogg'` |
| `card_error` | string literal | `'/server/assets/ezlibs-assets/ezfarms/card_error.ogg'` |
| `compressSfx` | string literal | `"/server/assets/ezlibs-assets/sfx/compress.ogg"` |

### `stats` *(line 80)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `reason` | expression/reference | `event.reason` |
| `health` | expression/reference | `event.health` |
| `time` | expression/reference | `event.time` |
| `ran` | expression/reference | `event.ran` |
| `emotion` | expression/reference | `event.emotion` |
| `turns` | expression/reference | `event.turns` |
| `enemies` | expression/reference | `event.enemies` |
| `score` | expression/reference | `event.score` |

### `details` *(line 179)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | expression/reference | `event.texture_path` |
| `animation_path` | expression/reference | `event.animation_path` |
| `name` | expression/reference | `event.name` |
| `element` | expression/reference | `event.element` |
| `max_health` | expression/reference | `event.max_health` |
| `prevent_default` | expression/reference | `event.prevent_default` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
