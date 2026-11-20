# 🟡 Gold Prog Ability Shop (`ability_shop.lua`)

[Complete Tiled configuration and examples](../../LIBERATION_ABILITY_PROG.md)

| Function | Arguments | Behavior |
|---|---|---|
| `Shop.ensure_items()` | None | Registers canonical ability items in ezmemory. |
| `Shop.is_owned(player_id, ability_id)` | Player ID; catalog ID | True if **equipped**, not merely previously unlocked. |
| `Shop.is_unlocked(player_id, ability_id)` | Player ID; catalog ID | True for persistent unlock or currently held item. |
| `Shop.unlock(player_id, ability_id)` | Player ID; catalog ID | Persistently unlocks without equipping or charging. |
| `Shop.get_equipped(player_id)` | Player ID | Returns the equipped ability ID from inventory/record. |
| `Shop.is_supported(ability_id)` | Catalog ID or known alias | True when a mission ability/passive is implemented. |
| `Shop.grant(player_id, ability_id)` | Player ID; catalog ID or legacy alias | Safely equips one ability, removes former items, and remembers both unlocks. Returns `boolean, error?`. |
| `Shop.read_offerings(properties)` | Tiled properties | Ordered `{id,name,cost,costs_enabled,requires_unlock}` (up to 13). |
| `Shop.open(npc, player_id)` | eznpcs record, player ID | Promise resolving on shop dismissal. |
| `Shop.register(eznpcs)` | Existing eznpcs module | Registers synthetic Dialogue event `Liberation Ability Shop`. |

**Menu value column:** `Owned` = equipped; `Unlocked` = earned/purchased previously, ready to re-equip free; `Locked` = requires external quest unlock; priced/unpriced = first acquisition. With `Enable Costs=false`, unowned unpriced choices show **nothing**. There are 13 catalog abilities, all backed by mission definitions.

**Visuals:** gold `MenuAPI` palette, optional gold frame and text tint for `Welcome Text`, `prog-gold` mugshot, single active list. Uses the existing PlayerInterface-compatible shared MenuAPI input-owner handling.
