# `prog_talk_dialogue.lua`

> **Source:** `scripts/net-games/npcs/prog_talk_dialogue.lua`  
> **Source lines:** 52  
> **Functions detected:** 0  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_talk_dialogue.lua Example: PROG-style prompt that branches into dialogue Uses NEW Talk.npc + presets + purple frame dye =====================================================

## Dependencies

- `scripts/net-games/main` — line 7
- `scripts/net-games/npcs/talk` — line 9

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `prompt` *(line 34)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `question` | string literal | `"Want to see the purple UI prompt in action?"` |
| `yes_lines` | table | `{ "Nice.", "This is the YES branch.", "Typing speed + open timing should match the PROG defaults.", "{end_page}And it should reuse the same …` |
| `no_lines` | table | `{ "All good.", "This is the NO branch.", "B should behave like BN prompt cancel: selects No, then confirms No.", }` |

### `yes_lines` *(line 36)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Nice."` |
| `[2]` | string literal | `"This is the YES branch."` |
| `[3]` | string literal | `"Typing speed + open timing should match the PROG defaults."` |
| `[4]` | string literal | `"{end_page}And it should reuse the same textbox (no flicker)."` |

### `no_lines` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"All good."` |
| `[2]` | string literal | `"This is the NO branch."` |
| `[3]` | string literal | `"B should behave like BN prompt cancel: selects No, then confirms No."` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_talk_dialogue.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
