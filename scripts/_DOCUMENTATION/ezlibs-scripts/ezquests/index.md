# `ezquests.lua`

> **Source:** `scripts/ezlibs-scripts/ezquests.lua`  
> **Source lines:** 122  
> **Functions detected:** 9  
> **Table declarations detected:** 3

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
- `scripts/ezlibs-scripts/ezmemory` — line 2
- `scripts/ezlibs-scripts/helpers` — line 3

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 9 | `ezquests.add_quest` | `quest` |
| 28 | `ezquests.set_player_quest_flag` | `player_id,quest_name,flag_name,flag_state` |
| 42 | `ezquests.get_player_quest_flag` | `player_id,quest_name,flag_name,flag_state` |
| 54 | `ezquests.clear_player_quest_flags` | `player_id,quest_name` |
| 65 | `ezquests.get_quest` | `quest_name` |
| 74 | `ezquests.get_player_quest_state` | `player_id, quest_name` |
| 83 | `ezquests.quest_event` | `player_id,quest_name,event_value` |
| 98 | `handle_event_async` | `self,player_id,event_value` |
| 110 | `determine_state` | `self,player_id` |

### Function notes

- **`ezquests.add_quest(quest)`** *(source line 9)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezquests.set_player_quest_flag(player_id,quest_name,flag_name,flag_state)`** *(source line 28)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezquests.get_player_quest_flag(player_id,quest_name,flag_name,flag_state)`** *(source line 42)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezquests.clear_player_quest_flags(player_id,quest_name)`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezquests.get_quest(quest_name)`** *(source line 65)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezquests.get_player_quest_state(player_id, quest_name)`** *(source line 74)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezquests.quest_event(player_id,quest_name,event_value)`** *(source line 83)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`handle_event_async(self,player_id,event_value)`** *(source line 98)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`determine_state(self,player_id)`** *(source line 110)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezquests` *(line 4)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `quests` | table | `{}` |

### `quests` *(line 6)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `quest_get_punched` *(line 96)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `"Get Punched"` |
| `handle_event_async` | function | `function (self` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | call/expression | `event_value) return async(function () local accpeted = ezquests.get_player_quest_flag(player_id` |
| `[5]` | expression/reference | `self.name` |
| `[6]` | string literal | `'accepted') if accpeted or event_value == "accepted" then ezquests.set_player_quest_flag(player_id` |
| `[7]` | expression/reference | `self.name` |
| `[8]` | expression/reference | `event_value` |
| `[9]` | call/expression | `true) end if event_value == 'reset' then ezquests.clear_player_quest_flags(player_id` |
| `[10]` | expression/reference | `self.name) end end) end` |
| `determine_state` | function | `function (self` |
| `[12]` | call/expression | `player_id) if ezquests.get_player_quest_flag(player_id` |
| `[13]` | expression/reference | `self.name` |
| `[14]` | string literal | `'punched') then return "punched" end if ezquests.get_player_quest_flag(player_id` |
| `[15]` | expression/reference | `self.name` |
| `[16]` | string literal | `'accepted') then return "accepted" end return "unaccepted" end` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezquests.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
