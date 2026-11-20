# 📄 `mission_selector.lua` — Persistent Gold Prog API reference

[🏠 Documentation home](../../../../index.md) · [⬆ Liberation modules](../index.md) · [🟡 Integration and Tiled setup](../../GOLDEN_PROG_MISSIONS.md)

**Source:** [`scripts/ezlibs-custom/nebulous-liberations/liberations/mission_selector.lua`](../../../../../ezlibs-custom/nebulous-liberations/liberations/mission_selector.lua)

## Contents

- [Dependencies](#dependencies)
- [Functions](#functions)
- [Data and configuration](#data-and-configuration)
- [Event flow](#event-flow)

## Dependencies

| Module | Use |
|---|---|
| `eznpcs/eznpcs` | `EzNPCs.add_event` registration |
| `liberations/option_menu` | Existing 9-slice PlayerControl menu |
| `liberations/constants` | `Liberation Tileset` property name |
| `logger/logger` | `mission-selector` subsystem logs |
| `ezlibs-scripts/direction` | Existing `Direction.to_vector()` mapping for all eight NPC facings |

## Functions

| Function | Arguments | Result |
|---|---|---|
| `is_base_area(area_id)` | Runtime area ID | `true` unless it is a `liberation_` clone instance |
| `has_liberation_configuration(area_id)` | Runtime area ID | Checks `Liberation Config` / tileset and named `Spawn` |
| `Selector.available_missions()` | None | Sorted array of `{id,label,order}` for configured, loaded mission maps |
| `Selector.return_destination_for_npc(npc, area_id)` | eznpcs NPC record; source runtime area ID | Returns `{area_id, x, y, z, npc_id, direction}` or `nil, reason`, with world/tile coordinates |
| `Selector.register(plugin)` | Nebulous Liberations plugin exposing `start_game_for_player` | Registers `Liberation Mission Selector` with eznpcs |

## Data and configuration

| Table | Fields | Purpose |
|---|---|---|
| `MENU_CONFIG` | `max_visible=5`, `centered=true`, `mugshot` | Centered 9-slice selector, five visible choices and cropped mug |
| `MENU_CONFIG.mugshot` | `texture_path`, `animation_path`, `anim_state`, `width`, `height`, `scale` | Gold Prog mug on the left of the menu |
| `KNOWN_MISSIONS` | Runtime ID/name → `{label,order}` | Friendly display names for six imported compatible missions |
| `missions` | Array `{id,label,order}` | Actual current `Net.list_areas()` results; never launch by display string |

## Event flow

When an NPC with `First Dialogue` targeting a Dialogue object of `Event Name = Liberation Mission Selector` is interacted with, eznpcs invokes the event. It discovers available base areas and opens the 9-slice menu. On successful confirmation, it verifies the player still exists in the original area, computes the center of the tile *in front of the NPC*, then invokes `plugin.start_game_for_player(player_id, mission.id, return_destination)`. Cancel and disconnect do not launch. The NPC object remains available for repeat use.

### Return destination

- **Return area:** `Net.get_player_area(player_id)` at menu opening, retained after selecting a mission. The return data belongs only to that mission instance.
- **NPC reference:** the original Tiled NPC object from `npc.placeholder_id` and `Net.get_object_by_id`; its `Direction` property is authoritative, because eznpcs can turn the visible bot toward the player during conversation.
- **Position:** `x = floor(npc_world_x) + step_x + 0.5`, `y = floor(npc_world_y) + step_y + 0.5`; `z` stays equal to the NPC's world-layer elevation. No TMX pixel coordinates are used as Net transfer coordinates.
- **Direction:** `Direction.to_vector()` supplies the signed direction; nonzero vector components become a one-tile step. `Up Left` = (-1, 0), `Up Right` = (0, -1), `Down Left` = (0, +1), `Down Right` = (+1, 0); screen-cardinal facings move diagonally by one map tile on each axis.
- **Cleanup:** `main.lua` stores the location on the created mission instance; it calls the existing `Net.transfer_player` to return mission participants there. If the source area cannot be resolved, it falls back to the normal map-configured `Respawn Area` and spawn behavior. Ordinary Liberation Gates never set this override and are unchanged.
- **Debugging:** a `Golden Prog mission return destination` log records chosen coordinates at launch, and the `Removing liberation instance` log records `return_source`, return area, coordinates, and elevation.

The test `liberations/tests/test_mission_selector_return.lua` covers all eight directions, live NPC turning versus authored Tiled facing, selector return on cleanup, and the original gate fallback path.
