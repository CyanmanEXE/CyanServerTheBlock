# `prompt_vertical.lua`

> **Source:** `scripts/net-games/dialogue/prompt_vertical.lua`  
> **Source lines:** 1200  
> **Functions detected:** 46  
> **Table declarations detected:** 22

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/net-games/dialogue/prompt_vertical.lua Vertical menu prompt helper for net-games Dialogue (adapted to new displayer) NOTE: This version preserves the original logic but marks areas where the new displayer no longer exposes internal fields (pages, current_page, backdrop indicator). These parts will need to be reimplemented using the available APIs.

## Dependencies

- `scripts/displayer/displayer` — line 7
- `scripts/input/input` — line 8

## Events

- `Net:on("tick", function(event) ...)` — line 191. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 11 | `mdbg` | `pid, msg` |
| 32 | `merge_assets` | `overrides` |
| 45 | `play_cursor_move_sfx` | `player_id` |
| 58 | `ensure_backdrop_sprite` | `player_id` |
| 66 | `draw_backdrop` | `player_id, backdrop, z` |
| 95 | `erase_backdrop` | `player_id` |
| 100 | `get_text_width` | `text, font, scale` |
| 113 | `draw_text` | `inst, text, x, y, font, scale, z, id, tint` |
| 154 | `erase_text` | `inst, id` |
| 164 | `ensure_listener` | `(none)` |
| 170 | `set_input_locked` | `player_id, locked` |
| 178 | `mk_id` | `player_id` |
| 182 | `clamp` | `v, a, b` |
| 188 | `ensure_tick` | `(none)` |
| 203 | `provide_ui_assets` | `player_id, assets` |
| 214 | `alloc_ui_sprites` | `inst` |
| 238 | `draw_sprite` | `inst, sprite_id, draw_id, x, y, z, s, anim_state` |
| 254 | `draw_sprite_xy` | `inst, sprite_id, draw_id, x, y, z, sx, sy, anim_state` |
| 270 | `draw_menu_frame_overlay` | `inst, draw_id, x, y, z, s, anim_state, frame_cfg` |
| 297 | `erase_sprite` | `player_id, draw_id` |
| 302 | `normalize_ui` | `ui` |
| 330 | `normalize_layout` | `layout` |
| 399 | `PromptMenuInstance:new` | `player_id, opts` |
| 488 | `PromptMenuInstance:render_textbox` | `(none)` |
| 522 | `PromptMenuInstance:menu_origin` | `(none)` |
| 535 | `PromptMenuInstance:start_close` | `reason, keep_textbox` |
| 562 | `PromptMenuInstance:render_menu_window` | `(none)` |
| 579 | `PromptMenuInstance:clear_menu_text` | `(none)` |
| 586 | `PromptMenuInstance:update_scroll_for_selection` | `force` |
| 604 | `set_textbox_indicator_enabled` | `player_id, box_id, enabled` |
| 611 | `PromptMenuInstance:menu_overlays_visible` | `(none)` |
| 615 | `PromptMenuInstance:set_locked` | `locked` |
| 632 | `PromptMenuInstance:update_cursor_bob` | `dt` |
| 648 | `ease_out_quad` | `x` |
| 660 | `PromptMenuInstance:render_menu_contents` | `force` |
| 868 | `PromptMenuInstance:start_text_intro` | `(none)` |
| 882 | `PromptMenuInstance:become_ready` | `(none)` |
| 910 | `PromptMenuInstance:select_current` | `(none)` |
| 917 | `self._post_close_cb` | `(none)` |
| 921 | `PromptMenuInstance:do_cancel` | `(none)` |
| 927 | `self._post_close_cb` | `(none)` |
| 942 | `PromptMenuInstance:restart_shop_item_intro` | `(none)` |
| 948 | `PromptMenuInstance:update` | `_dt` |
| 1133 | `PromptVertical.menu` | `player_id, opts` |
| 1146 | `PromptVertical._finalize_close` | `player_id, _reason, opts` |
| 1192 | `PromptVertical.close` | `player_id, _reason, opts` |

### Function notes

- **`mdbg(pid, msg)`** *(source line 11)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`merge_assets(overrides)`** *(source line 32)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`play_cursor_move_sfx(player_id)`** *(source line 45)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_backdrop_sprite(player_id)`** *(source line 58)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_backdrop(player_id, backdrop, z)`** *(source line 66)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_backdrop(player_id)`** *(source line 95)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_text_width(text, font, scale)`** — Text drawing helpers using Displayer.Font *(source line 100)*
- **`draw_text(inst, text, x, y, font, scale, z, id, tint)`** *(source line 113)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_text(inst, id)`** *(source line 154)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_listener()`** *(source line 164)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_input_locked(player_id, locked)`** *(source line 170)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`mk_id(player_id)`** *(source line 178)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`clamp(v, a, b)`** *(source line 182)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_tick()`** *(source line 188)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`provide_ui_assets(player_id, assets)`** *(source line 203)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`alloc_ui_sprites(inst)`** *(source line 214)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_sprite(inst, sprite_id, draw_id, x, y, z, s, anim_state)`** *(source line 238)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_sprite_xy(inst, sprite_id, draw_id, x, y, z, sx, sy, anim_state)`** *(source line 254)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_menu_frame_overlay(inst, draw_id, x, y, z, s, anim_state, frame_cfg)`** *(source line 270)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`erase_sprite(player_id, draw_id)`** *(source line 297)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_ui(ui)`** — Layout normalization *(source line 302)*
- **`normalize_layout(layout)`** *(source line 330)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:new(player_id, opts)`** *(source line 399)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:render_textbox()`** *(source line 488)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:menu_origin()`** *(source line 522)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:start_close(reason, keep_textbox)`** *(source line 535)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:render_menu_window()`** *(source line 562)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:clear_menu_text()`** *(source line 579)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:update_scroll_for_selection(force)`** *(source line 586)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_textbox_indicator_enabled(player_id, box_id, enabled)`** *(source line 604)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:menu_overlays_visible()`** *(source line 611)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:set_locked(locked)`** *(source line 615)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:update_cursor_bob(dt)`** *(source line 632)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ease_out_quad(x)`** *(source line 648)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:render_menu_contents(force)`** *(source line 660)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:start_text_intro()`** *(source line 868)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:become_ready()`** *(source line 882)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:select_current()`** *(source line 910)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`self._post_close_cb()`** *(source line 917)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:do_cancel()`** *(source line 921)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`self._post_close_cb()`** *(source line 927)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:restart_shop_item_intro()`** *(source line 942)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptMenuInstance:update(_dt)`** *(source line 948)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptVertical.menu(player_id, opts)`** — Public API *(source line 1133)*
- **`PromptVertical._finalize_close(player_id, _reason, opts)`** *(source line 1146)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`PromptVertical.close(player_id, _reason, opts)`** *(source line 1192)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `PromptVertical` *(line 15)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `PromptVertical.instances` *(line 17)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `DEFAULT_ASSET` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `menu_bg` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_an.png"` |
| `menu_bg_anim` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_an.animation"` |
| `menu_bg_frame` | string literal | `"/server/assets/net-games/ui/prompt_vert_menu_an_frame.png"` |
| `highlight` | string literal | `"/server/assets/net-games/ui/highlight_default.png"` |
| `cursor` | string literal | `"/server/assets/net-games/cursors/green_cursor.png"` |
| `scrollbar` | string literal | `"/server/assets/net-games/ui/scrollbar.png"` |
| `shop_item` | string literal | `"/server/assets/net-games/ui/card_shop_item.png"` |
| `shop_exit` | string literal | `"/server/assets/net-games/ui/card_shop_exit.png"` |

### `out` *(line 33)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `player_backdrop_sprite` *(line 56)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `opts` *(line 117)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `scale` | expression/reference | `scale` |
| `z` | expression/reference | `z` |
| `r` | expression/reference | `tint and tint.r or 255` |
| `g` | expression/reference | `tint and tint.g or 255` |
| `b` | expression/reference | `tint and tint.b or 255` |
| `opacity` | expression/reference | `tint and tint.opacity or 255` |
| `a` | expression/reference | `tint and tint.a or 255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |

### `glyph_ids` *(line 135)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `opts` *(line 242)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `draw_id` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |
| `sx` | expression/reference | `s or 2.0` |
| `sy` | expression/reference | `s or 2.0` |

### `opts` *(line 258)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `draw_id` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |
| `sx` | expression/reference | `sx or 2.0` |
| `sy` | expression/reference | `sy or 2.0` |

### `opts` *(line 280)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `draw_id` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |
| `sx` | expression/reference | `s or 2.0` |
| `sy` | expression/reference | `s or 2.0` |
| `r` | call/expression | `tonumber(frame_cfg.r) or 255` |
| `g` | call/expression | `tonumber(frame_cfg.g) or 255` |
| `b` | call/expression | `tonumber(frame_cfg.b) or 255` |
| `a` | expression/reference | `a` |
| `color_mode` | call/expression | `tonumber(frame_cfg.color_mode) or 2` |

### `o` *(line 303)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `box_id` | expression/reference | `ui.box_id` |
| `font` | expression/reference | `ui.font or "THIN_BLACK"` |
| `scale` | expression/reference | `ui.scale or 2.0` |
| `z` | expression/reference | `ui.z or 100` |
| `x` | expression/reference | `ui.x or 8` |
| `y` | expression/reference | `ui.y or 110` |
| `w` | expression/reference | `ui.w or 224` |
| `h` | expression/reference | `ui.h or 42` |
| `backdrop` | expression/reference | `ui.backdrop or ui.backdrop_config or nil` |
| `mugshot` | expression/reference | `ui.mugshot or nil` |
| `nameplate` | expression/reference | `ui.nameplate` |
| `typing_speed` | expression/reference | `ui.typing_speed or 12` |
| `type_sfx_path` | expression/reference | `ui.type_sfx_path` |
| `type_sfx_min_dt` | expression/reference | `ui.type_sfx_min_dt` |

### `o` *(line 332)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `anchor` | expression/reference | `layout.anchor or "textbox"` |
| `x` | expression/reference | `layout.x` |
| `y` | expression/reference | `layout.y` |
| `offset_x` | expression/reference | `layout.offset_x or 0` |
| `offset_y` | expression/reference | `layout.offset_y or -200` |
| `gap` | expression/reference | `layout.gap or 4` |
| `width` | expression/reference | `layout.width or 160` |
| `height` | expression/reference | `layout.height or 64` |
| `font` | expression/reference | `layout.font or "THIN_BLACK"` |
| `scale` | expression/reference | `layout.scale or 2.0` |
| `z` | expression/reference | `layout.z or 130` |
| `frame` | expression/reference | `layout.frame` |
| `padding_x` | expression/reference | `layout.padding_x or 12` |
| `padding_y` | expression/reference | `layout.padding_y or 10` |
| `row_height` | expression/reference | `layout.row_height or 12` |
| `visible_rows` | call/expression | `tonumber(layout.visible_rows or 5) or 5` |
| `cursor_offset_x` | expression/reference | `layout.cursor_offset_x or 6` |
| `cursor_offset_y` | expression/reference | `layout.cursor_offset_y or 1` |
| `highlight_inset_x` | expression/reference | `layout.highlight_inset_x or 8` |
| `highlight_inset_y` | expression/reference | `layout.highlight_inset_y or 0` |
| `scrollbar_x` | expression/reference | `layout.scrollbar_x or 148` |
| `scrollbar_y` | expression/reference | `layout.scrollbar_y or 12` |
| `scrollbar_h` | expression/reference | `layout.scrollbar_h or 40` |
| `thumb_min_h` | expression/reference | `layout.thumb_min_h or 6` |
| `thumb_w` | expression/reference | `layout.thumb_w or 6` |
| `text_intro_enabled` | call/expression | `(layout.text_intro_enabled == true)` |
| `text_intro_frames` | call/expression | `tonumber(layout.text_intro_frames or 20) or 20` |
| `text_intro_stagger_frames` | call/expression | `tonumber(layout.text_intro_stagger_frames or 3) or 3` |
| `text_intro_slide_px` | call/expression | `tonumber(layout.text_intro_slide_px or 10) or 10` |
| `monies_label_enabled` | call/expression | `(layout.monies_label_enabled == true)` |
| `monies_label_text` | expression/reference | `layout.monies_label_text` |
| `monies_label_font` | expression/reference | `layout.monies_label_font` |
| `monies_label_pad_x` | expression/reference | `layout.monies_label_pad_x` |
| `monies_label_pad_y` | expression/reference | `layout.monies_label_pad_y` |
| `monies_label_z_add` | expression/reference | `layout.monies_label_z_add` |
| `monies_amount_enabled` | call/expression | `(layout.monies_amount_enabled == true)` |
| `monies_amount_text` | expression/reference | `layout.monies_amount_text` |
| `monies_amount_font` | expression/reference | `layout.monies_amount_font` |
| `monies_amount_offset_x` | expression/reference | `layout.monies_amount_offset_x` |
| `monies_amount_offset_y` | expression/reference | `layout.monies_amount_offset_y` |
| `shop_item_enabled` | call/expression | `(layout.shop_item_enabled == true)` |
| `shop_item_pad_x` | expression/reference | `layout.shop_item_pad_x` |
| `shop_item_pad_y` | expression/reference | `layout.shop_item_pad_y` |
| `shop_item_z_add` | expression/reference | `layout.shop_item_z_add` |
| `shop_item_swap_exit` | call/expression | `(layout.shop_item_swap_exit == true)` |
| `shop_item_intro_enabled` | call/expression | `(layout.shop_item_intro_enabled == true)` |
| `shop_item_intro_frames` | call/expression | `tonumber(layout.shop_item_intro_frames or 10) or 10` |
| `shop_item_w` | call/expression | `tonumber(layout.shop_item_w or 0) or 0` |
| `shop_item_h` | call/expression | `tonumber(layout.shop_item_h or 0) or 0` |
| `shop_exit_w` | call/expression | `tonumber(layout.shop_exit_w or 0) or 0` |
| `shop_exit_h` | call/expression | `tonumber(layout.shop_exit_h or 0) or 0` |

### `STATE` *(line 388)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `TEXT` | string literal | `"text"` |
| `MENU` | string literal | `"menu"` |
| `SUBPROMPT` | string literal | `"subprompt"` |
| `CLOSING` | string literal | `"closing"` |

### `PromptMenuInstance` *(line 395)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o.spr` *(line 408)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `MENU_BG` | string literal | `"pv_" .. base .. "_spr_menu_bg"` |
| `MENU_FRAME` | string literal | `"pv_" .. base .. "_spr_menu_frame"` |
| `HILITE` | string literal | `"pv_" .. base .. "_spr_hilite"` |
| `CURSOR` | string literal | `"pv_" .. base .. "_spr_cursor"` |
| `SCROLL` | string literal | `"pv_" .. base .. "_spr_scroll"` |
| `SHOP_ITEM` | string literal | `"pv_" .. base .. "_spr_shop_item"` |
| `SHOP_EXIT` | string literal | `"pv_" .. base .. "_spr_shop_exit"` |

### `o.draw` *(line 446)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `menu_bg` | expression/reference | `base .. "_menu_bg"` |
| `menu_frame` | expression/reference | `base .. "_menu_frame"` |
| `hilite` | expression/reference | `base .. "_menu_hilite"` |
| `cursor` | expression/reference | `base .. "_menu_cursor"` |
| `scroll` | expression/reference | `base .. "_menu_scroll"` |
| `monies` | expression/reference | `base .. "_menu_monies"` |
| `monies_amount` | expression/reference | `base .. "_menu_monies_amount"` |
| `shop_item` | expression/reference | `base .. "_menu_shop_item"` |
| `shop_exit` | expression/reference | `base .. "_menu_shop_exit"` |

### `o.menu_text_ids` *(line 457)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o.text_glyphs` *(line 458)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `text_options` *(line 490)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | expression/reference | `ui.font` |
| `scale` | expression/reference | `ui.scale` |
| `z` | expression/reference | `ui.z` |
| `speed` | expression/reference | `ui.typing_speed` |
| `type_sound` | expression/reference | `ui.type_sfx_path` |
| `type_sound_min_dt` | expression/reference | `ui.type_sfx_min_dt` |

### `self.menu_text_ids` *(line 583)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.menu_text_ids` *(line 773)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `held` *(line 899)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/dialogue/prompt_vertical.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
