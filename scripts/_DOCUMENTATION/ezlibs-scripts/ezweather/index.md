# `ezweather.lua`

> **Source:** `scripts/ezlibs-scripts/ezweather.lua`  
> **Source lines:** 149  
> **Functions detected:** 8  
> **Table declarations detected:** 7

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

On server start, record the default custom properties for each area that might be overwritten if the weather changes TODO, support areas being added during server runtime

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/ezbus` — line 3

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 25 | `ezweather.start_rain_in_area` | `area_id` |
| 51 | `ezweather.start_snow_in_area` | `area_id` |
| 77 | `ezweather.start_fog_in_area` | `area_id` |
| 98 | `fade_camera_for_players_in_area` | `area_id` |
| 105 | `ezweather.get_area_weather` | `area_id` |
| 113 | `ezweather.clear_weather_in_area` | `area_id` |
| 135 | `ezweather.handle_player_transfer` | `player_id` |
| 142 | `ezweather.handle_player_join` | `player_id` |

### Function notes

- **`ezweather.start_rain_in_area(area_id)`** *(source line 25)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezweather.start_snow_in_area(area_id)`** *(source line 51)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezweather.start_fog_in_area(area_id)`** *(source line 77)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fade_camera_for_players_in_area(area_id)`** *(source line 98)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezweather.get_area_weather(area_id)`** *(source line 105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezweather.clear_weather_in_area(area_id)`** *(source line 113)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezweather.handle_player_transfer(player_id)`** *(source line 135)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezweather.handle_player_join(player_id)`** *(source line 142)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezweather` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `volatile_memory` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `fine_weather_properties` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `weather_properties` *(line 11)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Song"` |
| `[2]` | string literal | `"Foreground Animation"` |
| `[3]` | string literal | `"Foreground Texture"` |
| `[4]` | string literal | `"Foreground Parallax"` |
| `[5]` | string literal | `"Foreground Vel X"` |
| `[6]` | string literal | `"Foreground Vel Y"` |

### `camera_tint` *(line 30)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `10` |
| `g` | number literal | `10` |
| `b` | number literal | `40` |
| `a` | number literal | `120` |

### `camera_tint` *(line 56)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `a` | number literal | `40` |

### `camera_tint` *(line 82)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `0` |
| `b` | number literal | `0` |
| `a` | number literal | `0` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezweather.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
