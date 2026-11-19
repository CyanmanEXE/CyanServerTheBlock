-- Roll: source-pixel OW hover/whip animation plus original heart item.
local ROOT='/server/assets/ezlibs-custom/nebulous-liberations/bots/'
return function(EnemyTemplates)
    EnemyTemplates.register('Roll',{
        battle_name='Roll',default_ow_bot_encounter_name='Roll',
        health=80,max_health=80,
        texture_path=ROOT..'npcs/roll_ow.png',
        animation_path=ROOT..'npcs/roll_ow.animation',
        ai_type='roll_heart_whip',attack_damage=18,
        shape={{1}},shape_offset_x=0,shape_offset_y=0,
        is_special_encounter=true,has_attack_animation=true,
        preload_assets={
            ROOT..'npcs/roll_ow.png',ROOT..'npcs/roll_ow.animation',
            ROOT..'attacks/roll_whip.png',ROOT..'attacks/roll_whip.animation',
            ROOT..'item.png',ROOT..'item.animation',
            ROOT..'effects/recover.png',ROOT..'effects/recover.animation',
        },
    })
end
