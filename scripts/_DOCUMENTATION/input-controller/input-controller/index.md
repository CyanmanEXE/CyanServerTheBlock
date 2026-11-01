# `input-controller.lua`

> **Source:** `scripts/input-controller/input-controller.lua`  
> **Source lines:** 660  
> **Functions detected:** 47  
> **Table declarations detected:** 22

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

input-controller.lua Unified sticky-state input controller with release/repeat edges and UI handoff guards. Timing is driven only by tick(delta_time); missing packet keys never imply release. Lifecycle: local ctrl = InputController.new(player_id, button_mappings, dir_names, config) ctrl:activate()     -- begin processing (default unless config.auto_activate == false) ctrl:deactivate()   -- stop processing, clear transient state (no events emitted) ctrl:reset()        -- clear transient state, keep active flag as-is ctrl:reload(m, d)   -- swap in new mappings/dir-names and reset transient state ctrl:destroy()      -- permanent teardown Repeat cadence: Per-instance. `config.first_repeat_delay` and `config.repeat_delay` override the module defaults at construction. `:set_repeat_delays(first, repeat)` changes them at runtime; `:restore_repeat_delays()` reverts to the values used at construction. Extension: local MyController = InputController.extend({ _init = function(self, ...) InputController._init(self, ...); ... end, some_method = function(self) ... end, }) Cloning (same mappings, new instance): local copy = ctrl:clone(other_player_id_or_nil)

## Dependencies

- `scripts/utils/utility` — line 28
- `scripts/input-controller/d-pad` — line 29

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 46 | `normalize_state` | `value` |
| 58 | `normalize_events` | `events` |
| 91 | `rebuild_action_tables` | `self` |
| 112 | `sanitize_delay` | `value, fallback` |
| 122 | `InputController.new` | `player_id, button_mappings, direction_raw_names, config` |
| 128 | `InputController:_init` | `player_id, button_mappings, direction_raw_names, config` |
| 169 | `InputController.extend` | `overrides` |
| 177 | `subclass.new` | `player_id, button_mappings, direction_raw_names, config` |
| 188 | `InputController:clone` | `player_id` |
| 206 | `InputController:is_active` | `(none)` |
| 210 | `InputController:activate` | `(none)` |
| 215 | `InputController:deactivate` | `(none)` |
| 220 | `InputController:reset` | `(none)` |
| 225 | `InputController:reload` | `button_mappings, direction_raw_names` |
| 238 | `InputController:_clear_transient_state` | `(none)` |
| 250 | `InputController:destroy` | `(none)` |
| 274 | `InputController:set_repeat_delays` | `first_repeat_delay, repeat_delay` |
| 289 | `InputController:restore_repeat_delays` | `(none)` |
| 299 | `InputController:get_repeat_delays` | `(none)` |
| 307 | `InputController:on` | `event, callback` |
| 314 | `InputController:off` | `event, callback` |
| 321 | `InputController:remove_listener` | `event, callback` |
| 328 | `InputController:claim_input` | `owner, force` |
| 364 | `InputController:release_input` | `owner` |
| 388 | `InputController:has_input_control` | `owner` |
| 392 | `InputController:get_input_owner` | `(none)` |
| 396 | `InputController:_swallowing` | `(none)` |
| 400 | `InputController:_emit_edge` | `kind, action, state` |
| 424 | `InputController:handle_raw_input` | `events` |
| 445 | `InputController:_set_action_down` | `action, down` |
| 458 | `InputController:_update_logical_states` | `(none)` |
| 477 | `InputController:_update_direction` | `(none)` |
| 506 | `InputController:_synthesize_non_direction_releases` | `(none)` |
| 520 | `InputController:_process_holds` | `dt` |
| 540 | `InputController:tick` | `delta_time` |
| 558 | `can_access_input` | `self, owner` |
| 565 | `InputController:is_action_down` | `action, owner` |
| 573 | `InputController:peek_action_pressed` | `action, owner` |
| 580 | `InputController:peek_action_released` | `action, owner` |
| 587 | `InputController:peek_action_repeated` | `action, owner` |
| 594 | `InputController:is_action_pressed` | `action, owner` |
| 603 | `InputController:is_action_released` | `action, owner` |
| 612 | `InputController:is_action_repeated` | `action, owner` |
| 621 | `InputController:get_active_direction` | `owner` |
| 632 | `InputController:require_release` | `actions, owner` |
| 644 | `InputController:swallow` | `seconds, owner` |
| 652 | `InputController:consume` | `owner` |

### Function notes

- **`normalize_state(value)`** *(source line 46)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_events(events)`** *(source line 58)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`rebuild_action_tables(self)`** — Rebuild self.actions and self.raw_to_actions from self.button_mappings. *(source line 91)*
- **`sanitize_delay(value, fallback)`** *(source line 112)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController.new(player_id, button_mappings, direction_raw_names, config)`** — --------------------------------------------------------------------------- Construction --------------------------------------------------------------------------- *(source line 122)*
- **`InputController:_init(player_id, button_mappings, direction_raw_names, config)`** *(source line 128)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController.extend(overrides)`** — Create a subclass. *(source line 169)*
- **`subclass.new(player_id, button_mappings, direction_raw_names, config)`** *(source line 177)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:clone(player_id)`** — Clone produces a new controller that inherits the source controller's current repeat cadence (not the class defaults). *(source line 188)*
- **`InputController:is_active()`** — --------------------------------------------------------------------------- Lifecycle --------------------------------------------------------------------------- *(source line 206)*
- **`InputController:activate()`** *(source line 210)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:deactivate()`** *(source line 215)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:reset()`** *(source line 220)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:reload(button_mappings, direction_raw_names)`** *(source line 225)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:_clear_transient_state()`** *(source line 238)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:destroy()`** *(source line 250)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:set_repeat_delays(first_repeat_delay, repeat_delay)`** — Change the repeat cadence at runtime. Passing nil for either argument keeps the current value for that field. *(source line 274)*
- **`InputController:restore_repeat_delays()`** — Revert to the cadence configured at construction time. *(source line 289)*
- **`InputController:get_repeat_delays()`** *(source line 299)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:on(event, callback)`** — --------------------------------------------------------------------------- Events --------------------------------------------------------------------------- *(source line 307)*
- **`InputController:off(event, callback)`** — Match the underlying EventEmitter API and let consumers reliably detach subscriptions during teardown. CameraController previously tried to unsubscribe, but InputController did not expose the emitter's method. *(source line 314)*
- **`InputController:remove_listener(event, callback)`** *(source line 321)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:claim_input(owner, force)`** — Claim exclusive interactive control. A forced claim is intended for an explicit context transition (for example, entering a minigame) and not for competing systems to repeatedly steal control from each other. *(source line 328)*
- **`InputController:release_input(owner)`** *(source line 364)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:has_input_control(owner)`** *(source line 388)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:get_input_owner()`** *(source line 392)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:_swallowing()`** *(source line 396)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:_emit_edge(kind, action, state)`** *(source line 400)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:handle_raw_input(events)`** — --------------------------------------------------------------------------- Input handling --------------------------------------------------------------------------- *(source line 424)*
- **`InputController:_set_action_down(action, down)`** *(source line 445)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:_update_logical_states()`** *(source line 458)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:_update_direction()`** *(source line 477)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:_synthesize_non_direction_releases()`** *(source line 506)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:_process_holds(dt)`** *(source line 520)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:tick(delta_time)`** *(source line 540)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`can_access_input(self, owner)`** — Backward compatibility is retained while the controller is unclaimed. Once an owner exists, callers must identify themselves; legacy pollers can no longer consume the active owner's edge flags by calling without an owner. *(source line 558)*
- **`InputController:is_action_down(action, owner)`** *(source line 565)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:peek_action_pressed(action, owner)`** *(source line 573)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:peek_action_released(action, owner)`** *(source line 580)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:peek_action_repeated(action, owner)`** *(source line 587)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:is_action_pressed(action, owner)`** *(source line 594)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:is_action_released(action, owner)`** *(source line 603)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:is_action_repeated(action, owner)`** *(source line 612)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:get_active_direction(owner)`** *(source line 621)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:require_release(actions, owner)`** — --------------------------------------------------------------------------- Control --------------------------------------------------------------------------- *(source line 632)*
- **`InputController:swallow(seconds, owner)`** *(source line 644)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`InputController:consume(owner)`** *(source line 652)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `InputController` *(line 30)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 59)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.actions` *(line 92)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.raw_to_actions` *(line 93)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.raw_states` *(line 136)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.raw_last_seen` *(line 138)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.logical` *(line 139)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.pressed_actions` *(line 141)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.released_actions` *(line 142)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.repeat_actions` *(line 143)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.release_required` *(line 144)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.raw_states` *(line 239)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.raw_last_seen` *(line 240)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.logical` *(line 241)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.pressed_actions` *(line 243)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.released_actions` *(line 244)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.repeat_actions` *(line 245)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.release_required` *(line 246)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `pressed` *(line 478)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.pressed_actions` *(line 655)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.released_actions` *(line 656)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.repeat_actions` *(line 657)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/input-controller/input-controller.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
