> ⚠️ **Historical guide.** This document was retained from an earlier control-system layout. Use the [current PlayerInterface guide](../../README.md) and [API reference](../../API_REFERENCE.md) for authoritative imports and behavior.

# 🎮 PlayerManager — unified player control interface

[🏠 Documentation home](../../../index.md) · [📄 PlayerManager source](../../main/index.md) · [🛠️ Startup lock investigation](../../../ezlibs-custom/nebulous-liberations/STARTUP_INPUT_LOCK.md)

> **Applies to `scripts(4).zip` with the accompanying November 19, 2026 patch.** This is a compatibility facade, **not** a replacement event loop or a second input registry. Live client verification remains necessary.

## 🗂️ Contents

- [What owns what](#-what-owns-what)
- [Public functions](#-public-functions)
- [Recipes](#-recipes)
- [Migration and safety](#-migration-and-safety)

## 🧭 What owns what

| Responsibility | Implementation | Entry via manager | Ownership / cleanup |
|---|---|---|---|
| Engine input capture and reference counting | `player-control/main.lua` + `player-control/resources/ui-suppression.lua` | `acquire_capture`, `release_capture`, `begin_capture_scope` | Named `(player_id, owner)` scopes; idempotent per owner |
| Menu focus and button events | `player-control/main.lua` + `input-controller/main.lua` | `begin`, `get_input_controller` | A `Session` must be `:close()`d; parent/child contexts share capture lifetime |
| Raw input, direction and per-owner repeats | `input-controller` | `get_input_controller` | Do not claim raw input while a PlayerControl session is active |
| Scoped scripted/server camera | `player-control/main.lua` + `player-control/camera-focus.lua` | `begin_scripted_camera` or `begin(...,camera="scripted")` | Close the session; camera lease protects against another scripted owner |
| Player-controlled free camera | `camera/camera-manager.lua` + `camera/camera-controller.lua` | `activate_free_camera`, `deactivate_free_camera`, `move_free_camera`, `slide_free_camera`, `pan_free_camera` | The CameraController creates its own `PlayerControl` session and releases on deactivation |
| HUD suppression | `player-control/main.lua` | `suppress_hud`, `restore_hud`, session `hud` option | Separate reference count from input capture |
| Disconnect cleanup | Existing `player-control`, `input-controller`, `camera/main` handlers | Existing handlers are unchanged | No duplicate listener installed by this facade |

The new file is `scripts/player-interface/main.lua`. Its table delegates the existing `PlayerControl` methods with `__index` so existing `begin`, `get_active`, `cleanup_player`, `get_debug_state`, capture and HUD methods keep their original implementations.

## 🔌 Public functions

| Function | Parameters | Return / effect |
|---|---|---|
| `Manager.begin` | `player_id`, `options` | Existing PlayerControl session or `nil, err` |
| `Manager.begin_capture_scope` | `player_id`, `owner`, `options` | Named input / optional HUD scope, `scope:close()` |
| `Manager.acquire_capture` / `release_capture` | `player_id`, `owner` | Lock/unlock engine input using existing reference counting |
| `Manager.has_capture` | `player_id`, `owner` | Whether owner currently holds an engine input lock |
| `Manager.get_input_controller` | `player_id` | Existing `InputAPI.get_controller` result; does not claim focus |
| `Manager.get_camera_controller` | `player_id` | Existing registered free-camera controller or `nil` |
| `Manager.activate_free_camera` | `player_id`, `mode`, `lock_input` | Existing `CameraManager:activate_camera` result |
| `Manager.deactivate_free_camera` | `player_id`, `keep_camera_position` | `true` when inactive/absent, otherwise existing deactivation result |
| `Manager.is_free_camera_active` | `player_id` | Existing camera active state |
| `Manager.move_free_camera` | `player_id`, `x`, `y`, `z` | Existing `CameraManager:move_camera` call |
| `Manager.slide_free_camera` | `player_id`, `x`, `y`, `z`, `duration` | Existing slide call |
| `Manager.pan_free_camera` | `player_id`, `dx`, `dy`, `dz` | Existing pan call |
| `Manager.get_free_camera_position` | `player_id` | Existing camera position or `nil` |
| `Manager.begin_scripted_camera` | `player_id`, `owner`, `options` | PlayerControl `cinematic` session with scripted camera lease; supports `parent`, `capture`, `restore_camera` options |

**Options accepted by `Manager.begin(...)`** remain the original PlayerControl options: `owner`, `profile`, `parent`, `focus`, `native`, `capture`, `hud`, `camera`, `restore_camera`, `handoff_free_camera`, `first_repeat_delay`, `repeat_delay`. Check [PlayerControl API](../../control/index.md) and its [authored guide](../control/README.md) for the existing behavior. `Manager.begin_scripted_camera` passes only its documented options, not arbitrary unknown keys.

## 💻 Recipes

### Capture without stealing menu focus

```lua
local Players = require("scripts/player-interface/main")
local owner = "my_feature:cutscene"
Players.acquire_capture(player_id, owner)
-- Release this exact owner at completion, cancellation, and on error.
Players.release_capture(player_id, owner)
```

Prefer `begin_capture_scope` for a lexical lifetime:

```lua
local scope, err = Players.begin_capture_scope(player_id, "my_feature:dialogue", {hud=true})
if not scope then
    print("capture failed: " .. tostring(err))
    return
end
-- ... operation and async handoff ...
scope:close()
```

### A menu with logical buttons

```lua
local session, err = Players.begin(player_id, {owner="my_feature:menu", profile="menu"})
if not session then
    print("menu unavailable: " .. tostring(err))
    return
end
session:on_pressed("Cancel", function() session:close() end)
-- Close on completion as well as on interruption / disconnect.
```

### Server-scripted camera, released back to the player

```lua
local session, err = Players.begin_scripted_camera(player_id, "my_feature:camera")
if not session then return end
local camera = session:camera()
if camera then camera:slide_to(x, y, z, 0.7) end
-- Schedule the close AFTER movement/hold completion with the server's Async.
-- Do not release immediately after queuing a slide.
Async.sleep(0.7).and_then(function() session:close() end)
```

### Free camera, only in allowed areas

```lua
-- The camera/main.lua integration owns the map-interaction trigger.
local active = Players.is_free_camera_active(player_id)
if active then Players.deactivate_free_camera(player_id, true) end
```

Use the same non-grabbing semantics as `CameraManager` for camera moves. Never use raw `Net.lock_player_input`/`Net.unlock_player_input` in a feature participating in reference-counted PlayerControl captures: an external raw unlock can release input too early, and an external raw lock can leave it locked after managed owners finish.

## 🧪 Migration and safety

1. New feature code should `require("scripts/player-interface/main")` and call PlayerControl session/capture methods through that facade. The existing modules still load normally, and no sweeping require-path change is needed.
2. The Liberation `instance.lua` and `camera/main.lua` now enter through the manager; all other original consumers are source-compatible and may migrate incrementally.
3. **Do not merge the low-level registries into a single table or install another `Net:on("virtual_input")` handler.** InputAPI already processes raw virtual input; PlayerControl arbitrates menu focus; camera controllers use PlayerControl leases.
4. Do not reactivate free camera automatically inside cloned `liberation_` or `footbomb_` instances. For scripted cameras use a session or the mission's existing guarded lifetime.
5. Use `Players.get_debug_state(player_id)` to see active named capture owners, reference counts, camera leases and pending releases while diagnosing a stuck input state.
6. The standalone free camera is registered by `scripts/player-interface/main.lua` on player join. The facade does **not** implicitly create an absent camera controller. This preserves existing server load order.

**Compatibility:** This patch makes no changes to the internals or public signatures of InputController, CameraController, or PlayerControl. Consequently, existing consumers can continue importing each of them while new consumers migrate. It does not prove all active client scenes behave correctly without live testing.
