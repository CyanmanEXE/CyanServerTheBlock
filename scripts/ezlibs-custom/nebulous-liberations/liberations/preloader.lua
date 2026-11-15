-- Mission-local asset provisioning for Nebulous Liberations.
-- Select only bots referenced by placed panels and their Tiled Point Object
-- Bot Configs.  All bot/attack paths come from registered templates; Tiled
-- selects the template by name rather than containing user-supplied paths.
local Constants = require("scripts/ezlibs-custom/nebulous-liberations/liberations/constants")
local EnemyConfig = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_config")
local log = require("scripts/ezlibs-custom/nebulous-liberations/liberations/logger").spawning

local AttackAssets = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ai/attack_assets")
local Preloader = {}
local missing_by_area = {} -- warn once per missing path/mission
local can_verify_local_assets = nil -- nil until server working directory is checked
local cached_animation_states = {} -- file -> { state_name = true }
local function local_asset_root_available()
    if can_verify_local_assets ~= nil then return can_verify_local_assets end
    can_verify_local_assets = false
    if type(io.open) == "function" then
        local ok, file = pcall(io.open,
            "scripts/ezlibs-custom/nebulous-liberations/liberations/preloader.lua", "rb")
        if ok and file then
            file:close()
            can_verify_local_assets = true
        end
    end
    if not can_verify_local_assets then
        print("[NL_ASSET][LOCAL_PATH_CHECK_DISABLED]",
            "Current working directory is not the server root; Net.provide_asset remains authoritative")
    end
    return can_verify_local_assets
end
local shared_assets = {}     -- backwards compatible add_asset(path) registrations
local supplied_by_area = {}  -- area_id -> set of paths; never shared between missions
local supplied_to_player = {} -- area_id -> player_id -> path -> true; late runtime only
local animation_image_cache = {} -- path -> imagePath reference (if readable)

-- A referenced PNG is part of an animation's asset dependencies even if the
-- authored attack template only lists the .animation. Resolve only benign
-- sibling filenames; do not accept paths supplied from arbitrary Tiled text.
local function animation_linked_texture(animation_path)
    if type(animation_path) ~= "string" or not string.match(animation_path, "%.animation$") then
        return nil
    end
    if animation_image_cache[animation_path] ~= nil then
        local value = animation_image_cache[animation_path]
        return value ~= false and value or nil
    end
    animation_image_cache[animation_path] = false
    local relative = string.match(animation_path, "^/server/(assets/.+)$")
    if not relative or not local_asset_root_available() then return nil end
    local file = io.open(relative, "rb")
    if not file then return nil end
    local data = file:read("*a") or ""
    file:close()
    local name = string.match(data, 'imagePath%s*=%s*"([^"]+)"')
    if not name or not string.match(name, "^[%w_ %-]+%.png$") then
        -- Most server animation sheets reference a simple sibling image.
        -- Reject paths with traversal, subdirectories or unusual characters.
        if name then
            print("[NL_ASSET][ANIMATION_IMAGE_UNSUPPORTED]", animation_path, name)
        end
        return nil
    end
    local folder = string.match(animation_path, "^(.*)/[^/]+$")
    local linked = folder and (folder .. "/" .. name) or nil
    if linked then animation_image_cache[animation_path] = linked end
    return linked
end

local function expand_animation_dependencies(paths)
    local extended = {}
    for path, why in pairs(paths or {}) do
        extended[path] = why
        local texture = animation_linked_texture(path)
        if texture and extended[texture] == nil and (paths or {})[texture] == nil then
            extended[texture] = tostring(why) .. ".imagePath"
        end
    end
    return extended
end

-- Client asset messages must be in a deterministic dependency order. In
-- particular, the image referenced by imagePath must arrive before the
-- animation. `pairs` does NOT guarantee this, especially in late effects.
local function ordered_assets(paths)
    local names = {}
    for path in pairs(paths or {}) do
        if type(path) == "string" and path ~= "" then
            names[#names + 1] = path
        end
    end
    table.sort(names, function(a, b)
        local a_animation = string.match(a, "%.animation$") ~= nil
        local b_animation = string.match(b, "%.animation$") ~= nil
        if a_animation ~= b_animation then return not a_animation end
        return a < b
    end)
    return names
end

local function deliver_current_players(area_id, path, owner)
    if type(Net.list_players) ~= "function" or type(Net.provide_asset_for_player) ~= "function" then
        return true
    end
    local success, players = pcall(Net.list_players, area_id)
    if not success or type(players) ~= "table" then return true end
    local by_player = supplied_to_player[tostring(area_id)] or {}
    supplied_to_player[tostring(area_id)] = by_player
    local okay = true
    for _, id in ipairs(players) do
        local player_paths = by_player[tostring(id)] or {}
        by_player[tostring(id)] = player_paths
        if not player_paths[path] then
            local sent, result = pcall(Net.provide_asset_for_player, id, path)
            if sent and result ~= false then
                player_paths[path] = true
            else
                okay = false
                print("[NL_ASSET][PLAYER_PROVISION_FAILED]", "area", tostring(area_id),
                    "player", tostring(id), "owner", tostring(owner),
                    "path", path, "error", not sent and tostring(result) or "returned false")
            end
        end
    end
    return okay
end

local function provide(area_id, path)
    if area_id == nil or type(path) ~= "string" or path == "" then return false end
    local key = tostring(area_id)
    local supplied = supplied_by_area[key]
    if supplied and supplied[path] then return true end
    -- Verify source presence without assuming Net.provide_asset throws for an
    -- absent file (some server builds acknowledge a missing asset path).
    local relative = string.match(path, "^/server/(assets/.+)$")
    if relative and local_asset_root_available() then
        local readable, file = pcall(io.open, relative, "rb")
        if readable and not file then
            missing_by_area[key] = missing_by_area[key] or {}
            if not missing_by_area[key][path] then
                missing_by_area[key][path] = true
                print("[NL_ASSET][MISSING_FILE]", "area", key, "path", path,
                    "server_relative", relative)
            end
            return false
        end
        if readable and file then file:close() end
    end
    -- The asset registry is authoritative. The local PNG may exist on disk
    -- but not be registered yet (e.g., files copied without a server restart).
    if type(Net.has_asset) == "function" then
        local checked, registered = pcall(Net.has_asset, path)
        if checked and registered == false then
            print("[NL_ASSET][NOT_REGISTERED]", "area", key, "path", path,
                "hint", "Restart the server after copying assets")
            return false
        end
    end
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

-- Stage assets are often specified in attack_profile.stages rather than
-- template.attack_texture. Inspect the full authored profile at mission boot.
local function collect_template_paths(template, name, needs_simple_charge)
    return AttackAssets.collect_template(template, name, needs_simple_charge)
end

-- Shared with legacy and reusable attack runners: every dynamic attack sprite
-- is provisioned to its own mission area before an effect bot is spawned.
function Preloader.ensure_paths(area_id, paths, owner)
    local success, count = true, 0
    local expanded = expand_animation_dependencies(paths)
    for _, path in ipairs(ordered_assets(expanded)) do
        local origin = expanded[path]
        count = count + 1
        if not provide(area_id, path) then
            success = false
            print("[NL_ASSET][PROVISION_FAILED]", "area", tostring(area_id),
                "bot", tostring(owner), "origin", tostring(origin),
                "path", tostring(path))
        elseif not deliver_current_players(area_id, path, owner) then
            success = false
        end
    end
    return success, count
end

function Preloader.provide_template(area_id, template, name)
    local paths = collect_template_paths(template, name or "template")
    return Preloader.ensure_paths(area_id, paths, name)
end

function Preloader.provide_profile(area_id, profile, name)
    local paths = AttackAssets.collect_profile(profile, name or "runtime_profile")
    return Preloader.ensure_paths(area_id, paths, name)
end

-- Asset delivery success does not guarantee that an .animation file defines
-- the requested state. Validate actual state names against the installed file
-- when the Lua process runs from the server root; otherwise let Net decide.
function Preloader.validate_animation_state(area_id, animation_path, state, owner)
    if type(animation_path) ~= "string" or type(state) ~= "string" or state == "" then
        return false
    end
    if not local_asset_root_available() then return true end
    local names = cached_animation_states[animation_path]
    if not names then
        local relative = string.match(animation_path, "^/server/(assets/.+)$")
        if not relative then return true end
        local f = io.open(relative, "rb")
        if not f then
            print("[NL_ASSET][ANIMATION_FILE_MISSING]", "area", tostring(area_id),
                "bot", tostring(owner), "path", animation_path)
            return false
        end
        local text = f:read("*a") or ""
        f:close()
        names = {}
        for found in string.gmatch(text, 'animation%s+state%s*=%s*"([^"]+)"') do
            names[found] = true
        end
        cached_animation_states[animation_path] = names
    end
    if names[state] then return true end
    print("[NL_ASSET][ANIMATION_STATE_MISSING]", "area", tostring(area_id),
        "bot", tostring(owner), "path", animation_path, "state", state)
    return false
end

local function validate_template_states(area_id, template, name)
    local ok = true
    local suffixes = {"UL", "UR", "DL", "DR"}
    for i, stage in ipairs((template.attack_profile or {}).stages or {}) do
        local effect = stage.effect or (template.attack_profile and template.attack_profile.effect)
        local _, animation = AttackAssets.effect_paths(effect)
        if animation then
            local base = stage.state or string.upper(effect)
            for _, suffix in ipairs(suffixes) do
                if not Preloader.validate_animation_state(area_id, animation,
                    base .. "_" .. suffix, name .. ".stage" .. i) then ok = false end
            end
        end
    end
    if template.attack_animation_path and template.attack_effect_animation then
        if not Preloader.validate_animation_state(area_id, template.attack_animation_path,
            template.attack_effect_animation, name .. ".attack") then ok = false end
    end
    if template.ai_type == "shockwave_line" and template.attack_animation_path then
        for _, suffix in ipairs(suffixes) do
            if not Preloader.validate_animation_state(area_id, template.attack_animation_path,
                "SHOCKWAVE_" .. suffix, name .. ".shockwave") then ok = false end
        end
    end
    return ok
end

function Preloader.update(area_id, registry)
    local attempted, failed = 0, 0
    local attempted_paths = {}
    local function send(path, owner, source)
        if attempted_paths[path] then return end
        -- Ensure imagePath PNG is supplied first, then the animation file.
        local linked = animation_linked_texture(path)
        if linked and linked ~= path and not attempted_paths[linked] then
            attempted_paths[linked] = true
            attempted = attempted + 1
            if not provide(area_id, linked) then
                failed = failed + 1
                print("[NL_ASSET][ANIMATION_IMAGE_NOT_PROVIDED]", "area", tostring(area_id),
                    "bot", tostring(owner), "animation", path, "image", linked)
            end
        end
        attempted_paths[path] = true
        attempted = attempted + 1
        if not provide(area_id, path) then
            failed = failed + 1
            print("[NL_ASSET][BOOT_PROVISION_FAILED]", "area", tostring(area_id),
                "bot", tostring(owner), "source", tostring(source),
                "path", tostring(path))
        end
    end

    -- Collect all dependencies first, then supply PNGs and other payloads
    -- before ANY .animation file, even when local imagePath inspection is
    -- unavailable. This is crucial for effect bots created after join.
    local requests = {}
    local function queue(path, owner, source)
        if type(path) == "string" and path ~= "" and not requests[path] then
            requests[path] = { owner = owner, source = source }
        end
    end
    for _, path in ipairs(Constants.PreloadAssets) do queue(path, "mission", "constants") end
    for path in pairs(shared_assets) do queue(path, "shared", "registered") end

    local names = collect_names(area_id, registry)
    local template_count = 0
    for name, options in pairs(names) do
        template_count = template_count + 1
        local template = registry[name]
        for path, origin in pairs(collect_template_paths(template, name, options.simple_charge)) do
            queue(path, name, origin)
        end
    end
    for _, path in ipairs(ordered_assets(requests)) do
        local item = requests[path]
        send(path, item.owner, item.source)
    end
    for name in pairs(names) do
        if not validate_template_states(area_id, registry[name], name) then
            failed = failed + 1
        end
    end
    log:info_data("Liberation mission-local bot and attack assets provisioned", {
        area_id = area_id, registered_templates = template_count,
        asset_requests = attempted, failed_requests = failed,
        asset_root = "/server/assets/ezlibs-custom/nebulous-liberations/bots/",
        stage_effects_included = true,
    })
    return failed == 0, template_count, failed
end

function Preloader.clear(area_id)
    if area_id ~= nil then
        supplied_by_area[tostring(area_id)] = nil
        missing_by_area[tostring(area_id)] = nil
        supplied_to_player[tostring(area_id)] = nil
    end
end

return Preloader
