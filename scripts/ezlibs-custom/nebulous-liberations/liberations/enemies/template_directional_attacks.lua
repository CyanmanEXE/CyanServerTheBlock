-- Authoritative directional Liberation overworld attack profiles.
-- These five test bots use approved Prog OW body art until dedicated isometric
-- bot frames are available. Their attacks are directional and species-specific.
-- Keep all corresponding battle mods, encounter IDs, HP and scales unchanged.
local ROOT="/server/assets/ezlibs-custom/nebulous-liberations/bots/"
local PROG=ROOT.."npcs/prog.png"
local PROG_ANIM=ROOT.."npcs/prog.animation"

-- Assets are supplied per mission by preloader.lua from the selected template.
-- No global Preloader.add_asset calls here: missions with unrelated enemies
-- should not download every attack and bot sheet on every entry.

local profiles={
    Quaker={
        -- Real Mettaur 4-dir shockwave; visually traverses 3 panels.
        movement={mode="approach",tiles=2},
        telegraph={shape_type="line",range=3},telegraph_seconds=0.55,effect_hold_seconds=0.68,
        stages={{motion="travel",range=3,effect="quaker_shock",state="SHOCKWAVE",duration=0.14}},
        attack_damage=16,
    },
    Swordy={
        movement={mode="approach",tiles=2},
        telegraph={shape_type="arc"},telegraph_seconds=0.45,effect_hold_seconds=0.22,
        stages={{shape_type="arc",effect="sword_arc",state="SWORD_ARC",duration=0.23}},
        attack_damage=22,
    },
    Piranha={
        movement={mode="reposition",tiles=1},
        telegraph={shape_type="line",range=4},telegraph_seconds=0.5,effect_hold_seconds=0.18,
        stages={{motion="travel",range=4,effect="piranha_arrow",state="PIRANHA_ARROW",duration=0.12},
                {shape_type="line",range=1,offset_y=3,effect="piranha_impact",state="PIRANHA_IMPACT",duration=0.09}},
        attack_damage=14,
    },
    AirMan={
        movement={mode="reposition",tiles=1},
        telegraph={shape_type="cone",range=3},telegraph_seconds=0.6,effect_hold_seconds=0.38,
        stages={{shape_type="line",range=1,effect="wind_burst",state="WIND_BURST",duration=0.12},
                {shape_type="cone",range=2,effect="wind_burst",state="WIND_BURST",duration=0.12},
                {shape_type="cone",range=3,effect="wind_burst",state="WIND_BURST",duration=0.16}},
        attack_damage=15,
    },
    Cannodumb={
        movement={mode="stationary",tiles=0},
        telegraph={shape_type="line",range=4},telegraph_seconds=0.8,effect_hold_seconds=0.55,
        stages={{motion="travel",range=4,effect="cannon_burst",state="CANNON_BURST",duration=0.12}},
        attack_damage=24,
    },
}

return function(EnemyTemplates)
    for name,profile in pairs(profiles) do
        EnemyTemplates.register(name,{
            battle_name=name,default_ow_bot_encounter_name=name,
            health=80,max_health=80,
            texture_path=PROG,animation_path=PROG_ANIM,
            ai_type="patterned_attack",attack_profile=profile,
            attack_damage=profile.attack_damage,
            is_special_encounter=true,
            shape={{1}},shape_offset_y=0,
            preload_assets=(function()
                local paths={PROG,PROG_ANIM}
                local found={}
                for _,stage in ipairs(profile.stages or {}) do
                    local name=stage.effect
                    if type(name)=="string" and name~="" and not found[name] then
                        found[name]=true
                        paths[#paths+1]=ROOT.."attacks/"..name..".png"
                        paths[#paths+1]=ROOT.."attacks/"..name..".animation"
                    end
                end
                return paths
            end)(),
        })
    end
end
