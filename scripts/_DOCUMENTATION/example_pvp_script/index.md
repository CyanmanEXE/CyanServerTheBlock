# `example_pvp_script.disabled-lua`

> **Source:** `scripts/example_pvp_script.disabled-lua`  
> **Source lines:** 89  
> **Functions detected:** 0  
> **Table declarations detected:** 2

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

other_id is not a player id, since they're not registered in the request list

## Dependencies

- No `require(...)` dependency was detected.

## Events

- `Net:on("player_connect", function(event) ...)` — line 4. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 8. The event name is taken directly from this source.
- `Net:on("actor_interaction", function(event) ...)` — line 15. The event name is taken directly from this source.
- `Net:on("textbox_response", function(event) ...)` — line 62. The event name is taken directly from this source.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `requests` *(line 1)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `questioned_requests` *(line 2)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/example_pvp_script.disabled-lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
