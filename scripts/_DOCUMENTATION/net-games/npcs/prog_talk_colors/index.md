# `prog_talk_colors.lua`

> **Source:** `scripts/net-games/npcs/prog_talk_colors.lua`  
> **Source lines:** 257  
> **Functions detected:** 1  
> **Table declarations detected:** 16

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== prog_talk_colors.lua PROG talk NPCs: one per frame dye color Tiled object names must be: prog_{color} =====================================================

## Dependencies

- `scripts/net-games/main` — line 7
- `scripts/net-games/npcs/talk` — line 9

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 15 | `ow` | `color` |

### Function notes

- **`ow(color)`** *(source line 15)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `lines` *(line 28)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"{end_page}DEFAULT PROG ONLINE{p_2}"` |
| `[2]` | string literal | `"{end_line} "` |
| `[3]` | string literal | `"SIR,{p_2.2} This is the very definition of overkill.{p_0.2}.{p_0.4}.{p_0.8}"` |
| `[4]` | string literal | `"{end_page}BUT LETS TAKE A LOOK SHALL WE?!"` |

### `lines` *(line 47)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"LIME PROG ONLINE."` |
| `[2]` | string literal | `"Everything is GO.{p_0.2} Fast.{p_0.2} Clean.{p_0.2} Alive."` |
| `[3]` | string literal | `"{end_page}If you need momentum, borrow mine."` |

### `prompt` *(line 65)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `question` | string literal | `"RED PROG READY. PUSH HARD?"` |
| `yes_lines` | table | `{ "Yes confirmed.", "We move fast.", "We break things on purpose.", "{end_page}If it matters, we do it now.", }` |
| `no_lines` | table | `{ "Copy that.", "Holding position.", "{end_page}Pressure stays on standby.", }` |

### `yes_lines` *(line 67)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Yes confirmed."` |
| `[2]` | string literal | `"We move fast."` |
| `[3]` | string literal | `"We break things on purpose."` |
| `[4]` | string literal | `"{end_page}If it matters, we do it now."` |

### `no_lines` *(line 74)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Copy that."` |
| `[2]` | string literal | `"Holding position."` |
| `[3]` | string literal | `"{end_page}Pressure stays on standby."` |

### `lines` *(line 94)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"PURPLE PROG speaking."` |
| `[2]` | string literal | `"Mystery is just data wearing a cloak."` |
| `[3]` | string literal | `"{end_page}Keep staring.{p_0.2} Patterns confess eventually."` |

### `lines` *(line 112)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"TURQUOISE PROG online."` |
| `[2]` | string literal | `"Breathe.{p_0.3} Smooth inputs.{p_0.3} Smooth outputs."` |
| `[3]` | string literal | `"{end_page}No rush. We still win."` |

### `lines` *(line 130)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"PINK PROG reporting in."` |
| `[2]` | string literal | `"I made the UI cute so the bugs feel bad about existing."` |
| `[3]` | string literal | `"{end_page}It's working.{p_0.2} You're allowed to be proud."` |

### `lines` *(line 148)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"EMERALD PROG operational."` |
| `[2]` | string literal | `"Stable.{p_0.2} Grounded.{p_0.2} Built to last."` |
| `[3]` | string literal | `"{end_page}We don't just ship.{p_0.2} We endure."` |

### `lines` *(line 166)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"SAPPHIRE PROG here."` |
| `[2]` | string literal | `"Cool head.{p_0.2} Clear eyes.{p_0.2} Clean diff."` |
| `[3]` | string literal | `"{end_page}If it looks haunted, we log it until it apologizes."` |

### `lines` *(line 184)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"YELLOW PROG online."` |
| `[2]` | string literal | `"Good news:{p_0.2} it's bright for a reason."` |
| `[3]` | string literal | `"{end_page}Spot the issue.{p_0.2} Tag it.{p_0.2} Fix it.{p_0.2} Celebrate."` |

### `lines` *(line 202)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"ORANGE PROG active."` |
| `[2]` | string literal | `"I run hot.{p_0.2} I move fast.{p_0.2} I break walls."` |
| `[3]` | string literal | `"{end_page}Point me at the problem and stand back."` |

### `prompt` *(line 220)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `question` | string literal | `"CHARCOAL PROG READY. SHIP NOW?"` |
| `yes_lines` | table | `{ "Confirmed.", "No noise.", "No drama.", "{end_page}We ship.", }` |
| `no_lines` | table | `{ "Understood.", "Holding for clarity.", "{end_page}Signal stays clean.", }` |

### `yes_lines` *(line 223)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Confirmed."` |
| `[2]` | string literal | `"No noise."` |
| `[3]` | string literal | `"No drama."` |
| `[4]` | string literal | `"{end_page}We ship."` |

### `no_lines` *(line 230)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Understood."` |
| `[2]` | string literal | `"Holding for clarity."` |
| `[3]` | string literal | `"{end_page}Signal stays clean."` |

### `lines` *(line 250)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"WHITE PROG reporting."` |
| `[2]` | string literal | `"Baseline check:{p_0.2} no tricks.{p_0.2} no tint lies."` |
| `[3]` | string literal | `"{end_page}If this breaks, something else is VERY wrong."` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/prog_talk_colors.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
