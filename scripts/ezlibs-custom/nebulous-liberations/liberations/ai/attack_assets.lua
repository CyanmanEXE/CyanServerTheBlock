-- All OW attack dependencies are derived from the same profile that spawns
-- the effects. This module deliberately has no dependency on Preloader,
-- EnemyTemplates, or the combat engine, so it can be used during map preflight.
local Assets = {}
Assets.ATTACK_ROOT = "/server/assets/ezlibs-custom/nebulous-liberations/bots/attacks/"

local function add(result, path, source)
    if type(path) == "string" and path ~= "" then
        result[path] = result[path] or source
    end
end

-- Existing profiles use effect basenames such as 'quaker_shock'. A future
-- profile can also use an absolute /server/... basename. Never let a Tiled
-- value become an arbitrary asset path: only authored templates supply names.
function Assets.effect_paths(effect)
    if type(effect) ~= "string" or effect == "" then return nil, nil end
    local base = effect
    if not string.find(base, "/", 1, true) then
        base = Assets.ATTACK_ROOT .. base
    elseif string.sub(base, 1, 8) ~= "/server/" then
        return nil, nil
    end
    base = string.gsub(base, "%.animation$", "")
    base = string.gsub(base, "%.png$", "")
    if string.find(base, "..", 1, true) then return nil, nil end
    return base .. ".png", base .. ".animation"
end

local function collect_effect(result, effect, source)
    local texture, animation = Assets.effect_paths(effect)
    add(result, texture, source)
    add(result, animation, source)
end

local function collect_stage(result, stage, origin)
    if type(stage) ~= "table" then return end
    collect_effect(result, stage.effect, origin)
    add(result, stage.effect_texture, origin)
    add(result, stage.effect_animation_path, origin)
    -- Optional next-generation profiles can use distinct art for startup,
    -- travel, impact and recovery without a separate custom AI function.
    collect_effect(result, stage.projectile_effect, origin)
    collect_effect(result, stage.impact_effect, origin)
    collect_effect(result, stage.windup_effect, origin)
    collect_effect(result, stage.recovery_effect, origin)
    for _, name in ipairs(stage.effects or {}) do collect_effect(result, name, origin) end
end

function Assets.collect_profile(profile, source)
    local paths = {}
    if type(profile) ~= "table" then return paths end
    source = source or "profile"
    collect_stage(paths, profile, source)
    collect_stage(paths, profile.telegraph, source .. ".telegraph")
    collect_stage(paths, profile.windup, source .. ".windup")
    collect_stage(paths, profile.impact, source .. ".impact")
    collect_stage(paths, profile.recovery, source .. ".recovery")
    for i, stage in ipairs(profile.stages or {}) do
        collect_stage(paths, stage, source .. ".stages[" .. tostring(i) .. "]")
    end
    return paths
end

function Assets.collect_template(template, source, force_simple_charge)
    local paths = {}
    if type(template) ~= "table" then return paths end
    source = source or "template"
    add(paths, template.texture_path, source .. ".bot")
    add(paths, template.animation_path, source .. ".bot")
    add(paths, template.attack_texture, source .. ".attack")
    add(paths, template.attack_animation_path, source .. ".attack")
    if type(template.mug) == "table" then
        add(paths, template.mug.texture_path, source .. ".mug")
        add(paths, template.mug.animation_path, source .. ".mug")
    end
    for _, path in ipairs(template.preload_assets or {}) do
        add(paths, path, source .. ".preload_assets")
    end
    for path, why in pairs(Assets.collect_profile(template.attack_profile, source .. ".attack_profile")) do
        add(paths, path, why)
    end
    -- The original simple_charge fallback uses Beast Breath when the
    -- template does not declare explicit attack assets. Keep it provisioned.
    if force_simple_charge or template.ai_type == "simple_charge" then
        if not template.attack_texture then
            add(paths, Assets.ATTACK_ROOT .. "beast breath.png", source .. ".simple_charge")
        end
        if not template.attack_animation_path then
            add(paths, Assets.ATTACK_ROOT .. "beast breath.animation", source .. ".simple_charge")
        end
    end
    return paths
end

return Assets
