# 🧭 Nebulous Liberations `player.lua` API

[Documentation home](../../../index.md) · [Golden Prog mission returns](../GOLDEN_PROG_MISSIONS.md)

**Runtime source:** `scripts/ezlibs-custom/nebulous-liberations/player.lua`  
**Source lines:** 498  
**SHA-256:** `edaeeb3cb5af493d61b7b247f92a89bfb322153d8a64c4d49f9fddd70025d144`

## Contents

- [Overview](#overview)
- [Dependencies and player fields](#dependencies-and-player-fields)
- [Public functions](#public-functions)
- [Liberation exit and return](#liberation-exit-and-return)
- [Testing](#testing)

## Overview

This module wraps a single connected player for Nebulous Liberations. It manages textbox responses, encounter results, current mission activity, and mission exits. `main.lua` constructs player wrappers and forwards Net events into these methods. It does **not** register an independent Net listener.

## Dependencies and player fields

| Required module | Purpose |
|---|---|
| `scripts/ezlibs-scripts/ezmemory` | Player health and post-victory hidden-gate memory |
| `scripts/ezlibs-scripts/helpers` | Safe player secret for gate memory |
| `scripts/logger/logger` | Per-system debug/transfer logs |
| `scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu` | Controller-driven mission option menus |
| `scripts/ezlibs-scripts/ezencounters/scale_registry` | Encounter visual-scale enrichment |

`Player:new(player_id)` captures `id`, `mug`, the initial world position `x/y/z`, `activity`, `textbox_promise_resolvers`, encounter resolver/results fields, `battle_exit_fallback_token`, `avatar_details`, `moved`, and `disconnected`. During a normal mission exit it also temporarily holds `pending_return_verification`, consumed by `main.lua`'s player-transfer observer.

## Public functions

| Function | Parameters | Effect / return |
|---|---|---|
| `Player:new(player_id)` | Player ID | Creates one player wrapper from current Net state |
| `:message(message, texture_path?, animation_path?)` | Message and optional mug resources | Opens a message, returns a dismissal promise |
| `:message_with_mug(message)` | Text | Uses the player's mugshot; returns dismissal promise |
| `:say(message, texture_path?, animation_path?)` | Message and optional mug resources | Fire-and-forget message without queued promise |
| `:say_with_mug(message)` | Text | Fire-and-forget message with mugshot |
| `:question(question, texture_path?, animation_path?)` | Question and optional mug resources | Opens question and returns response promise |
| `:question_with_mug(question)` | Text | Question with player's mugshot |
| `:quiz(a, b, c, texture_path?, animation_path?)` | Up to 3 options, optional mug resources | Returns response promise |
| `:quiz_with_mug(a, b, c)` | Three options | Player-mugshot quiz |
| `:select_mission_option(options, title)` | String option list, menu title | Controller-driven 9-slice menu; zero-based result |
| `:is_battling()` | None | True while a battle-result resolver exists |
| `:initiate_encounter(asset_path, data)` | Encounter ZIP path, encounter config | Provisions player asset, calls Net encounter API; returns results promise |
| `:handle_textbox_response(response)` | Net textbox response | Resolves oldest queued textbox; logs stray responses |
| `:handle_battle_results(stats)` | Battle result payload | Logs/stashes results; schedules a 3s panic or 20s other fallback |
| `:handle_battle_exit(stats)` | Battle exit payload | Prioritizes saved complete results; resolves pending encounter |
| `:handle_disconnect()` | None | Cancels outstanding interactions and tells mission to detach player |
| `:boot_to_lobby(isVictory, mapName)` | Victory boolean and mission name | Selects return destination, requests transfer, leaves mission on accepted transfer; returns true/false |

### Internal helpers

`create_textbox_promise(self)`, `debug_print_battle_data(value,prefix,depth)`, `stats_indicate_panic(stats)`, `create_default_results()`, `resolve_loaded_return_area(reference)`, `valid_return_coordinate(value)`, and `resolve_liberation_return(player_id,activity,current_area)` are module-private. The return resolver verifies area membership via `Net.list_areas`, and handles runtime area IDs or area names from `Net.get_area_name`.

## Liberation exit and return

**Critical ordering:** normal victory and avatar-change exits call `Player:boot_to_lobby`, not `main.lua`'s generic instance cleanup. The selected Gold Prog's saved `activity.return_destination` must therefore be read and applied here, before the player is detached.

Return destination priority:

1. **Mission Selector override:** saved {`area_id`, `x`, `y`, `z`} per instance; verify the area is loaded and coordinates are finite numbers.
2. **Mission Respawn Area:** custom property `Respawn Area`, with the named object `Liberation Respawn`.
3. **Configured area spawn:** `Net.get_spawn_position` of the configured area.
4. **Default spawn:** `Net.get_spawn_position("default")`.

If no valid destination exists, log an error and retain the player's mission activity. The transfer is requested using the existing call:

```lua
Net.transfer_player(player_id, return_area, true, spawn.x, spawn.y, spawn.z)
```

A thrown exception or a returned `false` leaves the activity intact. A transfer request accepted without an error causes `activity:handle_player_disconnect(player_id)`, then `activity=nil`, then the existing victory-gate memory and health restoration. Before detaching, it records the accepted transfer on `activity.pending_exit_transfers[player_id]`; the mission's empty-instance cleanup waits until the server reports that player has left the instance. A reported transfer failure never creates this marker. The return result is `true` for an accepted request, not a client arrival acknowledgement.

`pending_return_verification` is set before the request and checked in `LibPlugin.handle_player_transfer`, logging `Liberation exit transfer verified` or `Liberation exit destination differs from request`, with both requested and observed areas/coordinates. This helps distinguish source calculation problems from subsequent warps.

The existing `Removing liberation instance` / `Cleaning up liberation instance` logs normally follow after all participants leave. They are not network-disconnect evidence.

## Testing

```sh
lua scripts/ezlibs-custom/nebulous-liberations/liberations/tests/test_selector_exit_transfer.lua
lua scripts/ezlibs-custom/nebulous-liberations/liberations/tests/test_selector_return_observer.lua
```

These isolate the accepted transfer, failure handling, gate and selector returns, party exits, and post-transfer comparison. Verify live with a DEBUGLIB victory and review both `player` and `main` subsystem logs.
