# `eznpcs_onceitem.lua`

> **Source:** `scripts/events/eznpcs_onceitem.lua`  
> **Source lines:** 3579  
> **Functions detected:** 131  
> **Table declarations detected:** 39

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

scripts/events/eznpcs_onceitem.lua Dialogue Type "onceitem": unique, server-wide rental with renewals Dialogue Type "oncepass": renter sets/clears a visitor password for the HP checkpoint Dialogue Type "oncehub": renter hub (password + decorate HP with live preview) Checkpoint integration: Any object of type "Checkpoint" with custom property: Once Key = <same unique key as the NPC>   (e.g., "House.A.Key") Behavior: • Owner (current renter) opens immediately • Visitors open with renter-defined password (via oncepass) • Gate hides-for-session only (reappears on relog or lease change) • Password auto-clears when lease expires or changes owner Loader (in eznpcs_events.lua): helpers.safe_require('scripts/events/eznpcs_onceitem')

## Dependencies

- `scripts/events/eznpcs_onceitem` — line 15
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 18
- `scripts/ezlibs-scripts/helpers` — line 19
- `scripts/ezlibs-scripts/ezmemory` — line 20
- `scripts/ezlibs-scripts/ezmenus` — line 21
- `scripts/ezlibs-scripts/ezweather` — line 22
- `scripts/ezlibs-custom/custom` — line 23
- `scripts/ezlibs-custom/pets` — line 24
- `scripts/ezlibs-custom/jukebox` — line 25

## Events

- `Net:on("virtual_input", function(event) ...)` — line 2861. The event name is taken directly from this source.
- `Net:on("player_area_transfer", function(event) ...)` — line 3025. The event name is taken directly from this source.
- `Net:on("player_join_area", function(event) ...)` — line 3038. The event name is taken directly from this source.
- `Net:on("player_join", function(event) ...)` — line 3048. The event name is taken directly from this source.
- `Net:on("object_interaction", function(event) ...)` — line 3484. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 141 | `is_pet_item_id` | `id` |
| 145 | `pet_kind_from_item_id` | `id` |
| 156 | `_oh_log` | `pid, msg` |
| 168 | `_mark_ignore_next_close` | `pid, reason` |
| 175 | `_open_menu_ignoring_custom` | `pid, title, color, posts, reason` |
| 182 | `_path_tail` | `p` |
| 189 | `catalog_resolve_gid` | `area_id, entry` |
| 212 | `catalog_entry_by_gid` | `area_id, gid` |
| 222 | `dprop` | `dialogue, key, default` |
| 228 | `cprop` | `obj_custom, key, default` |
| 234 | `normalize_key` | `s` |
| 241 | `_pick_existing_mem_area` | `fallback` |
| 251 | `_area_exists` | `area_id` |
| 261 | `resolve_mem_area_id` | `dialogue, player_id, obj_custom` |
| 277 | `say` | `player_id, text, mug` |
| 284 | `ask_yes_no` | `player_id, prompt, mug` |
| 289 | `ask_text` | `player_id, prompt, mug` |
| 294 | `fmt` | `ts` |
| 299 | `add_months` | `ts, months` |
| 308 | `compute_period` | `now_ts, months, minutes` |
| 316 | `resolve_manual_purchased_at` | `dialogue, now_ts` |
| 335 | `menu_closed_now` | `pid, secs` |
| 343 | `recently_closed_menu` | `pid` |
| 347 | `fast_close_board` | `pid` |
| 359 | `ensure_bucket_mem` | `BUCKET_AREA_ID` |
| 369 | `purge_player_key_if_invalid` | `player_id, BUCKET_AREA_ID, once_key, item_name` |
| 385 | `get_record_and_prune` | `BUCKET_AREA_ID, once_key` |
| 422 | `eznpcs.player_has_active_lease` | `player_id, once_key, bucket_area_id` |
| 425 | `check_area` | `area_id` |
| 444 | `dir_to_offset` | `dir` |
| 457 | `get_cursor_point` | `player_id, dist` |
| 478 | `clamp_cursor_to_map` | `area_id, x, y, z` |
| 493 | `init_free_cursor` | `pid, s` |
| 508 | `get_session_cursor` | `pid, s` |
| 517 | `follow_preview_camera` | `pid, x, y, z` |
| 559 | `lock_for_preview` | `pid, s` |
| 570 | `unlock_after_preview` | `pid, s` |
| 615 | `stop_session` | `player_id, reason` |
| 644 | `try_resolve_test_gid` | `dialogue, area_id` |
| 647 | `norm` | `s` |
| 648 | `looks_like_bus_stop` | `s` |
| 680 | `resolve_removal_cursor_gid` | `area_id` |
| 709 | `_tmx_read_map_tilesize` | `xml` |
| 715 | `find_prototype_for_gid` | `area_id, target_gid` |
| 735 | `get_template_dims_from_layer` | `area_id, layer_name, gid` |
| 763 | `get_gid_dims_in_tiles` | `area_id, gid` |
| 775 | `resolve_object_dims` | `area_id, template_layer_name, gid` |
| 791 | `object_covers_point` | `o, x, y, z` |
| 798 | `find_oncehub_object_at` | `area_id, x, y, z` |
| 817 | `decode_gid_flags` | `raw` |
| 826 | `gid_base` | `raw_gid` |
| 832 | `_tmx_flip_flags_from_layer` | `area_id, layer_name, base_gid` |
| 857 | `resolve_preview_flip_flags` | `area_id, template_layer_name, base_gid, def_fh, def_fv, def_fr` |
| 879 | `ensure_preview` | `player_id` |
| 1053 | `_decor_ci` | `dialogue` |
| 1060 | `_decor_get_prop_ci` | `ci, key` |
| 1062 | `_catalog_by_id` | `id` |
| 1069 | `_player_decor_mem` | `pid` |
| 1075 | `decor_count_owned` | `pid, id` |
| 1080 | `decor_add_owned` | `pid, id, qty` |
| 1088 | `short_money` | `n` |
| 1107 | `price_for` | `dialogue, id` |
| 1124 | `_catalog_by_id` | `id` |
| 1130 | `_decor_ci` | `dialogue` |
| 1138 | `_decor_get_prop_ci` | `ci, key` |
| 1142 | `price_for_index_or_id` | `dialogue, idx, id` |
| 1160 | `_pmem_secret` | `pid` |
| 1168 | `_pmem_get` | `pid` |
| 1182 | `_decor_inv` | `pid` |
| 1187 | `decor_count_owned` | `pid, id` |
| 1194 | `decor_set_owned` | `pid, id, count` |
| 1206 | `decor_add_owned` | `pid, id, qty` |
| 1213 | `count_placed_in_area_by_player` | `area_id, once_key, object_id, pid` |
| 1235 | `decor_left_to_place` | `pid, area_id, once_key, object_id` |
| 1247 | `snapshot_oncehub_placements` | `area_id, once_key` |
| 1289 | `_remember_key_area` | `mem_area, key, area_id` |
| 1297 | `save_placements` | `area_id, bucket_area_id, once_key` |
| 1313 | `rehydrate_placements` | `area_id, bucket_area_id, once_key` |
| 1445 | `ensure_rehydrated` | `player_id, dialogue` |
| 1463 | `_cleanup_expired_hp` | `area_id, bucket_area_id, once_key` |
| 1496 | `_lease_rec_for_key` | `bucket_area_id, key` |
| 1505 | `_apply_jukebox_song` | `area_id, bucket_area_id, once_key` |
| 1519 | `rehydrate_all_for_area` | `area_id` |
| 1522 | `try_from` | `bucket_area_id` |
| 1585 | `_rehydrate_from_event` | `ev` |
| 1594 | `_oncehub_rehydrate_for_player` | `pid` |
| 1606 | `_safe_get_player` | `ev` |
| 1610 | `_safe_get_to_area` | `ev, pid` |
| 1617 | `ezweather.handle_player_join` | `pid` |
| 1626 | `ezweather.handle_player_transfer` | `pid` |
| 1633 | `_cf_key` | `area_id, once_key, x, y, z` |
| 1643 | `_cf_mem` | `area_id` |
| 1649 | `_cf_record_bot` | `area_id, once_key, x, y, z, bot_id` |
| 1655 | `_cf_remove_bot` | `area_id, once_key, x, y, z, direct_id` |
| 1690 | `_find_card_item_id_by_title` | `pid, title` |
| 1706 | `_dec_player_item_count` | `pid, item_id, n` |
| 1719 | `_inc_inventory_by_secret` | `secret, item_id, n` |
| 1732 | `_refund_card_to_frame_owner` | `cp` |
| 1757 | `persist_area` | `area_id, bucket_area_id, once_key` |
| 1787 | `place_current` | `player_id` |
| 1931 | `remove_current` | `player_id` |
| 1964 | `get_template_layer_name` | `dialogue` |
| 1970 | `start_place_session` | `player_id, dialogue, chosen_gid, chosen_name, chosen_id, template_layer` |
| 2039 | `open_place_catalog_menu` | `player_id, dialogue` |
| 2123 | `start_remove_session` | `player_id, dialogue` |
| 2159 | `open_decorate_menu` | `player_id, dialogue` |
| 2196 | `find_my_object` | `(none)` |
| 2339 | `open_pass_menu` | `player_id, npc, dialogue` |
| 2413 | `_get_rental_record` | `player_id, dialogue` |
| 2422 | `_is_current_renter` | `player_id, dialogue` |
| 2431 | `_find_visitor_object` | `area_id, once_key, visitor_secret` |
| 2446 | `open_visitor_decor_menu` | `player_id, dialogue` |
| 2494 | `_pets_require` | `(none)` |
| 2499 | `_pets_auth_renter` | `player_id, dialogue` |
| 2522 | `start_pet_place_session` | `player_id, dialogue, pet_id, pet_name` |
| 2586 | `place_pet_current` | `player_id` |
| 2640 | `open_pets_summon_menu` | `player_id, npc, dialogue` |
| 2724 | `open_pets_remove_menu` | `player_id, npc, dialogue` |
| 2803 | `open_pets_menu` | `player_id, npc, dialogue` |
| 2829 | `action` | `npc, player_id, dialogue, relay_object` |
| 2888 | `action_ok` | `key, seconds` |
| 2899 | `nudge_cursor` | `dx, dy` |
| 3060 | `action` | `npc, player_id, dialogue, relay_object` |
| 3096 | `finish` | `next_id` |
| 3105 | `save_record` | `r` |
| 3111 | `can_afford` | `amount` |
| 3116 | `grant_key_if_missing` | `(none)` |
| 3129 | `new_window_from` | `ts` |
| 3314 | `action` | `npc, player_id, dialogue, relay_object` |
| 3372 | `action` | `npc, player_id, dialogue, relay_object` |
| 3501 | `run_logic` | `with_lock` |

### Function notes

- **`is_pet_item_id(id)`** — ====================== Pets Helpers ====================== Pets are sold via the Decor Shop (inventory), but are NOT placed as map objects anymore. They are summoned/removed via the Home Hub -> Pets menu, and stored separately in pets.lua. *(source line 141)*
- **`pet_kind_from_item_id(id)`** *(source line 145)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_oh_log(pid, msg)`** *(source line 156)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_mark_ignore_next_close(pid, reason)`** — Ask custom.lua to ignore the very next board_close for this player (one-shot) *(source line 168)*
- **`_open_menu_ignoring_custom(pid, title, color, posts, reason)`** — Wrapper: mark ignore + open menu (returns the ezmenus board like normal) *(source line 175)*
- **`_path_tail(p)`** — ====================== Small helpers ====================== *(source line 182)*
- **`catalog_resolve_gid(area_id, entry)`** — Resolve a catalog entry to a gid for the current map *(source line 189)*
- **`catalog_entry_by_gid(area_id, gid)`** — Lookup friendly name/id by gid (for older placed objects that lack oncehub_name) *(source line 212)*
- **`dprop(dialogue, key, default)`** *(source line 222)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cprop(obj_custom, key, default)`** *(source line 228)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_key(s)`** *(source line 234)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_pick_existing_mem_area(fallback)`** *(source line 241)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_area_exists(area_id)`** *(source line 251)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_mem_area_id(dialogue, player_id, obj_custom)`** *(source line 261)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`say(player_id, text, mug)`** *(source line 277)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ask_yes_no(player_id, prompt, mug)`** *(source line 284)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ask_text(player_id, prompt, mug)`** *(source line 289)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fmt(ts)`** *(source line 294)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`add_months(ts, months)`** *(source line 299)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`compute_period(now_ts, months, minutes)`** *(source line 308)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_manual_purchased_at(dialogue, now_ts)`** *(source line 316)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`menu_closed_now(pid, secs)`** *(source line 335)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`recently_closed_menu(pid)`** *(source line 343)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fast_close_board(pid)`** *(source line 347)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_bucket_mem(BUCKET_AREA_ID)`** — ====================== Memory helpers ====================== *(source line 359)*
- **`purge_player_key_if_invalid(player_id, BUCKET_AREA_ID, once_key, item_name)`** *(source line 369)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_record_and_prune(BUCKET_AREA_ID, once_key)`** *(source line 385)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.player_has_active_lease(player_id, once_key, bucket_area_id)`** *(source line 422)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`check_area(area_id)`** *(source line 425)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`dir_to_offset(dir)`** — ---------- Cursor helpers ---------- *(source line 444)*
- **`get_cursor_point(player_id, dist)`** — NEW: normalized fractional cursor distance *(source line 457)*
- **`clamp_cursor_to_map(area_id, x, y, z)`** — -------------------------- oncehub "free cursor" helpers -------------------------- *(source line 478)*
- **`init_free_cursor(pid, s)`** *(source line 493)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_session_cursor(pid, s)`** *(source line 508)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`follow_preview_camera(pid, x, y, z)`** *(source line 517)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lock_for_preview(pid, s)`** *(source line 559)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`unlock_after_preview(pid, s)`** *(source line 570)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`stop_session(player_id, reason)`** — ====================== oncehub core (preview + placement + remove) ====================== *(source line 615)*
- **`try_resolve_test_gid(dialogue, area_id)`** — Resolve a test GID (dialogue "Test GID" overrides; else tileset named like Bus Stop; else TMX scan) *(source line 644)*
- **`norm(s)`** *(source line 647)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`looks_like_bus_stop(s)`** *(source line 648)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_removal_cursor_gid(area_id)`** *(source line 680)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_tmx_read_map_tilesize(xml)`** — ---------- DIMENSIONS: prototype → TMX layer → tileset image ---------- *(source line 709)*
- **`find_prototype_for_gid(area_id, target_gid)`** *(source line 715)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_template_dims_from_layer(area_id, layer_name, gid)`** *(source line 735)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_gid_dims_in_tiles(area_id, gid)`** *(source line 763)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_object_dims(area_id, template_layer_name, gid)`** *(source line 775)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`object_covers_point(o, x, y, z)`** *(source line 791)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`find_oncehub_object_at(area_id, x, y, z)`** *(source line 798)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`decode_gid_flags(raw)`** *(source line 817)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`gid_base(raw_gid)`** — Return the base (unflipped) gid, ignoring TMX flip bits *(source line 826)*
- **`_tmx_flip_flags_from_layer(area_id, layer_name, base_gid)`** — Read flip flags for a gid from a specific TMX object layer (by name) *(source line 832)*
- **`resolve_preview_flip_flags(area_id, template_layer_name, base_gid, def_fh, def_fv, def_fr)`** — Prefer live prototype object (if present), else TMX layer (Object Layer 1/2), else defaults *(source line 857)*
- **`ensure_preview(player_id)`** — ---------- Preview follow ---------- *(source line 879)*
- **`_decor_ci(dialogue)`** — ====================== Decor inventory (per-player; ONCEHUB_CATALOG-only) ====================== Stored separately from ezlibs item inventory to avoid mixing with other items. *(source line 1053)*
- **`_decor_get_prop_ci(ci, key)`** *(source line 1060)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_catalog_by_id(id)`** *(source line 1062)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_player_decor_mem(pid)`** *(source line 1069)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`decor_count_owned(pid, id)`** *(source line 1075)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`decor_add_owned(pid, id, qty)`** *(source line 1080)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`short_money(n)`** *(source line 1088)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`price_for(dialogue, id)`** *(source line 1107)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_catalog_by_id(id)`** *(source line 1124)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_decor_ci(dialogue)`** *(source line 1130)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_decor_get_prop_ci(ci, key)`** *(source line 1138)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`price_for_index_or_id(dialogue, idx, id)`** *(source line 1142)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_pmem_secret(pid)`** *(source line 1160)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_pmem_get(pid)`** *(source line 1168)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_decor_inv(pid)`** *(source line 1182)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`decor_count_owned(pid, id)`** *(source line 1187)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`decor_set_owned(pid, id, count)`** *(source line 1194)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`decor_add_owned(pid, id, qty)`** *(source line 1206)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`count_placed_in_area_by_player(area_id, once_key, object_id, pid)`** — Count how many of this object the CURRENT PLAYER has placed in this HP *(source line 1213)*
- **`decor_left_to_place(pid, area_id, once_key, object_id)`** *(source line 1235)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`snapshot_oncehub_placements(area_id, once_key)`** — Collect all placed objects for this renter in this area *(source line 1247)*
- **`_remember_key_area(mem_area, key, area_id)`** — Map once_key (or "area:<id>") -> owning area_id *(source line 1289)*
- **`save_placements(area_id, bucket_area_id, once_key)`** — Save the current placement list into area memory (bucket or live area) *(source line 1297)*
- **`rehydrate_placements(area_id, bucket_area_id, once_key)`** — Recreate objects from saved list if none currently exist (prevents duplicates) *(source line 1313)*
- **`ensure_rehydrated(player_id, dialogue)`** — Convenience: call this whenever the hub/menu opens *(source line 1445)*
- **`_cleanup_expired_hp(area_id, bucket_area_id, once_key)`** *(source line 1463)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_lease_rec_for_key(bucket_area_id, key)`** *(source line 1496)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_apply_jukebox_song(area_id, bucket_area_id, once_key)`** *(source line 1505)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`rehydrate_all_for_area(area_id)`** — ====================== Auto-rehydrate on area enter/transfer ====================== *(source line 1519)*
- **`try_from(bucket_area_id)`** *(source line 1522)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_rehydrate_from_event(ev)`** *(source line 1585)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_oncehub_rehydrate_for_player(pid)`** *(source line 1594)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_safe_get_player(ev)`** *(source line 1606)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_safe_get_to_area(ev, pid)`** *(source line 1610)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezweather.handle_player_join(pid)`** *(source line 1617)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezweather.handle_player_transfer(pid)`** *(source line 1626)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_cf_key(area_id, once_key, x, y, z)`** — --- Card Frame: bot-id bookkeeping in area memory ----------------------- *(source line 1633)*
- **`_cf_mem(area_id)`** *(source line 1643)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_cf_record_bot(area_id, once_key, x, y, z, bot_id)`** *(source line 1649)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_cf_remove_bot(area_id, once_key, x, y, z, direct_id)`** *(source line 1655)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_find_card_item_id_by_title(pid, title)`** — Find a player's item_id for an exact card title (e.g. "[GR]DMGirl") *(source line 1690)*
- **`_dec_player_item_count(pid, item_id, n)`** — Decrement a player's item count and persist *(source line 1706)*
- **`_inc_inventory_by_secret(secret, item_id, n)`** — Increment by account secret (works even if user is offline) *(source line 1719)*
- **`_refund_card_to_frame_owner(cp)`** — Refund 1 copy to the Card Frame owner (the player who placed it) *(source line 1732)*
- **`persist_area(area_id, bucket_area_id, once_key)`** — ---------- Actions ---------- Save both the legacy XML and the structured placements into *both* the live area AND (if present) the bucket area memory. *(source line 1757)*
- **`place_current(player_id)`** *(source line 1787)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_current(player_id)`** *(source line 1931)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_template_layer_name(dialogue)`** — ---------- Start sessions ---------- *(source line 1964)*
- **`start_place_session(player_id, dialogue, chosen_gid, chosen_name, chosen_id, template_layer)`** *(source line 1970)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`open_place_catalog_menu(player_id, dialogue)`** *(source line 2039)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`start_remove_session(player_id, dialogue)`** *(source line 2123)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`open_decorate_menu(player_id, dialogue)`** — ====================== oncehub menus ====================== *(source line 2159)*
- **`find_my_object()`** — Helper: find the object this visitor placed (relies on earlier helper if present) *(source line 2196)*
- **`open_pass_menu(player_id, npc, dialogue)`** *(source line 2339)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_get_rental_record(player_id, dialogue)`** — Renter/record helpers *(source line 2413)*
- **`_is_current_renter(player_id, dialogue)`** *(source line 2422)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_find_visitor_object(area_id, once_key, visitor_secret)`** — Find the object a specific visitor placed (by safe secret) *(source line 2431)*
- **`open_visitor_decor_menu(player_id, dialogue)`** *(source line 2446)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_pets_require()`** — ====================== Pets menu & placement ====================== *(source line 2494)*
- **`_pets_auth_renter(player_id, dialogue)`** *(source line 2499)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`start_pet_place_session(player_id, dialogue, pet_id, pet_name)`** *(source line 2522)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`place_pet_current(player_id)`** *(source line 2586)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`open_pets_summon_menu(player_id, npc, dialogue)`** *(source line 2640)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`open_pets_remove_menu(player_id, npc, dialogue)`** *(source line 2724)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`open_pets_menu(player_id, npc, dialogue)`** *(source line 2803)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 2829)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action_ok(key, seconds)`** *(source line 2888)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`nudge_cursor(dx, dy)`** *(source line 2899)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 3060)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`finish(next_id)`** *(source line 3096)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`save_record(r)`** *(source line 3105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`can_afford(amount)`** *(source line 3111)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`grant_key_if_missing()`** *(source line 3116)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`new_window_from(ts)`** *(source line 3129)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 3314)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc, player_id, dialogue, relay_object)`** *(source line 3372)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run_logic(with_lock)`** *(source line 3501)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `DEFAULTS` *(line 28)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `RentPrompt` | string literal | `"Rent the {item} for {price}$? It will expire on {date}."` |
| `DeclinedText` | string literal | `"All good! Come back anytime."` |
| `DeclinedNext` | nil | `nil` |
| `RenewPrompt` | string literal | `"You rent this until {date}. Renew for {price}$?"` |
| `RenewedText` | string literal | `"Renewed! New expiry: {date}."` |
| `OwnedText` | string literal | `"{owner} already has the {item} until {date}."` |
| `SoldText` | string literal | `"It's yours, {owner}! ({item}) Expires {date}."` |
| `NoMoneyText` | string literal | `"You don't have enough."` |
| `BusyText` | string literal | `"Someone else is being served—try again in a moment."` |
| `BusyNext` | nil | `nil` |
| `SkipRentConfirm` | string literal | `"false"` |
| `NotRenterText` | string literal | `"Only the current renter can do that."` |
| `PassAction` | string literal | `"set"` |
| `PassPrompt` | string literal | `"Enter a password (1-24 chars):"` |
| `PassSavedText` | string literal | `"Password saved."` |
| `PassClearedText` | string literal | `"Password cleared."` |
| `CP_Description` | string literal | `"It's a Security Cube."` |
| `CP_VisitorPasswordPrompt` | string literal | `"Please input the password."` |
| `CP_WrongPasswordMessage` | string literal | `"Incorrect password."` |
| `CP_OwnerUnlockedMessage` | string literal | `"Access granted."` |
| `CP_LeaseInactiveMessage` | string literal | `"This HP is not currently rented."` |
| `CP_UnlockingAssetName` | string literal | `"bn5cubegreen_bot"` |
| `CP_UnlockingAnimationTimeMS` | string literal | `"0"` |
| `CP_UnlockingSoundPath` | string literal | `"/server/assets/ezlibs-assets/sfx/panel_change.ogg"` |

### `sfx` *(line 59)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `item_get` | string literal | `'/server/assets/ezlibs-assets/sfx/item_get.ogg'` |

### `ONCEHUB` *(line 65)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `sessions` | table | `{}` |

### `sessions` *(line 76)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ONCEHUB_CATALOG` *(line 78)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ id = "bus_stop", name = "Bus Stop", gid = 259, layer = "Object Layer 2" }` |
| `[2]` | table | `{ id = "robot_toy", name = "Robot Toy", ts_source = "../assets/objects/toy.tsx", gid = 260, layer = "Object Layer 2" }` |
| `[3]` | table | `{ id = "green_tree", name = "Green Cyber Tree", ts_source = "../assets/objects/tree.tsx", gid = 261, layer = "Object Layer 2" }` |
| `[4]` | table | `{ id = "blue_tree", name = "Blue Cyber Tree", ts_source = "../assets/objects/tree.tsx", gid = 265, layer = "Object Layer 2" }` |
| `[5]` | table | `{ id = "stuffed_bear", name = "Stuffed Bear", ts_source = "../assets/objects/Teddy.tsx", gid = 269, layer = "Object Layer 2" }` |
| `[6]` | table | `{ id = "lan_tile", name = "Animated HP Tile", ts_source = "../assets/objects/LanHpAnimatedTiles.tsx", gid = 270, layer = "Object Layer 2" }` |
| `[7]` | table | `{ id = "junk_1", name = "Junk Pile", ts_source = "../assets/objects/Junkpiles.tsx", gid = 274, layer = "Object Layer 2" }` |
| `[8]` | table | `{ id = "cyber_duck", name = "Cyber Duck", ts_source = "../assets/objects/Ducky.tsx", gid = 2147483932, layer = "Object Layer 2" }` |
| `[9]` | table | `{ id = "welcome_coffee", name = "Welcome Coffee Sign", ts_source = "../assets/objects/coffee.tsx", gid = 285, layer = "Object Layer 2" }` |
| `[10]` | table | `{ id = "spinning_top", name = "Spinning Top", ts_source = "../assets/objects/beyblade.tsx", gid = 289, layer = "Object Layer 2" }` |
| `[11]` | table | `{ id = "red_boss", name = "Red Boss Marker", ts_source = "../assets/objects/EXE6_boss_markers.tsx", gid = 2147483924, layer = "Object Layer …` |
| `[12]` | table | `{ id = "blue_boss", name = "Blue Boss Marker", ts_source = "../assets/objects/EXE6_boss_markers.tsx", gid = 2147483926, layer = "Object Laye…` |
| `[13]` | table | `{ id = "yellow_boss", name = "Yellow Boss Marker", ts_source = "../assets/objects/EXE6_boss_markers.tsx", gid = 2147483928, layer = "Object …` |
| `[14]` | table | `{ id = "purple_boss", name = "Purple Boss Marker", ts_source = "../assets/objects/EXE6_boss_markers.tsx", gid = 2147483930, layer = "Object …` |
| `[15]` | table | `{ id = "protoman_doll", name = "Protoman Doll", ts_source = "../assets/objects/BoktaiDolls28x33.tsx", gid = 2147483947, layer = "Object Laye…` |
| `[16]` | table | `{ id = "megaman_doll", name = "Megaman Doll", ts_source = "../assets/objects/BoktaiDolls28x33.tsx", gid = 2147483946, layer = "Object Layer …` |
| `[17]` | table | `{ id = "otenko_doll", name = "Otenko Doll", ts_source = "../assets/objects/BoktaiDolls28x33.tsx", gid = 2147483943, layer = "Object Layer 2"…` |
| `[18]` | table | `{ id = "doronbo_doll", name = "Doronbo Doll", ts_source = "../assets/objects/BoktaiDolls28x33.tsx", gid = 2147483945, layer = "Object Layer …` |
| `[19]` | table | `{ id = "okenko_doll", name = "Okenko Doll", ts_source = "../assets/objects/BoktaiDolls28x33.tsx", gid = 2147483944, layer = "Object Layer 2"…` |
| `[20]` | table | `{ id = "bass_doll", name = "Bass Doll", ts_source = "../assets/objects/bass_plush.tsx", gid = 302, layer = "Object Layer 2" }` |
| `[21]` | table | `{ id = "zary_doll", name = "Zary Doll", ts_source = "../assets/objects/Zarydoll.tsx", gid = 321, layer = "Object Layer 2" }` |
| `[22]` | table | `{ id = "django_doll", name = "Django Doll", ts_source = "../assets/objects/BoktaiDolls2.tsx", gid = 2147484082, layer = "Object Layer 2" }` |
| `[23]` | table | `{ id = "sabata_doll", name = "Sabata Doll", ts_source = "../assets/objects/BoktaiDolls2.tsx", gid = 2147484083, layer = "Object Layer 2" }` |
| `[24]` | table | `{ id = "bug_frag", name = "Bug Frag", ts_source = "../assets/objects/frag.tsx", gid = 301, layer = "Object Layer 2" }` |
| `[25]` | table | `{ id = "skull_1", name = "DOTD Skull Blk", ts_source = "../assets/objects/skull_1.tsx", gid = 303, layer = "Object Layer 2" }` |
| `[26]` | table | `{ id = "skull_2", name = "DOTD Skull Wht", ts_source = "../assets/objects/skull_2.tsx", gid = 304, layer = "Object Layer 2" }` |
| `[27]` | table | `{ id = "nov_fountain", name = "Blue Fountain", ts_source = "../assets/objects/fountain.tsx", gid = 305, layer = "Object Layer 2" }` |
| `[28]` | table | `{ id = "home_shortcut", name = "Home Shortcut", ts_source = "../assets/objects/EXE6_Shortcuts.tsx", gid = 326, layer = "Object Layer 2" }` |
| `[29]` | table | `{ id = "fish_shortcut", name = "Fish Area Shortcut", ts_source = "../assets/objects/EXE6_Shortcuts.tsx", gid = 322, layer = "Object Layer 2"…` |
| `[30]` | table | `{ id = "teams_shortcut", name = "TeamsHQ Shortcut", ts_source = "../assets/objects/EXE6_Shortcuts.tsx", gid = 330, layer = "Object Layer 2" …` |
| `[31]` | table | `{ id = "wcity3_shortcut", name = "WCity3 Shortcut", ts_source = "../assets/objects/EXE6_Shortcuts.tsx", gid = 342, layer = "Object Layer 2" …` |
| `[32]` | table | `{ id = "casino_shortcut", name = "Casino Shortcut", ts_source = "../assets/objects/EXE6_Shortcuts.tsx", gid = 366, layer = "Object Layer 2" …` |
| `[33]` | table | `{ id = "giant_rug", name = "Giant PokeBall Rug", ts_source = "../assets/objects/pokemon_huge_128x96_128x96.tsx", gid = 370, layer = "Object …` |
| `[34]` | table | `{ id = "med_rug", name = "Medium PokeBall Rug", ts_source = "../assets/objects/midrug_72x96_72x96.tsx", gid = 371, layer = "Object Layer 2" …` |
| `[35]` | table | `{ id = "pokeshelf_silver", name = "Medium Poke Shelf Silver", ts_source = "../assets/objects/pokemon_mid_72x96_72x96.tsx", gid = 381, layer …` |
| `[36]` | table | `{ id = "poke_plant", name = "Medium Poke Plant", ts_source = "../assets/objects/pokemon_mid_72x96_72x96.tsx", gid = 383, layer = "Object Lay…` |
| `[37]` | table | `{ id = "poke_chooser", name = "Medium Poke Chooser", ts_source = "../assets/objects/pokemon_mid_72x96_72x96.tsx", gid = 386, layer = "Object…` |
| `[38]` | table | `{ id = "poke_desk", name = "Medium Poke Desk", ts_source = "../assets/objects/pokemon_mid_72x96_72x96.tsx", gid = 388, layer = "Object Layer…` |
| `[39]` | table | `{ id = "pokeshelf_brown", name = "Medium Poke Shelf Brown", ts_source = "../assets/objects/pokemon_mid_72x96_72x96.tsx", gid = 389, layer = …` |
| `[40]` | table | `{ id = "poke_master", name = "Small Master Ball", ts_source = "../assets/objects/pokemon_small_32x32_32x32.tsx", gid = 2147484051, layer = "…` |
| `[41]` | table | `{ id = "poke_great", name = "Small Great Ball", ts_source = "../assets/objects/pokemon_small_32x32_32x32.tsx", gid = 2147484052, layer = "Ob…` |
| `[42]` | table | `{ id = "poke_ball", name = "Small Poke Ball", ts_source = "../assets/objects/pokemon_small_32x32_32x32.tsx", gid = 2147484056, layer = "Obje…` |
| `[43]` | table | `{ id = "pokedesk_brown", name = "Medium Poke Desk Brown", ts_source = "../assets/objects/pokemon_pairs_128x96_128x96.tsx", gid = 428, layer …` |
| `[44]` | table | `{ id = "poketable_silver", name = "Medium Poke Table", ts_source = "../assets/objects/pokemon_pairs_128x96_128x96.tsx", gid = 430, layer = "…` |
| `[45]` | table | `{ id = "jukebox", name = "Jukebox", ts_source = "../assets/objects/jukebox.tsx", gid = 2147484084, layer = "Object Layer 2" }` |
| `[46]` | table | `{ id = "card_frame", name = "Card Frame" }` |
| `[47]` | table | `{ id = "pet_mettaur", name = "Pet: Mettaur" }` |
| `[48]` | table | `{ id = "pet_meddy", name = "Pet: Meddy" }` |
| `[49]` | table | `{ id = "pet_ratty", name = "Pet: Ratty" }` |
| `[50]` | table | `{ id = "pet_swordy", name = "Pet: Swordy" }` |
| `[51]` | table | `{ id = "pet_moloko", name = "Pet: Moloko" }` |
| `[52]` | table | `{ id = "pet_powie", name = "Pet: Powie" }` |
| `[53]` | table | `{ id = "pet_kabutank", name = "Pet: Kabutank" }` |
| `[54]` | table | `{ id = "pet_spooky", name = "Pet: Spooky" }` |

### `MENU_COLOR` *(line 148)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `YELLOW` | table | `{r=245,g=210,b=70}` |
| `GREEN` | table | `{r=60, g=170,b=90}` |
| `BLUE` | table | `{r=80, g=140,b=220}` |

### `YELLOW` *(line 150)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `245` |
| `g` | number literal | `210` |
| `b` | number literal | `70` |

### `GREEN` *(line 151)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `60` |
| `g` | number literal | `170` |
| `b` | number literal | `90` |

### `BLUE` *(line 152)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `80` |
| `g` | number literal | `140` |
| `b` | number literal | `220` |

### `_AREA_ID_SET` *(line 254)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `MENU_DEBOUNCE` *(line 334)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `try_layers` *(line 868)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `template_layer_name` |
| `[2]` | string literal | `"Object Layer 1"` |
| `[3]` | string literal | `"Object Layer 2"` |

### `data` *(line 924)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"tile"` |
| `gid` | expression/reference | `base_gid` |
| `flipped_horizontally` | expression/reference | `want_fh` |
| `flipped_vertically` | expression/reference | `want_fv` |
| `rotated` | expression/reference | `want_fr` |

### `custom_properties` *(line 931)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `placed_by_oncehub` | string literal | `"preview"` |
| `oncehub_preview` | string literal | `"true"` |
| `oncehub_key` | expression/reference | `s.once_key` |
| `passable` | string literal | `"true"` |

### `info` *(line 956)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `""` |
| `class` | string literal | `"DecorRemovePreview"` |
| `visible` | boolean literal | `true` |
| `x` | expression/reference | `target.x` |
| `y` | expression/reference | `target.y` |
| `z` | expression/reference | `target.z` |
| `width` | expression/reference | `target.width or 1` |
| `height` | expression/reference | `target.height or 1` |
| `rotation` | number literal | `0` |
| `data` | table | `{ type = "tile", gid = td.gid or 0, flipped_horizontally = (s._blink and (not base_fh)) or base_fh, flipped_vertically = base_fv, rotated = …` |
| `custom_properties` | table | `{ placed_by_oncehub = "preview", oncehub_preview = "true", oncehub_key = s.once_key, passable = "true", }` |

### `data` *(line 963)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"tile"` |
| `gid` | expression/reference | `td.gid or 0` |
| `flipped_horizontally` | call/expression | `(s._blink and (not base_fh)) or base_fh` |
| `flipped_vertically` | expression/reference | `base_fv` |
| `rotated` | expression/reference | `base_fr` |

### `custom_properties` *(line 970)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `placed_by_oncehub` | string literal | `"preview"` |
| `oncehub_preview` | string literal | `"true"` |
| `oncehub_key` | expression/reference | `s.once_key` |
| `passable` | string literal | `"true"` |

### `data` *(line 1034)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"tile"` |
| `gid` | expression/reference | `base_gid` |
| `flipped_horizontally` | expression/reference | `fh` |
| `flipped_vertically` | expression/reference | `fv` |
| `rotated` | expression/reference | `fr` |

### `custom_properties` *(line 1041)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `placed_by_oncehub` | string literal | `"preview"` |
| `oncehub_preview` | string literal | `"true"` |
| `oncehub_key` | expression/reference | `s.once_key` |
| `passable` | string literal | `"true"` |

### `ci` *(line 1054)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ci` *(line 1131)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 1248)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `new_cp` *(line 1254)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `spawn_info` *(line 1340)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | expression/reference | `cp.cf_title or "Card"` |
| `ow_png` | expression/reference | `cp.cf_png` |
| `ow_anim` | expression/reference | `cp.cf_anim` |

### `new_cp` *(line 1354)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `new_cp` *(line 1391)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `tried` *(line 1520)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `anchor` *(line 1840)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `""` |
| `class` | string literal | `"Decor"` |
| `visible` | boolean literal | `false` |
| `x` | expression/reference | `preview.x` |
| `y` | expression/reference | `preview.y` |
| `z` | expression/reference | `preview.z` |
| `width` | expression/reference | `preview.width` |
| `height` | expression/reference | `preview.height` |
| `rotation` | number literal | `0` |
| `data` | expression/reference | `preview.data` |
| `custom_properties` | table | `{ placed_by_oncehub = "true", oncehub_gid = tostring(s.object_gid or ""), oncehub_name = "Card Frame", oncehub_id = "card_frame", oncehub_ke…` |

### `custom_properties` *(line 1848)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `placed_by_oncehub` | string literal | `"true"` |
| `oncehub_gid` | call/expression | `tostring(s.object_gid or "")` |
| `oncehub_name` | string literal | `"Card Frame"` |
| `oncehub_id` | string literal | `"card_frame"` |
| `oncehub_key` | call/expression | `tostring(s.once_key or "")` |
| `visitor_secret` | expression/reference | `s.is_visitor and s.visitor_secret or nil` |
| `owner_secret` | call/expression | `(not s.is_visitor) and (s.owner_secret or nil) or nil` |
| `cf_title` | call/expression | `(custom.display_name_for_title and custom.display_name_for_title(lc.name)) or (custom.get_summon_display_name and custom.get_summon_display_…` |
| `cf_png` | expression/reference | `lc.ow_png or lc.png` |
| `cf_anim` | expression/reference | `lc.ow_anim or lc.anim` |
| `cf_bot_id` | call/expression | `tostring(bid)` |
| `cf_item_id` | expression/reference | `item_id` |
| `cf_owner_secret` | expression/reference | `placer_secret` |
| `oncehub_bucket` | call/expression | `tostring(s.bucket_area_id or "")` |

### `permanent_cp` *(line 1877)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `placed_by_oncehub` | string literal | `"true"` |
| `oncehub_gid` | call/expression | `tostring(s.object_gid or "")` |
| `oncehub_name` | call/expression | `tostring(s.object_name or "Object")` |
| `oncehub_id` | call/expression | `tostring(s.object_id or "object")` |
| `oncehub_key` | call/expression | `tostring(s.once_key or "")` |
| `oncehub_bucket` | call/expression | `tostring(s.bucket_area_id or "")` |
| `visitor_secret` | expression/reference | `s.is_visitor and s.visitor_secret or nil` |
| `owner_secret` | call/expression | `(not s.is_visitor) and (s.owner_secret or nil) or nil` |

### `permanent` *(line 1907)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | string literal | `""` |
| `class` | string literal | `"Decor"` |
| `visible` | boolean literal | `true` |
| `x` | expression/reference | `preview.x` |
| `y` | expression/reference | `preview.y` |
| `z` | expression/reference | `preview.z` |
| `width` | expression/reference | `preview.width` |
| `height` | expression/reference | `preview.height` |
| `rotation` | number literal | `0` |
| `data` | expression/reference | `preview.data` |
| `custom_properties` | expression/reference | `permanent_cp` |

### `posts` *(line 2262)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `helpers.create_bbs_option("Place object")` |
| `[2]` | call/expression | `helpers.create_bbs_option("Remove object")` |
| `[3]` | call/expression | `helpers.create_bbs_option("Clear all")` |

### `opts` *(line 2362)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `helpers.create_bbs_option(LABEL_SET)` |
| `[2]` | call/expression | `helpers.create_bbs_option(LABEL_CLEAR)` |
| `[3]` | call/expression | `helpers.create_bbs_option(LABEL_TOGGLE)` |

### `opts` *(line 2449)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `helpers.create_bbs_option("Enable Visitor Decor")` |
| `[2]` | call/expression | `helpers.create_bbs_option("Disable Visitor Decor")` |

### `placed_by_kind` *(line 2654)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `posts` *(line 2805)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `helpers.create_bbs_option("Summon Pet")` |
| `[2]` | call/expression | `helpers.create_bbs_option("Remove Pet")` |
| `[3]` | call/expression | `helpers.create_bbs_option("Back")` |

### `posts` *(line 2832)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `helpers.create_bbs_option("Set/Clear visitor password")` |
| `[2]` | call/expression | `helpers.create_bbs_option("Decorate HP")` |
| `[3]` | call/expression | `helpers.create_bbs_option("Visitor Decorations")` |
| `[4]` | call/expression | `helpers.create_bbs_option("Pets")` |

### `new_rec` *(line 3285)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `owner_secret` | expression/reference | `safe_secret` |
| `owner_name` | expression/reference | `player_name` |
| `item_id` | expression/reference | `item_object_id` |
| `item_name` | expression/reference | `item_info.name` |
| `price_paid` | expression/reference | `price` |
| `owned_at` | expression/reference | `start_ts` |
| `expires_at` | expression/reference | `end_ts` |
| `jukebox_song` | nil | `nil` |
| `password` | nil | `nil` |

### `sell_rows` *(line 3380)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/events/eznpcs_onceitem.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
