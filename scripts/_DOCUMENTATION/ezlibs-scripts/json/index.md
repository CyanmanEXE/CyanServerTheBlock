# `json.lua`

> **Source:** `scripts/ezlibs-scripts/json.lua`  
> **Source lines:** 439  
> **Functions detected:** 19  
> **Table declarations detected:** 13

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

json.lua Copyright (c) 2020 rxi Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 49 | `escape_char` | `c` |
| 54 | `encode_nil` | `...` |
| 59 | `encode_table` | `val, stack, indent_unit, level` |
| 145 | `encode_string` | `val, ...` |
| 150 | `encode_number` | `val, ...` |
| 166 | `encode` | `val, stack, indent_unit, level` |
| 179 | `json.encode` | `val, pretty` |
| 196 | `create_set` | `...` |
| 216 | `next_char` | `str, idx, set, negate` |
| 226 | `decode_error` | `str, idx, msg` |
| 240 | `codepoint_to_utf8` | `n` |
| 257 | `parse_unicode_escape` | `s` |
| 269 | `parse_string` | `str, i` |
| 310 | `parse_number` | `str, i` |
| 321 | `parse_literal` | `str, i` |
| 331 | `parse_array` | `str, i` |
| 358 | `parse_object` | `str, i` |
| 414 | `parse` | `str, idx` |
| 426 | `json.decode` | `str` |

### Function notes

- **`escape_char(c)`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_nil(...)`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_table(val, stack, indent_unit, level)`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_string(val, ...)`** *(source line 145)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_number(val, ...)`** *(source line 150)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode(val, stack, indent_unit, level)`** *(source line 166)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`json.encode(val, pretty)`** *(source line 179)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_set(...)`** *(source line 196)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`next_char(str, idx, set, negate)`** *(source line 216)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`decode_error(str, idx, msg)`** *(source line 226)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`codepoint_to_utf8(n)`** *(source line 240)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_unicode_escape(s)`** *(source line 257)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_string(str, i)`** *(source line 269)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_number(str, i)`** *(source line 310)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_literal(str, i)`** *(source line 321)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_array(str, i)`** *(source line 331)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_object(str, i)`** *(source line 358)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse(str, idx)`** *(source line 414)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`json.decode(str)`** *(source line 426)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `json` *(line 24)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `_version` | string literal | `"0.1.2"` |

### `escape_char_map` *(line 32)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[\\]` | string literal | `"\\"` |
| `[\"]` | string literal | `"\""` |
| `[\b]` | string literal | `"b"` |
| `[\f]` | string literal | `"f"` |
| `[\n]` | string literal | `"n"` |
| `[\r]` | string literal | `"r"` |
| `[\t]` | string literal | `"t"` |

### `escape_char_map_inv` *(line 42)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[/]` | string literal | `"/"` |

### `res` *(line 61)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `lines` *(line 87)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"["` |

### `keys` *(line 110)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `lines` *(line 118)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"{"` |

### `type_func_map` *(line 157)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[nil]` | expression/reference | `encode_nil` |
| `[table]` | expression/reference | `encode_table` |
| `[string]` | expression/reference | `encode_string` |
| `[number]` | expression/reference | `encode_number` |
| `[boolean]` | expression/reference | `tostring` |

### `res` *(line 197)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `literal_map` *(line 208)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[true]` | boolean literal | `true` |
| `[false]` | boolean literal | `false` |
| `[null]` | nil | `nil` |

### `res` *(line 332)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `res` *(line 359)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `char_func_map` *(line 393)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `["]` | expression/reference | `parse_string` |
| `[0]` | expression/reference | `parse_number` |
| `[1]` | expression/reference | `parse_number` |
| `[2]` | expression/reference | `parse_number` |
| `[3]` | expression/reference | `parse_number` |
| `[4]` | expression/reference | `parse_number` |
| `[5]` | expression/reference | `parse_number` |
| `[6]` | expression/reference | `parse_number` |
| `[7]` | expression/reference | `parse_number` |
| `[8]` | expression/reference | `parse_number` |
| `[9]` | expression/reference | `parse_number` |
| `[-]` | expression/reference | `parse_number` |
| `[t]` | expression/reference | `parse_literal` |
| `[f]` | expression/reference | `parse_literal` |
| `[n]` | expression/reference | `parse_literal` |
| `[[]` | expression/reference | `parse_array` |
| `[{]` | expression/reference | `parse_object` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/json.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
