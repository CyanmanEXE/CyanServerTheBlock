# 🔄 PlayerInterface migration — November 19, 2026

[🏠 Documentation](../index.md) · [🎮 Current API](README.md)

## Decisions

- `scripts/player-interface/main.lua` is the **only public `require` path**.
- The previous directories `player-control`, `input-controller`, `camera`,
  `player-manager` are replaced by internal files/folders under `player-interface`.
- Raw input events continue through **one** input registry, scoped sessions
  through **one** player-control stack, and player camera controllers through
  **one** camera manager. No control semantics were rewritten for this move.
- All supplied first-party consumers now import the single entry. Where a
  script previously had two imports, local aliases now point to one table.
- The camera's automatic `player_join`, `tile_interaction`, `tick`, transfer and
  disconnect setup is loaded by the single main entry (previously `camera/main.lua`).
- FootBomb and Liberation instance tile interactions still cannot open free
  camera. `liberation:intro` and `liberation:turn` capture names remain separate.

## Installation in an existing server

1. Back up the server and stop it.
2. Extract the complete updated `scripts/` contents, overwriting files.
3. Remove the **four obsolete runtime folders** `scripts/player-control`,
   `scripts/input-controller`, `scripts/camera`, `scripts/player-manager`.
   The supplied cleanup script does only those deletions.
4. Review any **external bootstrap/configuration**, not included with this
   upload, that loads `scripts/camera/main`; load
   `scripts/player-interface/main` instead. Loading before the first player join is preferred; the
   public camera accessor also lazily initializes a missing controller for
   a player verified by `Net.is_player`.
5. Start the server, verify that no `module not found` errors remain, and run
   the [live regression checklist](TESTING.md).

### Find remaining imports in other custom repositories

```bash
rg -n 'scripts/(player-control|input-controller|camera|player-manager)' scripts   --glob '*.lua'
```

The supplied first-party Lua tree has no remaining old require path. Old
archive text and previously generated historical documents may still mention
the old folder names for migration context.

## API mapping

| Old import | New import |
|---|---|
| `require("scripts/player-control/main")` | `require("scripts/player-interface/main")` |
| `require("scripts/input-controller/main")` | `require("scripts/player-interface/main")` |
| `require("scripts/camera/main")` | `require("scripts/player-interface/main")`; camera functions are flattened |
| `require("scripts/player-manager/main")` | `require("scripts/player-interface/main")` |

The **old `CameraManager` colon API is not literally interchangeable with the
new flat table**: use `Players.get_camera_controller(pid)`,
`Players.activate_free_camera(pid,mode,lock_input)`, etc., or access
`Players.Camera` for explicit existing colon methods. Never replace a colon
call blindly with a dot call without checking its arguments.

Older direct `Net.move_player_camera` cinematics still use the ONB engine API
where their camera lifetime has not been migrated. They have not been
reinterpreted as PlayerInterface-owned leases by this folder consolidation.
