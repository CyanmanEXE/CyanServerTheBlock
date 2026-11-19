> 🗃️ **Prior snapshot / historical context.** For the current runtime folder layout and module paths, use the [PlayerInterface migration guide](player-interface/MIGRATION.md) and [source inventory](SOURCE_INVENTORY.md).

# 📦 November 19, 2026 — drop-in patch and documentation

[🏠 Documentation home](index.md) · [🔎 QA results](DOCUMENTATION_QA_2026_11_19.md)

## Install

1. Back up your current `scripts/` directory.
2. Extract the **drop-in ZIP** at your server root, keeping the `scripts/` prefix. Overwrite only files included in the package; it does not replace areas or encounters.
3. Ensure your normal server bootstrap still loads `scripts/player-interface/main`, `scripts/player-interface/main` and `scripts/player-interface/main` through its existing entrypoints. The new `scripts/player-interface/main.lua` is a facade consumed by the changed scripts, **not** a new plugin to register independently.
4. Restart the server to load the changed Lua and re-register the existing handlers.
5. Validate in game: launch Liberation, press **no buttons** during the intro, then test movement, Cancel/menu, camera, both solo and multiplayer.

## Runtime files in this drop-in

| File | Role |
|---|---|
| `scripts/player-interface/main.lua` | Unified compatibility entry point |
| `scripts/player-interface/main.lua` | Automatic free camera blocked in Liberation instances |
| `scripts/ezlibs-custom/nebulous-liberations/liberations/instance.lua` | Independent intro capture/timer per player |
| `scripts/ezlibs-custom/nebulous-liberations/liberations/camera_sequence.lua` | Camera return no longer unlocked early |

Documentation includes the current API indexes, entire Tiled object schema catalog, actual map examples, field status, control-interface guide, and source inventory. Original assets and TMX maps are not rewritten in this patch. For a list of remaining live checks and possible residual direct input-lock integrations, see [documentation QA](DOCUMENTATION_QA_2026_11_19.md).
