# 📄 `scripts/player-interface/resources/ui-suppression.lua`

[⬆️ Modules](../../index.md) · [🎮 API](../../API_REFERENCE.md)

## Source-declared functions

| Line | Signature |
|---:|---|
| 6 | `state_for(store, pid)` |
| 10 | `net_call(name, pid)` |
| 17 | `acquire_engine(store, pid, owner, kind, fn_name)` |
| 30 | `M.acquire_engine_hud(pid, owner)` |
| 35 | `M.acquire_input_lock(pid, owner)` |
| 38 | `M.register_handler(name, handler)` |
| 42 | `M.acquire_element(pid, name, owner, options)` |
| 52 | `M.release(h)` |
| 88 | `M.register_profile(name, entries)` |
| 92 | `M.acquire_profile(pid, name, owner, options)` |
| 109 | `M.release_profile(b)` |
| 116 | `M.cleanup_player(pid)` |
| 121 | `M.get_debug_state(pid)` |
| 122 | `summary(s)` |

> Signatures are derived from the uploaded Lua code. Read the source for actual effects and error paths.
