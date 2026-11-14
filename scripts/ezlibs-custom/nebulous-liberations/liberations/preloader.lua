-- Mission-local asset provisioning for Nebulous Liberations.
-- Select only bots referenced by placed panels and their Tiled Point Object
-- Bot Configs.  All bot/attack paths come from registered templates; Tiled
-- selects the template by name rather than containing user-supplied paths.
local Constants = require("scripts/ezlibs-custom/nebulous-liberations/liberations/constants")
local EnemyConfig = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_config")
local log = require("scripts/ezlibs-custom/nebulous-liberations/liberations/logger").spawning

local Preloader = {}
local shared_assets = {}     -- backwards compatible add_asset(path) registrations
local supplied_by_area = {}  -- area_id -> set of paths; never shared between missions

local function provide(area_id, path)
    if area_id == nil or type(path) ~= "string" or path == "" then return false end
    local key = tostring(area_id)
    local supplied = supplied_by_area[key]
    if supplied and supplied[path] then return true end
    local ok, result = pcall(Net.provide_asset, area_id, path)
    if not ok or result == false then
        log:warn_data("Liberation asset provision failed", {
            area_id = area_id, asset_path = path,
            error = not ok and tostring(result) or "Net.provide_asset returned false",
        })
        return false
    end
    supplied = supplied or {}
    supplied_by_area[key] = supplied
    supplied[path] = true
    return true
end

-- A no-area registration remains available for legacy callers. A mission
-- registration supplies directly to that area, without polluting other areas.
function Preloader.add_asset(asset_path, area_id)
    if area_id ~= nil then
        return provide(area_id, asset_path)
    end
    if type(asset_path) ~= "string" or asset_path == "" then return false end
    shared_assets[asset_path] = true
    return true
end

local function collect_names(area_id, registry)
    local selected = {}
    local ok, object_ids = pcall(Net.list_objects, area_id)
    if not ok or type(object_ids) ~= "table" then
        log:warn_data("Liberation asset scan could not list Tiled objects", {
            area_id = area_id, error = tostring(object_ids),
        })
        return selected
    end
    for _, object_id in ipairs(object_ids) do
        local found, obj = pcall(Net.get_object_by_id, area_id, object_id)
        if found and type(obj) == "table" then
            local kind = obj.type
            if kind == "Dark Hole" or kind == "Dark Hole Buffed Virus"
                or kind == "Boss Dark Panel" then
                local is_boss = kind == "Boss Dark Panel"
                local category = is_boss and "Boss" or "Dark Hole"
                local legacy_health = is_boss and "Boss Health Override"
                    or "Minion Health Override"
                local cfg = EnemyConfig.resolve(area_id, obj, legacy_health, category)
                local props = obj.custom_properties or {}
                local inline_boss = is_boss and props.Boss or nil
                local name = (inline_boss ~= nil and inline_boss ~= "" and inline_boss)
                    or cfg.template_name or props.Spawns
                if type(name) == "string" and name ~= "" then
                    if registry and registry.has and registry.has(name) then
                        selected[name] = selected[name] or { simple_charge = false }
                        if cfg.ai_type == "simple_charge" then
                            selected[name].simple_charge = true
                        end
                    else
                        log:warn_data("Liberation bot asset template is not registered", {
                            area_id = area_id, object_id = obj.id,
                            panel_type = kind, template_name = tostring(name),
                        })
                    end
                end
            end
        end
    end
    return selected
end

local function collect_template_paths(template, needs_simple_charge)
    local assets = {}
    local function add(path)
        if type(path) == "string" and path ~= "" then assets[path] = true end
    end
    -- Even templates with no preload_assets must supply their bot sheet.
    add(template.texture_path)
    add(template.animation_path)
    add(template.attack_texture)
    add(template.attack_animation_path)
    if type(template.mug) == "table" then
        add(template.mug.texture_path)
        add(template.mug.animation_path)
    end
    for _, path in ipairs(template.preload_assets or {}) do add(path) end

    -- The existing simple_charge AI creates these attack bots when a template
    -- does not specify its own effect; match its real fallback paths exactly.
    if needs_simple_charge or template.ai_type == "simple_charge" then
        if not template.attack_texture then
            add("/server/assets/ezlibs-custom/nebulous-liberations/bots/attacks/beast breath.png")
        end
        if not template.attack_animation_path then
            add("/server/assets/ezlibs-custom/nebulous-liberations/bots/attacks/beast breath.animation")
        end
    end
    return assets
end

function Preloader.update(area_id, registry)
    local attempted, failed = 0, 0
    local function send(path)
        attempted = attempted + 1
        if not provide(area_id, path) then failed = failed + 1 end
    end

    -- Existing mission UI, effects and sound assets retain their provisioning.
    for _, path in ipairs(Constants.PreloadAssets) do send(path) end
    for path in pairs(shared_assets) do send(path) end

    local names = collect_names(area_id, registry)
    local template_count = 0
    for name, options in pairs(names) do
        template_count = template_count + 1
        local template = registry[name]
        for path in pairs(collect_template_paths(template, options.simple_charge)) do send(path) end
    end
    log:info_data("Liberation mission-local bot and attack assets provisioned", {
        area_id = area_id, registered_templates = template_count,
        asset_requests = attempted, failed_requests = failed,
        asset_root = "/server/assets/ezlibs-custom/nebulous-liberations/bots/",
    })
    return failed == 0, template_count, failed
end

function Preloader.clear(area_id)
    if area_id ~= nil then supplied_by_area[tostring(area_id)] = nil end
end

return Preloader
