# 🗡️ Liberation Ability Runtime (`ability.lua`)

[🏠 Documentation home](../../../../index.md) · [⬆ Parent folder](../index.md) · [🟡 Gold Prog guide](../../LIBERATION_ABILITY_PROG.md)

The file is **`liberations/ability.lua`** (singular, not `abilities.lua`). It retains the current base-area EZEncounters resolver, plus the original missing Liberation actions.

| Public interface | Parameters | Behavior |
|---|---|---|
| `Ability.resolve_for_player(player)` | player with `.id` | Uses equipped inventory item via `ability_ownership.get_equipped` and returns the mapped mission action. Falls back to `LongSwrd`. |
| `Ability.<ability name>` | table | `name`, `question`, `cost`, `remove_traps`, `destroy_items`, `generate_shape`, `activate`; passives omit interactive fields. |
| `generate_shape()` | None (extra arguments ignored) | Returns `shape`, `offset_x`, `offset_y`. |
| `activate(instance, player_session, results, remove_traps, destroy_items)` | Mission/session and optional results/flags | Uses existing `initiate_encounter`, `liberate_and_loot_panels`, `loot_panels`, `complete_turn` handlers. |

**Restored original actions:** `HeroSwrd` (3 vertical panels; 2 points), `CrosBmb` (plus; 2), `Burner` (3×3; 4), `Blaster` (T; 1), `Bazooka` (5×5; 2). Other abilities retain their **current** server costs and behavior, not the old copied values. `PanelSearch` remains a placeholder.

**Item IDs:** `HeroSwrd`, `WideSwrd`, `OldSaber`, `Guard`, `HevyShld`, `HexSickle`, `NumGadgt`, `GutsHamr`, `ShdwShoe`, `CrosBmb`, `Burner`, `Blaster`, `Bazooka`.

See [Tiled and shop configuration](../../LIBERATION_ABILITY_PROG.md) for ownership, quest-gated abilities, prices, and examples.
