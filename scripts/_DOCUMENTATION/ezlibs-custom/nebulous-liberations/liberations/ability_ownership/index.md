# 🔐 Liberation Ability Ownership (`ability_ownership.lua`)

[🟡 Gold Prog shop and Tiled setup](../../../LIBERATION_ABILITY_PROG.md)

The persistent equipped/unlocked controller is shared by Gold Prog and the older Liberation ability grant event. It uses `ezmemory.get_player_memory`, `save_player_memory`, `give_player_item`, `remove_player_item`, and the existing player-secret helper.

| API | Parameters | Result |
|---|---|---|
| `normalize(id)` | Shop ID or legacy item ID | Canonical ID; returns `nil` for unknown IDs. `HexScyth` aliases `HexSickle`; `LongSwrd` stays distinct. |
| `is_supported(id)` | Shop or legacy ID | True for a resolvable ability/passive. |
| `sync(player_id)` | Player ID | Imports currently held legacy items into permanent unlocks; preserves existing equipped choice. |
| `get_equipped(player_id)` | Player ID | Returns the single currently equipped item ID. |
| `is_unlocked(player_id, id)` | Player ID, ability ID | True if persisted unlock or item currently held. |
| `unlock(player_id, id)` | Player ID, ability ID | Persists an unlock, without spending or equipping. Returns `boolean, error?`. |
| `equip(player_id, id)` | Player ID, ability ID | Grants desired item, removes other equipped ability items, saves unlock/equipped record; best-effort rollback on failed removal. Returns `boolean, error?`. |

**Memory key:** `player_memory.liberation_abilities` with `unlocked` (map of ID to `true`) and `equipped` (one ID string). Only a currently held item is considered equipped: a stale stored name will not resurrect an externally removed item.

**Caveat:** `sync()` can learn what is currently in the inventory; it cannot recover unlocks for abilities discarded before the patch that were never persisted.
