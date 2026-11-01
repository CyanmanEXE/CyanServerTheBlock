# `main.lua`

> **Source:** `scripts/ezlibs-custom/footbomb/main.lua`  
> **Source lines:** 4718  
> **Functions detected:** 124  
> **Table declarations detected:** 78

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

FootBomb Controller and match-instance entry point. Loaded by scripts/ezlibs-scripts/main.lua through custom.lua.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 4
- `scripts/ezlibs-scripts/object_registry` — line 5
- `scripts/ezlibs-scripts/ezmapinstance` — line 6
- `scripts/net-games/main` — line 7
- `scripts/net-games/ui-safe` — line 8
- `scripts/ezlibs-scripts/ezexplosions` — line 9
- `scripts/displayer/text-layout` — line 10
- `scripts/input-controller/main` — line 11
- `scripts/net-games/ui-suppression` — line 12
- `scripts/boom/main` — line 13
- `scripts/ezlibs-scripts/ezbus` — line 14
- `scripts/ezlibs-scripts/ezemitter` — line 15
- `scripts/ezlibs-custom/footbomb/constants` — line 17
- `scripts/ezlibs-custom/footbomb/animation_states` — line 18
- `scripts/ezlibs-custom/footbomb/navi_options` — line 19
- `scripts/ezlibs-custom/footbomb/bomb_options` — line 20
- `scripts/world-attachment` — line 21
- `scripts/ezlibs-custom/footbomb/result_timeline` — line 22
- `scripts/ezlibs-custom/footbomb/sfx_driver` — line 23
- `scripts/displayer/displayer` — line 24
- `scripts/ezlibs-custom/footbomb/state` — line 27
- `scripts/ezlibs-custom/footbomb/animation_diagnostics` — line 193

## Events

- `Net:on("tick", function(event) ...)` — line 4609. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 60 | `log` | `message` |
| 65 | `async` | `p` |
| 69 | `await` | `v` |
| 77 | `get_footbomb_animation` | `path` |
| 130 | `ensure_round_events` | `instance_id` |
| 140 | `get_round_events` | `instance_id` |
| 145 | `destroy_round_events` | `instance_id` |
| 207 | `run_direction_mapping_test` | `(none)` |
| 239 | `draw_confirm_prompt` | `player_id, text_id` |
| 254 | `hide_role_text` | `player_id, rep` |
| 269 | `build_role_panel` | `player_id, rep, role` |
| 289 | `make_icon_child` | `(none)` |
| 354 | `draw_role_text` | `player_id, rep, role` |
| 406 | `begin_role_text_suppression` | `player_id` |
| 421 | `end_role_text_suppression` | `player_id, rep` |
| 436 | `await_player_message` | `player_id, ...` |
| 443 | `await_player_quiz` | `player_id, ...` |
| 450 | `draw_navi_name` | `player_id, rep, name` |
| 461 | `as_string` | `value, fallback` |
| 466 | `as_number` | `value, fallback` |
| 472 | `ensure_area_refs` | `area_id` |
| 477 | `create_ref_npc` | `area_id, object` |
| 527 | `player_is_available` | `player_id` |
| 540 | `find_named_spawn_points` | `area_id` |
| 597 | `safe_remove_bot` | `bot_id` |
| 601 | `set_bot_animation_state` | `bot_id, animation_state, should_loop` |
| 612 | `ensure_bot_direction` | `bot, direction` |
| 628 | `cancel_hold` | `bot, reason` |
| 637 | `create_match_bots` | `instance, spawn_points, vs_npc` |
| 692 | `provide_match_assets` | `player_id` |
| 695 | `provide` | `path` |
| 734 | `transfer_match_players` | `instance, player_ids, spawn_points` |
| 767 | `remove_instance_bots` | `instance_id` |
| 785 | `cleanup_empty_instance` | `instance` |
| 813 | `server_asset_file_exists` | `path` |
| 825 | `provide_instance_asset` | `area_id, path` |
| 852 | `read_png_dimensions` | `path` |
| 866 | `u32` | `offset` |
| 878 | `validate_animation_states` | `path, required_states, label, texture_path` |
| 965 | `provide_instance_bot_assets` | `area_id` |
| 967 | `add` | `path` |
| 1034 | `provide_source_area_assets` | `area_id, reason` |
| 1070 | `make_instance` | `player_id, source_area_id, object, mode` |
| 1139 | `move_player_off_map` | `player_id, area_id` |
| 1162 | `hide_bomb_selector_ui` | `player_id, rep` |
| 1175 | `direction_cursor_id` | `rep, direction` |
| 1182 | `draw_direction_cursor` | `player_id, rep, direction, y` |
| 1209 | `show_direction_selector_ui` | `player_id, rep` |
| 1219 | `hide_direction_selector_ui` | `player_id, rep` |
| 1231 | `update_direction_selector_bob` | `player_id, rep` |
| 1247 | `hide_selector_ui` | `player_id, rep` |
| 1261 | `show_bomb_selector_ui` | `player_id, rep` |
| 1298 | `show_selector_ui` | `player_id, rep` |
| 1329 | `remove_representation` | `player_id` |
| 1369 | `setup_player_representation` | `player_id, instance, bot_record` |
| 1524 | `setup_representations_for_match` | `instance, player_ids, bots` |
| 1534 | `launch_npc_match` | `player_id, source_area_id, object, npc` |
| 1565 | `launch_player_match` | `waiting, second_player` |
| 1601 | `cycle_player_skin` | `player_id, direction` |
| 1691 | `cycle_bomb_skin` | `player_id, direction` |
| 1704 | `fade_player_to_black` | `player_id` |
| 1718 | `fade_player_to_white` | `player_id` |
| 1730 | `fade_player_in` | `player_id` |
| 1744 | `focus_player_camera_for_round` | `player_id, instance_id` |
| 1770 | `position_bots_for_round` | `instance_id` |
| 1804 | `spawn_bomb_bot_for_round` | `instance_id, human_reps` |
| 1910 | `set_defender_animation_for_round` | `instance_id, animation_state, phase` |
| 1949 | `set_kicker_pose_for_round` | `instance_id` |
| 1980 | `apply_round_role_poses` | `instance_id, phase` |
| 2002 | `reassert_round_start_poses` | `instance_id` |
| 2036 | `prime_round_bot_animations` | `instance_id` |
| 2093 | `draw_scoreboard_mug` | `player_id, rep, bot, ui_id, x` |
| 2114 | `draw_scoreboard_for_player` | `player_id, rep, bots` |
| 2143 | `measure_score` | `text` |
| 2168 | `draw_score_number` | `text_id, score_text, x, y, slot` |
| 2196 | `update_scoreboard` | `instance_id` |
| 2206 | `hide_scoreboard_for_player` | `player_id, rep` |
| 2215 | `hide_scoreboard_for_instance` | `instance_id` |
| 2223 | `play_sound_for_instance` | `instance_id, sound_path, reason` |
| 2249 | `move_bot_smoothly` | `bot, target, speed, phase, animation_state, duration_override` |
| 2348 | `set_result_animation` | `bot, animation_state, direction, phase, should_loop` |
| 2362 | `hold_pose_for` | `bot, state, direction, hold_seconds, phase, should_loop` |
| 2418 | `award_round_point` | `instance_id, kicker, defender, winner` |
| 2437 | `evaluate_match_point` | `bots, instance_id` |
| 2504 | `complete_match_and_return` | `instance_id` |
| 2577 | `get_animation_state_duration` | `bot, state_name` |
| 2595 | `get_animation_movement_end` | `bot, state_name` |
| 2616 | `world_xy_distance` | `a, b` |
| 2625 | `defender_jump_position_at` | `start_position, target_position, ratio, movement_speed` |
| 2657 | `move_defender_jump_arc` | `bot, target, duration, phase` |
| 2727 | `animation_frame_at_elapsed` | `animation, state_name, elapsed` |
| 2748 | `get_navi_ball_point_offset` | `bot, state_name, elapsed, child_z` |
| 2806 | `read_bot_position` | `bot` |
| 2832 | `ensure_role_events` | `instance_id` |
| 2846 | `destroy_role_events` | `instance_id` |
| 2856 | `emit_async` | `instance_id, role, event, ...` |
| 2885 | `subscribe_kicker_handlers` | `bot, emitter, on` |
| 2898 | `run` | `(none)` |
| 2948 | `subscribe_defender_handlers` | `bot, emitter, on` |
| 2965 | `run` | `(none)` |
| 3089 | `subscribe_bomb_handlers` | `bot, emitter, on` |
| 3099 | `assign_bot_role` | `bot, new_role, instance_id` |
| 3111 | `on` | `emitter, event, fn` |
| 3134 | `move_bot_follow_keyframe` | `bot, position, phase, duration` |
| 3178 | `follow_defender_ball_point` | `instance_id, bots, ball_bot, defender, animation_state, initial_elapsed, movement_duration, animation_duration, start_position, target_position` |
| 3205 | `defender_position_at` | `t` |
| 3301 | `resolve_round_winner` | `instance_id` |
| 3594 | `mark_response_actor_done` | `actor, success` |
| 3916 | `refill_npc_direction_bag` | `bot` |
| 3931 | `draw_npc_direction` | `bot` |
| 3939 | `finish_direction_selection_if_ready` | `instance_id` |
| 3986 | `start_direction_selection` | `instance_id, human_reps` |
| 4028 | `begin_next_round` | `instance_id` |
| 4121 | `confirm_direction_selection` | `player_id, rep` |
| 4224 | `try_begin_match` | `instance_id` |
| 4334 | `confirm_bomb_selection` | `player_id, rep` |
| 4355 | `confirm_navi_selection` | `player_id, rep` |
| 4370 | `representation_is_current` | `(none)` |
| 4414 | `join_waiting_match` | `player_id, source_area_id, reference` |
| 4468 | `begin_interaction` | `player_id, area_id, reference` |
| 4536 | `FootBomb.handle_player_join` | `player_id` |
| 4546 | `FootBomb.handle_actor_interaction` | `player_id, actor_id, button` |
| 4558 | `FootBomb.handle_player_transfer` | `player_id` |
| 4587 | `FootBomb.handle_player_disconnect` | `player_id` |

### Function notes

- **`log(message)`** *(source line 60)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`async(p)`** — Shorthand for async/await *(source line 65)*
- **`await(v)`** *(source line 69)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_footbomb_animation(path)`** *(source line 77)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_round_events(instance_id)`** *(source line 130)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_round_events(instance_id)`** *(source line 140)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`destroy_round_events(instance_id)`** *(source line 145)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run_direction_mapping_test()`** *(source line 207)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_confirm_prompt(player_id, text_id)`** *(source line 239)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide_role_text(player_id, rep)`** *(source line 254)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_role_panel(player_id, rep, role)`** — Build the role panel from a sprite+text+sprite row. Returns the panel object on success, nil on failure. Does NOT touch rep.role_panel_role; that is managed by draw_role_text. *(source line 269)*
- **`make_icon_child()`** *(source line 289)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_role_text(player_id, rep, role)`** *(source line 354)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`begin_role_text_suppression(player_id)`** *(source line 406)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`end_role_text_suppression(player_id, rep)`** *(source line 421)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`await_player_message(player_id, ...)`** *(source line 436)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`await_player_quiz(player_id, ...)`** *(source line 443)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_navi_name(player_id, rep, name)`** *(source line 450)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`as_string(value, fallback)`** *(source line 461)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`as_number(value, fallback)`** *(source line 466)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_area_refs(area_id)`** *(source line 472)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_ref_npc(area_id, object)`** *(source line 477)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`player_is_available(player_id)`** *(source line 527)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`find_named_spawn_points(area_id)`** *(source line 540)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`safe_remove_bot(bot_id)`** *(source line 597)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_bot_animation_state(bot_id, animation_state, should_loop)`** *(source line 601)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_bot_direction(bot, direction)`** *(source line 612)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cancel_hold(bot, reason)`** *(source line 628)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_match_bots(instance, spawn_points, vs_npc)`** *(source line 637)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`provide_match_assets(player_id)`** *(source line 692)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`provide(path)`** *(source line 695)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`transfer_match_players(instance, player_ids, spawn_points)`** *(source line 734)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_instance_bots(instance_id)`** *(source line 767)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cleanup_empty_instance(instance)`** *(source line 785)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`server_asset_file_exists(path)`** *(source line 813)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`provide_instance_asset(area_id, path)`** *(source line 825)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`read_png_dimensions(path)`** *(source line 852)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`u32(offset)`** *(source line 866)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`validate_animation_states(path, required_states, label, texture_path)`** *(source line 878)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`provide_instance_bot_assets(area_id)`** *(source line 965)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`add(path)`** *(source line 967)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`provide_source_area_assets(area_id, reason)`** *(source line 1034)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`make_instance(player_id, source_area_id, object, mode)`** *(source line 1070)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`move_player_off_map(player_id, area_id)`** *(source line 1139)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide_bomb_selector_ui(player_id, rep)`** — --------------------------------------------------------------------------- Selector UI --------------------------------------------------------------------------- *(source line 1162)*
- **`direction_cursor_id(rep, direction)`** *(source line 1175)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_direction_cursor(player_id, rep, direction, y)`** *(source line 1182)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`show_direction_selector_ui(player_id, rep)`** *(source line 1209)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide_direction_selector_ui(player_id, rep)`** *(source line 1219)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_direction_selector_bob(player_id, rep)`** *(source line 1231)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide_selector_ui(player_id, rep)`** *(source line 1247)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`show_bomb_selector_ui(player_id, rep)`** *(source line 1261)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`show_selector_ui(player_id, rep)`** *(source line 1298)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`remove_representation(player_id)`** — --------------------------------------------------------------------------- Player representation lifecycle --------------------------------------------------------------------------- *(source line 1329)*
- **`setup_player_representation(player_id, instance, bot_record)`** *(source line 1369)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`setup_representations_for_match(instance, player_ids, bots)`** *(source line 1524)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`launch_npc_match(player_id, source_area_id, object, npc)`** — --------------------------------------------------------------------------- Match creation --------------------------------------------------------------------------- *(source line 1534)*
- **`launch_player_match(waiting, second_player)`** *(source line 1565)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cycle_player_skin(player_id, direction)`** — --------------------------------------------------------------------------- Skin selection --------------------------------------------------------------------------- *(source line 1601)*
- **`cycle_bomb_skin(player_id, direction)`** *(source line 1691)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fade_player_to_black(player_id)`** *(source line 1704)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fade_player_to_white(player_id)`** *(source line 1718)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fade_player_in(player_id)`** *(source line 1730)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`focus_player_camera_for_round(player_id, instance_id)`** *(source line 1744)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`position_bots_for_round(instance_id)`** *(source line 1770)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`spawn_bomb_bot_for_round(instance_id, human_reps)`** *(source line 1804)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_defender_animation_for_round(instance_id, animation_state, phase)`** *(source line 1910)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_kicker_pose_for_round(instance_id)`** *(source line 1949)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`apply_round_role_poses(instance_id, phase)`** *(source line 1980)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`reassert_round_start_poses(instance_id)`** — Re-apply the round-start poses after fade-in has completed. Some clients drop animation writes that arrive during the black-screen transition, so the Kicker occasionally keeps its previous state (typically FOOTBOMB_IDLE_DEFENSE from the skin-selection bot creation) even though the server accepted IDLE_UR. Re-issuing the same write while the bot is visible resolves it without touching gameplay logic. *(source line 2002)*
- **`prime_round_bot_animations(instance_id)`** *(source line 2036)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_scoreboard_mug(player_id, rep, bot, ui_id, x)`** — --------------------------------------------------------------------------- Scoreboard --------------------------------------------------------------------------- *(source line 2093)*
- **`draw_scoreboard_for_player(player_id, rep, bots)`** *(source line 2114)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`measure_score(text)`** *(source line 2143)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`draw_score_number(text_id, score_text, x, y, slot)`** *(source line 2168)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_scoreboard(instance_id)`** *(source line 2196)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide_scoreboard_for_player(player_id, rep)`** *(source line 2206)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hide_scoreboard_for_instance(instance_id)`** *(source line 2215)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`play_sound_for_instance(instance_id, sound_path, reason)`** *(source line 2223)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`move_bot_smoothly(bot, target, speed, phase, animation_state, duration_override)`** *(source line 2249)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`set_result_animation(bot, animation_state, direction, phase, should_loop)`** *(source line 2348)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hold_pose_for(bot, state, direction, hold_seconds, phase, should_loop)`** *(source line 2362)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`award_round_point(instance_id, kicker, defender, winner)`** *(source line 2418)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`evaluate_match_point(bots, instance_id)`** *(source line 2437)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`complete_match_and_return(instance_id)`** *(source line 2504)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_animation_state_duration(bot, state_name)`** *(source line 2577)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_animation_movement_end(bot, state_name)`** *(source line 2595)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`world_xy_distance(a, b)`** *(source line 2616)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`defender_jump_position_at(start_position, target_position, ratio, movement_speed)`** *(source line 2625)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`move_defender_jump_arc(bot, target, duration, phase)`** *(source line 2657)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`animation_frame_at_elapsed(animation, state_name, elapsed)`** *(source line 2727)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_navi_ball_point_offset(bot, state_name, elapsed, child_z)`** *(source line 2748)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`read_bot_position(bot)`** *(source line 2806)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_role_events(instance_id)`** — --------------------------------------------------------------------------- Role-based animation events (concrete implementations) --------------------------------------------------------------------------- *(source line 2832)*
- **`destroy_role_events(instance_id)`** *(source line 2846)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`emit_async(instance_id, role, event, ...)`** *(source line 2856)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`subscribe_kicker_handlers(bot, emitter, on)`** *(source line 2885)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run()`** *(source line 2898)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`subscribe_defender_handlers(bot, emitter, on)`** *(source line 2948)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`run()`** *(source line 2965)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`subscribe_bomb_handlers(bot, emitter, on)`** *(source line 3089)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`assign_bot_role(bot, new_role, instance_id)`** *(source line 3099)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on(emitter, event, fn)`** *(source line 3111)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`move_bot_follow_keyframe(bot, position, phase, duration)`** — --------------------------------------------------------------------------- Ball follower --------------------------------------------------------------------------- *(source line 3134)*
- **`follow_defender_ball_point(instance_id, bots, ball_bot, defender, animation_state, initial_elapsed, movement_duration, animation_duration, start_position, target_position)`** *(source line 3178)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`defender_position_at(t)`** *(source line 3205)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_round_winner(instance_id)`** *(source line 3301)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`mark_response_actor_done(actor, success)`** *(source line 3594)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`refill_npc_direction_bag(bot)`** — --------------------------------------------------------------------------- NPC direction variety (Fisher-Yates shuffle bag) --------------------------------------------------------------------------- Each fill of the bag contains all three directions exactly once, in random order. Picking pops from the bag; when the bag empties it refills with a fresh shuffle. Consequences: * No fixed cycle. The order changes every three picks. * No streaks. "Left, Left, Left" is impossible within any 3-pick window. * Still random-feeling. Nothing about the next pick is predictable from the previous ones within a bag fill.  The bag lives on the bot record (`bot._direction_bag`) rather than on `State`, so it survives the Kicker/Defender role swap each round. The NPC's variety is a property of the NPC, not of the role they're in. *(source line 3916)*
- **`draw_npc_direction(bot)`** *(source line 3931)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`finish_direction_selection_if_ready(instance_id)`** *(source line 3939)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`start_direction_selection(instance_id, human_reps)`** *(source line 3986)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`begin_next_round(instance_id)`** *(source line 4028)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`confirm_direction_selection(player_id, rep)`** *(source line 4121)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`try_begin_match(instance_id)`** *(source line 4224)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`confirm_bomb_selection(player_id, rep)`** *(source line 4334)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`confirm_navi_selection(player_id, rep)`** *(source line 4355)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`representation_is_current()`** *(source line 4370)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`join_waiting_match(player_id, source_area_id, reference)`** — --------------------------------------------------------------------------- Ref interaction and matchmaking --------------------------------------------------------------------------- *(source line 4414)*
- **`begin_interaction(player_id, area_id, reference)`** *(source line 4468)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`FootBomb.handle_player_join(player_id)`** *(source line 4536)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`FootBomb.handle_actor_interaction(player_id, actor_id, button)`** *(source line 4546)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`FootBomb.handle_player_transfer(player_id)`** *(source line 4558)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`FootBomb.handle_player_disconnect(player_id)`** *(source line 4587)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `FootBomb` *(line 25)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `role_panel_styles` *(line 47)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Kicker` | call/expression | `Displayer.Builder.sliceStyle9( Config.ASSETS.ROLE_PANEL_TEXTURE_KICKER` |
| `[2]` | expression/reference | `Config.ASSETS.ROLE_PANEL_ANIMATION )` |
| `Defender` | call/expression | `Displayer.Builder.sliceStyle9( Config.ASSETS.ROLE_PANEL_TEXTURE_DEFENDER` |
| `[4]` | expression/reference | `Config.ASSETS.ROLE_PANEL_ANIMATION )` |

### `footbomb_animation_cache` *(line 76)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ROUND_EVENT` *(line 107)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `KICKER_STEP_STARTED` | string literal | `"kicker_step_started"` |
| `KICKER_STEP_COMPLETE` | string literal | `"kicker_step_complete"` |
| `KICKER_IDLE_STARTED` | string literal | `"kicker_idle_started"` |
| `DEFENDER_JUMP_LAUNCHED` | string literal | `"defender_jump_launched"` |
| `DEFENDER_LANDING_FRAME` | string literal | `"defender_landing_frame"` |
| `DEFENDER_ARC_COMPLETE` | string literal | `"defender_arc_complete"` |
| `DEFENDER_HOLD_STARTED` | string literal | `"defender_hold_started"` |
| `BOMB_LAUNCHED` | string literal | `"bomb_launched"` |
| `BOMB_CATCH_CONTACT` | string literal | `"bomb_catch_contact"` |
| `BOMB_TARGET_REACHED` | string literal | `"bomb_target_reached"` |
| `BOMB_EXPLODING` | string literal | `"bomb_exploding"` |
| `ROUND_RESPONSE_COMPLETE` | string literal | `"round_response_complete"` |
| `ROUND_HOLD_COMPLETE` | string literal | `"round_hold_complete"` |
| `ROUND_CAMERA_FADE_STARTED` | string literal | `"round_camera_fade_started"` |
| `ROUND_CAMERA_FADED` | string literal | `"round_camera_faded"` |
| `ROUND_COMPLETE` | string literal | `"round_complete"` |

### `RESULT_TARGET_BY_DIRECTION` *(line 200)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Left` | string literal | `"Bomb 1"` |
| `Up` | string literal | `"Bomb 2"` |
| `Right` | string literal | `"Bomb 3"` |

### `directions` *(line 208)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Left"` |
| `[2]` | string literal | `"Up"` |
| `[3]` | string literal | `"Right"` |

### `children` *(line 299)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `make_icon_child()` |
| `[2]` | call/expression | `Displayer.Builder.panelTextChild(tostring(role)` |
| `[3]` | table | `{ font = "THICK", scale = Config.UI.ROLE_TEXT_SCALE, color = { r = 255, g = 255, b = 255, a = 255 }, halign = "center", valign = "middle", }…` |
| `[4]` | call/expression | `make_icon_child()` |

### `color` *(line 305)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `a` | number literal | `255` |

### `reference` *(line 508)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `object` | expression/reference | `object` |
| `npc` | table | `{ bot_id = bot_id, actor_id = actor_id, mug_texture_path = Config.ASSETS.MUG_FOLDER .. mugshot_name .. ".png", mug_animation_path = mug_anim…` |

### `npc` *(line 510)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `bot_id` | expression/reference | `bot_id` |
| `actor_id` | expression/reference | `actor_id` |
| `mug_texture_path` | expression/reference | `Config.ASSETS.MUG_FOLDER .. mugshot_name .. ".png"` |
| `mug_animation_path` | expression/reference | `mug_animation_path` |

### `found` *(line 549)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `required_names` *(line 550)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Player 1 Spawn]` | boolean literal | `true` |
| `[Player 2 Spawn]` | boolean literal | `true` |
| `[Kicker]` | boolean literal | `true` |
| `[Move Forward]` | boolean literal | `true` |
| `[Defender 1]` | boolean literal | `true` |
| `[Defender 2]` | boolean literal | `true` |
| `[Defender 3]` | boolean literal | `true` |
| `[Bomb]` | boolean literal | `true` |
| `[Bomb 1]` | boolean literal | `true` |
| `[Bomb 2]` | boolean literal | `true` |
| `[Bomb 3]` | boolean literal | `true` |
| `[Camera Focus]` | boolean literal | `true` |

### `missing` *(line 569)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `actor_ids` *(line 640)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `prefix .. "-player1"` |
| `[2]` | expression/reference | `prefix .. "-player2"` |

### `labels` *(line 641)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"FootBomb Player 1"` |
| `[2]` | expression/reference | `vs_npc and "FootBomb Opponent" or "FootBomb Player 2"` |

### `created` *(line 645)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `position` *(line 677)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `position.x` |
| `y` | expression/reference | `position.y` |
| `z` | expression/reference | `position.z` |

### `transferred` *(line 735)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `candidates` *(line 856)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `path` |

### `required_navi_states` *(line 974)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `AnimationStates.IDLE_D` |
| `[2]` | expression/reference | `AnimationStates.IDLE_U` |
| `[3]` | expression/reference | `AnimationStates.IDLE_UR` |
| `[4]` | expression/reference | `AnimationStates.WALK_U` |
| `[5]` | expression/reference | `AnimationStates.WALK_UR` |
| `[6]` | expression/reference | `AnimationStates.FOOTBOMB_IDLE_DEFENSE` |
| `[7]` | expression/reference | `AnimationStates.FOOTBOMB_READY_DEFENSE` |
| `[8]` | expression/reference | `AnimationStates.FOOTBOMB_JUMP_LEFT` |
| `[9]` | expression/reference | `AnimationStates.FOOTBOMB_JUMP_RIGHT` |
| `[10]` | expression/reference | `AnimationStates.FOOTBOMB_JUMP_LEFT_END` |
| `[11]` | expression/reference | `AnimationStates.FOOTBOMB_JUMP_RIGHT_END` |

### `required_bomb_states` *(line 987)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `AnimationStates.SMALL_BOMB` |
| `[2]` | expression/reference | `AnimationStates.BIG_BOMB` |
| `[3]` | expression/reference | `AnimationStates.BOMB_PREVIEW` |

### `source_area_assets_ready` *(line 1031)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ui_paths` *(line 1048)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `Config.ASSETS.CURSOR_TEXTURE` |
| `[2]` | expression/reference | `Config.ASSETS.VIBRANT_CURSOR_TEXTURE` |
| `[3]` | expression/reference | `Config.ASSETS.CURSOR_ANIMATION` |
| `[4]` | expression/reference | `Config.ASSETS.CURSOR_SFX` |
| `[5]` | expression/reference | `Config.ASSETS.THUD_SFX` |
| `[6]` | expression/reference | `Config.ASSETS.SCOREBOARD_TEXTURE` |
| `[7]` | expression/reference | `Config.ASSETS.SCOREBOARD_ANIMATION` |

### `player_ids` *(line 1084)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `metadata` *(line 1086)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `game` | string literal | `"footbomb"` |
| `mode` | expression/reference | `mode` |
| `return_area_id` | expression/reference | `source_area_id` |
| `points_to_win` | expression/reference | `configured_points` |
| `party` | table | `{ host_id = player_id, members = {} }` |

### `party` *(line 1090)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `host_id` | expression/reference | `player_id` |
| `members` | table | `{}` |

### `bots.return_position` *(line 1123)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `return_x + 1` |
| `y` | expression/reference | `ref_y + 1` |
| `z` | expression/reference | `return_z` |

### `bots.return_npc_position` *(line 1124)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `ref_x` |
| `y` | expression/reference | `ref_y` |
| `z` | expression/reference | `ref_z` |

### `DIRECTION_CURSOR_DIRECTIONS` *(line 1172)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Left"` |
| `[2]` | string literal | `"Up"` |
| `[3]` | string literal | `"Right"` |

### `red` *(line 1188)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `a` | number literal | `255` |
| `r` | number literal | `255` |
| `g` | number literal | `0` |
| `b` | number literal | `0` |
| `color_mode` | number literal | `1` |

### `blue` *(line 1189)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `a` | number literal | `255` |
| `r` | number literal | `0` |
| `g` | number literal | `0` |
| `b` | number literal | `255` |
| `color_mode` | number literal | `1` |

### `rep` *(line 1383)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `instance_id` | expression/reference | `instance.id` |
| `area_id` | expression/reference | `instance.area_id` |
| `slot` | expression/reference | `bot_record.slot` |
| `bot_id` | expression/reference | `bot_record.id` |
| `actor_id` | expression/reference | `bot_record.actor_id` |
| `bot_record` | expression/reference | `bot_record` |
| `cursor_top` | string literal | `"footbomb_cursor_top_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[8]` | string literal | `"_")` |
| `cursor_bottom` | string literal | `"footbomb_cursor_bottom_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[10]` | string literal | `"_")` |
| `direction_cursor_left` | string literal | `"footbomb_direction_cursor_left_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[12]` | string literal | `"_")` |
| `direction_cursor_up` | string literal | `"footbomb_direction_cursor_up_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[14]` | string literal | `"_")` |
| `direction_cursor_right` | string literal | `"footbomb_direction_cursor_right_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[16]` | string literal | `"_")` |
| `skin_text_id` | string literal | `"footbomb_navi_name_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[18]` | string literal | `"_")` |
| `confirm_prompt_text_id` | string literal | `"footbomb_navi_confirm_prompt_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[20]` | string literal | `"_")` |
| `cursor_left` | string literal | `"footbomb_bomb_cursor_left_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[22]` | string literal | `"_")` |
| `cursor_right` | string literal | `"footbomb_bomb_cursor_right_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[24]` | string literal | `"_")` |
| `bomb_preview` | string literal | `"footbomb_bomb_preview_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[26]` | string literal | `"_")` |
| `bomb_confirm_prompt_text_id` | string literal | `"footbomb_bomb_confirm_prompt_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[28]` | string literal | `"_")` |
| `scoreboard_ui_id` | string literal | `"footbomb_scoreboard_" .. tostring(instance.id):gsub("[^%w_%-]"` |
| `[30]` | string literal | `"_") .. "_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[31]` | string literal | `"_")` |
| `score_player_one_mug_ui_id` | string literal | `"footbomb_scoreboard_mug_p1_" .. tostring(instance.id):gsub("[^%w_%-]"` |
| `[33]` | string literal | `"_") .. "_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[34]` | string literal | `"_")` |
| `score_player_two_mug_ui_id` | string literal | `"footbomb_scoreboard_mug_p2_" .. tostring(instance.id):gsub("[^%w_%-]"` |
| `[36]` | string literal | `"_") .. "_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[37]` | string literal | `"_")` |
| `score_player_one_text_id` | string literal | `"footbomb_score_p1_" .. tostring(instance.id):gsub("[^%w_%-]"` |
| `[39]` | string literal | `"_") .. "_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[40]` | string literal | `"_")` |
| `score_player_two_text_id` | string literal | `"footbomb_score_p2_" .. tostring(instance.id):gsub("[^%w_%-]"` |
| `[42]` | string literal | `"_") .. "_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[43]` | string literal | `"_")` |
| `role_text_id` | string literal | `"footbomb_role_text_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[45]` | string literal | `"_")` |
| `role_panel_id` | string literal | `"footbomb_role_panel_" .. tostring(player_id):gsub("[^%w_%-]"` |
| `[47]` | string literal | `"_")` |
| `role_panel_role` | nil | `nil` |
| `role_text_enabled` | boolean literal | `false` |
| `role_text_suppressed` | boolean literal | `false` |
| `role_text_suppression_count` | number literal | `0` |
| `skin_index` | expression/reference | `bot_record.skin_index or 1` |
| `bomb_skin_index` | number literal | `1` |
| `bomb_selection_confirmed` | boolean literal | `false` |
| `selection_confirmed` | boolean literal | `false` |
| `confirming` | boolean literal | `false` |
| `match_started` | boolean literal | `false` |
| `selector_ui_visible` | boolean literal | `false` |
| `direction_selection_active` | boolean literal | `false` |
| `direction_selection_confirmed` | boolean literal | `false` |
| `selected_direction` | nil | `nil` |
| `direction_cursor_ui_visible` | boolean literal | `false` |
| `direction_cursor_bob_tick` | number literal | `0` |
| `direction_cursor_bob_offset` | number literal | `0` |
| `input` | call/expression | `InputAPI.get_controller(player_id) or InputAPI.create_controller(player_id)` |
| `input_owner` | string literal | `"footbomb:" .. tostring(instance.id) .. ":" .. tostring(player_id)` |

### `position` *(line 1503)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `current.x` |
| `y` | expression/reference | `current.y` |
| `z` | call/expression | `as_number(current.z` |
| `[4]` | expression/reference | `position and position.z or 0)` |

### `instance.metadata.party.members` *(line 1577)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `first_player` |
| `[2]` | expression/reference | `second_player` |

### `bot.position` *(line 1797)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `target.x` |
| `y` | expression/reference | `target.y` |
| `z` | expression/reference | `target.z or 0` |

### `bots.bomb_bot` *(line 1880)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `id` | expression/reference | `bomb_id` |
| `actor_id` | expression/reference | `actor_id` |
| `area_id` | expression/reference | `kicker.area_id` |
| `current_direction` | string literal | `"Down"` |
| `_round_instance_id` | expression/reference | `instance_id` |
| `skin_index` | expression/reference | `bomb_skin_index` |
| `skin_name` | expression/reference | `option.name` |
| `texture_path` | expression/reference | `texture_path` |
| `animation_path` | expression/reference | `animation_path` |
| `animation_state` | expression/reference | `AnimationStates.SMALL_BOMB` |
| `position` | table | `{ x = point.x, y = point.y, z = point.z or 0 }` |

### `position` *(line 1891)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `point.x` |
| `y` | expression/reference | `point.y` |
| `z` | expression/reference | `point.z or 0` |

### `required_states` *(line 2044)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `AnimationStates.IDLE_D` |
| `[2]` | expression/reference | `AnimationStates.IDLE_UR` |
| `[3]` | expression/reference | `AnimationStates.IDLE_U` |
| `[4]` | expression/reference | `AnimationStates.WALK_U` |
| `[5]` | expression/reference | `AnimationStates.WALK_UR` |
| `[6]` | expression/reference | `AnimationStates.FOOTBOMB_IDLE_DEFENSE` |
| `[7]` | expression/reference | `AnimationStates.FOOTBOMB_READY_DEFENSE` |
| `[8]` | expression/reference | `AnimationStates.FOOTBOMB_JUMP_RIGHT` |
| `[9]` | expression/reference | `AnimationStates.FOOTBOMB_JUMP_LEFT` |
| `[10]` | expression/reference | `AnimationStates.FOOTBOMB_JUMP_RIGHT_END` |
| `[11]` | expression/reference | `AnimationStates.FOOTBOMB_JUMP_LEFT_END` |

### `score_text_options` *(line 2142)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | expression/reference | `Config.UI.SCORE_TEXT_SCALE` |

### `start` *(line 2270)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(position.x) or 0` |
| `y` | call/expression | `tonumber(position.y) or 0` |
| `z` | call/expression | `tonumber(position.z) or 0` |

### `keyframes` *(line 2289)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = sx }, { property = "Y", value = sy }, { property = "Z", value = sz } }, duration = 0 }` |
| `[2]` | table | `{ properties = { { property = "X", ease = "Linear", value = tx }, { property = "Y", ease = "Linear", value = ty }, { property = "Z", ease = …` |

### `properties` *(line 2291)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = sx }` |
| `[2]` | table | `{ property = "Y", value = sy }` |
| `[3]` | table | `{ property = "Z", value = sz }` |

### `properties` *(line 2299)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", ease = "Linear", value = tx }` |
| `[2]` | table | `{ property = "Y", ease = "Linear", value = ty }` |
| `[3]` | table | `{ property = "Z", ease = "InOut", value = tz }` |

### `bot.position` *(line 2341)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `tx` |
| `y` | expression/reference | `ty` |
| `z` | expression/reference | `tz` |

### `token` *(line 2375)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `players` *(line 2510)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `connected_players` *(line 2537)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `start_position` *(line 2673)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `sx` |
| `y` | expression/reference | `sy` |
| `z` | expression/reference | `sz` |

### `target_position` *(line 2674)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(target.x) or sx` |
| `y` | call/expression | `tonumber(target.y) or sy` |
| `z` | call/expression | `tonumber(target.z) or sz` |

### `keyframes` *(line 2680)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = sx }, { property = "Y", value = sy }, { property = "Z", value = sz }, }, duration = 0 }` |

### `properties` *(line 2682)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = sx }` |
| `[2]` | table | `{ property = "Y", value = sy }` |
| `[3]` | table | `{ property = "Z", value = sz }` |

### `properties` *(line 2696)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", ease = "Linear", value = position.x }` |
| `[2]` | table | `{ property = "Y", ease = "Linear", value = position.y }` |
| `[3]` | table | `{ property = "Z", ease = "Linear", value = position.z }` |

### `z_correction` *(line 2789)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `enabled` | boolean literal | `true` |
| `child_z` | call/expression | `tonumber(child_z) or 0` |

### `events` *(line 2836)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `kicker` | call/expression | `EventEmitter.new()` |
| `defender` | call/expression | `EventEmitter.new()` |
| `bomb` | call/expression | `EventEmitter.new()` |
| `phase` | call/expression | `EventEmitter.new()` |

### `varargs` *(line 2867)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `n` | expression/reference | `arg_count` |
| `[2]` | expression/reference | `...` |

### `type_list` *(line 2872)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bot._role_subscriptions` *(line 3106)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keyframes` *(line 3149)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = sx }, { property = "Y", value = sy }, { property = "Z", value = sz }, }, duration = start_duratio…` |
| `[2]` | table | `{ properties = { { property = "X", ease = "InOut", value = tx }, { property = "Y", ease = "InOut", value = ty }, { property = "Z", ease = "L…` |

### `properties` *(line 3151)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = sx }` |
| `[2]` | table | `{ property = "Y", value = sy }` |
| `[3]` | table | `{ property = "Z", value = sz }` |

### `properties` *(line 3159)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", ease = "InOut", value = tx }` |
| `[2]` | table | `{ property = "Y", ease = "InOut", value = ty }` |
| `[3]` | table | `{ property = "Z", ease = "Linear", value = tz }` |

### `bot.position` *(line 3174)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `tx` |
| `y` | expression/reference | `ty` |
| `z` | expression/reference | `tz` |

### `times` *(line 3214)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `elapsed` |

### `keyframes` *(line 3224)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = tonumber(current.x) or 0 }, { property = "Y", value = tonumber(current.y) or 0 }, { property = "Z…` |

### `properties` *(line 3226)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = tonumber(current.x) or 0 }` |
| `[2]` | table | `{ property = "Y", value = tonumber(current.y) or 0 }` |
| `[3]` | table | `{ property = "Z", value = tonumber(current.z) or 0 }` |

### `properties` *(line 3275)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", ease = "Linear", value = attached_position.x }` |
| `[2]` | table | `{ property = "Y", ease = "Linear", value = attached_position.y }` |
| `[3]` | table | `{ property = "Z", ease = "Linear", value = attached_position.z }` |

### `target_position` *(line 3473)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(defender_target.x) or tonumber(defender_start.x) or 0` |
| `y` | call/expression | `tonumber(defender_target.y) or tonumber(defender_start.y) or 0` |
| `z` | call/expression | `tonumber(defender_target.z) or tonumber(defender_start.z) or 0` |

### `start_position` *(line 3478)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(defender_start.x) or 0` |
| `y` | call/expression | `tonumber(defender_start.y) or 0` |
| `z` | call/expression | `tonumber(defender_start.z) or 0` |

### `response_actor_seen` *(line 3573)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `response_results` *(line 3574)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `start_position` *(line 3604)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(defender_start.x) or 0` |
| `y` | call/expression | `tonumber(defender_start.y) or 0` |
| `z` | call/expression | `tonumber(defender_start.z) or 0` |

### `target_position` *(line 3609)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | call/expression | `tonumber(defender_target.x) or start_position.x` |
| `y` | call/expression | `tonumber(defender_target.y) or start_position.y` |
| `z` | call/expression | `tonumber(defender_target.z) or start_position.z` |

### `defender.position` *(line 3767)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `defender_target.x` |
| `y` | expression/reference | `defender_target.y` |
| `z` | expression/reference | `defender_target.z` |

### `humans` *(line 3844)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `bag` *(line 3917)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `humans` *(line 3942)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `human_slots` *(line 3943)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `humans` *(line 4036)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `human_reps` *(line 4227)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/footbomb/main.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
