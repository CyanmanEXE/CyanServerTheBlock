# `eztiledutils.lua`

> **Source:** `scripts/ezlibs-scripts/utils/eztiledutils.lua`  
> **Source lines:** 316  
> **Functions detected:** 15  
> **Table declarations detected:** 3

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

tiled_utils.lua Shared helpers for Tiled property access. Replaces local helpers in: * eznpcs.lua / eznpcs/dialogue_types.lua  (is_property_true) * FootBomb                                  (as_string / as_number) * ezpushback.lua                            (truthy / number_property) Runtime properties live at object.custom_properties (the shape used throughout ezlibs). For forward compatibility, object.properties is also accepted in both map form (name -> value) and array form (name/type/value entries). This module requires nothing, so it is safe to require from leaf files such as dialogue_types.lua without creating circular dependencies.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 33 | `M.is_true` | `value, default` |
| 51 | `M.to_number` | `value, default` |
| 65 | `M.to_string` | `value, default` |
| 80 | `raw_lookup` | `obj, name` |
| 121 | `M.get_property` | `obj, name, default` |
| 127 | `M.get_string` | `obj, name, default` |
| 131 | `M.get_number` | `obj, name, default` |
| 135 | `M.get_boolean` | `obj, name, default` |
| 148 | `M.get_object_reference` | `obj, name, resolver, default` |
| 160 | `M.get_class_or_type` | `obj` |
| 174 | `M.get_string_from` | `props, name, default` |
| 179 | `M.get_number_from` | `props, name, default` |
| 184 | `M.get_boolean_from` | `props, name, default` |
| 194 | `M.normalize_properties` | `obj` |
| 240 | `M.validate_properties` | `obj, schema_props, enums` |

### Function notes

- **`M.is_true(value, default)`** — Canonical boolean normalizer.  true / "true" / "1" / "yes" / "on" / non-zero number -> true false / "false" / "0" / "no" / "off" / "" / 0        -> false nil                                                  -> default (false if omitted)  After validate_properties() succeeds against a class schema, booleans are guaranteed to be real booleans or the string forms above, so the liberal handling here is a safety net for optional properties and for call sites that bypass validation. *(source line 33)*
- **`M.to_number(value, default)`** — Strict number parsing. Matches FootBomb as_number and ezpushback number_property: returns default on non-numbers and unparseable strings. *(source line 51)*
- **`M.to_string(value, default)`** — String normalization. Numbers and booleans become their string form; tables and nil return default. *(source line 65)*
- **`raw_lookup(obj, name)`** — Return the runtime value for `name` on `obj`, or nil. custom_properties wins when it has the field; otherwise falls through to the older .properties shape (array-of-entries or map-of-{value=,type=}). *(source line 80)*
- **`M.get_property(obj, name, default)`** — ------------------------------------------------------------------------ Object-level accessors ------------------------------------------------------------------------ *(source line 121)*
- **`M.get_string(obj, name, default)`** *(source line 127)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.get_number(obj, name, default)`** *(source line 131)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.get_boolean(obj, name, default)`** *(source line 135)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.get_object_reference(obj, name, resolver, default)`** — Resolve an object reference stored as an ID.  resolver: function(id) -> object|nil  (typically function(id) return ezcache.get_object_by_id_cached(area_id, id) end)  Returns (resolved_object, true) on success. Returns (default, false) if the property is nil or "" (Tiled convention for "no reference" — matches prop("X", "object", "") in the generator). Returns (raw_id, false) if a resolver was not given or the resolver missed. *(source line 148)*
- **`M.get_class_or_type(obj)`** — Tiled 1.9+ uses .class; older Tiled data and various loaders use .type. *(source line 160)*
- **`M.get_string_from(props, name, default)`** — ------------------------------------------------------------------------ Props-table accessors For call sites that already hold object.custom_properties. ------------------------------------------------------------------------ *(source line 174)*
- **`M.get_number_from(props, name, default)`** *(source line 179)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.get_boolean_from(props, name, default)`** *(source line 184)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`M.normalize_properties(obj)`** — Normalize an object's properties into a flat name -> value map. *(source line 194)*
- **`M.validate_properties(obj, schema_props, enums)`** — Validate an object against an array of schema property definitions (the .members array from ezlibs-tiled-schema.lua).  schema_props: { {name=, type=, value=, propertyType=, required=, ...}, ... } enums:        optional { [name] = { values = {...} } }  Returns (ok, report). report = { errors  = { {name, issue, expected, got}, ... }, values  = { name -> coerced value },   -- includes defaults missing = { name, ... }, } *(source line 240)*

## Tables and data structures

### `M` *(line 16)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 195)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `report` *(line 241)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `errors` | table | `{}` |
| `values` | table | `{}` |
| `missing` | table | `{}` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/utils/eztiledutils.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
