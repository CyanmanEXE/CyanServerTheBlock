-- Registered overworld template. Legacy constructor module remains for compatibility.
return function(EnemyTemplates)
EnemyTemplates.register("BigBrute", {
    battle_name = "BigBrute",
    health = 120,
    max_health = 120,
    texture_path = "/server/assets/NebuLibsAssets/bots/bigbrute.png",
    animation_path = "/server/assets/NebuLibsAssets/bots/bigbrute.animation",
    shape = { {1,1,1}, {1,0,1}, {1,1,1} },
    shape_offset_x = 0,
    shape_offset_y = -2,
    attack_damage = 20,
    attack_texture = "/server/assets/NebuLibsAssets/bots/beast breath.png",
    attack_animation_path = "/server/assets/NebuLibsAssets/bots/beast breath.animation",
    ai_type = "simple_charge",
    is_special_encounter = true,
    preload_assets = { "/server/assets/NebuLibsAssets/bots/bigbrute.animation","/server/assets/NebuLibsAssets/bots/beast breath.png", "/server/assets/NebuLibsAssets/bots/beast breath.animation","/server/assets/NebuLibsAssets/bots/bigbrute.png", },
})
end
