# `main.lua`

> **Source:** `scripts/net-games/main.lua`  
> **Source lines:** 2604  
> **Functions detected:** 123  
> **Table declarations detected:** 53

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

- `scripts/displayer/displayer` — line 11
- `scripts/animation-engine/animation-engine` — line 12
- `scripts/boom/main` — line 13
- `scripts/input-controller/main` — line 14

## Events

- `Net:on("player_request", function(event) ...)` — line 134. The event name is taken directly from this source.
- `Net:on("virtual_input", function(event) ...)` — line 2309. The event name is taken directly from this source.
- `Net:on("tick", function(event) ...)` — line 2398. The event name is taken directly from this source.
- `Net:on("cursor_move", function(event) ...)` — line 2434. The event name is taken directly from this source.
- `Net:on("player_join", function(event) ...)` — line 2473. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 2491. The event name is taken directly from this source.
- `Net:on("player_move", function(event) ...)` — line 2536. The event name is taken directly from this source.
- `Net:on("player_area_transfer", function(event) ...)` — line 2585. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 56 | `round_fraction` | `value, denominator` |
| 63 | `convertOffsets` | `horizontalOffset, verticalOffset, Z` |
| 69 | `fixOffsets` | `a, b` |
| 89 | `normalize_color` | `color` |
| 105 | `async` | `p` |
| 110 | `await` | `v` |
| 114 | `table_has_value` | `tab, val` |
| 123 | `exclude_except_for` | `player_id, bot_id` |
| 143 | `try_move_player` | `player_id, area_id, x, y, z` |
| 175 | `try_animate_player` | `player_id, anim_state` |
| 197 | `frame.move_frozen_player` | `player_id, x, y, z` |
| 205 | `frame.animate_frozen_player` | `player_id, anim_state` |
| 229 | `frame.set_cosmetic` | `cosmetic_id, player_id, texture, animation, state, x, y, visible, player_xoffset, player_yoffset, anim_duration, scale, bot_scale, owner_sprite_state, owner_sprite_enabled, movement_duration` |
| 385 | `frame.remove_cosmetic` | `cosmetic_id, player_id` |
| 417 | `frame.add_map_element` | `name, player_id, texture, animation, animation_state, x, y, z, exclude` |
| 450 | `frame.change_map_element` | `name, player_id, animation_state, loop` |
| 459 | `frame.move_map_element` | `name, player_id, x, y, z` |
| 478 | `frame.remove_map_element` | `name, player_id` |
| 489 | `compute_aligned_position` | `element` |
| 510 | `frame.add_ui_element` | `sprite_id, player_id, texture_path, animation_path, animation_state, x, y, z, sx, sy, box_width, box_height, halign, valign` |
| 635 | `frame.update_ui_element` | `sprite_id, player_id, properties` |
| 692 | `frame.set_ui_animation` | `sprite_id, player_id, animation_state` |
| 724 | `frame.remove_ui_element` | `sprite_id, player_id` |
| 733 | `frame.get_ui_element_proxy` | `sprite_id, player_id` |
| 754 | `setPosition` | `self, x, y` |
| 760 | `setScale` | `self, sx, sy` |
| 766 | `setRotation` | `self, ro` |
| 771 | `setOpacity` | `self, opacity` |
| 776 | `setColor` | `self, r, g, b, a` |
| 784 | `setRo` | `self, ro` |
| 795 | `frame.slide_ui_element` | `sprite_id, player_id, target_x, target_y, duration, easing, on_complete` |
| 817 | `on_update` | `values` |
| 823 | `on_complete` | `values, interrupted` |
| 846 | `frame.relative_slide_ui_element` | `sprite_id, player_id, offset_x, offset_y, duration, easing, on_complete` |
| 857 | `frame.set_slide_ui_element` | `sprite_id, player_id, start_x, start_y, target_x, target_y, duration, easing, on_complete` |
| 878 | `on_update` | `values` |
| 884 | `on_complete` | `values, interrupted` |
| 914 | `frame.move_ui_element` | `sprite_id, player_id, offset_x, offset_y, duration, easing, on_complete` |
| 933 | `frame.scale_ui_element` | `sprite_id, player_id, target_scale, duration, easing, on_complete` |
| 954 | `on_update` | `values` |
| 960 | `on_complete` | `values, interrupted` |
| 990 | `frame.relative_scale_ui_element` | `sprite_id, player_id, offset_scale, duration, easing, on_complete` |
| 1000 | `frame.rotate_ui_element` | `sprite_id, player_id, target_rotation, duration, easing, on_complete` |
| 1021 | `on_update` | `values` |
| 1026 | `on_complete` | `values, interrupted` |
| 1055 | `frame.relative_rotate_ui_element` | `sprite_id, player_id, offset_rotation, duration, easing, on_complete` |
| 1065 | `frame.transform_ui_element` | `sprite_id, player_id, properties, duration, easing, on_complete` |
| 1098 | `on_update` | `values` |
| 1108 | `on_complete` | `values, interrupted` |
| 1135 | `frame.relative_transform_ui_element` | `sprite_id, player_id, offset_properties, duration, easing, on_complete` |
| 1155 | `frame.bob_ui_element` | `sprite_id, player_id, distance, duration, easing, loop, ping_pong` |
| 1171 | `setPosition` | `self, x, y` |
| 1183 | `on_update` | `values` |
| 1200 | `frame.pulse_scale_ui_element` | `sprite_id, player_id, min_scale, max_scale, pulse_duration, easing, loops, on_complete` |
| 1218 | `on_update` | `values` |
| 1235 | `frame.color_pulse_from_current` | `sprite_id, player_id, target_color` |
| 1252 | `frame.summon_ui_element` | `sprite_id, player_id, start_x, start_y, start_scale, end_x, end_y, end_scale, duration, arc_height, peak_scale_mul, wobble_deg, easing, on_complete` |
| 1283 | `on_update` | `values` |
| 1306 | `on_complete` | `values, interrupted` |
| 1336 | `frame.complex_summon_ui_element` | `sprite_id, player_id, start_x, start_y, start_scale, end_x, end_y, end_scale, arc_duration, wobble_duration, settle_duration, arc_height, peak_scale_mul, wobble_deg, easing, on_complete, on_update_step1, on_update_step2, on_update_step3` |
| 1368 | `on_update` | `values, t, phase` |
| 1396 | `on_update` | `values, t, phase` |
| 1411 | `on_update` | `values, t, phase` |
| 1423 | `on_complete` | `values, interrupted` |
| 1442 | `on_complete` | `(none)` |
| 1458 | `frame.summon_ui_element_relative` | `sprite_id, player_id, end_x, end_y, end_scale, duration, arc_height, peak_scale_mul, wobble_deg, easing, on_complete` |
| 1477 | `frame.complex_summon_ui_element_relative` | `sprite_id, player_id, end_x, end_y, end_scale, arc_duration, wobble_duration, settle_duration, arc_height, peak_scale_mul, wobble_deg, easing, on_complete, on_update_step1, on_update_step2, on_update_step3` |
| 1501 | `frame.set_opacity_ui_element` | `sprite_id, player_id, target_opacity, duration, easing, on_complete` |
| 1522 | `on_update` | `values` |
| 1525 | `on_complete` | `values, interrupted` |
| 1552 | `frame.relative_set_opacity_ui_element` | `sprite_id, player_id, offset_opacity, duration, easing, on_complete` |
| 1562 | `frame.set_ui_element_color` | `sprite_id, player_id, r, g, b, duration, easing, on_complete` |
| 1588 | `on_update` | `values` |
| 1595 | `on_complete` | `values, interrupted` |
| 1622 | `frame.relative_set_ui_element_color` | `sprite_id, player_id, offset_r, offset_g, offset_b, duration, easing, on_complete` |
| 1634 | `frame.color_pulse_ui_element` | `sprite_id, player_id, start_color, target_color` |
| 1658 | `setColor` | `self, r, g, b` |
| 1664 | `setAlpha` | `self, alpha` |
| 1668 | `setOpacity` | `self,opacity` |
| 1684 | `frame.color_pulse_rgb` | `sprite_id, player_id, start_r, start_g, start_b, start_a, target_r, target_g, target_b, target_a` |
| 1703 | `frame.menu_cursor_ui_element` | `sprite_id, player_id, bob_distance, pulse_scale, bob_duration, pulse_duration, orientation, easing, back_easing, on_complete` |
| 1731 | `on_update` | `values` |
| 1745 | `on_update` | `values` |
| 1763 | `stop` | `(none)` |
| 1777 | `frame.shake_ui_element` | `sprite_id, player_id, intensity, duration, frequency, on_complete` |
| 1795 | `setPosition` | `self, x, y` |
| 1798 | `setRotation` | `self, rotation` |
| 1808 | `on_complete` | `(none)` |
| 1817 | `on_update` | `value` |
| 1831 | `frame.set_ui_element_instant` | `sprite_id, player_id, properties` |
| 1848 | `frame.reset_ui_element` | `sprite_id, player_id, initial_values` |
| 1877 | `frame.stop_ui_animation` | `sprite_id, player_id, anim_id` |
| 1906 | `frame.has_active_animations` | `sprite_id, player_id` |
| 1915 | `frame.is_animation_running` | `sprite_id, player_id, anim_id` |
| 1924 | `frame.get_ui_element_properties` | `sprite_id, player_id` |
| 1959 | `frame.spawn_cursor` | `sprite_id, player_id, options` |
| 1993 | `frame.remove_cursor` | `cursor_id, player_id` |
| 2002 | `frame.move_cursor_to_selection` | `cursor_id, player_id, selection_name` |
| 2040 | `frame.get_current_cursor_selection` | `cursor_id, player_id` |
| 2055 | `frame.lock_cursor` | `cursor_id, player_id, locked` |
| 2065 | `frame.is_cursor_locked` | `cursor_id, player_id` |
| 2074 | `frame.update_cursor_options` | `cursor_id, player_id, new_options` |
| 2100 | `frame.detach_camera` | `player_id` |
| 2108 | `frame.draw_text` | `text_id, player_id, text, x, y, z, font, scale` |
| 2125 | `frame.update_text` | `text_id, player_id, text` |
| 2134 | `frame.remove_text` | `text_id, player_id` |
| 2141 | `frame.draw_advanced_text` | `player_id, text, opts` |
| 2158 | `frame.draw_marquee_text` | `marquee_id, player_id, text, y, font, scale, z_order, speed, backdrop` |
| 2176 | `frame.set_marquee_position` | `player_id, marquee_id, x, y` |
| 2193 | `frame.set_marquee_speed` | `player_id, marquee_id, speed` |
| 2212 | `frame.spawn_timer` | `timer_id, player_id, x, y, duration, loop` |
| 2214 | `callback` | `_, timer_id, value` |
| 2221 | `frame.resume_timer` | `timer_id, player_id` |
| 2225 | `frame.pause_timer` | `timer_id, player_id` |
| 2229 | `frame.remove_timer` | `timer_id, player_id` |
| 2237 | `frame.update_timer` | `timer_id, player_id, duration` |
| 2250 | `frame.spawn_countdown` | `countdown_id, player_id, x, y, duration, loop` |
| 2252 | `callback` | `_, countdown_id, value` |
| 2263 | `frame.resume_countdown` | `countdown_id, player_id` |
| 2267 | `frame.pause_countdown` | `countdown_id, player_id` |
| 2271 | `frame.remove_countdown` | `countdown_id, player_id` |
| 2279 | `frame.update_countdown` | `countdown_id, player_id, duration` |
| 2292 | `splitter` | `inputstr, sep` |

### Function notes

- **`round_fraction(value, denominator)`** — =========================================================== HELPER FUNCTIONS =========================================================== *(source line 56)*
- **`convertOffsets(horizontalOffset, verticalOffset, Z)`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fixOffsets(a, b)`** *(source line 69)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_color(color)`** *(source line 89)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`async(p)`** *(source line 105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`await(v)`** *(source line 110)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`table_has_value(tab, val)`** *(source line 114)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`exclude_except_for(player_id, bot_id)`** *(source line 123)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_move_player(player_id, area_id, x, y, z)`** — =========================================================== PLAYER MOVEMENT FUNCTIONS =========================================================== *(source line 143)*
- **`try_animate_player(player_id, anim_state)`** *(source line 175)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.move_frozen_player(player_id, x, y, z)`** *(source line 197)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.animate_frozen_player(player_id, anim_state)`** *(source line 205)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.set_cosmetic(cosmetic_id, player_id, texture, animation, state, x, y, visible, player_xoffset, player_yoffset, anim_duration, scale, bot_scale, owner_sprite_state, owner_sprite_enabled, movement_duration)`** — Purpose: Show a cosmetic as a native animated sprite for its owner and as an animated world bot for every other player.  Animation states: * `state` (caller-provided, typically "IDLE_DR") is used by the WORLD BOT. animate_bot(..., true) forces looping regardless of the .anim file's own loop flag, so the bot animates fine for other clients. * The OWNER SPRITE uses "cosmetic" -- the overlay state designed to sit on top of the player. The engine's sprite path (player_draw_sprite) obeys the .anim file's loop flag, and boom v2.0 states have loop hardcoded to false. So the sprite plays the "cosmetic" animation once and then stops; the tick handler below restarts it by erasing and re-drawing at the state's total duration. *(source line 229)*
- **`frame.remove_cosmetic(cosmetic_id, player_id)`** *(source line 385)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.add_map_element(name, player_id, texture, animation, animation_state, x, y, z, exclude)`** — =========================================================== MAP ELEMENT FUNCTIONS =========================================================== *(source line 417)*
- **`frame.change_map_element(name, player_id, animation_state, loop)`** *(source line 450)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.move_map_element(name, player_id, x, y, z)`** *(source line 459)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.remove_map_element(name, player_id)`** *(source line 478)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`compute_aligned_position(element)`** — =========================================================== UI ELEMENT FUNCTIONS =========================================================== *(source line 489)*
- **`frame.add_ui_element(sprite_id, player_id, texture_path, animation_path, animation_state, x, y, z, sx, sy, box_width, box_height, halign, valign)`** *(source line 510)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.update_ui_element(sprite_id, player_id, properties)`** *(source line 635)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.set_ui_animation(sprite_id, player_id, animation_state)`** *(source line 692)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.remove_ui_element(sprite_id, player_id)`** *(source line 724)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.get_ui_element_proxy(sprite_id, player_id)`** *(source line 733)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setPosition(self, x, y)`** *(source line 754)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setScale(self, sx, sy)`** *(source line 760)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setRotation(self, ro)`** *(source line 766)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setOpacity(self, opacity)`** *(source line 771)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setColor(self, r, g, b, a)`** *(source line 776)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setRo(self, ro)`** *(source line 784)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.slide_ui_element(sprite_id, player_id, target_x, target_y, duration, easing, on_complete)`** — =========================================================== UI ANIMATION FUNCTIONS =========================================================== *(source line 795)*
- **`on_update(values)`** *(source line 817)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 823)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.relative_slide_ui_element(sprite_id, player_id, offset_x, offset_y, duration, easing, on_complete)`** *(source line 846)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.set_slide_ui_element(sprite_id, player_id, start_x, start_y, target_x, target_y, duration, easing, on_complete)`** *(source line 857)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 878)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 884)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.move_ui_element(sprite_id, player_id, offset_x, offset_y, duration, easing, on_complete)`** *(source line 914)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.scale_ui_element(sprite_id, player_id, target_scale, duration, easing, on_complete)`** *(source line 933)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 954)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 960)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.relative_scale_ui_element(sprite_id, player_id, offset_scale, duration, easing, on_complete)`** *(source line 990)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.rotate_ui_element(sprite_id, player_id, target_rotation, duration, easing, on_complete)`** *(source line 1000)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1021)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 1026)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.relative_rotate_ui_element(sprite_id, player_id, offset_rotation, duration, easing, on_complete)`** *(source line 1055)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.transform_ui_element(sprite_id, player_id, properties, duration, easing, on_complete)`** *(source line 1065)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1098)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 1108)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.relative_transform_ui_element(sprite_id, player_id, offset_properties, duration, easing, on_complete)`** *(source line 1135)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.bob_ui_element(sprite_id, player_id, distance, duration, easing, loop, ping_pong)`** *(source line 1155)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setPosition(self, x, y)`** *(source line 1171)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1183)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.pulse_scale_ui_element(sprite_id, player_id, min_scale, max_scale, pulse_duration, easing, loops, on_complete)`** *(source line 1200)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1218)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.color_pulse_from_current(sprite_id, player_id, target_color)`** *(source line 1235)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.summon_ui_element(sprite_id, player_id, start_x, start_y, start_scale, end_x, end_y, end_scale, duration, arc_height, peak_scale_mul, wobble_deg, easing, on_complete)`** *(source line 1252)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1283)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 1306)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.complex_summon_ui_element(sprite_id, player_id, start_x, start_y, start_scale, end_x, end_y, end_scale, arc_duration, wobble_duration, settle_duration, arc_height, peak_scale_mul, wobble_deg, easing, on_complete, on_update_step1, on_update_step2, on_update_step3)`** *(source line 1336)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values, t, phase)`** *(source line 1368)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values, t, phase)`** *(source line 1396)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values, t, phase)`** *(source line 1411)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 1423)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 1442)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.summon_ui_element_relative(sprite_id, player_id, end_x, end_y, end_scale, duration, arc_height, peak_scale_mul, wobble_deg, easing, on_complete)`** *(source line 1458)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.complex_summon_ui_element_relative(sprite_id, player_id, end_x, end_y, end_scale, arc_duration, wobble_duration, settle_duration, arc_height, peak_scale_mul, wobble_deg, easing, on_complete, on_update_step1, on_update_step2, on_update_step3)`** *(source line 1477)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.set_opacity_ui_element(sprite_id, player_id, target_opacity, duration, easing, on_complete)`** *(source line 1501)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1522)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 1525)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.relative_set_opacity_ui_element(sprite_id, player_id, offset_opacity, duration, easing, on_complete)`** *(source line 1552)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.set_ui_element_color(sprite_id, player_id, r, g, b, duration, easing, on_complete)`** *(source line 1562)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1588)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete(values, interrupted)`** *(source line 1595)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.relative_set_ui_element_color(sprite_id, player_id, offset_r, offset_g, offset_b, duration, easing, on_complete)`** *(source line 1622)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.color_pulse_ui_element(sprite_id, player_id, start_color, target_color)`** *(source line 1634)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setColor(self, r, g, b)`** *(source line 1658)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setAlpha(self, alpha)`** *(source line 1664)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setOpacity(self,opacity)`** *(source line 1668)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.color_pulse_rgb(sprite_id, player_id, start_r, start_g, start_b, start_a, target_r, target_g, target_b, target_a)`** *(source line 1684)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.menu_cursor_ui_element(sprite_id, player_id, bob_distance, pulse_scale, bob_duration, pulse_duration, orientation, easing, back_easing, on_complete)`** *(source line 1703)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1731)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(values)`** *(source line 1745)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`stop()`** *(source line 1763)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.shake_ui_element(sprite_id, player_id, intensity, duration, frequency, on_complete)`** *(source line 1777)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setPosition(self, x, y)`** *(source line 1795)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setRotation(self, rotation)`** *(source line 1798)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_complete()`** *(source line 1808)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_update(value)`** *(source line 1817)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.set_ui_element_instant(sprite_id, player_id, properties)`** *(source line 1831)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.reset_ui_element(sprite_id, player_id, initial_values)`** *(source line 1848)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.stop_ui_animation(sprite_id, player_id, anim_id)`** *(source line 1877)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.has_active_animations(sprite_id, player_id)`** *(source line 1906)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.is_animation_running(sprite_id, player_id, anim_id)`** *(source line 1915)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.get_ui_element_properties(sprite_id, player_id)`** *(source line 1924)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.spawn_cursor(sprite_id, player_id, options)`** — =========================================================== CURSOR FUNCTIONS =========================================================== *(source line 1959)*
- **`frame.remove_cursor(cursor_id, player_id)`** *(source line 1993)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.move_cursor_to_selection(cursor_id, player_id, selection_name)`** *(source line 2002)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.get_current_cursor_selection(cursor_id, player_id)`** *(source line 2040)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.lock_cursor(cursor_id, player_id, locked)`** *(source line 2055)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.is_cursor_locked(cursor_id, player_id)`** *(source line 2065)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.update_cursor_options(cursor_id, player_id, new_options)`** *(source line 2074)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.detach_camera(player_id)`** — =========================================================== CAMERA FUNCTIONS =========================================================== *(source line 2100)*
- **`frame.draw_text(text_id, player_id, text, x, y, z, font, scale)`** — =========================================================== TEXT FUNCTIONS =========================================================== *(source line 2108)*
- **`frame.update_text(text_id, player_id, text)`** *(source line 2125)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.remove_text(text_id, player_id)`** *(source line 2134)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.draw_advanced_text(player_id, text, opts)`** *(source line 2141)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.draw_marquee_text(marquee_id, player_id, text, y, font, scale, z_order, speed, backdrop)`** *(source line 2158)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.set_marquee_position(player_id, marquee_id, x, y)`** *(source line 2176)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.set_marquee_speed(player_id, marquee_id, speed)`** *(source line 2193)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.spawn_timer(timer_id, player_id, x, y, duration, loop)`** — =========================================================== TIMER FUNCTIONS =========================================================== *(source line 2212)*
- **`callback(_, timer_id, value)`** *(source line 2214)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.resume_timer(timer_id, player_id)`** *(source line 2221)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.pause_timer(timer_id, player_id)`** *(source line 2225)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.remove_timer(timer_id, player_id)`** *(source line 2229)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.update_timer(timer_id, player_id, duration)`** *(source line 2237)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.spawn_countdown(countdown_id, player_id, x, y, duration, loop)`** — =========================================================== COUNTDOWN FUNCTIONS =========================================================== *(source line 2250)*
- **`callback(_, countdown_id, value)`** *(source line 2252)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.resume_countdown(countdown_id, player_id)`** *(source line 2263)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.pause_countdown(countdown_id, player_id)`** *(source line 2267)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.remove_countdown(countdown_id, player_id)`** *(source line 2271)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`frame.update_countdown(countdown_id, player_id, duration)`** *(source line 2279)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`splitter(inputstr, sep)`** — =========================================================== UTILITY FUNCTIONS =========================================================== *(source line 2292)*

## Tables and data structures

### `assets` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.png"` |
| `[2]` | string literal | `"/server/assets/net-games/fonts/fonts_wide.animation"` |
| `[3]` | string literal | `"/server/assets/net-games/fonts/fonts_gradient.animation"` |
| `[4]` | string literal | `"/server/assets/net-games/fonts/fonts_thick.animation"` |
| `[5]` | string literal | `"/server/assets/net-games/fonts/fonts_battle.animation"` |
| `[6]` | string literal | `"/server/assets/net-games/fonts/fonts_thin.animation"` |
| `[7]` | string literal | `"/server/assets/net-games/fonts/fonts_tiny.animation"` |
| `[8]` | string literal | `"/server/assets/net-games/fonts/fonts_compressed.animation"` |
| `[9]` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.png"` |
| `[10]` | string literal | `"/server/assets/net-games/fonts/fonts_dark_compressed.animation"` |

### `frame` *(line 37)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `last_position_cache` *(line 38)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `cosmetic_cache` *(line 39)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `avatar_cache` *(line 41)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ui_cache` *(line 42)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `map_elements` *(line 43)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ui_update` *(line 44)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `online_players` *(line 45)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `text_cache` *(line 46)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `marquee_cache` *(line 48)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `timer_cache` *(line 49)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `countdown_cache` *(line 50)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `repeat_state` *(line 51)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keyframes` *(line 178)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = {{property = "Animation", value = anim_state}}, duration = 0 }` |

### `properties` *(line 179)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{property = "Animation", value = anim_state}` |

### `keyframes` *(line 365)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "ScaleX", ease = "Linear", value = world_bot_scale }, { property = "ScaleY", ease = "Linear", value = world_bo…` |

### `properties` *(line 366)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "ScaleX", ease = "Linear", value = world_bot_scale }` |
| `[2]` | table | `{ property = "ScaleY", ease = "Linear", value = world_bot_scale }` |

### `animations` *(line 622)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `children` *(line 624)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `sprite_data` *(line 641)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `sprite_id .. "_obj"` |

### `element.animations` *(line 839)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 907)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 983)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 1048)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `current_props` *(line 1074)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `element.x` |
| `y` | expression/reference | `element.y` |
| `sx` | expression/reference | `element.sx` |
| `sy` | expression/reference | `element.sy` |
| `ro` | expression/reference | `element.ro` |
| `opacity` | expression/reference | `element.opacity` |

### `target_props` *(line 1083)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 1128)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `target_props` *(line 1141)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `proxy` *(line 1168)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `y` | expression/reference | `start_y` |
| `setPosition` | function | `function(self` |
| `[3]` | expression/reference | `x` |
| `[4]` | call/expression | `y) element.y = y frame.update_ui_element(sprite_id` |
| `[5]` | expression/reference | `player_id` |
| `[6]` | table | `{y = y}) end` |

### `element.animations` *(line 1193)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 1228)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `current_color` *(line 1242)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `element.r or 255` |
| `g` | expression/reference | `element.g or 255` |
| `b` | expression/reference | `element.b or 255` |
| `a` | expression/reference | `element.a or 255` |

### `element.animations` *(line 1329)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `sequence_steps` *(line 1362)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 1450)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 1545)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 1615)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `start_color` *(line 1645)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `element.r or 255` |
| `g` | expression/reference | `element.g or 255` |
| `b` | expression/reference | `element.b or 255` |
| `a` | expression/reference | `element.a or 255` |

### `proxy` *(line 1652)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `element.r or 255` |
| `g` | expression/reference | `element.g or 255` |
| `b` | expression/reference | `element.b or 255` |
| `a` | expression/reference | `element.a or 255` |
| `setColor` | function | `function(self` |
| `[6]` | expression/reference | `r` |
| `[7]` | expression/reference | `g` |
| `[8]` | call/expression | `b) element.r = r element.g = g element.b = b frame.update_ui_element(sprite_id` |
| `[9]` | expression/reference | `player_id` |
| `[10]` | table | `{r = r, g = g, b = b}) end` |
| `setAlpha` | function | `function(self` |
| `[12]` | call/expression | `alpha) element.a = alpha frame.update_ui_element(sprite_id` |
| `[13]` | expression/reference | `player_id` |
| `[14]` | table | `{a = alpha}) end` |
| `setOpacity` | function | `function(self` |
| `[16]` | call/expression | `opacity) element.opacity = opacity frame.update_ui_element(sprite_id` |
| `[17]` | expression/reference | `player_id` |
| `[18]` | table | `{o = opacity}) end` |

### `element.animations` *(line 1677)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `start_color` *(line 1686)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `start_r or 255` |
| `g` | expression/reference | `start_g or 255` |
| `b` | expression/reference | `start_b or 255` |
| `a` | expression/reference | `start_a or 255` |

### `target_color` *(line 1692)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `target_r or 255` |
| `g` | expression/reference | `target_g or 255` |
| `b` | expression/reference | `target_b or 255` |
| `a` | expression/reference | `target_a or start_color.a` |

### `element.animations` *(line 1755)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `shake_object` *(line 1790)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `proxy.x` |
| `y` | expression/reference | `proxy.y` |
| `rotation` | expression/reference | `proxy.ro` |
| `setPosition` | function | `function(self` |
| `[5]` | expression/reference | `x` |
| `[6]` | call/expression | `y) proxy:setPosition(x` |
| `[7]` | expression/reference | `y) end` |
| `setRotation` | function | `function(self` |
| `[9]` | call/expression | `rotation) proxy:setRo(rotation) end` |

### `element.animations` *(line 1824)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `element.animations` *(line 1900)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `obj_cache.cursor_options` *(line 1983)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `selections` | expression/reference | `options.selections` |
| `movement` | expression/reference | `options.movement or "vertical"` |
| `current_index` | number literal | `1` |
| `locked` | boolean literal | `false` |
| `name` | expression/reference | `sprite_id` |

### `opts` *(line 2159)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | expression/reference | `font or "THICK"` |
| `scale` | expression/reference | `scale or 2.0` |
| `z` | expression/reference | `z_order or 100` |
| `speed` | expression/reference | `speed or 60` |
| `loops` | nil | `nil` |

### `t` *(line 2298)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keyframes` *(line 2554)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = tonumber(bot_position.x) or target_x }, { property = "Y", value = tonumber(bot_position.y) or tar…` |
| `[2]` | table | `{ properties = { { property = "X", ease = "Linear", value = target_x }, { property = "Y", ease = "Linear", value = target_y }, { property = …` |

### `properties` *(line 2556)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = tonumber(bot_position.x) or target_x }` |
| `[2]` | table | `{ property = "Y", value = tonumber(bot_position.y) or target_y }` |
| `[3]` | table | `{ property = "Z", value = tonumber(bot_position.z) or target_z }` |

### `properties` *(line 2564)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", ease = "Linear", value = target_x }` |
| `[2]` | table | `{ property = "Y", ease = "Linear", value = target_y }` |
| `[3]` | table | `{ property = "Z", ease = "Linear", value = target_z }` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
