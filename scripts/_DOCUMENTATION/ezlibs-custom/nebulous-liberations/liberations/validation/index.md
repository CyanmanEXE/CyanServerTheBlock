# `validation.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/validation.lua`  
> **Source lines:** 201  
> **Functions detected:** 4  
> **Table declarations detected:** 6

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

validation.lua

## Dependencies

- `scripts/ezlibs-custom/nebulous-liberations/liberations/constants` — line 2

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 7 | `log` | `level, message` |
| 12 | `validate_object` | `area_id, object` |
| 84 | `Validation.validate_area` | `area_id` |
| 190 | `Validation.report` | `area_id` |

### Function notes

- **`log(level, message)`** — Log a warning or error (replace with proper logging) *(source line 7)*
- **`validate_object(area_id, object)`** — Validate a single object *(source line 12)*
- **`Validation.validate_area(area_id)`** — Validate a whole area *(source line 84)*
- **`Validation.report(area_id)`** — Print validation results to console *(source line 190)*

## Tables and data structures

### `Validation` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `valid_modes` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Immediate]` | boolean literal | `true` |
| `[On Dark Hole Cleared]` | boolean literal | `true` |
| `[Manual]` | boolean literal | `true` |
| `[After Boss Defeated]` | boolean literal | `true` |

### `boss_object_ids` *(line 88)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `boss_ids` *(line 89)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `boss_trigger_refs` *(line 90)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `panel_boss_refs` *(line 91)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/validation.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
