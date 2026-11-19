# 🧪 PlayerInterface verification

[🏠 Documentation](../index.md) · [🎮 PlayerInterface](README.md)

## Offline test commands (server root)

```bash
texlua scripts/player-interface/tests/smoke.lua
texlua scripts/player-interface/tests/integration.lua
texlua scripts/player-interface/tests/migration.lua
texlua scripts/player-interface/tests/reliability.lua
texlua scripts/player-interface/tests/unified.lua
```

These tests mock the `Net` API to validate module reuse, reference-counted
movement locks, logical input focus, nested sessions, camera guards,
cleanup and error recovery. They do **not** run ONB clients.

## Manual live verification

| Case | Expected observation |
|---|---|
| Join and free camera | Camera input works after normal join; Cancel returns control |
| FootBomb | Camera trigger does not steal input in `footbomb_` areas; exiting restores movement |
| Liberation intro, one player | Movement unlocks without having to press menu controls |
| Liberation intro, multiple players | Each player receives their own intro duration; one player's end does not unlock another player's active turn |
| Liberation menus | Confirm/Cancel, repeat timing, and returned focus work without stale held-button presses |
| Liberation combat/loot | Battle handoff and loot textbox close return to the correct input owner |
| HP menus, Jukebox, Net Games | Nested owner scopes release once and do not prematurely unlock movement |
| Warps and area transfer | Camera and input restore when the owner releases |
| Disconnect in camera/menu/mission | Per-player references are cleaned up without leaking another player's leases |

**Unverified:** engine-level timing and intermittent real-client freezes. For
any remaining lock, inspect `Players.get_debug_state(player_id)` and mission
logs before adding raw `Net.unlock_player_input` (which would break reference
counting).
