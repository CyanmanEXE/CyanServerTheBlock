-- Prog test sprite registration: visually tests OW scaling and HP only.
-- Prog has no matching battle character in the supplied encounter package;
-- the Tiled OW Encounter Config intentionally uses the Mettaur encounter.
return function(EnemyTemplates)
    EnemyTemplates.register("Prog", {
        battle_name = "Prog",
        health = 40,
        max_health = 40,
        texture_path = "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/prog.png",
        animation_path = "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/prog.animation",
        shape = { {1} },
        shape_offset_x = 0,
        shape_offset_y = -1,
        attack_damage = 10,
        ai_type = "ranged", -- safe no-op placeholder
        is_special_encounter = true,
        preload_assets = {
            "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/prog.png",
            "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/prog.animation",
        },
    })
end
