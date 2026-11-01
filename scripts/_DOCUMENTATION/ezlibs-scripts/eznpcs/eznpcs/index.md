# `eznpcs.lua`

> **Source:** `scripts/ezlibs-scripts/eznpcs/eznpcs.lua`  
> **Source lines:** 1945  
> **Functions detected:** 69  
> **Table declarations detected:** 29

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

Optional schema-driven validation. If the generated schema file is not present yet (user hasn't run generate-ezlibs-tiled.lua), validation is skipped silently so the module continues to load.

## Dependencies

- `scripts/ezlibs-scripts/ezlogger` — line 1
- `scripts/ezlibs-scripts/direction` — line 2
- `scripts/ezlibs-scripts/helpers` — line 3
- `scripts/ezlibs-scripts/ezmemory` — line 4
- `scripts/ezlibs-scripts/ezcache` — line 5
- `scripts/ezlibs-scripts/object_registry` — line 6
- `math` — line 7
- `scripts/ezlibs-scripts/ezbus` — line 8
- `scripts/ezlibs-scripts/ezquests` — line 9
- `scripts/ezlibs-scripts/utils/eztiledutils` — line 10
- `scripts/ezlibs-scripts/eznpcs/dialogue_types` — line 48
- `scripts/ezlibs-scripts/ezcutscenes/ezcutscenes` — line 434

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 73 | `set_npc_animation` | `npc, animation, loop, source` |
| 90 | `printd` | `...` |
| 97 | `validate_npc_object` | `area_id, object` |
| 113 | `get_all_players` | `(none)` |
| 126 | `exclude_except_for` | `owner_id, bot_id` |
| 137 | `include_for_all` | `bot_id` |
| 147 | `emit_bot_created` | `bot_id, area_id, extra` |
| 156 | `emit_bot_removed` | `bot_id` |
| 161 | `emit_bot_moved` | `bot_id, area_id, x, y, z` |
| 173 | `eznpcs.get_dialogue_mugshot` | `npc,player_id,dialogue` |
| 190 | `do_dialogue` | `npc,player_id,dialogue,relay_object` |
| 233 | `create_bot_from_object` | `area_id, object, player_id, options` |
| 330 | `create_npc` | `area_id,asset_name,x,y,z,direction,bot_name,animation_name,mug_animation_name,npc_turns_to_talk` |
| 395 | `add_behaviour` | `npc,behaviour` |
| 404 | `clear_player_conversation` | `player_id` |
| 421 | `chat_behaviour` | `(none)` |
| 424 | `action` | `npc,player_id,relay_object` |
| 484 | `waypoint_follow_behaviour` | `first_waypoint_id, options` |
| 488 | `initialize` | `npc` |
| 508 | `action` | `npc,delta_time` |
| 515 | `do_actor_interaction` | `player_id,actor_id,relay_object` |
| 522 | `is_anyone_talking_to_npc` | `npc_id` |
| 546 | `start_scripted_waypoint_move` | `npc, waypoint, move_anim, move_loop, move_duration` |
| 639 | `move_npc` | `npc,delta_time` |
| 707 | `on_npc_reached_waypoint` | `npc,waypoint` |
| 805 | `count_and_prune_live_bots` | `spawner` |
| 825 | `warp_out_spawner_npc` | `spawner, npc` |
| 867 | `make_spawner_path_complete_cb` | `spawner` |
| 890 | `spawn_from_spawner` | `spawner` |
| 939 | `register_npc_spawner` | `area_id, object` |
| 1075 | `update_spawner_triggers` | `delta_time` |
| 1156 | `update_quest_exclusive_for_player` | `player_id` |
| 1188 | `register_npc_object` | `area_id, object` |
| 1225 | `eznpcs.get_bot_for_placeholder` | `area_id, object_id` |
| 1231 | `eznpcs.load_npcs` | `(none)` |
| 1238 | `eznpcs.add_npcs_to_area` | `area_id` |
| 1275 | `eznpcs.add_event` | `event_object` |
| 1287 | `eznpcs.create_npc_from_object` | `area_id,object_id` |
| 1292 | `eznpcs.handle_actor_interaction` | `player_id,actor_id` |
| 1296 | `eznpcs.on_tick` | `delta_time` |
| 1309 | `eznpcs.create_npc` | `area_id,asset_name,x,y,z,direction,bot_name,animation_name,mug_animation_name,dont_face_player` |
| 1318 | `eznpcs.handle_player_transfer` | `player_id` |
| 1322 | `eznpcs.handle_player_join` | `player_id` |
| 1357 | `eznpcs.handle_player_disconnect` | `player_id` |
| 1382 | `eznpcs.handle_object_interaction` | `player_id, object_id` |
| 1444 | `eznpcs.remove_exclusive_npc` | `player_id, placeholder_id` |
| 1457 | `eznpcs.prepare_battle_exit_wait` | `player_id` |
| 1462 | `eznpcs.cancel_battle_exit_wait` | `player_id` |
| 1469 | `eznpcs.handle_battle_exit` | `player_id, battle_results, exit_event` |
| 1483 | `eznpcs.wait_for_battle_exit` | `player_id` |
| 1498 | `eznpcs.handle_battle_results` | `player_id, stats` |
| 1504 | `eznpcs.remove_quest_exclusive_npc` | `player_id, placeholder_id` |
| 1518 | `eznpcs.get_bot_id_for_placeholder` | `area_id, placeholder_id` |
| 1542 | `_resolve_bot_id` | `bot_or_npc` |
| 1553 | `_apply_bot_animation` | `bot_id, state, loop` |
| 1560 | `_apply_bot_direction` | `bot_id, direction` |
| 1569 | `_bump_hold_generation` | `bot_id` |
| 1583 | `_claim_pose` | `bot_id` |
| 1595 | `_release_pose` | `bot_id` |
| 1605 | `eznpcs.get_bot_record` | `bot_id` |
| 1612 | `eznpcs.resolve_bot` | `area_id, object_id, player_id` |
| 1633 | `eznpcs.cancel_bot_hold` | `bot_or_npc` |
| 1643 | `_apply_pose_with_reassert` | `bot_id, animation, loop, reassert_interval` |
| 1684 | `eznpcs.move_bot_to_spot` | `bot_or_npc, target, options` |
| 1779 | `eznpcs.set_bot_pose` | `bot_or_npc, options` |
| 1854 | `eznpcs.create_npc_from_paths` | `area_id, texture_path, animation_path, x, y, z, direction, options` |
| 1909 | `eznpcs.attach_waypoint_follow` | `npc, first_waypoint_id, options` |
| 1923 | `eznpcs.attach_chat` | `npc, first_dialogue` |
| 1935 | `eznpcs.remove_npc` | `npc_or_bot_id` |

### Function notes

- **`set_npc_animation(npc, animation, loop, source)`** — --------------------------------------------------------------------------- NPC animation state tracking  Waypoints and cutscene pose holds both need to drive bot animation state. Tracking the "current" animation + who owns it lets waypoint movement skip redundant Net.animate_bot calls every tick, and lets a cutscene pose hold block waypoint ticks from clobbering it (see move_npc's pose bail-out).  Ownership values: nil       - no explicit animation tracked (engine picks). "move"    - waypoint travel animation, applied by move_npc and by start_scripted_waypoint_move for keyframe-driven movement. "wait"    - waypoint Wait Animation, applied by on_npc_reached_waypoint and waypoint_follow_behaviour.initialize. "pose"    - cutscene / API pose hold, applied by move_bot_to_spot / set_bot_pose. move_npc bails out while this owns the state. --------------------------------------------------------------------------- *(source line 73)*
- **`printd(...)`** *(source line 90)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`validate_npc_object(area_id, object)`** — Log-only schema validation. Turning this into a hard reject is a one-line change (replace the `logger:warn` block with `return nil`). *(source line 97)*
- **`get_all_players()`** — Helper: get all players currently in the server (across all areas) *(source line 113)*
- **`exclude_except_for(owner_id, bot_id)`** — Helper: exclude a bot from everyone except the owner *(source line 126)*
- **`include_for_all(bot_id)`** — Helper: include a bot for all players (used when creating a non-exclusive bot) *(source line 137)*
- **`emit_bot_created(bot_id, area_id, extra)`** — Notify other modules when a bot lifecycle event occurs. Consumers such as ezpress (area-wide scaling) and ezbottriggers (bot enter/depart detection) subscribe to these on ezbus, so no Net polling is required elsewhere. *(source line 147)*
- **`emit_bot_removed(bot_id)`** *(source line 156)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`emit_bot_moved(bot_id, area_id, x, y, z)`** *(source line 161)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.get_dialogue_mugshot(npc,player_id,dialogue)`** *(source line 173)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`do_dialogue(npc,player_id,dialogue,relay_object)`** *(source line 190)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_bot_from_object(area_id, object, player_id, options)`** — Creates a bot (global or per-player) and returns its npc_data.  options (all optional): skip_placeholder_registration  (bool)  When true, does NOT register the bot in placeholder_to_botid. Used by spawners so multiple instances of the same template don't collide. on_path_complete               (func)  Passed to waypoint_follow_behaviour; fires when the NPC reaches a waypoint with no next waypoint. *(source line 233)*
- **`create_npc(area_id,asset_name,x,y,z,direction,bot_name,animation_name,mug_animation_name,npc_turns_to_talk)`** *(source line 330)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`add_behaviour(npc,behaviour)`** *(source line 395)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`clear_player_conversation(player_id)`** *(source line 404)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`chat_behaviour()`** — Behaviour factories *(source line 421)*
- **`action(npc,player_id,relay_object)`** *(source line 424)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`waypoint_follow_behaviour(first_waypoint_id, options)`** — waypoint_follow_behaviour(first_waypoint_id, options) options.on_path_complete  (func, optional)  Fires when the NPC reaches a waypoint whose Next Waypoint is nil (end of path). Used by NPC Spawners to trigger warp-out or cleanup. *(source line 484)*
- **`initialize(npc)`** *(source line 488)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`action(npc,delta_time)`** *(source line 508)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`do_actor_interaction(player_id,actor_id,relay_object)`** *(source line 515)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`is_anyone_talking_to_npc(npc_id)`** *(source line 522)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`start_scripted_waypoint_move(npc, waypoint, move_anim, move_loop, move_duration)`** — ========================================================================= Scripted waypoint movement  Footbomb-style jumps are multi-frame animations where the position must track the animation's intrinsic timing (a 0.5s jump arc, for example). Per-tick Net.move_bot can't express that: the animation and position drift apart. When a waypoint sets Move Duration > 0, we switch into scripted mode:  1. Apply the Move Animation once (respecting Move Loop). 2. Queue keyframes with Net.animate_bot_properties from the current position to the waypoint position over exactly Move Duration seconds. 3. On completion, call on_npc_reached_waypoint — which applies the Wait Animation (the END hold pose) and advances npc.next_waypoint.  A generation counter invalidates in-flight scripted moves when a cutscene pose claims the animation state, or when a new scripted move starts. ========================================================================= *(source line 546)*
- **`move_npc(npc,delta_time)`** *(source line 639)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_npc_reached_waypoint(npc,waypoint)`** *(source line 707)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`count_and_prune_live_bots(spawner)`** — Clean up dead entries and return the live count. *(source line 805)*
- **`warp_out_spawner_npc(spawner, npc)`** — Warp out a spawner-owned NPC. Called by the on_path_complete callback. *(source line 825)*
- **`make_spawner_path_complete_cb(spawner)`** — Callback factory. Each spawner gets a closure that captures its own state. *(source line 867)*
- **`spawn_from_spawner(spawner)`** — Spawn one NPC from this spawner. Returns true on success. Enforces: * Once mode: no live bot AND not once_spawned * Interval mode: live count under Max Alive (or unlimited)  After a successful spawn, emits npc_spawned_from_spawner so consumers (notably ezpushback for Pushback NPC templates) can attach per-bot behaviours that need the template's properties but a bot_id-scoped key. *(source line 890)*
- **`register_npc_spawner(area_id, object)`** *(source line 939)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`update_spawner_triggers(delta_time)`** — Called from eznpcs.on_tick. Handles both Once and Interval modes; only iterates spawners in radius mode (immediate mode is handled at registration). *(source line 1075)*
- **`update_quest_exclusive_for_player(player_id)`** — Helper to update quest‑exclusive NPCs for a given player *(source line 1156)*
- **`register_npc_object(area_id, object)`** — Register regular NPCs and the Pushback-enabled NPC subtype through the same creation path, so dialogue, waypoints, quest rules, and exclusivity stay consistent. *(source line 1188)*
- **`eznpcs.get_bot_for_placeholder(area_id, object_id)`** — Public lookup used by companion systems such as ezpushback. *(source line 1225)*
- **`eznpcs.load_npcs()`** — Public API *(source line 1231)*
- **`eznpcs.add_npcs_to_area(area_id)`** *(source line 1238)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.add_event(event_object)`** *(source line 1275)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.create_npc_from_object(area_id,object_id)`** *(source line 1287)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.handle_actor_interaction(player_id,actor_id)`** *(source line 1292)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.on_tick(delta_time)`** *(source line 1296)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.create_npc(area_id,asset_name,x,y,z,direction,bot_name,animation_name,mug_animation_name,dont_face_player)`** *(source line 1309)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.handle_player_transfer(player_id)`** *(source line 1318)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.handle_player_join(player_id)`** *(source line 1322)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.handle_player_disconnect(player_id)`** *(source line 1357)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.handle_object_interaction(player_id, object_id)`** *(source line 1382)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.remove_exclusive_npc(player_id, placeholder_id)`** — Helper to remove an exclusive NPC (called from dialogue_types on win) *(source line 1444)*
- **`eznpcs.prepare_battle_exit_wait(player_id)`** *(source line 1457)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.cancel_battle_exit_wait(player_id)`** *(source line 1462)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.handle_battle_exit(player_id, battle_results, exit_event)`** — Called by ezlibs main.lua when the engine emits battle_exit. The full battle_results payload is supplied as the second argument when available. *(source line 1469)*
- **`eznpcs.wait_for_battle_exit(player_id)`** — Await the actual battle_exit event before running post-battle world effects. Returns the stored battle_results payload and battle_exit event, if present. *(source line 1483)*
- **`eznpcs.handle_battle_results(player_id, stats)`** *(source line 1498)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`eznpcs.remove_quest_exclusive_npc(player_id, placeholder_id)`** — Helper to remove a quest‑exclusive NPC (can be called when quest state changes) *(source line 1504)*
- **`eznpcs.get_bot_id_for_placeholder(area_id, placeholder_id)`** — Helper to get bot ID for placeholder (used in ezmemory) *(source line 1518)*
- **`_resolve_bot_id(bot_or_npc)`** — ========================================================================= Cutscene support: bot movement, pose hold, and bot resolution  These helpers generalize the movement-and-hold pattern used by net-game-footbomb so any module (ezcutscenes, custom map scripts) can drive NPC bots through animated sequences without reimplementing the animate_bot_properties keyframe plumbing. ========================================================================= *(source line 1542)*
- **`_apply_bot_animation(bot_id, state, loop)`** *(source line 1553)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_apply_bot_direction(bot_id, direction)`** *(source line 1560)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`_bump_hold_generation(bot_id)`** — Bump the hold generation on this bot. Any in-flight reassert loop compares the current generation against its captured generation and exits on mismatch, so bumping invalidates any stale loop. *(source line 1569)*
- **`_claim_pose(bot_id)`** — Claim pose ownership: bump generation and mark the source as "pose". Called at the very start of move_bot_to_spot / set_bot_pose so move_npc bails out during the movement keyframes (before _apply_pose_with_reassert would otherwise take ownership after the move).  Also invalidates any in-flight scripted waypoint move: a cutscene pose always takes precedence over pending waypoint travel. *(source line 1583)*
- **`_release_pose(bot_id)`** — Release pose ownership. Called from cancel_bot_hold (explicit release), and from the pose functions when a hold naturally expires (hold_seconds elapsed) or no hold was requested at all. *(source line 1595)*
- **`eznpcs.get_bot_record(bot_id)`** — Public: get the internal npc record for a bot. Useful for cutscene steps that need mugshot info via get_dialogue_mugshot. *(source line 1605)*
- **`eznpcs.resolve_bot(area_id, object_id, player_id)`** — Public: resolve a bot_id given an area + object_id + optional player context. Tries per-player exclusive, quest-exclusive, then global bots. *(source line 1612)*
- **`eznpcs.cancel_bot_hold(bot_or_npc)`** — Public: cancel any active pose hold on this bot. Reassert loops check a monotonically increasing generation counter, so a cancelled hold exits without an extra sleep-and-poll cycle. Also releases pose ownership so waypoint movement can resume. *(source line 1633)*
- **`_apply_pose_with_reassert(bot_id, animation, loop, reassert_interval)`** — Internal: set a pose and (optionally) reassert it every `reassert_interval` seconds. Returns the generation this pose was assigned, for coordinated cancellation by move_bot_to_spot / set_bot_pose. *(source line 1643)*
- **`eznpcs.move_bot_to_spot(bot_or_npc, target, options)`** — Move a bot to a target position with animation, then optionally hold a pose.  options.animation               (string)  animation during movement options.direction               (string)  facing during movement options.speed                   (number)  map units / second (default 3) options.hold_animation          (string)  pose applied on arrival options.hold_direction          (string)  facing applied on arrival options.hold_seconds            (number)  hold duration; 0/nil = indefinite options.hold_loop               (bool)    loop flag for hold (default true) options.hold_reassert           (bool)    reassert hold (default false) options.hold_reassert_interval  (number)  reassert period (default 0.2)  Returns an async promise resolving to `true` on success. If `hold_seconds` > 0, the promise resolves after that wait; if 0/nil, it resolves immediately after starting the hold. The hold persists until another move/pose call, eznpcs.cancel_bot_hold, or (for reassert=false with loop=false) the animation naturally ending. *(source line 1684)*
- **`eznpcs.set_bot_pose(bot_or_npc, options)`** — Set a pose on a bot without moving it.  options.animation     (string)  required options.direction     (string)  facing options.loop          (bool)    loop flag (default true) options.hold          (bool)    reassert the pose (default true) options.hold_seconds  (number)  0/nil = indefinite; >0 waits that long *(source line 1779)*
- **`eznpcs.create_npc_from_paths(area_id, texture_path, animation_path, x, y, z, direction, options)`** — - Create an NPC with explicit texture/animation paths. - - Unlike eznpcs.create_npc (which builds paths from an asset name in the - eznpcs asset folder), this accepts arbitrary paths — useful for - player-avatar clones or dynamically sourced sprites. - - @param area_id string - @param texture_path string      (e.g. "/server/assets/avatars/...") - @param animation_path string - @param x number - @param y number - @param z number - @param direction string - @param options table|nil -   options.asset_name         - identifier for debugging (default "custom") -   options.name               - bot name -   options.animation          - initial animation state (default nil = engine default) -   options.mug_animation_path - mugshot animation path override -   options.dont_face_player   - bool (default true) -   options.solid              - bool (default true) -   options.size               - number (default 0.2) -   options.speed              - number (default 1) -   options.warp_in            - bool (default false) - @return npc_data|nil *(source line 1854)*
- **`eznpcs.attach_waypoint_follow(npc, first_waypoint_id, options)`** — - Attach waypoint-following behavior to an existing NPC record. - Uses the same waypoint_follow_behaviour the Tiled property path uses, - so `Next Waypoint N`, `Move Animation`, `Wait Animation`, `Waypoint Type`, - loop/path-complete semantics are all identical. - - @param npc table             npc_data returned by create_npc* / create_npc_from_paths - @param first_waypoint_id string - @param options table|nil     see waypoint_follow_behaviour -   options.on_path_complete(npc) — fires when a waypoint has no Next Waypoint - @return boolean *(source line 1909)*
- **`eznpcs.attach_chat(npc, first_dialogue)`** — - Attach the standard chat/interaction behavior to an NPC record. - Not needed for the endless runner, but exposed for symmetry with Tiled - NPCs so custom modules don't have to reimplement dialogue plumbing. - - @param npc table - @param first_dialogue table|nil - @return boolean *(source line 1923)*
- **`eznpcs.remove_npc(npc_or_bot_id)`** — - Remove an NPC by record or bot_id. - Handles the ezbus notification so ezbottriggers clears overlap state. - - @param npc_or_bot_id table|string|number - @return boolean *(source line 1935)*

## Tables and data structures

### `eznpcs` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `battle_exit_generation` *(line 27)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `battle_exit_waiting` *(line 28)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `placeholder_to_botid` *(line 29)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `exclusive_npcs` *(line 30)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `exclusive_placeholders` *(line 31)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `quest_exclusive_placeholders` *(line 34)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `quest_exclusive_npcs` *(line 35)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `npc_spawners` *(line 39)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `npcs` *(line 40)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `current_player_conversation` *(line 42)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `npc_required_properties` *(line 49)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Direction"` |
| `[2]` | string literal | `"Asset Name"` |

### `arg` *(line 91)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `...` |

### `players` *(line 114)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `payload` *(line 149)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `bot_id` | expression/reference | `bot_id` |
| `area_id` | expression/reference | `area_id` |

### `mug` *(line 176)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `npc_data` *(line 346)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `asset_name` | expression/reference | `asset_name` |
| `bot_id` | nil | `nil` |
| `name` | expression/reference | `name` |
| `area_id` | expression/reference | `area_id` |
| `texture_path` | expression/reference | `texture_path` |
| `animation_path` | expression/reference | `animation_path` |
| `mug_animation_path` | expression/reference | `mug_animation_path` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z` |
| `direction` | expression/reference | `direction` |
| `solid` | boolean literal | `true` |
| `size` | number literal | `0.2` |
| `speed` | number literal | `1` |
| `dont_face_player` | expression/reference | `npc_turns_to_talk` |
| `warp_in` | boolean literal | `true` |
| `current_animation` | nil | `nil` |
| `_animation_source` | nil | `nil` |
| `_hold_generation` | number literal | `0` |
| `_scripted_move_generation` | number literal | `0` |
| `_scripted_move_active` | boolean literal | `false` |

### `behaviour` *(line 422)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `'on_interact'` |
| `action` | function | `function(npc` |
| `[3]` | expression/reference | `player_id` |
| `[4]` | call/expression | `relay_object) return async(function () local cutscene_name = npc.placeholder_custom_properties and npc.placeholder_custom_properties["Cutsce…` |
| `[5]` | expression/reference | `npc.area_id` |
| `[6]` | expression/reference | `cutscene_name` |
| `[7]` | table | `{ trigger_object_id = npc.placeholder_id, trigger_bot_id = npc.bot_id, }) if cutscene_promise then await(cutscene_promise) return end end if…` |
| `[8]` | call/expression | `player_pos) or nil if dir then Net.set_bot_direction(npc.bot_id` |
| `[9]` | call/expression | `dir) end end local dialogue = npc.first_dialogue if not dialogue then current_player_conversation[player_id] = nil return end Net.lock_playe…` |
| `[10]` | expression/reference | `player_id` |
| `[11]` | expression/reference | `dialogue` |
| `[12]` | call/expression | `relay_object)) clear_player_conversation(player_id) end) end` |

### `behaviour` *(line 486)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `'on_tick'` |
| `initialize` | function | `function(npc) npc._waypoint_path_complete_cb = options.on_path_complete local first_waypoint = ezcache.get_object_by_id_cached(npc.area_id` |
| `[3]` | call/expression | `first_waypoint_id) if first_waypoint then npc.next_waypoint = first_waypoint local props = first_waypoint.custom_properties or {} local wait…` |
| `[4]` | expression/reference | `wait_anim` |
| `[5]` | expression/reference | `wait_loop` |
| `[6]` | string literal | `"wait") end else printd('invalid Next Waypoint '..first_waypoint_id) end end` |
| `action` | function | `function(npc` |
| `[8]` | call/expression | `delta_time) move_npc(npc` |
| `[9]` | expression/reference | `delta_time) end` |

### `keyframes` *(line 571)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = sx }, { property = "Y", value = sy }, { property = "Z", value = sz }, }, duration = 0, }` |
| `[2]` | table | `{ properties = { { property = "X", ease = "Linear", value = tx }, { property = "Y", ease = "Linear", value = ty }, { property = "Z", ease = …` |

### `properties` *(line 573)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = sx }` |
| `[2]` | table | `{ property = "Y", value = sy }` |
| `[3]` | table | `{ property = "Z", value = sz }` |

### `properties` *(line 581)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", ease = "Linear", value = tx }` |
| `[2]` | table | `{ property = "Y", ease = "Linear", value = ty }` |
| `[3]` | table | `{ property = "Z", ease = "InOut", value = tz }` |

### `new_pos` *(line 692)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `z` | expression/reference | `npc.z` |
| `size` | expression/reference | `npc.size` |

### `spawner` *(line 1009)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `area_id` | expression/reference | `area_id` |
| `object` | expression/reference | `object` |
| `template_object` | expression/reference | `template` |
| `live_bots` | table | `{}` |
| `trigger_radius` | expression/reference | `trigger_radius` |
| `spawn_mode` | expression/reference | `spawn_mode` |
| `spawn_interval` | expression/reference | `spawn_interval` |
| `max_alive` | expression/reference | `max_alive` |
| `once` | expression/reference | `once` |
| `once_spawned` | boolean literal | `false` |
| `trigger_armed` | boolean literal | `true` |
| `was_player_inside` | boolean literal | `false` |
| `time_since_last_spawn` | number literal | `0` |

### `live_bots` *(line 1014)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keyframes` *(line 1712)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ properties = { { property = "X", value = sx }, { property = "Y", value = sy }, { property = "Z", value = sz }, }, duration = 0, }` |
| `[2]` | table | `{ properties = { { property = "X", ease = "Linear", value = tx }, { property = "Y", ease = "Linear", value = ty }, { property = "Z", ease = …` |

### `properties` *(line 1715)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", value = sx }` |
| `[2]` | table | `{ property = "Y", value = sy }` |
| `[3]` | table | `{ property = "Z", value = sz }` |

### `properties` *(line 1723)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ property = "X", ease = "Linear", value = tx }` |
| `[2]` | table | `{ property = "Y", ease = "Linear", value = ty }` |
| `[3]` | table | `{ property = "Z", ease = "Linear", value = tz }` |

### `npc_data` *(line 1858)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `asset_name` | expression/reference | `options.asset_name or "custom"` |
| `bot_id` | nil | `nil` |
| `name` | expression/reference | `options.name or nil` |
| `area_id` | expression/reference | `area_id` |
| `texture_path` | expression/reference | `texture_path` |
| `animation_path` | expression/reference | `animation_path or ""` |
| `mug_animation_path` | expression/reference | `options.mug_animation_path or generic_npc_mug_animation_path` |
| `x` | expression/reference | `x` |
| `y` | expression/reference | `y` |
| `z` | expression/reference | `z or 0` |
| `direction` | expression/reference | `direction or "Down"` |
| `animation` | expression/reference | `options.animation` |
| `solid` | expression/reference | `options.solid ~= false` |
| `size` | expression/reference | `options.size or 0.2` |
| `speed` | expression/reference | `options.speed or 1` |
| `dont_face_player` | expression/reference | `options.dont_face_player ~= false` |
| `warp_in` | expression/reference | `options.warp_in == true` |
| `current_animation` | nil | `nil` |
| `_animation_source` | nil | `nil` |
| `_hold_generation` | number literal | `0` |
| `_scripted_move_generation` | number literal | `0` |
| `_scripted_move_active` | boolean literal | `false` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/eznpcs/eznpcs.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
