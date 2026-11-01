# `main.lua`

> **Source:** `scripts/boom/main.lua`  
> **Source lines:** 252  
> **Functions detected:** 16  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

[[@module boom

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 10 | `warn` | `message` |
| 16 | `cleanstr` | `value` |
| 25 | `parse_attributes` | `line, convert_numbers, frame_rate` |
| 71 | `valid_state` | `animation, state_name, operation` |
| 81 | `make_animation` | `version` |
| 83 | `animation.get_state` | `self, name` |
| 89 | `animation.get_frame` | `self, name, frame_index` |
| 97 | `animation.get_point` | `self, name, frame_index, label` |
| 105 | `animation.duration` | `self, name` |
| 115 | `animation.get_duration` | `self, name` |
| 116 | `animation.refresh` | `self, name` |
| 122 | `animation.update` | `self, name, seconds` |
| 143 | `read_lines` | `path` |
| 161 | `parse_v20` | `lines, path` |
| 196 | `parse_v25` | `lines, path` |
| 236 | `boom.load` | `path` |

### Function notes

- **`warn(message)`** *(source line 10)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cleanstr(value)`** *(source line 16)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_attributes(line, convert_numbers, frame_rate)`** — Parse key=value attributes while preserving quoted values containing spaces. *(source line 25)*
- **`valid_state(animation, state_name, operation)`** *(source line 71)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`make_animation(version)`** *(source line 81)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation.get_state(self, name)`** *(source line 83)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation.get_frame(self, name, frame_index)`** *(source line 89)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation.get_point(self, name, frame_index, label)`** *(source line 97)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation.duration(self, name)`** *(source line 105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation.get_duration(self, name)`** *(source line 115)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation.refresh(self, name)`** *(source line 116)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation.update(self, name, seconds)`** *(source line 122)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`read_lines(path)`** *(source line 143)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_v20(lines, path)`** *(source line 161)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_v25(lines, path)`** *(source line 196)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`boom.load(path)`** *(source line 236)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `boom` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `result` *(line 26)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `animation` *(line 82)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `states` | table | `{}` |
| `elapsed` | number literal | `0` |
| `imagePath` | string literal | `""` |
| `currFrame` | table | `{}` |
| `version` | expression/reference | `version` |
| `format_version` | expression/reference | `version` |
| `frame_rate` | number literal | `60` |

### `lines` *(line 155)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/boom/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
