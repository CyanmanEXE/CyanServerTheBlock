# `guard_interception.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception.lua`  
> **Source lines:** 246  
> **Functions detected:** 10  
> **Table declarations detected:** 12

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

- `scripts/ezlibs-scripts/ezbus` — line 1
- `scripts/libs/direction` — line 2
- `scripts/ezlibs-scripts/ezlogger` — line 3

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 21 | `get_position` | `player` |
| 31 | `is_guard_session` | `session` |
| 39 | `is_eligible_attacker` | `attacker` |
| 44 | `face_attacker` | `guard_player, guard_position, attacker` |
| 60 | `animate_interception` | `instance, guard_session, protected_session, attacker, impact_delay` |
| 144 | `build_attack_records` | `event` |
| 198 | `get_instance_bus` | `instance` |
| 210 | `GuardInterception.prepare_attack` | `instance, attacker, target_sessions, impact_delay` |
| 222 | `GuardInterception.apply_damage` | `records, amount, attacker` |
| 239 | `GuardInterception.finish_attack` | `instance, records` |

### Function notes

- **`get_position(player)`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_guard_session(session)`** *(source line 31)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_eligible_attacker(attacker)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`face_attacker(guard_player, guard_position, attacker)`** *(source line 44)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animate_interception(instance, guard_session, protected_session, attacker, impact_delay)`** *(source line 60)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_attack_records(event)`** *(source line 144)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_instance_bus(instance)`** *(source line 198)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`GuardInterception.prepare_attack(instance, attacker, target_sessions, impact_delay)`** *(source line 210)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`GuardInterception.apply_damage(records, amount, attacker)`** *(source line 222)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`GuardInterception.finish_attack(instance, records)`** *(source line 239)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `GuardInterception` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `registered_buses` *(line 7)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `animation_suffix` *(line 13)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `[Direction.UP_LEFT] = "UL"` |
| `[2]` | expression/reference | `[Direction.UP_RIGHT] = "UR"` |
| `[3]` | expression/reference | `[Direction.DOWN_LEFT] = "DL"` |
| `[4]` | expression/reference | `[Direction.DOWN_RIGHT] = "DR"` |

### `keyframes` *(line 86)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = guard_start.x, ease = "Linear" }, { property = "Y", value = guard_start.y, ease = "Linear" }, { p…` |
| `[2]` | table | `{ properties = { { property = "X", value = protected_position.x, ease = "Linear" }, { property = "Y", value = protected_position.y, ease = "…` |
| `[3]` | table | `{ properties = { { property = "X", value = protected_position.x, ease = "Linear" }, { property = "Y", value = protected_position.y, ease = "…` |
| `[4]` | table | `{ properties = { { property = "X", value = push_x, ease = "Linear" }, { property = "Y", value = push_y, ease = "Linear" }, { property = "Z",…` |
| `[5]` | table | `{ properties = { { property = "X", value = guard_start.x, ease = "Linear" }, { property = "Y", value = guard_start.y, ease = "Linear" }, { p…` |

### `properties` *(line 88)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = guard_start.x, ease = "Linear" }` |
| `[2]` | table | `{ property = "Y", value = guard_start.y, ease = "Linear" }` |
| `[3]` | table | `{ property = "Z", value = guard_start.z, ease = "Linear" }` |

### `properties` *(line 96)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = protected_position.x, ease = "Linear" }` |
| `[2]` | table | `{ property = "Y", value = protected_position.y, ease = "Linear" }` |
| `[3]` | table | `{ property = "Z", value = protected_position.z, ease = "Linear" }` |

### `properties` *(line 104)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = protected_position.x, ease = "Linear" }` |
| `[2]` | table | `{ property = "Y", value = protected_position.y, ease = "Linear" }` |
| `[3]` | table | `{ property = "Z", value = protected_position.z, ease = "Linear" }` |

### `properties` *(line 112)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = push_x, ease = "Linear" }` |
| `[2]` | table | `{ property = "Y", value = push_y, ease = "Linear" }` |
| `[3]` | table | `{ property = "Z", value = protected_position.z, ease = "Linear" }` |

### `properties` *(line 120)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = guard_start.x, ease = "Linear" }` |
| `[2]` | table | `{ property = "Y", value = guard_start.y, ease = "Linear" }` |
| `[3]` | table | `{ property = "Z", value = guard_start.z, ease = "Linear" }` |

### `event` *(line 211)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance` | expression/reference | `instance` |
| `attacker` | expression/reference | `attacker` |
| `target_sessions` | expression/reference | `target_sessions or {}` |
| `impact_delay` | expression/reference | `impact_delay or 0.5` |
| `records` | table | `{}` |

### `records` *(line 216)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `damaged` *(line 223)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
