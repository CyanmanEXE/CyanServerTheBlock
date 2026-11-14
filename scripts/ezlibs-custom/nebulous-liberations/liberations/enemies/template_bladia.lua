-- Bladia test sprite registration. Battle alias exists in the installed debuglib encounter package.
-- Uses a non-attacking placeholder AI until a dedicated overworld AI is authored.
return function(EnemyTemplates)
    EnemyTemplates.register("Bladia", {
        battle_name = "Bladia",
        health = 80,
        max_health = 80,
        texture_path = "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/bladia.png",
        animation_path = "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/bladia.animation",
        shape = { {1} },
        shape_offset_x = 0,
        shape_offset_y = -1,
        attack_damage = 25,
        ai_type = "ranged", -- current ranged AI is a harmless placeholder
        is_special_encounter = true,
        preload_assets = {
            "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/bladia.png",
            "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/bladia.animation",
        },
    })
end
