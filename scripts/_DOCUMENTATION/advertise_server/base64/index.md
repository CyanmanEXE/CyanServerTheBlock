# `base64.lua`

> **Source:** `scripts/advertise_server/base64.lua`  
> **Source lines:** 201  
> **Functions detected:** 6  
> **Table declarations detected:** 4

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

[[

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 31 | `extract` | `v, from, width` |
| 35 | `extract` | `v, from, width` |
| 55 | `base64.makeencoder` | `s62, s63, spad` |
| 67 | `base64.makedecoder` | `s62, s63, spad` |
| 80 | `base64.encode` | `str, encoder, usecaching` |
| 112 | `base64.decode` | `b64, decoder, usecaching` |

### Function notes

- **`extract(v, from, width)`** *(source line 31)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`extract(v, from, width)`** *(source line 35)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`base64.makeencoder(s62, s63, spad)`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`base64.makedecoder(s62, s63, spad)`** *(source line 67)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`base64.encode(str, encoder, usecaching)`** *(source line 80)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`base64.decode(b64, decoder, usecaching)`** *(source line 112)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `base64` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `encoder` *(line 56)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `decoder` *(line 68)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `cache` *(line 84)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/advertise_server/base64.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
