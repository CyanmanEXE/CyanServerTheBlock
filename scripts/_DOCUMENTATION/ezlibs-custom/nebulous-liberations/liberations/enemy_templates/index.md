# `enemy_templates.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_templates.lua`  
> **Source lines:** 279  
> **Functions detected:** 9  
> **Table declarations detected:** 13

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

enemy_templates.lua Enemy behaviour, health, and assets live here. Encounters do NOT live here: they are always resolved from the area's Liberation Encounters custom property via PanelEncounters.resolve_encounter(base_area_id), which routes through ezencounters. Do not add a per-template encounter path — it will be ignored by instance.lua.

## Dependencies

- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_selection` — line 8
- `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers` — line 9
- `scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception` — line 10
- `scripts/ezlibs-custom/nebulous-liberations/liberations/preloader` — line 11
- `scripts/ezlibs-custom/nebulous-liberations/liberations/constants` — line 12
- `scripts/libs/direction` — line 13

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 18 | `EnemyTemplates.register` | `name, template` |
| 23 | `EnemyTemplates.create` | `instance, position, direction, template_name, spawn_options` |
| 77 | `spawn` | `self, direction` |
| 101 | `get_death_message` | `self` |
| 104 | `take_turn` | `self` |
| 115 | `sign` | `a` |
| 125 | `EnemyTemplates.ai.simple_charge` | `self` |
| 136 | `attempt_axis` | `xstep, ystep, diff` |
| 214 | `EnemyTemplates.ai.ranged` | `self` |

### Function notes

- **`EnemyTemplates.register(name, template)`** — Register a template *(source line 18)*
- **`EnemyTemplates.create(instance, position, direction, template_name, spawn_options)`** — Create an enemy instance from a template *(source line 23)*
- **`spawn(self, direction)`** *(source line 77)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_death_message(self)`** *(source line 101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`take_turn(self)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sign(a)`** *(source line 115)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyTemplates.ai.simple_charge(self)`** *(source line 125)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`attempt_axis(xstep, ystep, diff)`** *(source line 136)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`EnemyTemplates.ai.ranged(self)`** *(source line 214)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `EnemyTemplates` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enemy` *(line 28)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `id` | nil | `nil` |
| `battle_name` | expression/reference | `template.battle_name` |
| `health` | expression/reference | `template.health` |
| `max_health` | expression/reference | `template.max_health` |
| `x` | call/expression | `math.floor(position.x)` |
| `y` | call/expression | `math.floor(position.y)` |
| `z` | call/expression | `math.floor(position.z)` |
| `selection` | call/expression | `EnemySelection:new(instance)` |
| `mug` | expression/reference | `template.mug` |
| `is_boss` | call/expression | `(spawn_options and spawn_options.is_boss == true) or template.is_boss or false` |
| `is_special_encounter` | expression/reference | `template.is_special_encounter or false` |
| `ai_type` | expression/reference | `template.ai_type or "simple_charge"` |
| `ai_params` | expression/reference | `template.ai_params or {}` |
| `texture_path` | expression/reference | `template.texture_path` |
| `animation_path` | expression/reference | `template.animation_path` |
| `attack_texture` | expression/reference | `template.attack_texture` |
| `attack_animation_path` | expression/reference | `template.attack_animation_path` |
| `attack_damage` | expression/reference | `template.attack_damage` |
| `death_message` | expression/reference | `template.death_message` |
| `preload_assets` | expression/reference | `template.preload_assets` |
| `auto_face_player` | expression/reference | `spawn_options == nil or spawn_options.auto_face_player ~= false` |

### `EnemyTemplates.metatable` *(line 76)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `spawn` | function | `function(self` |
| `[2]` | call/expression | `direction) local closest_session = EnemyHelpers.find_closest_player_session(self.instance` |
| `[3]` | call/expression | `self) if self.auto_face_player and closest_session and closest_session.player then local player = closest_session.player direction = Directi…` |
| `[4]` | call/expression | `player.y - (self.y + .5) ) end self.direction = direction self.id = Net.create_bot({ texture_path = self.texture_path, animation_path = self…` |
| `[5]` | expression/reference | `color) end` |
| `get_death_message` | function | `function(self) return self.death_message or "Gyaaaaahh!!" end` |
| `take_turn` | function | `function(self) if self.ai_type == "simple_charge" then return EnemyTemplates.ai.simple_charge(self) elseif self.ai_type == "ranged" then ret…` |

### `EnemyTemplates.ai` *(line 123)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `spawned_bots` *(line 180)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `shape` *(line 226)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1,1,1}` |
| `[2]` | table | `{1,0,1}` |
| `[3]` | table | `{1,1,1}` |

### `preload_assets` *(line 234)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/bots/bigbrute.animation"` |
| `[2]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/bots/beast breath.png"` |
| `[3]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/bots/beast breath.animation"` |
| `[4]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/bots/bigbrute.png"` |

### `shape` *(line 243)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1,1,1}` |
| `[2]` | table | `{1,0,1}` |
| `[3]` | table | `{1,1,1}` |
| `[4]` | table | `{1,1,1}` |

### `mug` *(line 251)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/mugs/blizzardman.png"` |
| `animation_path` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/mugs/blizzardman.animation"` |

### `preload_assets` *(line 256)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/bots/snowball.png"` |
| `[2]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/bots/snowball.animation"` |

### `shape` *(line 265)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{1}` |

### `mug` *(line 271)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/mugs/shademan.png"` |
| `animation_path` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/mugs/shademan.animation"` |

### `preload_assets` *(line 276)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/bots/shademan.animation"` |
| `[2]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/bots/shademan.png"` |
| `[3]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/mugs/shademan.png"` |
| `[4]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/mugs/shademan.animation"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_templates.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
