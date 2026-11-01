# `main.lua`

> **Source:** `scripts/net-games/menuAPI/main.lua`  
> **Source lines:** 732  
> **Functions detected:** 46  
> **Table declarations detected:** 27

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/net-games/menuAPI/main.lua Reusable BN-style menu layer for net-games. This is a creator-side rewrite inspired by the production MenuAPI used by shadis_hp. It intentionally depends only on net-games/Displayer/Input and does not contain pet, inventory, LMenu, or server-specific business logic.

## Dependencies

- `scripts/net-games/main` — line 8
- `scripts/displayer/displayer` — line 10
- `scripts/input-controller/main` — line 11
- `scripts/net-games/ui-safe` — line 12
- `scripts/net-games/ui-suppression` — line 13

## Events

- `Net:on("tick", function(event) ...)` — line 673. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 723. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 18 | `get_controller` | `player_id` |
| 23 | `menu_input_owner` | `player_id` |
| 27 | `guard_input` | `player_id, swallow_seconds` |
| 60 | `tint_copy` | `src` |
| 76 | `MenuAPI.get_palette` | `name` |
| 153 | `copy_table` | `src` |
| 161 | `merge` | `dst, src` |
| 169 | `resolve_type` | `value` |
| 178 | `stack_for` | `player_id, create` |
| 183 | `active` | `player_id` |
| 190 | `set_input_locked` | `player_id, locked` |
| 217 | `play_sfx` | `player_id, path` |
| 222 | `normalize_rows` | `rows` |
| 236 | `row_selectable` | `row` |
| 240 | `first_selectable` | `rows` |
| 245 | `next_selectable` | `rows, start, direction` |
| 256 | `ensure_visible` | `st` |
| 267 | `sprite_key` | `st, key` |
| 268 | `text_key` | `st, key` |
| 270 | `draw_text` | `st, key, text, x, y, options` |
| 277 | `erase_text` | `st, key` |
| 281 | `tint_options` | `tint, extra` |
| 293 | `draw_background` | `st` |
| 306 | `draw_title` | `st` |
| 312 | `clear_visible_rows` | `st` |
| 321 | `draw_rows` | `st` |
| 362 | `draw_cursor` | `st` |
| 377 | `draw_scroll` | `st` |
| 394 | `draw_profile` | `st` |
| 432 | `draw_confirm` | `st` |
| 451 | `full_draw` | `st` |
| 457 | `cleanup` | `st` |
| 467 | `move_selection` | `st, direction` |
| 489 | `confirm` | `st` |
| 505 | `handle_cancel` | `st` |
| 514 | `MenuAPI.open` | `player_id, spec` |
| 585 | `MenuAPI.close` | `player_id, opts` |
| 613 | `MenuAPI.close_all` | `player_id, opts` |
| 628 | `MenuAPI.is_open` | `player_id` |
| 629 | `MenuAPI.get_state` | `player_id` |
| 630 | `MenuAPI.get_stack` | `player_id` |
| 632 | `MenuAPI.refresh` | `player_id` |
| 639 | `MenuAPI.set_rows` | `player_id, rows, preserve_selection` |
| 653 | `MenuAPI.set_profile` | `player_id, profile` |
| 661 | `MenuAPI.set_title` | `player_id, title` |
| 666 | `MenuAPI.handle_cancel` | `player_id` |

### Function notes

- **`get_controller(player_id)`** *(source line 18)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`menu_input_owner(player_id)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`guard_input(player_id, swallow_seconds)`** *(source line 27)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`tint_copy(src)`** *(source line 60)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.get_palette(name)`** *(source line 76)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`copy_table(src)`** *(source line 153)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`merge(dst, src)`** *(source line 161)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_type(value)`** *(source line 169)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`stack_for(player_id, create)`** *(source line 178)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`active(player_id)`** *(source line 183)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_input_locked(player_id, locked)`** *(source line 190)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`play_sfx(player_id, path)`** *(source line 217)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_rows(rows)`** *(source line 222)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`row_selectable(row)`** *(source line 236)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`first_selectable(rows)`** *(source line 240)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`next_selectable(rows, start, direction)`** *(source line 245)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_visible(st)`** *(source line 256)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sprite_key(st, key)`** *(source line 267)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`text_key(st, key)`** *(source line 268)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_text(st, key, text, x, y, options)`** *(source line 270)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_text(st, key)`** *(source line 277)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`tint_options(tint, extra)`** *(source line 281)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_background(st)`** *(source line 293)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_title(st)`** *(source line 306)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`clear_visible_rows(st)`** *(source line 312)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_rows(st)`** *(source line 321)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_cursor(st)`** *(source line 362)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_scroll(st)`** *(source line 377)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_profile(st)`** *(source line 394)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_confirm(st)`** *(source line 432)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`full_draw(st)`** *(source line 451)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cleanup(st)`** *(source line 457)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`move_selection(st, direction)`** *(source line 467)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`confirm(st)`** *(source line 489)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`handle_cancel(st)`** *(source line 505)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.open(player_id, spec)`** *(source line 514)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.close(player_id, opts)`** *(source line 585)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.close_all(player_id, opts)`** *(source line 613)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.is_open(player_id)`** *(source line 628)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.get_state(player_id)`** *(source line 629)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.get_stack(player_id)`** *(source line 630)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.refresh(player_id)`** *(source line 632)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.set_rows(player_id, rows, preserve_selection)`** *(source line 639)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.set_profile(player_id, profile)`** *(source line 653)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.set_title(player_id, title)`** *(source line 661)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`MenuAPI.handle_cancel(player_id)`** *(source line 666)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `MenuAPI` *(line 14)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `cfg` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `open_sfx` | string literal | `"/server/assets/net-games/sfx/screen_open.ogg"` |
| `move_sfx` | string literal | `"/server/assets/net-games/sfx/cursor_move.ogg"` |
| `choose_sfx` | string literal | `"/server/assets/net-games/sfx/choose.ogg"` |
| `cancel_sfx` | string literal | `"/server/assets/net-games/sfx/cancel.ogg"` |
| `title_tint` | table | `{ r = 18, g = 42, b = 100, color_mode = 2 }` |
| `row_tint` | table | `{ r = 95, g = 100, b = 108, color_mode = 2 }` |
| `right_tint` | table | `{ r = 95, g = 100, b = 108, color_mode = 2 }` |
| `disabled_tint` | table | `{ r = 110, g = 110, b = 110, color_mode = 0, opacity = 150 }` |
| `lock_input_by_default` | boolean literal | `true` |
| `asset_root` | string literal | `"/server/assets/ui/menuAPI/"` |

### `title_tint` *(line 49)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `18` |
| `g` | number literal | `42` |
| `b` | number literal | `100` |
| `color_mode` | number literal | `2` |

### `row_tint` *(line 51)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `95` |
| `g` | number literal | `100` |
| `b` | number literal | `108` |
| `color_mode` | number literal | `2` |

### `right_tint` *(line 52)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `95` |
| `g` | number literal | `100` |
| `b` | number literal | `108` |
| `color_mode` | number literal | `2` |

### `disabled_tint` *(line 53)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `110` |
| `g` | number literal | `110` |
| `b` | number literal | `110` |
| `color_mode` | number literal | `0` |
| `opacity` | number literal | `150` |

### `out` *(line 61)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `MenuAPI.tint_palettes` *(line 65)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `default` | table | `{ title_tint = tint_copy(cfg.title_tint), row_tint = tint_copy(cfg.row_tint), right_tint = tint_copy(cfg.right_tint) }` |
| `red` | table | `{ title_tint = {r=120,g=20,b=24,color_mode=2}, row_tint={r=128,g=27,b=27,color_mode=2}, right_tint={r=120,g=50,b=50,color_mode=2} }` |
| `blue` | table | `{ title_tint = {r=18,g=42,b=100,color_mode=2}, row_tint={r=70,g=90,b=125,color_mode=2}, right_tint={r=65,g=85,b=120,color_mode=2} }` |
| `green` | table | `{ title_tint = {r=20,g=95,b=55,color_mode=2}, row_tint={r=65,g=105,b=75,color_mode=2}, right_tint={r=55,g=115,b=70,color_mode=2} }` |
| `gold` | table | `{ title_tint = {r=145,g=95,b=20,color_mode=2}, row_tint={r=115,g=95,b=55,color_mode=2}, right_tint={r=135,g=100,b=35,color_mode=2} }` |
| `purple` | table | `{ title_tint = {r=95,g=40,b=125,color_mode=2}, row_tint={r=95,g=80,b=115,color_mode=2}, right_tint={r=105,g=75,b=125,color_mode=2} }` |
| `gray` | table | `{ title_tint = {r=55,g=60,b=70,color_mode=2}, row_tint={r=95,g=100,b=108,color_mode=2}, right_tint={r=95,g=100,b=108,color_mode=2} }` |

### `default` *(line 67)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `title_tint` | call/expression | `tint_copy(cfg.title_tint)` |
| `row_tint` | call/expression | `tint_copy(cfg.row_tint)` |
| `right_tint` | call/expression | `tint_copy(cfg.right_tint)` |

### `red` *(line 68)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `title_tint` | table | `{r=120,g=20,b=24,color_mode=2}` |
| `row_tint` | table | `{r=128,g=27,b=27,color_mode=2}` |
| `right_tint` | table | `{r=120,g=50,b=50,color_mode=2}` |

### `blue` *(line 69)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `title_tint` | table | `{r=18,g=42,b=100,color_mode=2}` |
| `row_tint` | table | `{r=70,g=90,b=125,color_mode=2}` |
| `right_tint` | table | `{r=65,g=85,b=120,color_mode=2}` |

### `green` *(line 70)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `title_tint` | table | `{r=20,g=95,b=55,color_mode=2}` |
| `row_tint` | table | `{r=65,g=105,b=75,color_mode=2}` |
| `right_tint` | table | `{r=55,g=115,b=70,color_mode=2}` |

### `gold` *(line 71)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `title_tint` | table | `{r=145,g=95,b=20,color_mode=2}` |
| `row_tint` | table | `{r=115,g=95,b=55,color_mode=2}` |
| `right_tint` | table | `{r=135,g=100,b=35,color_mode=2}` |

### `purple` *(line 72)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `title_tint` | table | `{r=95,g=40,b=125,color_mode=2}` |
| `row_tint` | table | `{r=95,g=80,b=115,color_mode=2}` |
| `right_tint` | table | `{r=105,g=75,b=125,color_mode=2}` |

### `gray` *(line 73)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `title_tint` | table | `{r=55,g=60,b=70,color_mode=2}` |
| `row_tint` | table | `{r=95,g=100,b=108,color_mode=2}` |
| `right_tint` | table | `{r=95,g=100,b=108,color_mode=2}` |

### `MENU_TYPES` *(line 79)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `[1] = { name = "scroll_list", selectable = true, vertical = true, layout = { texture = cfg.asset_root .. "menu1.png", x = 49, y = 17, z = 22…` |
| `[2]` | expression/reference | `[2] = { name = "info_window", selectable = false, vertical = false, layout = { texture = cfg.asset_root .. "menu2.png", x = 49, y = 17, z = …` |
| `[3]` | expression/reference | `[3] = { name = "compact_menu", selectable = true, vertical = true, layout = { texture = cfg.asset_root .. "menu2.png", x = 49, y = 17, z = 2…` |
| `[4]` | expression/reference | `[4] = { name = "confirm_prompt", selectable = true, horizontal = true, layout = { texture = cfg.asset_root .. "menu2.png", x = 49, y = 17, z…` |
| `[5]` | expression/reference | `[5] = { name = "profile_list", selectable = true, vertical = true, layout = { profile_texture = cfg.asset_root .. "menu3.png", profile_x = 1…` |

### `layout` *(line 85)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `cfg.asset_root .. "menu1.png"` |
| `x` | number literal | `49` |
| `y` | number literal | `17` |
| `z` | number literal | `220` |
| `scale` | number literal | `2` |
| `title_x` | number literal | `17` |
| `title_y` | number literal | `1` |
| `title_font` | string literal | `"THICK"` |
| `title_scale` | number literal | `1.5` |
| `row_x` | number literal | `13` |
| `row_y` | number literal | `16` |
| `row_font` | string literal | `"THICK"` |
| `row_scale` | number literal | `1.5` |
| `row_advance` | number literal | `13` |
| `right_x` | number literal | `103` |
| `right_font` | string literal | `"THICK"` |
| `right_scale` | number literal | `1.5` |
| `visible_rows` | number literal | `8` |
| `cursor_texture` | expression/reference | `cfg.asset_root .. "cursor.png"` |
| `cursor_x` | number literal | `1` |
| `cursor_y_offset` | number literal | `-2` |
| `cursor_scale` | number literal | `2` |
| `scroll_texture` | expression/reference | `cfg.asset_root .. "scroll.png"` |
| `scroll_x` | number literal | `131` |
| `scroll_top_y` | number literal | `11` |
| `scroll_bottom_y` | number literal | `106` |
| `scroll_h` | number literal | `13` |
| `scroll_scale` | number literal | `2` |

### `layout` *(line 99)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `cfg.asset_root .. "menu2.png"` |
| `x` | number literal | `49` |
| `y` | number literal | `17` |
| `z` | number literal | `220` |
| `scale` | number literal | `2` |
| `title_x` | number literal | `17` |
| `title_y` | number literal | `1` |
| `title_font` | string literal | `"THICK"` |
| `title_scale` | number literal | `1.5` |
| `row_x` | number literal | `13` |
| `row_y` | number literal | `16` |
| `row_font` | string literal | `"THICK"` |
| `row_scale` | number literal | `1.5` |
| `row_advance` | number literal | `13` |
| `visible_rows` | number literal | `4` |

### `layout` *(line 110)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `cfg.asset_root .. "menu2.png"` |
| `x` | number literal | `49` |
| `y` | number literal | `17` |
| `z` | number literal | `220` |
| `scale` | number literal | `2` |
| `title_x` | number literal | `17` |
| `title_y` | number literal | `1` |
| `title_font` | string literal | `"THICK"` |
| `title_scale` | number literal | `1.5` |
| `row_x` | number literal | `13` |
| `row_y` | number literal | `16` |
| `row_font` | string literal | `"THICK"` |
| `row_scale` | number literal | `1.5` |
| `row_advance` | number literal | `13` |
| `visible_rows` | number literal | `4` |
| `cursor_texture` | expression/reference | `cfg.asset_root .. "cursor.png"` |
| `cursor_x` | number literal | `1` |
| `cursor_y_offset` | number literal | `-2` |
| `cursor_scale` | number literal | `2` |

### `layout` *(line 122)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture` | expression/reference | `cfg.asset_root .. "menu2.png"` |
| `x` | number literal | `49` |
| `y` | number literal | `17` |
| `z` | number literal | `220` |
| `scale` | number literal | `2` |
| `title_x` | number literal | `17` |
| `title_y` | number literal | `1` |
| `title_font` | string literal | `"THICK"` |
| `title_scale` | number literal | `1.5` |
| `line_x` | number literal | `13` |
| `line_y` | number literal | `16` |
| `line_font` | string literal | `"THICK"` |
| `line_scale` | number literal | `1.5` |
| `line_advance` | number literal | `13` |
| `choice_y` | number literal | `55` |
| `yes_x` | number literal | `25` |
| `no_x` | number literal | `82` |
| `choice_scale` | number literal | `1.5` |

### `layout` *(line 133)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `profile_texture` | expression/reference | `cfg.asset_root .. "menu3.png"` |
| `profile_x` | number literal | `144` |
| `profile_y` | number literal | `20` |
| `profile_z` | number literal | `220` |
| `profile_scale` | number literal | `2` |
| `mug_x` | number literal | `4` |
| `mug_y` | number literal | `13` |
| `mug_scale` | number literal | `1` |
| `profile_title_x` | number literal | `17` |
| `profile_title_y` | number literal | `2` |
| `profile_title_font` | string literal | `"THICK_BLACK"` |
| `profile_title_scale` | number literal | `1.8` |
| `profile_text_x` | number literal | `40` |
| `profile_text_y` | number literal | `24` |
| `profile_text_advance` | number literal | `10` |
| `profile_font` | string literal | `"THICK"` |
| `profile_text_scale` | number literal | `1.5` |
| `texture` | expression/reference | `cfg.asset_root .. "menu1.png"` |
| `x` | number literal | `2` |
| `y` | number literal | `20` |
| `z` | number literal | `220` |
| `scale` | number literal | `2` |
| `title_x` | number literal | `17` |
| `title_y` | number literal | `1` |
| `title_font` | string literal | `"THICK"` |
| `title_scale` | number literal | `1.5` |
| `row_x` | number literal | `13` |
| `row_y` | number literal | `16` |
| `row_font` | string literal | `"THICK"` |
| `row_scale` | number literal | `1.5` |
| `row_advance` | number literal | `13` |
| `right_x` | number literal | `96` |
| `right_font` | string literal | `"THICK"` |
| `right_scale` | number literal | `1.5` |
| `visible_rows` | number literal | `8` |
| `cursor_texture` | expression/reference | `cfg.asset_root .. "cursor.png"` |
| `cursor_x` | number literal | `1` |
| `cursor_y_offset` | number literal | `-2` |
| `cursor_scale` | number literal | `2` |
| `scroll_texture` | expression/reference | `cfg.asset_root .. "scroll.png"` |
| `scroll_x` | number literal | `131` |
| `scroll_top_y` | number literal | `11` |
| `scroll_bottom_y` | number literal | `106` |
| `scroll_h` | number literal | `13` |
| `scroll_scale` | number literal | `2` |

### `stacks` *(line 149)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 154)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `input_lock_handles` *(line 187)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 223)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `opts` *(line 283)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `1.5` |
| `z` | number literal | `225` |
| `r` | expression/reference | `tint.r or 255` |
| `g` | expression/reference | `tint.g or 255` |
| `b` | expression/reference | `tint.b or 255` |
| `opacity` | expression/reference | `tint.opacity or 255` |
| `a` | expression/reference | `tint.a or 255` |
| `color_mode` | expression/reference | `tint.color_mode or 0` |

### `st` *(line 526)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `player_id` | expression/reference | `player_id` |
| `type` | expression/reference | `type_id` |
| `type_name` | expression/reference | `def.name` |
| `prefix` | string literal | `"menuapi_" .. tostring(player_id) .. "_" .. tostring(next_id)` |
| `layout` | expression/reference | `layout` |
| `title` | expression/reference | `spec.title or "Menu"` |
| `rows` | call/expression | `normalize_rows(spec.rows)` |
| `cursor` | number literal | `1` |
| `top_index` | number literal | `1` |
| `profile` | call/expression | `copy_table(spec.profile)` |
| `lines` | call/expression | `copy_table(spec.lines)` |
| `choice` | call/expression | `(tonumber(spec.default_selection) == 2 or tostring(spec.default_selection):lower() == "no") and 2 or 1` |
| `yes_text` | expression/reference | `spec.yes_text` |
| `no_text` | expression/reference | `spec.no_text` |
| `title_tint` | call/expression | `copy_table(spec.title_tint or palette.title_tint)` |
| `row_tint` | call/expression | `copy_table(spec.row_tint or palette.row_tint)` |
| `right_tint` | call/expression | `copy_table(spec.right_tint or palette.right_tint)` |
| `bg_tint` | call/expression | `copy_table(spec.bg_tint)` |
| `on_select` | expression/reference | `spec.on_select` |
| `on_move` | expression/reference | `spec.on_move` |
| `on_cancel` | expression/reference | `spec.on_cancel` |
| `on_result` | expression/reference | `spec.on_result` |
| `on_close` | expression/reference | `spec.on_close` |
| `close_on_select` | expression/reference | `spec.close_on_select` |
| `lock_input` | expression/reference | `spec.lock_input ~= false and cfg.lock_input_by_default` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/menuAPI/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
