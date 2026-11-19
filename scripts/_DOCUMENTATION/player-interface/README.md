# 🎮 PlayerInterface — unified player integration

[🏠 Documentation home](../index.md) · [📘 API reference](API_REFERENCE.md) · [🔄 Migration](MIGRATION.md) · [🧪 Tests](TESTING.md)

**Public import for every gameplay script:**

```lua
local Players = require("scripts/player-interface/main")
```

The input registry, stateful scoped player controller, and free-camera
controller still exist as internal components of **one** `scripts/player-interface`
folder. Existing `PlayerControl.begin`, `InputAPI.get_controller`, camera
operations, capture/HUD operations, and input configuration methods are
available from the same `Players` table. `main.lua` is the **only public entry**;
internal component `.lua` files are private, not additional plugins to load.

## 📁 Folder structure

| Script or folder | Source-based responsibility |
|---|---|
| [`main.lua`](main/index.md) | Unified public API; loads components in dependency order and registers camera events |
| [`control.lua`](control/index.md) | Scoped input ownership, native-UI handoff, named capture, HUD/camera leases |
| [`input/api.lua`](input/api/index.md) | Single raw input registry and `Net:on("virtual_input")` listener |
| [`input/input-controller.lua`](input/input-controller/index.md) | Per-player action state, press/release/repeat, logical ownership |
| [`camera/events.lua`](camera/events/index.md) | Player join, tile interaction, transfer, disconnect, tick |
| [`camera/camera-manager.lua`](camera/camera-manager/index.md) | Camera controller registry and routing |
| [`camera/camera-controller.lua`](camera/camera-controller/index.md) | Player-controlled and custom camera input + movement |
| [`camera-focus.lua`](camera-focus/index.md) | Exclusive protected scripted camera leases |
| [`resources/ui-suppression.lua`](resources/ui-suppression/index.md) | Reference-counted movement/HUD suppression |
| [`tests/`](tests/index.md) | Mock-Net Lua regression checks |

## 🔒 Input ownership and locks

A **named capture** (`acquire_capture`, `release_capture`) prevents default
world movement. It does **not** claim the logical controller. A **session**
(`begin` with a `profile`) can acquire both engine capture and logical button
focus. Reusing an owner for named capture is idempotent; two overlapping tasks
need distinct owners. The last successful release unlocks the engine.

```lua
local Players = require("scripts/player-interface/main")

-- Lock world movement but leave native dialog controls available:
local scope, err = Players.begin_capture_scope(player_id,"my_event:dialogue")
if not scope then error(err) end
-- ... async dialogue; close only when its work actually ends ...
scope:close()

-- A button-driven menu uses a logical session instead:
local menu = assert(Players.begin(player_id, {owner="my_menu",profile="menu"}))
menu:on_pressed("Cancel",function() menu:close() end)
```

## 📸 Cameras: player controlled vs server controlled

**Free camera** uses a `PlayerControl` session internally and thus cannot
steal a currently focused menu. The built-in tile interaction is disabled
inside `liberation_` and `footbomb_` instance areas.

```lua
local Players = require("scripts/player-interface/main")
Players.activate_free_camera(player_id, Players.CameraMode.Custom, true)
-- Call when done, transfer, or on interruption:
Players.deactivate_free_camera(player_id, false)
```

**Server-directed camera** uses an exclusive lease; do not call raw `Net`
camera restore methods from a different owner during a lease:

```lua
local shot, err = Players.begin_scripted_camera(player_id,"scene:camera")
if not shot then error(err) end
local camera = assert(shot:camera())
camera:move_to(10,20,1)
camera:slide_to(11,20,1,0.5)
-- Close `shot` when the animation/hold finishes (not immediately).
shot:close()
```

The Liberation mission retains direct scripted `Net.move_player_camera` and
`Net.slide_player_camera` calls in its existing timed sequences: those calls
were not silently refactored to lease-based camera scopes because their
asynchronous lifetime and multiple participants need a separate migration.

## 🧩 Compatibility and installation

All first-party Lua requires in the supplied archive have been changed to the
one entry. The old **runtime directories** `scripts/player-control`,
`scripts/input-controller`, `scripts/camera`, `scripts/player-manager` are
removed from the replacement tree. When applying a partial ZIP over an
existing installation, physically delete those four old directories **only
after** replacing the updated Lua imports. Any external bootstrap not included
in the upload must load `scripts/player-interface/main` instead of the old
camera module. See the [migration checklist](MIGRATION.md).

**Scope:** Static inspection and mock-Net tests, not proof of live ONB client
behavior. See [tests and live-verification checklist](TESTING.md).
