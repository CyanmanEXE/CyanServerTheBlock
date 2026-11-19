# 📄 `scripts/player-interface/tests/smoke.lua`

[⬆️ Modules](../../index.md) · [🎮 API](../../API_REFERENCE.md)

## Source-declared functions

| Line | Signature |
|---:|---|
| 7 | `Net:on(name, fn)` |
| 11 | `Net.lock_player_input(pid)` |
| 12 | `Net.unlock_player_input(pid)` |
| 13 | `Net.toggle_player_hud(pid)` |
| 16 | `InputAPI.create_controller(pid)` |
| 18 | `ctrl:get_input_owner()` |
| 19 | `ctrl:claim_input(owner)` |
| 25 | `ctrl:release_input(owner)` |
| 31 | `ctrl:has_input_control(owner)` |
| 32 | `ctrl:get_repeat_delays()` |
| 33 | `ctrl:set_repeat_delays(first,repeat_delay)` |
| 36 | `ctrl:require_release(actions, owner)` |
| 37 | `ctrl:consume(owner)` |
| 38 | `ctrl:is_action_pressed(action,owner)` |
| 39 | `ctrl:is_action_repeated(action,owner)` |
| 40 | `ctrl:on(event,fn)` |
| 44 | `ctrl:off(event,fn)` |
| 48 | `ctrl:emit(event,data)` |
| 54 | `InputAPI.get_controller(pid)` |
| 57 | `verify(test_name, expected, actual)` |

> Signatures are derived from the uploaded Lua code. Read the source for actual effects and error paths.
