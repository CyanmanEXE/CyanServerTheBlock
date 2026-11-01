# `startup.lua`

> **Source:** `scripts/net-games/dialogue/startup.lua`  
> **Source lines:** 13  
> **Functions detected:** 0  
> **Table declarations detected:** 0

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

server/scripts/net-games/dialogue/startup.lua print("[net-games dialogue/startup] LOADING...") _G.NG_TEXTBOX_DEBUG = false _G.NG_TEXTBOX_DEBUG_TRACE = false local Displayer = require("scripts/displayer/displayer") local Input     = require("scripts/input/input") assert(Displayer:init(), "[net-games dialogue/startup] Displayer failed to init") Input.attach_virtual_input_listener() print("[net-games dialogue/startup] READY") return true

## Dependencies

- `scripts/displayer/displayer` — line 6
- `scripts/input/input` — line 7

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

No simple named table initializer was detected. Tables created dynamically or returned inline may not appear in this inventory.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/dialogue/startup.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
