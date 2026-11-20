# MenuAPI

MenuAPI is a small BN-style menu layer built on net-games **Displayer**, **InputController**, and `ui-safe.lua`. It handles menu stacks, input locking, held-button handoffs, scrolling lists, profile cards, confirmation prompts, safe sprite cleanup, and partial redraws.

```lua
local MenuAPI = require("scripts/net-games/menuAPI/main")

MenuAPI.open(player_id, {
  type = "scroll_list",
  title = "Choose one",
  rows = {
    { id="a", text="Alpha", right="10" },
    { id="b", text="Beta" },
  },
  on_select = function(row, index)
    print("picked", row.id, index)
  end,
})
```

Built-in types are `scroll_list`, `info_window`, `compact_menu`, `confirm_prompt`, and `profile_list`. Most visual values can be overridden with `layout = { ... }`; rows may also provide `icon_texture`, `icon_anim`, `icon_state`, `enabled=false`, `right`, and `on_select`.

Useful calls:

```lua
MenuAPI.is_open(player_id)
MenuAPI.get_state(player_id)
MenuAPI.set_rows(player_id, rows, true) -- true keeps matching row.id selected
MenuAPI.set_profile(player_id, profile)
MenuAPI.refresh(player_id)
MenuAPI.close(player_id)
MenuAPI.close_all(player_id)
```

`confirm_prompt` uses `default_selection = 1` (Yes) or `2` (No), `lines = {...}`, and `on_result = function(yes) ... end`.

Default art is expected under `/server/assets/ui/menuAPI/` (`menu1.png`, `menu2.png`, `menu3.png`, `cursor.png`, `scroll.png`). Copy that asset folder from `shadis_hp`, or override texture paths in each menu's `layout`.


## PlayerInterface input-owner handoff (2026-11-20)

`MenuAPI` receives the active controller **and** its ownership token from
`st.control_session:input()`. Both returned values must be assigned directly:

```lua
local ctrl, owner
if st and st.control_session then
    ctrl, owner = st.control_session:input()
end
```

Never write `local ctrl, owner = st and st.control_session and
st.control_session:input()`; a Lua logical expression collapses a multiple-result
call to one value, dropping `owner`. When the controller has been claimed by
PlayerInterface, `ctrl:is_action_pressed(action, nil)` intentionally returns
`false`, so menus render but ignore buttons.

Gold Prog shops use `MenuAPI.open()` from inside an eznpcs native movement
capture. The input session is allowed to claim logical controller input without
releasing the NPC's movement lock. For a welcome textbox, open the shop only
from its completion callback after the textbox's PlayerInterface session closes.

Regression test from the server root (after installing the Gold Prog shop):

```bash
lua scripts/net-games/menuAPI/tests/test_input_owner.lua
```

The test uses the actual MenuAPI, PlayerInterface, and Gold Prog shop modules,
with ONB rendering and persistent memory mocked. It covers Up/Down/Confirm/Cancel,
all 13 ability rows, Owned refresh, NPC captures, and textbox-to-shop handoff.
