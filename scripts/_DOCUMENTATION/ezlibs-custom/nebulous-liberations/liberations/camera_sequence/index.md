# `camera_sequence.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/camera_sequence.lua`  
> **Source lines:** 37  
> **Functions detected:** 1  
> **Table declarations detected:** 1

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

camera_sequence.lua

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 6 | `CameraSequence.play` | `instance, player, start_point` |

### Function notes

- **`CameraSequence.play(instance, player, start_point)`** — Play a camera sequence for a player, using points of interest as waypoints. If a point has custom properties "CameraDuration" and "CameraEase", they will be used. *(source line 6)*

## Tables and data structures

### `CameraSequence` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/camera_sequence.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
