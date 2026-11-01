# `color-picker.lua`

> **Source:** `scripts/color-picker/color-picker.lua`  
> **Source lines:** 77  
> **Functions detected:** 2  
> **Table declarations detected:** 44

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Extended color set accessible from outside

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 4 | `ColorPicker:getRandom` | `which` |
| 17 | `ColorPicker:new` | `(none)` |

### Function notes

- **`ColorPicker:getRandom(which)`** *(source line 4)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ColorPicker:new()`** *(source line 17)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ColorPicker` *(line 1)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.Rainbow` *(line 19)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `red` | table | `{ r = 255, g = 0, b = 0 }` |
| `orange` | table | `{ r = 255, g = 165, b = 0 }` |
| `yellow` | table | `{ r = 255, g = 255, b = 0 }` |
| `green` | table | `{ r = 0, g = 128, b = 0 }` |
| `blue` | table | `{ r = 0, g = 0, b = 255 }` |
| `indigo` | table | `{ r = 75, g = 0, b = 130 }` |
| `violet` | table | `{ r = 238, g = 130, b = 238 }` |

### `red` *(line 20)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `0` |
| `b` | number literal | `0` |

### `orange` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `165` |
| `b` | number literal | `0` |

### `yellow` *(line 22)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `0` |

### `green` *(line 23)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `128` |
| `b` | number literal | `0` |

### `blue` *(line 24)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `0` |
| `b` | number literal | `255` |

### `indigo` *(line 25)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `75` |
| `g` | number literal | `0` |
| `b` | number literal | `130` |

### `violet` *(line 26)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `238` |
| `g` | number literal | `130` |
| `b` | number literal | `238` |

### `self.RainbowArray` *(line 28)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `self.Rainbow.red` |
| `[2]` | expression/reference | `self.Rainbow.orange` |
| `[3]` | expression/reference | `self.Rainbow.yellow` |
| `[4]` | expression/reference | `self.Rainbow.green` |
| `[5]` | expression/reference | `self.Rainbow.blue` |
| `[6]` | expression/reference | `self.Rainbow.indigo` |
| `[7]` | expression/reference | `self.Rainbow.violet` |

### `ColorPicker.Colors` *(line 36)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `red` | table | `{ r = 255, g = 0, b = 0 }` |
| `green` | table | `{ r = 0, g = 128, b = 0 }` |
| `blue` | table | `{ r = 0, g = 0, b = 255 }` |
| `yellow` | table | `{ r = 255, g = 255, b = 0 }` |
| `cyan` | table | `{ r = 0, g = 255, b = 255 }` |
| `magenta` | table | `{ r = 255, g = 0, b = 255 }` |
| `white` | table | `{ r = 255, g = 255, b = 255 }` |
| `black` | table | `{ r = 0, g = 0, b = 0 }` |
| `gray` | table | `{ r = 128, g = 128, b = 128 }` |
| `silver` | table | `{ r = 192, g = 192, b = 192 }` |
| `maroon` | table | `{ r = 128, g = 0, b = 0 }` |
| `olive` | table | `{ r = 128, g = 128, b = 0 }` |
| `lime` | table | `{ r = 0, g = 255, b = 0 }` |
| `teal` | table | `{ r = 0, g = 128, b = 128 }` |
| `navy` | table | `{ r = 0, g = 0, b = 128 }` |
| `purple` | table | `{ r = 128, g = 0, b = 128 }` |
| `fuchsia` | table | `{ r = 255, g = 0, b = 255 }` |
| `aqua` | table | `{ r = 0, g = 255, b = 255 }` |
| `orange` | table | `{ r = 255, g = 165, b = 0 }` |
| `pink` | table | `{ r = 255, g = 192, b = 203 }` |
| `brown` | table | `{ r = 165, g = 42, b = 42 }` |
| `beige` | table | `{ r = 245, g = 245, b = 220 }` |
| `lavender` | table | `{ r = 230, g = 230, b = 250 }` |
| `turquoise` | table | `{ r = 64, g = 224, b = 208 }` |
| `indigo` | table | `{ r = 75, g = 0, b = 130 }` |
| `violet` | table | `{ r = 238, g = 130, b = 238 }` |
| `gold` | table | `{ r = 255, g = 215, b = 0 }` |
| `coral` | table | `{ r = 255, g = 127, b = 80 }` |
| `salmon` | table | `{ r = 250, g = 128, b = 114 }` |
| `khaki` | table | `{ r = 240, g = 230, b = 140 }` |
| `plum` | table | `{ r = 221, g = 160, b = 221 }` |
| `orchid` | table | `{ r = 218, g = 112, b = 214 }` |

### `red` *(line 37)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `0` |
| `b` | number literal | `0` |

### `green` *(line 38)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `128` |
| `b` | number literal | `0` |

### `blue` *(line 39)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `0` |
| `b` | number literal | `255` |

### `yellow` *(line 40)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `0` |

### `cyan` *(line 41)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |

### `magenta` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `0` |
| `b` | number literal | `255` |

### `white` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |

### `black` *(line 44)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `0` |
| `b` | number literal | `0` |

### `gray` *(line 45)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `128` |
| `g` | number literal | `128` |
| `b` | number literal | `128` |

### `silver` *(line 46)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `192` |
| `g` | number literal | `192` |
| `b` | number literal | `192` |

### `maroon` *(line 47)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `128` |
| `g` | number literal | `0` |
| `b` | number literal | `0` |

### `olive` *(line 48)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `128` |
| `g` | number literal | `128` |
| `b` | number literal | `0` |

### `lime` *(line 49)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `255` |
| `b` | number literal | `0` |

### `teal` *(line 50)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `128` |
| `b` | number literal | `128` |

### `navy` *(line 51)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `0` |
| `b` | number literal | `128` |

### `purple` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `128` |
| `g` | number literal | `0` |
| `b` | number literal | `128` |

### `fuchsia` *(line 53)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `0` |
| `b` | number literal | `255` |

### `aqua` *(line 54)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `0` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |

### `orange` *(line 55)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `165` |
| `b` | number literal | `0` |

### `pink` *(line 56)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `192` |
| `b` | number literal | `203` |

### `brown` *(line 57)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `165` |
| `g` | number literal | `42` |
| `b` | number literal | `42` |

### `beige` *(line 58)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `245` |
| `g` | number literal | `245` |
| `b` | number literal | `220` |

### `lavender` *(line 59)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `230` |
| `g` | number literal | `230` |
| `b` | number literal | `250` |

### `turquoise` *(line 60)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `64` |
| `g` | number literal | `224` |
| `b` | number literal | `208` |

### `indigo` *(line 61)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `75` |
| `g` | number literal | `0` |
| `b` | number literal | `130` |

### `violet` *(line 62)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `238` |
| `g` | number literal | `130` |
| `b` | number literal | `238` |

### `gold` *(line 63)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `215` |
| `b` | number literal | `0` |

### `coral` *(line 64)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `127` |
| `b` | number literal | `80` |

### `salmon` *(line 65)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `250` |
| `g` | number literal | `128` |
| `b` | number literal | `114` |

### `khaki` *(line 66)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `240` |
| `g` | number literal | `230` |
| `b` | number literal | `140` |

### `plum` *(line 67)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `221` |
| `g` | number literal | `160` |
| `b` | number literal | `221` |

### `orchid` *(line 68)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `218` |
| `g` | number literal | `112` |
| `b` | number literal | `214` |

### `ColorPicker.ColorArray` *(line 72)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/color-picker/color-picker.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
