# `loot.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/loot.lua`  
> **Source lines:** 361  
> **Functions detected:** 16  
> **Table declarations detected:** 20

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Loot reward messages are part of the reward sequence. Awaiting the message promise keeps the revealed item visible until the player dismisses its textbox before the loot sequence continues.

## Dependencies

- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy` — line 1

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `show_reward_message` | `player, message, on_acknowledged` |
| 23 | `activate` | `instance, player_session` |
| 32 | `activate` | `instance, player_session` |
| 39 | `activate` | `instance, player_session` |
| 48 | `activate` | `instance, player_session` |
| 55 | `activate` | `instance, player_session` |
| 67 | `activate` | `instance, player_session` |
| 78 | `activate` | `instance, player_session` |
| 94 | `activate` | `instance, player_session` |
| 104 | `unlock_gates` | `(none)` |
| 181 | `spawn_item_bot` | `bot_data, property_animation` |
| 204 | `cleanup` | `(none)` |
| 212 | `Loot.spawn_item_bot` | `item, area_id, x, y, z` |
| 241 | `Loot.spawn_randomized_item_bot` | `loot_pool, item_index, area_id, x, y, z` |
| 291 | `Loot.loot_item_panel` | `instance, player_session, panel, destroy_items` |
| 333 | `Loot.loot_bonus_panel` | `instance, player_session, panel` |

### Function notes

- **`show_reward_message(player, message, on_acknowledged)`** — Loot reward messages are part of the reward sequence. Awaiting the message promise keeps the revealed item visible until the player dismisses its textbox before the loot sequence continues. *(source line 6)*
- **`activate(instance, player_session)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate(instance, player_session)`** *(source line 32)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate(instance, player_session)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate(instance, player_session)`** *(source line 48)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate(instance, player_session)`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate(instance, player_session)`** *(source line 67)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate(instance, player_session)`** *(source line 78)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate(instance, player_session)`** *(source line 94)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`unlock_gates()`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`spawn_item_bot(bot_data, property_animation)`** *(source line 181)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cleanup()`** *(source line 204)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Loot.spawn_item_bot(item, area_id, x, y, z)`** *(source line 212)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Loot.spawn_randomized_item_bot(loot_pool, item_index, area_id, x, y, z)`** *(source line 241)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Loot.loot_item_panel(instance, player_session, panel, destroy_items)`** *(source line 291)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Loot.loot_bonus_panel(instance, player_session, panel)`** *(source line 333)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Loot` *(line 18)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `HEART` | table | `{ animation = "HEART", breakable = true, activate = function(instance, player_session) return show_reward_message(player_session.player, "I …` |
| `CHIP` | table | `{ animation = "CHIP", breakable = true, activate = function(instance, player_session) return show_reward_message(player_session.player, "I f…` |
| `MONEY` | table | `{ animation = "MONEY", breakable = true, activate = function(instance, player_session) return show_reward_message(player_session.player, "I …` |
| `BUGFRAG` | table | `{ animation = "BUGFRAG", breakable = true, activate = function(instance, player_session) return show_reward_message(player_session.player, "…` |
| `ORDER_POINT` | table | `{ animation = "ORDER_POINT", breakable = false, activate = function(instance, player_session) return show_reward_message(player_session.play…` |
| `INVINCIBILITY` | table | `{ animation = "INVINCIBILITY", breakable = false, activate = function(instance, player_session) return show_reward_message(player_session.pl…` |
| `MAJOR_HIT` | table | `{ animation = "MAJOR_HIT", breakable = false, activate = function(instance, player_session) local co = coroutine.create(function() Async.awa…` |
| `KEY` | table | `{ animation = "KEY", breakable = false, activate = function(instance, player_session) local co = coroutine.create(function() Async.await(pla…` |

### `HEART` *(line 20)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | string literal | `"HEART"` |
| `breakable` | boolean literal | `true` |
| `activate` | function | `function(instance` |
| `[4]` | call/expression | `player_session) return show_reward_message(player_session.player` |
| `[5]` | string literal | `"I found\na heart!"` |
| `[6]` | function | `function() return player_session:heal(player_session.max_health / 2) end) end` |

### `CHIP` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | string literal | `"CHIP"` |
| `breakable` | boolean literal | `true` |
| `activate` | function | `function(instance` |
| `[4]` | call/expression | `player_session) return show_reward_message(player_session.player` |
| `[5]` | string literal | `"I found a\nBattleChip!") end` |

### `MONEY` *(line 36)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | string literal | `"MONEY"` |
| `breakable` | boolean literal | `true` |
| `activate` | function | `function(instance` |
| `[4]` | call/expression | `player_session) return show_reward_message(player_session.player` |
| `[5]` | string literal | `"I found some\nMonies!"` |
| `[6]` | function | `function() player_session.get_monies = true end) end` |

### `BUGFRAG` *(line 45)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | string literal | `"BUGFRAG"` |
| `breakable` | boolean literal | `true` |
| `activate` | function | `function(instance` |
| `[4]` | call/expression | `player_session) return show_reward_message(player_session.player` |
| `[5]` | string literal | `"I found a\nBugFrag!") end` |

### `ORDER_POINT` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | string literal | `"ORDER_POINT"` |
| `breakable` | boolean literal | `false` |
| `activate` | function | `function(instance` |
| `[4]` | call/expression | `player_session) return show_reward_message(player_session.player` |
| `[5]` | string literal | `"I found\nOrder Points!"` |
| `[6]` | function | `function() local previous_points = instance.order_points instance:set_order_points(instance.order_points + 3) local recovered_points = insta…` |

### `INVINCIBILITY` *(line 64)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | string literal | `"INVINCIBILITY"` |
| `breakable` | boolean literal | `false` |
| `activate` | function | `function(instance` |
| `[4]` | call/expression | `player_session) return show_reward_message(player_session.player` |
| `[5]` | string literal | `"Team becomes invincible for\n 1 phase!!"` |
| `[6]` | function | `function() for _` |
| `[7]` | call/expression | `other_session in pairs(instance.player_sessions) do other_session.invincible = true end end) end` |

### `MAJOR_HIT` *(line 75)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | string literal | `"MAJOR_HIT"` |
| `breakable` | boolean literal | `false` |
| `activate` | function | `function(instance` |
| `[4]` | call/expression | `player_session) local co = coroutine.create(function() Async.await(player_session.player:message_with_mug("Damages the closest Guardian the …` |
| `[5]` | call/expression | `enemy)) end) return Async.promisify(co) end` |

### `KEY` *(line 91)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `animation` | string literal | `"KEY"` |
| `breakable` | boolean literal | `false` |
| `activate` | function | `function(instance` |
| `[4]` | call/expression | `player_session) local co = coroutine.create(function() Async.await(player_session.player:message_with_mug("I found a Key!")) local gates = p…` |
| `[5]` | expression/reference | `#gates` |
| `[6]` | number literal | `1 do instance:remove_panel(gates[i]) end end if #points &gt; 0 then local player_id = player_session.player.id local was_input_locked = Net.is_…` |
| `[7]` | expression/reference | `#points` |
| `[8]` | number literal | `1 do local point = points[j] Net.slide_player_camera(player_session.player.id` |
| `[9]` | expression/reference | `point.x` |
| `[10]` | expression/reference | `point.y` |
| `[11]` | expression/reference | `point.z` |
| `[12]` | call/expression | `slide_time) Net.move_player_camera(player_session.player.id` |
| `[13]` | expression/reference | `point.x` |
| `[14]` | expression/reference | `point.y` |
| `[15]` | expression/reference | `point.z` |
| `[16]` | call/expression | `hold_time) total_camera_time = total_camera_time + slide_time + hold_time if point == points[1] then Net.move_player_camera(player_session.p…` |
| `[17]` | expression/reference | `point.x` |
| `[18]` | expression/reference | `point.y` |
| `[19]` | expression/reference | `point.z` |
| `[20]` | call/expression | `hold_time) total_camera_time = total_camera_time + hold_time unlock_gates() end end total_camera_time = total_camera_time + slide_time Net.s…` |
| `[21]` | expression/reference | `player_session.player.x` |
| `[22]` | expression/reference | `player_session.player.y` |
| `[23]` | expression/reference | `player_session.player.z` |
| `[24]` | call/expression | `slide_time) Async.await(Async.sleep(total_camera_time)) if not was_input_locked then Net.unlock_player_input(player_id) end else unlock_gate…` |

### `Loot.DEFAULT_POOL` *(line 145)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `Loot.HEART` |
| `[2]` | expression/reference | `Loot.MONEY` |
| `[3]` | expression/reference | `Loot.ORDER_POINT` |

### `Loot.BONUS_POOL` *(line 151)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `Loot.HEART` |
| `[2]` | expression/reference | `Loot.ORDER_POINT` |
| `[3]` | expression/reference | `Loot.INVINCIBILITY` |
| `[4]` | expression/reference | `Loot.MAJOR_HIT` |
| `[5]` | expression/reference | `Loot.MONEY` |

### `Loot.TEST_POOL` *(line 159)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `Loot.HEART` |
| `[2]` | expression/reference | `Loot.CHIP` |
| `[3]` | expression/reference | `Loot.MONEY` |
| `[4]` | expression/reference | `Loot.BUGFRAG` |
| `[5]` | expression/reference | `Loot.ORDER_POINT` |

### `Loot.FULL_POOL` *(line 167)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `Loot.HEART` |
| `[2]` | expression/reference | `Loot.CHIP` |
| `[3]` | expression/reference | `Loot.MONEY` |
| `[4]` | expression/reference | `Loot.BUGFRAG` |
| `[5]` | expression/reference | `Loot.ORDER_POINT` |
| `[6]` | expression/reference | `Loot.INVINCIBILITY` |
| `[7]` | expression/reference | `Loot.KEY` |
| `[8]` | expression/reference | `Loot.MAJOR_HIT` |

### `bot_data` *(line 213)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `texture_path` | string literal | `"/server/assets/NebuLibsAssets/bots/item.png"` |
| `animation_path` | string literal | `"/server/assets/NebuLibsAssets/bots/item.animation"` |
| `animation` | expression/reference | `item.animation` |
| `warp_in` | boolean literal | `false` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |

### `property_animation` *(line 223)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "Z", ease = "Linear", value = z + 1 } }, duration = RISE_DURATION }` |

### `properties` *(line 226)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "Z", ease = "Linear", value = z + 1 }` |

### `bot_data` *(line 247)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `texture_path` | string literal | `"/server/assets/NebuLibsAssets/bots/item.png"` |
| `animation_path` | string literal | `"/server/assets/NebuLibsAssets/bots/item.animation"` |
| `animation` | expression/reference | `loot_pool[start_index].animation` |
| `warp_in` | boolean literal | `false` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |

### `property_animation` *(line 258)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `key_frame` *(line 265)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `properties` | table | `{ { property = "Animation", value = loot_pool[current_item_index].animation } }` |
| `duration` | expression/reference | `frame_duration` |

### `properties` *(line 267)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "Animation", value = loot_pool[current_item_index].animation }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/loot.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
