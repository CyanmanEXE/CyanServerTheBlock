# FootBomb Referee Menu (current API)

[FootBomb documentation](../index.md) · [Tiled setup](../AREA_SETUP.md)

**Runtime:** `scripts/ezlibs-custom/footbomb/referee_menu.lua`

The referee uses the existing Nebulous Liberations `liberations/option_menu.lua` (9-slice header/body), **not** `Async.quiz_player`. This is a UI reuse: FootBomb does not require the Liberation mission module to start.

## Public functions

| Function | Arguments | Return value | Behavior |
|---|---|---|---|
| `select_mode(player_id)` | Player ID | `Async` promise of 0-based selection index or `nil` | `[VS] NPC` = 0, `[VS] Player` = 1, `Explanation` = 2, `Cancel` = 3 |
| `select_join(player_id)` | Player ID | `Async` promise of 0-based selection index or `nil` | `Join Match` = 0, `Cancel` = 1 for guest matchmaking |
| `configure(player_id, initial_rules, is_current)` | Player ID, `{points_to_win=number, grace_enabled=boolean}`, callable returning boolean | `Async` promise resolving to `{points_to_win=integer, grace_enabled=boolean}` or `nil` | Host adjusts score (+/-1 or +/-5), toggles Grace, selects Start Match; Cancel returns nil |

`initial_rules.points_to_win` falls back to `Config.DEFAULTS.POINTS_TO_WIN` and clamps to at least 1. `initial_rules.grace_enabled` defaults to on. The `is_current()` callback stops the flow after transfer/disconnect. `OptionMenu.select` automatically releases its input session and erases UI sprites **before** resolving each selection.

## Screen lifecycle

1. Interaction opens the main option menu without a preceding native greeting textbox.
2. `[VS] NPC` or `[VS] Player` (when no match is waiting) opens the host score/grace editor.
3. A host's accepted rules are passed to `make_instance` directly (NPC) or saved in `State.waiting_matches[source_area_id].rules` for the second player (PvP). The guest cannot change host rules.
4. `Explanation` closes the menu first. Four `Async.message_player` textboxes display the referee's `mug_texture_path` and `mug_animation_path`. The code awaits all dismissals, **including the final textbox**, then reopens the four-option menu.
5. Cancel closes the menu, releases its PlayerInterface input capture, and exits without creating a match. Cancel in the score editor returns to the main menu.

`State.pending_interactions[player_id]` prevents duplicate interactions throughout explanation and menu handoffs. `OptionMenu.select` guards Confirm/Cancel against held-button opening input. Do not manually lock player input around these menus.

## Grace rule

`grace_enabled=true` is the existing FootBomb behavior: after the target is reached, the trailing side gets a last chance and ties extend the match. With `grace_enabled=false`, the match completes immediately after a side reaches the selected winning score. Both `points_to_win` and `grace_enabled` are stored on the instance metadata and match bot state; the completion event preserves its current payload.

## Dependencies

- `scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu.lua` — the existing shared menu UI
- `scripts/player-interface/main.lua` — used internally by OptionMenu for input session ownership
- `scripts/ezlibs-custom/footbomb/constants.lua` — default score and Grace setting
- `Async.promisify`, `Async.await`, `Async.message_player` — existing engine async primitives
