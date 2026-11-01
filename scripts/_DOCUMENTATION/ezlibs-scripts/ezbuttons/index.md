# `ezbuttons.lua`

> **Source:** `scripts/ezlibs-scripts/ezbuttons.lua`  
> **Source lines:** 1979  
> **Functions detected:** 67  
> **Table declarations detected:** 28

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

ezbuttons.lua Creates trigger-based buttons (non-solid NPCs). Logical relationships are defined with groups and button/group effects. Supports five interaction behaviors: Pressure Plate, One-Time, Toggle, Custom, Timed. Supports area-wide unlock/relock via "Area Wide" flag on Unlock/Relock Behavior objects. Optional per-button flag "Bots Can Trigger" (bool, default false) causes the button to register a parallel ezbottriggers rectangle/ellipse in addition to its eztriggers one, so NPCs entering or leaving can drive the same Pressure Plate / One-Time / Toggle / Timed state machine. Custom behavior is excluded because custom scripts receive a player_id. Bot-triggered activations pass nil as the activator, so per-player checkpoint unlocks and relocks have no target. When that happens, the deactivation path falls back to area-wide so the button's state change is fully reversed - matching player behavior as closely as possible. Optional "Cinematic Unlock" (bool, default false) on OW Buttons, Button Groups, and Combo Button Groups: player-triggered unlocks lock input, pan the player's camera smoothly to the first checkpoint, hold, then snap the camera back to the player and unlock input. Companion "Cinematic Duration" (number, default 1.0) sets the hold time after the checkpoint animation. Optional "Cinematic on Bot Trigger" (bool, default false): when true, bot (NPC) activations also play the cinematic - the camera pans for every live player in the area. When false, bot triggers perform the unlock normally but suppress the cinematic. Player-triggered cinematics are unaffected. Camera API: uses Net.unlock_player_camera / Net.move_player_camera / Net.track_with_player_camera (the same primitives camera-controller.lua uses). Override ezbuttons.camera_release / camera_move / camera_reattach if a project's engine revision exposes different names.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 34
- `scripts/ezlibs-scripts/object_registry` — line 35
- `scripts/ezlibs-scripts/eznpcs/eznpcs` — line 36
- `scripts/ezlibs-scripts/eztriggers/eztriggers` — line 37
- `scripts/ezlibs-scripts/ezmemory` — line 38
- `scripts/ezlibs-scripts/ezbus` — line 39
- `scripts/ezlibs-scripts/helpers` — line 40
- `scripts/ezlibs-scripts/ezcheckpoints` — line 41
- `scripts/ezlibs-scripts/utils/eztiledutils` — line 42

## Events

- `Net:on("player_join", function(event) ...)` — line 411. The event name is taken directly from this source.
- `Net:on("player_area_transfer", function(event) ...)` — line 427. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 483. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 59 | `async` | `p` |
| 64 | `await` | `v` |
| 80 | `player_is_alive` | `player_id` |
| 88 | `validate_button_object` | `area_id, object` |
| 105 | `object_to_tile_pos` | `object` |
| 142 | `normalize_ids` | `ids` |
| 157 | `find_live_contributor` | `area_id, group` |
| 158 | `first_live_from` | `ids` |
| 180 | `resolve_transition_player` | `area_id, group, event_player_id` |
| 200 | `combo_is_satisfied` | `area_id, combo` |
| 222 | `group_is_satisfied` | `area_id, group` |
| 252 | `apply_logic_action` | `area_id, target_id, action, player_id, was_bot` |
| 288 | `process_logic_event` | `event` |
| 332 | `enqueue_logic_event` | `area_id, object_id, active, player_id, was_bot` |
| 357 | `hide_button_placeholder_for_player` | `player_id, area_id, object_id` |
| 364 | `hide_button_placeholders_for_player` | `player_id` |
| 375 | `set_button_animation` | `bot_id, anim_state, loop` |
| 384 | `sync_button_animations_for_player` | `player_id` |
| 401 | `apply_area_wide_unlocks` | `player_id, area_id` |
| 446 | `cleanup_player_state` | `player_id` |
| 492 | `ezbuttons.handle_player_disconnect` | `player_id` |
| 500 | `create_button_bot` | `area_id, asset_name, x, y, z, direction, bot_name, animation_name, mug_animation_name, initial_anim` |
| 546 | `is_button_active` | `area_id, object_id` |
| 552 | `set_button_active_state` | `area_id, object_id, bot_id, active_anim, inactive_anim, active` |
| 563 | `create_button_trigger` | `area_id, object, width_px, height_px, trigger_id` |
| 587 | `ezbuttons.camera_release` | `player_id` |
| 590 | `ezbuttons.camera_move` | `player_id, x, y, z` |
| 594 | `ezbuttons.camera_reattach` | `player_id` |
| 600 | `smooth_camera_pan` | `player_id, from_pos, to_pos, duration` |
| 621 | `run_cinematic_unlock` | `player_id, button_area_id, button_object_id, checkpoint_ids, permanent, hold_duration` |
| 708 | `run_cinematic_for_all_players` | `button_area_id, button_object_id, checkpoint_ids, permanent, hold_duration` |
| 720 | `perform_activation` | `area_id, object_id, player_id, info` |
| 810 | `perform_deactivation` | `area_id, object_id, info` |
| 874 | `reconcile_pending_button_state` | `area_id, object_id, info` |
| 894 | `deactivate_button_internal` | `area_id, object_id, info` |
| 922 | `finish_deactivation` | `(none)` |
| 942 | `start_timed_deactivation` | `area_id, object_id, info` |
| 965 | `activate_button` | `area_id, object_id, player_id, was_bot` |
| 1004 | `deactivate_button` | `area_id, object_id` |
| 1016 | `load_custom_script` | `script_path` |
| 1038 | `register_button_object` | `area_id, object, group_member` |
| 1274 | `resolve_actor_id` | `event, actor_type` |
| 1279 | `mark_actor_present` | `actor_id, actor_type` |
| 1287 | `clear_actor_present` | `actor_id, actor_type` |
| 1295 | `on_button_entered` | `event, actor_type` |
| 1349 | `on_button_departed` | `event, actor_type` |
| 1417 | `ezbuttons.is_button_active` | `area_id, object_id` |
| 1421 | `ezbuttons.activate_button` | `area_id, object_id, player_id, was_bot` |
| 1425 | `ezbuttons.deactivate_button` | `area_id, object_id` |
| 1429 | `ezbuttons.reset_button` | `area_id, object_id` |
| 1441 | `ezbuttons.define_group` | `area_id, group_id, button_ids, mode, options` |
| 1468 | `ezbuttons.on_group_change` | `area_id, group_id, callback` |
| 1476 | `ezbuttons.add_button_effect` | `area_id, source_id, event_name, target_id, action` |
| 1488 | `ezbuttons.add_group_effect` | `area_id, group_id, event_name, target_id, action` |
| 1500 | `ezbuttons.refresh_groups` | `area_id, player_id` |
| 1510 | `ezbuttons.get_group_state` | `area_id, group_id` |
| 1518 | `property_ids` | `props, prefix` |
| 1539 | `apply_group_checkpoint_action` | `area_id, player_id, checkpoint_ids, area_wide, unlock, permanent, group_id, cinematic, cinematic_duration` |
| 1650 | `route_group_callback` | `area_id, group_ref, event_player_id, checkpoint_ids, area_wide, unlock, permanent, group_id, log_tag, cinematic, cinematic_duration, cinematic_on_bot, was_bot` |
| 1679 | `configure_group_object` | `area_id, object` |
| 1714 | `on_change` | `changed_area_id, changed_group_id, satisfied, player_id, was_bot` |
| 1756 | `try_configure_pending_groups` | `area_id` |
| 1774 | `configure_button_combo_object` | `area_id, object` |
| 1816 | `try_configure_pending_combos` | `area_id` |
| 1834 | `configure_combo_button_group_object` | `area_id, object` |
| 1876 | `callback` | `changed_area_id, changed_group_id, satisfied, player_id, was_bot` |
| 1926 | `try_configure_pending_combo_groups` | `area_id` |

### Function notes

- **`async(p)`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`await(v)`** *(source line 64)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`player_is_alive(player_id)`** — ========================================================================== Player liveness ========================================================================== *(source line 80)*
- **`validate_button_object(area_id, object)`** *(source line 88)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`object_to_tile_pos(object)`** *(source line 105)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_ids(ids)`** *(source line 142)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`find_live_contributor(area_id, group)`** — ========================================================================== Live-contributor resolution for group state transitions ========================================================================== *(source line 157)*
- **`first_live_from(ids)`** *(source line 158)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_transition_player(area_id, group, event_player_id)`** *(source line 180)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`combo_is_satisfied(area_id, combo)`** *(source line 200)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`group_is_satisfied(area_id, group)`** *(source line 222)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`apply_logic_action(area_id, target_id, action, player_id, was_bot)`** *(source line 252)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`process_logic_event(event)`** *(source line 288)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`enqueue_logic_event(area_id, object_id, active, player_id, was_bot)`** *(source line 332)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide_button_placeholder_for_player(player_id, area_id, object_id)`** *(source line 357)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide_button_placeholders_for_player(player_id)`** *(source line 364)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_button_animation(bot_id, anim_state, loop)`** *(source line 375)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sync_button_animations_for_player(player_id)`** *(source line 384)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`apply_area_wide_unlocks(player_id, area_id)`** *(source line 401)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cleanup_player_state(player_id)`** — ========================================================================== Disconnect cleanup - deterministic three-phase ========================================================================== *(source line 446)*
- **`ezbuttons.handle_player_disconnect(player_id)`** *(source line 492)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_button_bot(area_id, asset_name, x, y, z, direction, bot_name, animation_name, mug_animation_name, initial_anim)`** — Helper: create a non‑solid bot for the button *(source line 500)*
- **`is_button_active(area_id, object_id)`** *(source line 546)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_button_active_state(area_id, object_id, bot_id, active_anim, inactive_anim, active)`** *(source line 552)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_button_trigger(area_id, object, width_px, height_px, trigger_id)`** *(source line 563)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.camera_release(player_id)`** — ========================================================================== Cinematic unlock (uses Net camera primitives from camera-controller.lua) ========================================================================== *(source line 587)*
- **`ezbuttons.camera_move(player_id, x, y, z)`** *(source line 590)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.camera_reattach(player_id)`** *(source line 594)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`smooth_camera_pan(player_id, from_pos, to_pos, duration)`** *(source line 600)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run_cinematic_unlock(player_id, button_area_id, button_object_id, checkpoint_ids, permanent, hold_duration)`** *(source line 621)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run_cinematic_for_all_players(button_area_id, button_object_id, checkpoint_ids, permanent, hold_duration)`** — Fan a cinematic out to every live player in an area (used for bot triggers when "Cinematic on Bot Trigger" is enabled). *(source line 708)*
- **`perform_activation(area_id, object_id, player_id, info)`** — ============================================================ PERFORM ACTIVATION ============================================================ *(source line 720)*
- **`perform_deactivation(area_id, object_id, info)`** — ============================================================ PERFORM DEACTIVATION ============================================================ *(source line 810)*
- **`reconcile_pending_button_state(area_id, object_id, info)`** *(source line 874)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`deactivate_button_internal(area_id, object_id, info)`** *(source line 894)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`finish_deactivation()`** *(source line 922)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`start_timed_deactivation(area_id, object_id, info)`** *(source line 942)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`activate_button(area_id, object_id, player_id, was_bot)`** *(source line 965)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`deactivate_button(area_id, object_id)`** *(source line 1004)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`load_custom_script(script_path)`** *(source line 1016)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`register_button_object(area_id, object, group_member)`** — ============================================================ OBJECT REGISTRY HANDLER FOR "OW BUTTON" ============================================================ *(source line 1038)*
- **`resolve_actor_id(event, actor_type)`** *(source line 1274)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`mark_actor_present(actor_id, actor_type)`** *(source line 1279)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`clear_actor_present(actor_id, actor_type)`** *(source line 1287)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_button_entered(event, actor_type)`** *(source line 1295)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_button_departed(event, actor_type)`** *(source line 1349)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.is_button_active(area_id, object_id)`** — Public API *(source line 1417)*
- **`ezbuttons.activate_button(area_id, object_id, player_id, was_bot)`** *(source line 1421)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.deactivate_button(area_id, object_id)`** *(source line 1425)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.reset_button(area_id, object_id)`** *(source line 1429)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.define_group(area_id, group_id, button_ids, mode, options)`** *(source line 1441)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.on_group_change(area_id, group_id, callback)`** *(source line 1468)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.add_button_effect(area_id, source_id, event_name, target_id, action)`** *(source line 1476)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.add_group_effect(area_id, group_id, event_name, target_id, action)`** *(source line 1488)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.refresh_groups(area_id, player_id)`** *(source line 1500)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ezbuttons.get_group_state(area_id, group_id)`** *(source line 1510)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`property_ids(props, prefix)`** *(source line 1518)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`apply_group_checkpoint_action(area_id, player_id, checkpoint_ids, area_wide, unlock, permanent, group_id, cinematic, cinematic_duration)`** — Group checkpoint action. Area-wide: applies to every live player. Per-player: applies to the resolved target if still alive; otherwise skips with a log.  `cinematic` (optional) enables the camera presentation on the unlock path. Relock is never cinematic (the "Cinematic Unlock" property is unlock-only). *(source line 1539)*
- **`route_group_callback(area_id, group_ref, event_player_id, checkpoint_ids, area_wide, unlock, permanent, group_id, log_tag, cinematic, cinematic_duration, cinematic_on_bot, was_bot)`** — Resolve-and-route wrapper used by every group/combo callback.  Bot-trigger handling: * If `was_bot` is true and the event is a sat isfied transition (unlock): - `cinematic_on_bot` false (default): suppress the cinematic, but still perform the unlock through the normal resolution path. - `cinematic_on_bot` true: force area-wide so the cinematic fans out to every live player in the area. * Player-triggered transitions are unchanged. *(source line 1650)*
- **`configure_group_object(area_id, object)`** *(source line 1679)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_change(changed_area_id, changed_group_id, satisfied, player_id, was_bot)`** *(source line 1714)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_configure_pending_groups(area_id)`** *(source line 1756)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`configure_button_combo_object(area_id, object)`** *(source line 1774)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_configure_pending_combos(area_id)`** *(source line 1816)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`configure_combo_button_group_object(area_id, object)`** *(source line 1834)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`callback(changed_area_id, changed_group_id, satisfied, player_id, was_bot)`** *(source line 1876)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_configure_pending_combo_groups(area_id)`** *(source line 1926)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `ezbuttons` *(line 65)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `custom_script_cache` *(line 71)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `button_triggers` *(line 73)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `button_placeholders` *(line 113)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `button_bots` *(line 114)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `button_groups` *(line 125)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `button_effects` *(line 127)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `group_effects` *(line 128)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_group_objects` *(line 129)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `group_object_ids` *(line 130)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_group_effect_objects` *(line 131)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `combo_object_definitions` *(line 132)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_combo_objects` *(line 133)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pending_combo_group_objects` *(line 134)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `logic_queue` *(line 138)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `required` *(line 201)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `logic_queue` *(line 352)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `plates_to_deactivate` *(line 448)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `npc_data` *(line 509)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `asset_name` | expression/reference | `asset_name` |
| `bot_id` | nil | `nil` |
| `name` | expression/reference | `bot_name` |
| `area_id` | expression/reference | `area_id` |
| `texture_path` | expression/reference | `texture_path` |
| `animation_path` | expression/reference | `animation_path` |
| `animation` | expression/reference | `initial_anim or "IDLE_D"` |
| `direction` | expression/reference | `direction` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |
| `solid` | boolean literal | `false` |
| `size` | number literal | `0.2` |
| `speed` | number literal | `1` |
| `dont_face_player` | boolean literal | `true` |
| `warp_in` | boolean literal | `true` |

### `from_pos` *(line 657)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `player_pos.x` |
| `y` | expression/reference | `player_pos.y` |
| `z` | expression/reference | `cam_z` |

### `to_pos` *(line 658)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(cp_obj.x) or 0` |
| `y` | call/expression | `tonumber(cp_obj.y) or 0` |
| `z` | expression/reference | `cam_z` |

### `info` *(line 1165)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `object_id` | expression/reference | `object.id` |
| `bot_id` | expression/reference | `bot_id` |
| `active_anim` | expression/reference | `active_anim` |
| `inactive_anim` | expression/reference | `inactive_anim` |
| `behavior` | expression/reference | `behavior` |
| `script_path` | expression/reference | `script_path` |
| `bot_x` | expression/reference | `bot_x` |
| `bot_y` | expression/reference | `bot_y` |
| `bot_z` | expression/reference | `bot_z` |
| `activation_anim` | expression/reference | `activation_anim` |
| `activation_duration` | expression/reference | `activation_duration` |
| `deactivation_anim` | expression/reference | `deactivation_anim` |
| `deactivation_duration` | expression/reference | `deactivation_duration` |
| `is_animating` | boolean literal | `false` |
| `pending_state` | nil | `nil` |
| `pending_player_id` | nil | `nil` |
| `pending_was_bot` | boolean literal | `false` |
| `trigger_players` | table | `{}` |
| `trigger_bots` | table | `{}` |
| `trigger_x` | expression/reference | `trigger_source_obj.x` |
| `trigger_y` | expression/reference | `trigger_source_obj.y` |
| `trigger_z` | expression/reference | `trigger_source_obj.z or 0` |
| `trigger_half_w` | call/expression | `(TILE_SIZE / trigger_width_px) * 0.5` |
| `trigger_half_h` | call/expression | `(TILE_SIZE / trigger_height_px) * 0.5` |
| `activated_time` | expression/reference | `activated_time` |
| `timed_cancel` | boolean literal | `false` |
| `timer_generation` | number literal | `0` |
| `relock_target` | expression/reference | `relock_target` |
| `relock_area_wide` | expression/reference | `relock_area_wide` |
| `last_activator` | nil | `nil` |
| `last_activator_was_bot` | boolean literal | `false` |
| `group_member` | expression/reference | `group_member` |
| `unlock_checkpoint_obj` | expression/reference | `unlock_checkpoint_obj` |
| `unlock_permanently` | expression/reference | `unlock_permanently` |
| `unlock_area_wide` | expression/reference | `unlock_area_wide` |
| `cinematic_unlock` | expression/reference | `cinematic_unlock` |
| `cinematic_duration` | expression/reference | `cinematic_duration` |
| `cinematic_on_bot` | expression/reference | `cinematic_on_bot` |

### `trigger_players` *(line 1185)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `trigger_bots` *(line 1186)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `numbered` *(line 1519)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ids` *(line 1529)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `combos` *(line 1857)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `combo` *(line 1863)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `object_id` | expression/reference | `definition.object_id` |
| `button_ids` | call/expression | `normalize_ids(definition.button_ids)` |
| `forbidden_ids` | call/expression | `normalize_ids(definition.forbidden_ids)` |
| `mode` | expression/reference | `combo_mode` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/ezbuttons.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
