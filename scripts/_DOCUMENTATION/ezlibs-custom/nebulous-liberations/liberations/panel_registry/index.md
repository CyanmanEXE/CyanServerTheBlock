# `panel_registry.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_registry.lua`  
> **Source lines:** 98  
> **Functions detected:** 7  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

panel_registry.lua

## Dependencies

- `scripts/ezlibs-custom/nebulous-liberations/liberations/constants` — line 2

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 12 | `PanelRegistry.register` | `type_name, definition` |
| 53 | `PanelRegistry.get_type_by_gid` | `gid` |
| 58 | `PanelRegistry.get_definition` | `type_name` |
| 63 | `PanelRegistry.is_type` | `gid, type_name` |
| 69 | `PanelRegistry.is_liberatable` | `gid` |
| 79 | `PanelRegistry.is_walkable` | `gid` |
| 89 | `PanelRegistry.is_shadowstep` | `gid` |

### Function notes

- **`PanelRegistry.register(type_name, definition)`** — Register a panel type *(source line 12)*
- **`PanelRegistry.get_type_by_gid(gid)`** — Get panel type by GID *(source line 53)*
- **`PanelRegistry.get_definition(type_name)`** — Get definition by type name *(source line 58)*
- **`PanelRegistry.is_type(gid, type_name)`** — Check if a GID corresponds to a specific panel type *(source line 63)*
- **`PanelRegistry.is_liberatable(gid)`** — Check if a panel is liberatable *(source line 69)*
- **`PanelRegistry.is_walkable(gid)`** — Check if a panel is walkable (for enemies) *(source line 79)*
- **`PanelRegistry.is_shadowstep(gid)`** — Check if a panel triggers shadowstep *(source line 89)*

## Tables and data structures

### `PanelRegistry` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PanelRegistry.by_type` *(line 7)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PanelRegistry.gid_to_type` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PanelRegistry.type_gids` *(line 9)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `registered` *(line 18)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | expression/reference | `type_name` |
| `gids` | table | `{}` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/panel_registry.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
