# `text-layout.lua`

> **Source:** `scripts/displayer/text-layout.lua`  
> **Source lines:** 299  
> **Functions detected:** 11  
> **Table declarations detected:** 12

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Public text measurement/layout helper for Displayer. All input and output coordinates are virtual 240x160 coordinates.

## Dependencies

- `scripts/displayer/font-system` — line 4

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `normalize_scale` | `value, fallback` |
| 17 | `normalize_text` | `text` |
| 33 | `TextLayout.parseMarkup` | `text` |
| 40 | `push_char` | `ch` |
| 78 | `glyph_advance` | `font, char, scale` |
| 82 | `TextLayout.measureLine` | `text, options` |
| 94 | `split_long_word` | `word, max_width, options` |
| 111 | `wrap_paragraph` | `paragraph, max_width, options` |
| 149 | `split_preserve_empty` | `text, sep` |
| 163 | `TextLayout.layout` | `text, options` |
| 288 | `TextLayout.measure` | `text, options` |

### Function notes

- **`normalize_scale(value, fallback)`** — Font scale controls glyph size; the virtual-to-rendered coordinate ratio is still fixed at 2 in FontSystem. Keep scale values numeric and positive so measurement and drawing cannot silently diverge for 0/negative/string scales. *(source line 11)*
- **`normalize_text(text)`** *(source line 17)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextLayout.parseMarkup(text)`** — Turn the legacy dialogue markup into plain layout text while preserving pause positions. Supported tags: {p_0.25}, {end_line}, {end_page}. Unknown tags remain literal. *(source line 33)*
- **`push_char(ch)`** *(source line 40)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`glyph_advance(font, char, scale)`** *(source line 78)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextLayout.measureLine(text, options)`** *(source line 82)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`split_long_word(word, max_width, options)`** *(source line 94)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`wrap_paragraph(paragraph, max_width, options)`** *(source line 111)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`split_preserve_empty(text, sep)`** *(source line 149)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextLayout.layout(text, options)`** *(source line 163)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`TextLayout.measure(text, options)`** *(source line 288)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `TextLayout` *(line 5)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 35)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pauses` *(line 36)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pieces` *(line 119)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `word` |

### `wrapped_lines` *(line 183)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `forced_page_break_after` *(line 185)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `current` *(line 202)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `page_layouts` *(line 206)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `flat_glyphs` *(line 208)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `lines_meta` *(line 219)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `glyphs` *(line 232)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `glyph` *(line 236)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `char` | expression/reference | `ch` |
| `x` | expression/reference | `cx` |
| `y` | expression/reference | `line_y` |
| `page` | expression/reference | `page_index` |
| `line` | expression/reference | `line_index` |
| `col` | expression/reference | `col` |
| `visible_index` | expression/reference | `global_visible_index` |
| `pause_before` | expression/reference | `pauses[global_visible_index] or 0` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/text-layout.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
