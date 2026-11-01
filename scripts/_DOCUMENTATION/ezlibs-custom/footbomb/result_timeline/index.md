# `result_timeline.lua`

> **Source:** `scripts/ezlibs-custom/footbomb/result_timeline.lua`  
> **Source lines:** 57  
> **Functions detected:** 2  
> **Table declarations detected:** 1

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Pure timing helpers for FootBomb's result sequence. This module deliberately does not animate actors or wait on async tasks; it calculates timing boundaries from authored animation data and gameplay travel estimates so callers can coordinate their own event-driven tracks.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 7 | `ResultTimeline.state_timing` | `state` |
| 39 | `ResultTimeline.shared_response_duration` | `options` |

### Function notes

- **`ResultTimeline.state_timing(state)`** *(source line 7)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ResultTimeline.shared_response_duration(options)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ResultTimeline` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/footbomb/result_timeline.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
