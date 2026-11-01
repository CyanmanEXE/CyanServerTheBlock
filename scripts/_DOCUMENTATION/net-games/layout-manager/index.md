# `layout-manager.lua`

> **Source:** `scripts/net-games/layout-manager.lua`  
> **Source lines:** 1233  
> **Functions detected:** 45  
> **Table declarations detected:** 34

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

layout_manager.lua A comprehensive layout system for managing sprites, resources, and animations. Integrates with Net Games framework, AnimationEngine, and sound effects.

## Dependencies

- `scripts/animation-engine/animation-engine` — line 9
- `scripts/animation-engine/animation-sequences` — line 11
- `scripts/boom/main` — line 12

## Events

- `Net:on("tick", function(event) ...)` — line 1210. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 38 | `get_layout` | `player_id, layout_id` |
| 47 | `get_sprite` | `player_id, layout_id, object_id` |
| 57 | `ensure_resource` | `player_id, resource_id, texture_path, anim_path, anim_state` |
| 111 | `update_sprite_instance` | `player_id, instance_id, resource_id, properties, layout_properties` |
| 202 | `remove_sprite_instance` | `player_id, instance_id` |
| 207 | `compute_position` | `layout, index, use_order` |
| 271 | `recompute_layout` | `layout` |
| 304 | `mark_dirty` | `player_id, layout_id` |
| 311 | `process_dirty_layouts` | `(none)` |
| 328 | `LayoutManager.create_layout` | `player_id, layout_id, options` |
| 375 | `LayoutManager.add_sprite` | `player_id, layout_id, resource_id, object_id, properties` |
| 440 | `LayoutManager.remove_sprite` | `player_id, layout_id, object_id, properties` |
| 458 | `LayoutManager.remove_layout` | `player_id, layout_id` |
| 470 | `LayoutManager.arrange_layout` | `player_id, layout_id` |
| 476 | `LayoutManager.set_layout_property` | `player_id, layout_id, property, value, mode, duration, easing, sound` |
| 493 | `on_update` | `values` |
| 497 | `on_complete` | `(none)` |
| 514 | `LayoutManager.set_sprite_property` | `player_id, layout_id, object_id, property, value, mode, duration, easing, sound` |
| 544 | `on_update` | `values` |
| 556 | `on_complete` | `(none)` |
| 573 | `LayoutManager.get_sprite_proxy` | `player_id, layout_id, object_id` |
| 599 | `LayoutManager.animate_layout_property` | `player_id, layout_id, property, target, duration, options` |
| 610 | `on_update` | `values` |
| 619 | `LayoutManager.animate_sprite_property` | `player_id, layout_id, object_id, property, target, duration, options` |
| 636 | `on_update` | `values` |
| 659 | `LayoutManager.reorder_sprite` | `player_id, layout_id, object_id, new_index` |
| 693 | `LayoutManager.swap_sprites` | `player_id, layout_id, object_id_a, object_id_b, swap_properties` |
| 722 | `LayoutManager.move_sprite_before` | `player_id, layout_id, object_id_to_move, reference_object_id` |
| 751 | `LayoutManager.move_sprite_after` | `player_id, layout_id, object_id_to_move, reference_object_id` |
| 784 | `capture_positions` | `layout` |
| 793 | `apply_positions` | `layout, positions` |
| 805 | `compute_final_positions` | `layout, new_order` |
| 815 | `animate_sprites_to_positions` | `layout, old_positions, new_positions, duration, easing, on_complete` |
| 830 | `on_complete` | `(none)` |
| 848 | `LayoutManager.add_sprite_animated` | `player_id, layout_id, resource_id, object_id, properties, anim_options` |
| 933 | `on_complete` | `(none)` |
| 955 | `on_complete` | `(none)` |
| 973 | `LayoutManager.remove_sprite_animated` | `player_id, layout_id, object_id, anim_options` |
| 1040 | `on_complete` | `(none)` |
| 1061 | `LayoutManager.swap_sprites_animated` | `player_id, layout_id, object_id_a, object_id_b, swap_properties, anim_options` |
| 1096 | `LayoutManager.reorder_sprite_animated` | `player_id, layout_id, object_id, new_index, anim_options` |
| 1130 | `LayoutManager.move_sprite_before_animated` | `player_id, layout_id, object_id_to_move, reference_object_id, anim_options` |
| 1165 | `LayoutManager.move_sprite_after_animated` | `player_id, layout_id, object_id_to_move, reference_object_id, anim_options` |
| 1204 | `LayoutManager.on_tick` | `delta_time` |
| 1217 | `LayoutManager.clear_player` | `player_id` |

### Function notes

- **`get_layout(player_id, layout_id)`** — Validate that a player has a layout with given id *(source line 38)*
- **`get_sprite(player_id, layout_id, object_id)`** — Validate that a sprite exists in a layout *(source line 47)*
- **`ensure_resource(player_id, resource_id, texture_path, anim_path, anim_state)`** — Allocate a sprite resource if not already allocated for the player *(source line 57)*
- **`update_sprite_instance(player_id, instance_id, resource_id, properties, layout_properties)`** — Create or update a sprite instance *(source line 111)*
- **`remove_sprite_instance(player_id, instance_id)`** — Remove a sprite instance *(source line 202)*
- **`compute_position(layout, index, use_order)`** — Compute the position of a sprite based on layout mode and index *(source line 207)*
- **`recompute_layout(layout)`** — Recompute positions for all sprites in a layout and update instances *(source line 271)*
- **`mark_dirty(player_id, layout_id)`** — Mark a layout as dirty so it will be recomputed on next tick *(source line 304)*
- **`process_dirty_layouts()`** — Process all dirty layouts *(source line 311)*
- **`LayoutManager.create_layout(player_id, layout_id, options)`** — Create a new layout for a player *(source line 328)*
- **`LayoutManager.add_sprite(player_id, layout_id, resource_id, object_id, properties)`** — Add a sprite to a layout *(source line 375)*
- **`LayoutManager.remove_sprite(player_id, layout_id, object_id, properties)`** — Remove a sprite from a layout *(source line 440)*
- **`LayoutManager.remove_layout(player_id, layout_id)`** — Remove an entire layout (and all its sprites) *(source line 458)*
- **`LayoutManager.arrange_layout(player_id, layout_id)`** — Arrange layout (recompute positions) immediately *(source line 470)*
- **`LayoutManager.set_layout_property(player_id, layout_id, property, value, mode, duration, easing, sound)`** — Set a global property on the layout (with optional animation) *(source line 476)*
- **`on_update(values)`** *(source line 493)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 497)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LayoutManager.set_sprite_property(player_id, layout_id, object_id, property, value, mode, duration, easing, sound)`** — Set a property on a specific sprite *(source line 514)*
- **`on_update(values)`** *(source line 544)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 556)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LayoutManager.get_sprite_proxy(player_id, layout_id, object_id)`** — Get a proxy object for a sprite (to be used with AnimationEngine.tween) *(source line 573)*
- **`LayoutManager.animate_layout_property(player_id, layout_id, property, target, duration, options)`** — Animate a layout property using AnimationEngine.tween (convenience) *(source line 599)*
- **`on_update(values)`** *(source line 610)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LayoutManager.animate_sprite_property(player_id, layout_id, object_id, property, target, duration, options)`** — Animate a sprite property using AnimationEngine.tween *(source line 619)*
- **`on_update(values)`** *(source line 636)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LayoutManager.reorder_sprite(player_id, layout_id, object_id, new_index)`** — Reorder a sprite to a new position (index) in the layout's ordering. The layout's arrangement order is based on the order in which sprites were added. This function changes that order without affecting existing sprite properties. *(source line 659)*
- **`LayoutManager.swap_sprites(player_id, layout_id, object_id_a, object_id_b, swap_properties)`** — Swap the positions of two sprites in the layout (by object_id). This swaps their order and optionally swaps their stored properties. *(source line 693)*
- **`LayoutManager.move_sprite_before(player_id, layout_id, object_id_to_move, reference_object_id)`** — Move a sprite to a new position (object_id) within the layout, inserting before another sprite. *(source line 722)*
- **`LayoutManager.move_sprite_after(player_id, layout_id, object_id_to_move, reference_object_id)`** — Move a sprite to a new position (object_id) within the layout, inserting after another sprite. *(source line 751)*
- **`capture_positions(layout)`** — Helper: capture current positions of sprites in a layout *(source line 784)*
- **`apply_positions(layout, positions)`** — Helper: apply positions to sprites (updates properties and redraws) *(source line 793)*
- **`compute_final_positions(layout, new_order)`** — Helper: compute final positions after a structural change (without modifying layout) *(source line 805)*
- **`animate_sprites_to_positions(layout, old_positions, new_positions, duration, easing, on_complete)`** — Helper: animate sprites from old positions to new positions *(source line 815)*
- **`on_complete()`** *(source line 830)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LayoutManager.add_sprite_animated(player_id, layout_id, resource_id, object_id, properties, anim_options)`** — Add a sprite with an entrance animation *(source line 848)*
- **`on_complete()`** *(source line 933)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 955)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LayoutManager.remove_sprite_animated(player_id, layout_id, object_id, anim_options)`** — Remove a sprite with an exit animation *(source line 973)*
- **`on_complete()`** *(source line 1040)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`LayoutManager.swap_sprites_animated(player_id, layout_id, object_id_a, object_id_b, swap_properties, anim_options)`** — Swap sprites with animation *(source line 1061)*
- **`LayoutManager.reorder_sprite_animated(player_id, layout_id, object_id, new_index, anim_options)`** — Reorder sprite with animation *(source line 1096)*
- **`LayoutManager.move_sprite_before_animated(player_id, layout_id, object_id_to_move, reference_object_id, anim_options)`** — Move sprite before another with animation *(source line 1130)*
- **`LayoutManager.move_sprite_after_animated(player_id, layout_id, object_id_to_move, reference_object_id, anim_options)`** — Move sprite after another with animation *(source line 1165)*
- **`LayoutManager.on_tick(delta_time)`** — Tick handler to process dirty layouts *(source line 1204)*
- **`LayoutManager.clear_player(player_id)`** — Clear all data for a player (on disconnect) *(source line 1217)*

## Tables and data structures

### `LayoutManager` *(line 4)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `resources` *(line 19)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `instances` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `layouts` *(line 25)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `dirty_layouts` *(line 28)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `state_dimensions` *(line 74)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `final` *(line 119)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `layout` *(line 334)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `layout_id` |
| `player_id` | expression/reference | `player_id` |
| `mode` | expression/reference | `options.mode or "grid"` |
| `options` | table | `{ rows = options.rows, columns = options.columns, spacing_x = options.spacing_x or 0, spacing_y = options.spacing_y or 0, stagger = options.…` |
| `global_properties` | table | `{ scale = { value = options.global_scale or 1, mode = options.global_scale_mode or "relative" }, rotation = { value = options.global_rotatio…` |
| `sprites` | table | `{}` |
| `order` | table | `{}` |
| `origin_x` | expression/reference | `options.origin_x or 0` |
| `origin_y` | expression/reference | `options.origin_y or 0` |
| `suppress_dirty` | boolean literal | `false` |

### `options` *(line 339)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `rows` | expression/reference | `options.rows` |
| `columns` | expression/reference | `options.columns` |
| `spacing_x` | expression/reference | `options.spacing_x or 0` |
| `spacing_y` | expression/reference | `options.spacing_y or 0` |
| `stagger` | expression/reference | `options.stagger` |
| `wrap` | expression/reference | `options.wrap` |
| `restrict_to_bounds` | expression/reference | `options.restrict_to_bounds or false` |
| `scrollable` | expression/reference | `options.scrollable or false` |
| `viewport_offset` | expression/reference | `options.viewport_offset or { x = 0, y = 0 }` |
| `radius` | expression/reference | `options.radius` |
| `offset_x` | expression/reference | `options.offset_x` |
| `offset_y` | expression/reference | `options.offset_y` |

### `global_properties` *(line 353)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `scale` | table | `{ value = options.global_scale or 1, mode = options.global_scale_mode or "relative" }` |
| `rotation` | table | `{ value = options.global_rotation or 0, mode = options.global_rotation_mode or "relative" }` |
| `opacity` | table | `{ value = options.global_opacity or 255, mode = options.global_opacity_mode or "relative" }` |
| `color` | table | `{ value = options.global_color or { r=255, g=255, b=255 }, mode = options.global_color_mode or "relative" }` |
| `z` | table | `{ value = options.global_z or 0, mode = options.global_z_mode or "relative" }` |

### `scale` *(line 354)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `options.global_scale or 1` |
| `mode` | expression/reference | `options.global_scale_mode or "relative"` |

### `rotation` *(line 355)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `options.global_rotation or 0` |
| `mode` | expression/reference | `options.global_rotation_mode or "relative"` |

### `opacity` *(line 356)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `options.global_opacity or 255` |
| `mode` | expression/reference | `options.global_opacity_mode or "relative"` |

### `color` *(line 357)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `options.global_color or { r=255, g=255, b=255 }` |
| `mode` | expression/reference | `options.global_color_mode or "relative"` |

### `z` *(line 358)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `options.global_z or 0` |
| `mode` | expression/reference | `options.global_z_mode or "relative"` |

### `sprites` *(line 360)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `order` *(line 361)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `sprite_props` *(line 400)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `properties.x or 0` |
| `y` | expression/reference | `properties.y or 0` |
| `z` | expression/reference | `properties.z or 0` |
| `sx` | expression/reference | `properties.sx or 1` |
| `sy` | expression/reference | `properties.sy or 1` |
| `ro` | expression/reference | `properties.ro or 0` |
| `ox` | expression/reference | `properties.ox or 0` |
| `oy` | expression/reference | `properties.oy or 0` |
| `a` | expression/reference | `properties.a or 255` |
| `r` | expression/reference | `properties.r or 255` |
| `g` | expression/reference | `properties.g or 255` |
| `b` | expression/reference | `properties.b or 255` |
| `color_mode` | expression/reference | `properties.color_mode or 0` |
| `anim_state` | expression/reference | `current_state` |
| `opacity` | expression/reference | `properties.opacity or 255` |
| `sprite_width` | expression/reference | `sprite_width` |
| `sprite_height` | expression/reference | `sprite_height` |

### `sprite_data` *(line 421)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `resource_id` | expression/reference | `resource_id` |
| `object_id` | expression/reference | `object_id` |
| `instance_id` | expression/reference | `instance_id` |
| `properties` | expression/reference | `sprite_props` |

### `target` *(line 489)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `value` |

### `start` *(line 490)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `old_value` |

### `start` *(line 530)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `target` *(line 532)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `discrete` *(line 536)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `proxy` *(line 575)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `properties` *(line 578)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"x"` |
| `[2]` | string literal | `"y"` |
| `[3]` | string literal | `"z"` |
| `[4]` | string literal | `"sx"` |
| `[5]` | string literal | `"sy"` |
| `[6]` | string literal | `"ro"` |
| `[7]` | string literal | `"ox"` |
| `[8]` | string literal | `"oy"` |
| `[9]` | string literal | `"a"` |
| `[10]` | string literal | `"r"` |
| `[11]` | string literal | `"g"` |
| `[12]` | string literal | `"b"` |
| `[13]` | string literal | `"opacity"` |
| `[14]` | string literal | `"anim_state"` |

### `start` *(line 605)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `prop.value` |

### `target_tbl` *(line 606)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `value` | expression/reference | `target` |

### `start` *(line 621)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `target_tbl` *(line 623)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `positions` *(line 785)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `positions` *(line 806)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `target` *(line 941)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `target` *(line 1024)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/layout-manager.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
