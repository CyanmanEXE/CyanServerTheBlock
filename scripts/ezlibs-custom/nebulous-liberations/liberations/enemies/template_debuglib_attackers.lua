-- Five DEBUGLIB enemy overworld profiles using the existing Prog sprite.
-- To add a new profile: copy a configuration block and select a supported
-- shape, movement rule and effect. All HP and battle scales still come from Tiled.
local ROOT = "/server/assets/ezlibs-custom/nebulous-liberations/bots/"
local PROG_TEXTURE = ROOT .. "npcs/prog.png"
local PROG_ANIMATION = ROOT .. "npcs/prog.animation"
local EFFECT_ROOT = ROOT .. "attacks/ai/"

local profiles = {
    Quaker = {
        -- Ground-shock cross centered two tiles ahead.
        shape = { {0,1,0}, {1,1,1}, {0,1,0} },
        shape_offset_y = 0, move_tiles = 1, move_policy = "approach",
        attack_damage = 16, telegraph_seconds = 0.70,
        effect = "quaker_shock",
    },
    Swordy = {
        -- Short-range sword arc across the three front panels.
        shape = { {1,1,1} },
        shape_offset_y = 0, move_tiles = 2, move_policy = "approach",
        attack_damage = 22, telegraph_seconds = 0.50,
        effect = "sword_arc",
    },
    Piranha = {
        -- Straight water jet; skirmishes to find a clear line.
        shape = { {1}, {1}, {1} },
        shape_offset_y = 0, move_tiles = 1, move_policy = "reposition",
        attack_damage = 14, telegraph_seconds = 0.60,
        effect = "water_jet",
    },
    AirMan = {
        -- Broad wind fan over three forward rows.
        shape = { {0,1,0}, {1,1,1}, {1,1,1} },
        shape_offset_y = 0, move_tiles = 1, move_policy = "reposition",
        attack_damage = 15, telegraph_seconds = 0.75,
        effect = "wind_burst",
    },
    Cannodumb = {
        -- Stationary artillery shot, four panels in one line.
        shape = { {1}, {1}, {1}, {1} },
        shape_offset_y = 0, move_tiles = 0, move_policy = "stationary",
        attack_damage = 24, telegraph_seconds = 0.90,
        effect = "cannon_burst",
    },
}

return function(EnemyTemplates)
    for name, spec in pairs(profiles) do
        local tex = EFFECT_ROOT .. spec.effect .. ".png"
        local anim = EFFECT_ROOT .. spec.effect .. ".animation"
        EnemyTemplates.register(name, {
            battle_name = name,
            -- Only DEBUGLIB uses this Prog placeholder. Distinct template
            -- names preserve battle enemy aliases for persistent HP tracking.
            health = 80, max_health = 80,
            texture_path = PROG_TEXTURE,
            animation_path = PROG_ANIMATION,
            shape = spec.shape,
            shape_offset_x = 0,
            shape_offset_y = spec.shape_offset_y,
            attack_damage = spec.attack_damage,
            has_attack_animation = false, -- Prog only defines WALK/IDLE
            ai_type = "patterned_attack",
            attack_profile = {
                move_tiles = spec.move_tiles,
                move_policy = spec.move_policy,
                telegraph_seconds = spec.telegraph_seconds,
                impact_seconds = 0.45,
                animation_style = "walk", -- temporary Prog wind-up
            },
            attack_texture = tex,
            attack_animation_path = anim,
            attack_effect_animation = "IMPACT",
            is_special_encounter = true,
            preload_assets = { PROG_TEXTURE, PROG_ANIMATION, tex, anim },
        })
    end
end
