# 🔍 Liberation mission startup — input and camera-lock audit

[🏠 Documentation home](../../index.md) · [🎮 Unified manager](../../player-interface/history/manager/README.md) · [🗺️ Tiled setup](../../areas/LIBERATION_TILED_SETUP.md)

> Audit of `scripts(4).zip`, `encounters_areas_assets.zip` and the accompanying Lua patch. These are **verified code paths and preventive fixes**, not a claim that an intermittent live-client symptom has been reproduced on the server.

## 🧭 Confirmed ownership conflict

1. `ezlibs-custom/nebulous-liberations/main.lua` creates instances with IDs beginning `liberation_` and calls `Mission:begin()` when its pending player transfers have completed.
2. `camera/main.lua` attaches a `Net:on("tile_interaction", ...)` callback for the player-operated free camera; before this patch it excluded only FootBomb instance IDs.
3. A Liberation interaction on the matching camera button could activate a `CameraController` (`camera/camera-controller.lua`), which starts its own PlayerControl `free_camera` session with a movement capture.
4. Named `PlayerControl.acquire_capture(..., "liberation:turn")` locks the engine but **does not claim logical button ownership**; therefore only checking `PlayerControl.get_active()` was insufficient to protect the mission from free-camera activation.
5. While free camera was active, the client actor could remain movement-locked until free-camera controls closed that session. That behavior matches the reported symptom, although no runtime recording was provided to conclusively establish the event sequence.

**Patch:** `scripts/player-interface/main.lua` refuses automatic free-camera activation when the current area ID matches `^liberation_`, just as it already handled FootBomb. The activation also goes through the new `PlayerManager.activate_free_camera(...)` facade.

## ⏱️ Separate startup timing issue

The original `Mission:begin()` incremented **one shared `total_camera_time` across all party members** and only released the shared `liberation:turn` capture after that cumulative delay. That meant (for example) a two-player party's introductory camera sequences were effectively charged twice before either participant's movement was released, even though their camera commands are per player.

**Patch:** Each player now obtains a dedicated named `liberation:intro` capture. Its own camera sequence duration determines its release time, and the callback only unlocks a camera if that player is still in the same mission area. It no longer releases the turn capture. The intro releases a previous free-camera session before starting.

`liberations/camera_sequence.lua` no longer calls `Net.unlock_player_camera` immediately after queuing the last slide. The intro callback returns control after the elapsed sequence duration. The server has no camera-render-complete acknowledgement in the inspected code, so the duration is still scheduling-based rather than a client confirmation.

## 🛠️ Files changed

| Runtime path | Change |
|---|---|
| `scripts/player-interface/main.lua` | New backward-compatible facade, no duplicate event handlers |
| `scripts/player-interface/main.lua` | Deny free-camera interactions in `liberation_` areas; use facade |
| `scripts/ezlibs-custom/nebulous-liberations/liberations/instance.lua` | Independent intro owners, per-player timing, guarded unlock and release |
| `scripts/ezlibs-custom/nebulous-liberations/liberations/camera_sequence.lua` | Move camera unlock to end-of-intro callback |

## 🧪 In-game regression checklist

- Launch `DEBUGLIB` solo using the Golden Prog selector or a `Liberation Gate`. During the intro, attempt the button which previously activated free camera; it should **not** activate a free-camera session.
- Wait for intro completion **without pressing any buttons**. Confirm the character moves normally and `liberation:intro` disappears from `Players.get_debug_state(player_id).named_resources`.
- Start a two-player party. Both players should regain movement after their **own** camera sequence, rather than after the sum of the party sequences.
- Start an interaction menu during/after the intro; Cancel should close it and not release an active turn/loot capture prematurely.
- Verify native dialogues, Golden Prog selection, item panel textboxes, turn battles, camera returns, re-entry, and disconnect cleanup.
- Verify `footbomb_` still blocks accidental free-camera activation. In an ordinary non-mission map, confirm player-operated camera still works.
- If movement still sticks, inspect `Players.get_debug_state(player_id)` for `free_camera`, `liberation:turn`, `liberation:intro`, `liberation:loot`, `liberation:enemy`, pending releases and engine lock count. The named owners identify the remaining lifetime rather than requiring a blind unlock.

## ⚠️ Known limitations

- No automated integration tests with a real ONB client were executed. Validate event ordering in game.
- Map instances created by a custom naming convention **other than** `liberation_` are not covered by the automatic free-camera guard; update that guard if the instance ID contract changes.
- Code in `scripts/events/eznpcs_events.lua` still contains some direct `Net.lock_player_input`/`unlock_player_input` calls outside the PlayerControl reference-counted path. Those are a separate integration audit candidate; this patch does **not** rewrite their dialogue semantics.
