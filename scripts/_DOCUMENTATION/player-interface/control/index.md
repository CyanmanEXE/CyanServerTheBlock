# 📄 `scripts/player-interface/control.lua`

[⬆️ Modules](../index.md) · [🎮 API](../API_REFERENCE.md)

## Source-declared functions

| Line | Signature |
|---:|---|
| 24 | `lifecycle(kind,message,data)` |
| 46 | `report(where, err)` |
| 49 | `top(state)` |
| 55 | `focused(state)` |
| 59 | `safe_callback(session, callback, label, ...)` |
| 67 | `release_or_queue(pid, handle, label)` |
| 79 | `M.retry_cleanup(pid)` |
| 100 | `resource_for(pid, owner, create)` |
| 112 | `prune_resource(pid, owner)` |
| 118 | `acquire_resource(pid, owner, field, fn)` |
| 129 | `release_resource(pid,owner,field)` |
| 144 | `M.acquire_capture(pid,owner)` |
| 149 | `M.release_capture(pid,owner)` |
| 154 | `M.has_capture(pid,owner)` |
| 158 | `M.suppress_hud(pid,owner)` |
| 163 | `M.restore_hud(pid,owner)` |
| 169 | `M.begin_capture_scope(pid,owner,options)` |
| 178 | `scope:close()` |
| 188 | `state_for(pid)` |
| 206 | `sync_focus(state)` |
| 272 | `detach_state(state)` |
| 289 | `attach_events(state)` |
| 292 | `dispatch(kind,ev)` |
| 307 | `state.pressed_handler(ev)` |
| 308 | `state.repeated_handler(ev)` |
| 309 | `state.released_handler(ev)` |
| 310 | `state.owner_handler(change)` |
| 330 | `Session:is_alive()` |
| 331 | `Session:is_current()` |
| 335 | `Session:input()` |
| 338 | `Session:poll(actions)` |
| 354 | `Session:on_pressed(action,fn)` |
| 361 | `Session:on_repeat(action,fn)` |
| 368 | `Session:on_released(action,fn)` |
| 377 | `Session:guard_input(seconds, actions)` |
| 391 | `Session:begin_native_handoff(options)` |
| 398 | `handoff:resume()` |
| 410 | `Session:set_repeat_delays(first,interval)` |
| 417 | `Session:on_close(fn)` |
| 422 | `Session:on_error(fn)` |
| 427 | `Session:on_suspend(fn)` |
| 432 | `Session:on_resume(fn)` |
| 437 | `Session:yield_to_native_ui()` |
| 442 | `Session:resume_buttons()` |
| 448 | `Session:suspend_buttons()` |
| 449 | `Session:child(opts)` |
| 454 | `restore_camera(lease)` |
| 466 | `Session:close()` |
| 507 | `rollback_state(state)` |
| 510 | `M.begin(pid,options)` |
| 599 | `Session:camera()` |
| 603 | `call(name,...)` |
| 610 | `api:move_to(x,y,z)` |
| 611 | `api:slide_to(x,y,z,duration)` |
| 612 | `api:follow_player()` |
| 620 | `M.get_active(pid)` |
| 621 | `M.get_debug_state(pid)` |
| 640 | `M.cleanup_player(pid)` |

> Signatures are derived from the uploaded Lua code. Read the source for actual effects and error paths.
