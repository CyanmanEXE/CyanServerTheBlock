-- New DEBUGLIB enemies with distinct OW AI policies.
-- Battle alias names stay identical to encounter data.enemies[].name.
-- Prog is only the body placeholder until native OW art is approved.
local ROOT='/server/assets/ezlibs-custom/nebulous-liberations/bots/'
local PROG=ROOT..'npcs/prog.png'
local PROG_ANIM=ROOT..'npcs/prog.animation'
local PROFILES={
    Yurarion={
        movement={mode='reposition',tiles=2},
        telegraph={shape_type='line',range=3},telegraph_seconds=0.42,
        stages={{motion='travel',range=3,effect='thunder_ow',state='THUNDER',duration=0.35}},
        effect_hold_seconds=0.2,attack_damage=17,
    },
    Yurayura={
        movement={mode='reposition',tiles=2},
        telegraph={shape_type='cone',range=2},telegraph_seconds=0.45,
        stages={{shape_type='line',range=2,effect='wind_burst',state='WIND_BURST',duration=0.19},
                {shape_type='cone',range=2,effect='wind_burst',state='WIND_BURST',duration=0.27}},
        effect_hold_seconds=0.22,attack_damage=13,
    },
    KillWeed={
        movement={mode='stationary',tiles=0},
        telegraph={shape_type='line',range=2},telegraph_seconds=0.55,
        stages={{shape_type='line',range=2,effect='killweed_tower',state='WOOD_TOWER',duration=0.45}},
        effect_hold_seconds=0.26,attack_damage=14,
    },
    KillFlower={
        movement={mode='approach',tiles=1},
        telegraph={shape_type='arc',range=2},telegraph_seconds=0.57,
        stages={{shape_type='arc',range=2,effect='wideshot-effect',state='WIDESHOT',duration=0.31}},
        effect_hold_seconds=0.20,attack_damage=16,
    },
}
return function(EnemyTemplates)
    for name, profile in pairs(PROFILES) do
        local assets={PROG,PROG_ANIM}
        for _,stage in ipairs(profile.stages or {}) do
            local base=ROOT..'attacks/'..stage.effect
            assets[#assets+1]=base..'.png'
            assets[#assets+1]=base..'.animation'
        end
        EnemyTemplates.register(name,{
            battle_name=name,default_ow_bot_encounter_name='AutoScale_'..name,
            health=80,max_health=80,
            texture_path=PROG,animation_path=PROG_ANIM,
            ai_type='patterned_attack',attack_profile=profile,
            attack_damage=profile.attack_damage,
            is_special_encounter=true,shape={{1}},shape_offset_y=0,
            preload_assets=assets,
        })
    end
end
