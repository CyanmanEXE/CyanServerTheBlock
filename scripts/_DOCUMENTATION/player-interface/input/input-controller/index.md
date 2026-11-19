# 📄 `scripts/player-interface/input/input-controller.lua`

[⬆️ Modules](../../index.md) · [🎮 API](../../API_REFERENCE.md)

## Source-declared functions

| Line | Signature |
|---:|---|
| 46 | `normalize_state(value)` |
| 58 | `normalize_events(events)` |
| 91 | `rebuild_action_tables(self)` |
| 112 | `sanitize_delay(value, fallback)` |
| 122 | `InputController.new(player_id, button_mappings, direction_raw_names, config)` |
| 128 | `InputController:_init(player_id, button_mappings, direction_raw_names, config)` |
| 171 | `InputController.extend(overrides)` |
| 179 | `subclass.new(player_id, button_mappings, direction_raw_names, config)` |
| 190 | `InputController:clone(player_id)` |
| 208 | `InputController:is_active()` |
| 212 | `InputController:activate()` |
| 217 | `InputController:deactivate()` |
| 222 | `InputController:reset()` |
| 227 | `InputController:reload(button_mappings, direction_raw_names)` |
| 240 | `InputController:_clear_transient_state()` |
| 253 | `InputController:destroy()` |
| 279 | `InputController:set_repeat_delays(first_repeat_delay, repeat_delay)` |
| 294 | `InputController:restore_repeat_delays()` |
| 307 | `InputController:set_owned_repeat_delays(owner, first, repeat_delay)` |
| 321 | `InputController:clear_owned_repeat_delays(owner)` |
| 330 | `InputController:get_default_repeat_delays()` |
| 336 | `InputController:_notify(event, payload)` |
| 344 | `InputController:get_repeat_delays()` |
| 352 | `InputController:on(event, callback)` |
| 359 | `InputController:off(event, callback)` |
| 366 | `InputController:remove_listener(event, callback)` |
| 373 | `InputController:claim_input(owner, force)` |
| 411 | `InputController:release_input(owner)` |
| 438 | `InputController:has_input_control(owner)` |
| 442 | `InputController:get_input_owner()` |
| 446 | `InputController:_swallowing()` |
| 450 | `InputController:_emit_edge(kind, action, state)` |
| 474 | `InputController:handle_raw_input(events)` |
| 495 | `InputController:_set_action_down(action, down)` |
| 508 | `InputController:_update_logical_states()` |
| 527 | `InputController:_update_direction()` |
| 556 | `InputController:_synthesize_non_direction_releases()` |
| 570 | `InputController:_process_holds(dt)` |
| 590 | `InputController:tick(delta_time)` |
| 608 | `can_access_input(self, owner)` |
| 615 | `InputController:is_action_down(action, owner)` |
| 623 | `InputController:peek_action_pressed(action, owner)` |
| 630 | `InputController:peek_action_released(action, owner)` |
| 637 | `InputController:peek_action_repeated(action, owner)` |
| 644 | `InputController:is_action_pressed(action, owner)` |
| 653 | `InputController:is_action_released(action, owner)` |
| 662 | `InputController:is_action_repeated(action, owner)` |
| 671 | `InputController:get_active_direction(owner)` |
| 682 | `InputController:require_release(actions, owner)` |
| 694 | `InputController:swallow(seconds, owner)` |
| 702 | `InputController:consume(owner)` |

> Signatures are derived from the uploaded Lua code. Read the source for actual effects and error paths.
