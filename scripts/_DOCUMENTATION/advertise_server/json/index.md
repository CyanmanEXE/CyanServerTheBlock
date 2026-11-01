# `json.lua`

> **Source:** `scripts/advertise_server/json.lua`  
> **Source lines:** 388  
> **Functions detected:** 19  
> **Table declarations detected:** 10

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
| 54 | `encode_nil` | `val` |
| 59 | `encode_table` | `val, stack` |
| 101 | `encode_string` | `val` |
| 106 | `encode_number` | `val` |
| 122 | `encode` | `val, stack` |
| 134 | `json.encode` | `val` |
| 145 | `create_set` | `...` |
| 165 | `next_char` | `str, idx, set, negate` |
| 175 | `decode_error` | `str, idx, msg` |
| 189 | `codepoint_to_utf8` | `n` |
| 206 | `parse_unicode_escape` | `s` |
| 218 | `parse_string` | `str, i` |
| 259 | `parse_number` | `str, i` |
| 270 | `parse_literal` | `str, i` |
| 280 | `parse_array` | `str, i` |
| 307 | `parse_object` | `str, i` |
| 363 | `parse` | `str, idx` |
| 375 | `json.decode` | `str` |

### Function notes

- **`escape_char(c)`** *(source line 49)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_nil(val)`** *(source line 54)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_table(val, stack)`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_string(val)`** *(source line 101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode_number(val)`** *(source line 106)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`encode(val, stack)`** *(source line 122)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`json.encode(val)`** *(source line 134)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_set(...)`** *(source line 145)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`next_char(str, idx, set, negate)`** *(source line 165)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`decode_error(str, idx, msg)`** *(source line 175)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`codepoint_to_utf8(n)`** *(source line 189)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_unicode_escape(s)`** *(source line 206)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_string(str, i)`** *(source line 218)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_number(str, i)`** *(source line 259)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_literal(str, i)`** *(source line 270)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_array(str, i)`** *(source line 280)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse_object(str, i)`** *(source line 307)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`parse(str, idx)`** *(source line 363)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`json.decode(str)`** *(source line 375)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

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

### `res` *(line 60)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `type_func_map` *(line 113)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[nil]` | expression/reference | `encode_nil` |
| `[table]` | expression/reference | `encode_table` |
| `[string]` | expression/reference | `encode_string` |
| `[number]` | expression/reference | `encode_number` |
| `[boolean]` | expression/reference | `tostring` |

### `res` *(line 146)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `literal_map` *(line 157)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[true]` | boolean literal | `true` |
| `[false]` | boolean literal | `false` |
| `[null]` | nil | `nil` |

### `res` *(line 281)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `res` *(line 308)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `char_func_map` *(line 342)*

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

- This reference is generated from the exact archived source `scripts/advertise_server/json.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
