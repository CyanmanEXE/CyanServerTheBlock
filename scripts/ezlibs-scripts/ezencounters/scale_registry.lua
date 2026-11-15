-- Server boot-time EZEncounters battle sprite frame registry.
-- Reads installed character mod ZIPs (and encounter alias tables) exactly once.
-- Does not execute mod code, edit archives, or depend on external ZIP commands.
-- Frame data is attached per battle: enemy._ez_battle_native_frames = {{w,h}, ...}
local Zip = require('scripts/ezlibs-scripts/ezencounters/zip_reader')
local Registry = {}
local ROOT = 'assets/ezlibs-assets/ezencounters'
local catalogs_by_id, aliases_by_battle_zip = {}, {}
local source_by_id, unresolved_aliases = {}, {}
local initialized = false
local report = { archives = 0, character_archives = 0, character_ids = 0,
    mapped = 0, animations = 0, unresolved = 0, bad_zip = 0, alias_entries = 0 }

local function log(...)
    print('[EZSCALEREG][SERVER]', ...)
end
local function lower(s) return string.lower(s or '') end
local function basename(path) return string.match(path or '', '[^/\\]+$') or path end
local function path_join(folder, name)
    if folder == '' then return name end
    return folder .. '/' .. name
end
local function normalized_path(path)
    path = string.gsub(path or '', '\\', '/')
    local result = {}
    for part in string.gmatch(path, '[^/]+') do
        if part == '..' then
            if #result > 0 then result[#result] = nil end
        elseif part ~= '.' then
            result[#result + 1] = part
        end
    end
    return table.concat(result, '/')
end
local function no_ext(s) return string.gsub(s, '%.zip$', '') end
local function trim(s)
    return string.match(s or '', '^%s*(.-)%s*$')
end

local function list_zips(path)
    local result = {}
    local ok, lfs = pcall(require, 'lfs')
    if ok and lfs and lfs.dir then
        local worked, iter, obj = pcall(lfs.dir, path)
        if worked and iter then
            for filename in iter, obj do
                if string.match(lower(filename), '%.zip$') then result[#result + 1] = filename end
            end
            table.sort(result)
            return result
        end
    end
    -- The server's existing hp_manager / test-runner code also uses io.popen.
    -- Use it only to enumerate filenames; ZIP reading itself is pure Lua.
    local windows = package.config and string.sub(package.config, 1, 1) == '\\'
    local command
    if windows then
        command = 'dir /b /a:-d "' .. string.gsub(path, '/', '\\') .. '\\*.zip" 2>NUL'
    else
        command = 'find "' .. path .. '" -maxdepth 1 -type f -name "*.zip" -print 2>/dev/null'
    end
    local opened, process = pcall(io.popen, command, 'r')
    if not opened or not process then
        return nil, 'requires lfs.dir or working io.popen for directory enumeration'
    end
    for name in process:lines() do
        name = trim(name) -- Windows cmd.exe may leave a trailing carriage return.
        if string.match(lower(name), '%.zip$') then result[#result + 1] = basename(name) end
    end
    process:close()
    table.sort(result)
    return result
end

-- Evaluate ONLY simple string expressions: quoted literals, local identifiers,
-- concatenation, and _modpath. Never execute a character mod's entry.lua.
local function evaluate(expr, env)
    if type(expr) ~= 'string' then return nil end
    local i, result, expect_value = 1, {}, true
    while i <= #expr do
        while i <= #expr and string.match(string.sub(expr, i, i), '%s') do i = i + 1 end
        if i > #expr then break end
        if expect_value then
            local initial = string.sub(expr, i, i)
            local part
            if initial == '"' or initial == "'" then
                local j = i + 1
                while j <= #expr do
                    local c = string.sub(expr, j, j)
                    if c == initial and string.sub(expr, j - 1, j - 1) ~= '\\' then break end
                    j = j + 1
                end
                if j > #expr then return nil end
                part = string.sub(expr, i + 1, j - 1)
                i = j + 1
            else
                local a, b, token = string.find(expr, '^([%a_][%w_]*)', i)
                if not a then return nil end
                part, i = env[token], b + 1
                if type(part) ~= 'string' then return nil end
            end
            result[#result + 1] = part
            expect_value = false
        else
            if string.sub(expr, i, i + 1) ~= '..' then return nil end
            i = i + 2
            expect_value = true
        end
    end
    if expect_value or #result == 0 then return nil end
    return table.concat(result)
end

local function parse_character_definitions(text)
    local defs, seen, env = {}, {}, {_modpath = ''}
    for line in string.gmatch(text or '', '[^\r\n]+') do
        line = string.gsub(line, '%-%-.*$', '')
        local key, expr = string.match(line, '^%s*local%s+([%w_]+)%s*=%s*(.-)%s*$')
        if not key then key, expr = string.match(line, '^%s*([%w_]+)%s*=%s*(.-)%s*$') end
        if key and expr then
            local value = evaluate(expr, env)
            if value then env[key] = value end
        end
        local args = string.match(line, 'Engine%.define_character%s*%((.-)%)')
        if args then
            local first, second = string.match(args, '^(.-)%s*,%s*(.-)%s*$')
            local id, folder = evaluate(first, env), evaluate(second, env)
            if id and folder and not seen[id] then
                defs[#defs + 1] = {id = id, folder = normalized_path(folder)}
                seen[id] = true
            end
        end
    end
    return defs
end

local function parse_frame_dimensions(contents)
    local frames, seen = {}, {}
    for line in string.gmatch(contents or '', '[^\r\n]+') do
        if string.match(line, '^%s*frame%s') then
            local w = tonumber(string.match(line, 'w%s*=%s*"([%d%.]+)"'))
                or tonumber(string.match(line, 'w%s*=%s*([%d%.]+)'))
            local h = tonumber(string.match(line, 'h%s*=%s*"([%d%.]+)"'))
                or tonumber(string.match(line, 'h%s*=%s*([%d%.]+)'))
            if w and h and w > 0 and h > 0 and w <= 8192 and h <= 8192 then
                local key = tostring(w) .. ':' .. tostring(h)
                if not seen[key] then
                    frames[#frames + 1] = {w, h}
                    seen[key] = true
                end
            end
        end
    end
    return frames
end

local function choose_animation(archive, character_folder, archive_name)
    local character_entry = archive:read(path_join(character_folder, 'entry.lua'), 512 * 1024) or ''
    local shared_entry = archive:read('shared/entry.lua', 512 * 1024) or ''
    local use_shared = string.find(character_entry, '../shared/', 1, true)
        or string.find(character_entry, 'shared/entry.lua', 1, true)
    local archive_hint = lower(no_ext(basename(archive_name)))
    local scores = {}
    for _, name in ipairs(archive.names) do
        if string.match(lower(name), '%.animation$') then
            local part = lower(basename(name))
            local score = 0
            local under_character = character_folder ~= '' and
                string.sub(name, 1, #character_folder + 1) == character_folder .. '/'
            local in_shared = string.sub(name, 1, 7) == 'shared/'
            if under_character then score = score + 90 end
            if in_shared and use_shared then score = score + 70 end
            if part == 'battle.animation' then score = score + 230 end
            if part == 'virus.animation' then score = score + 150 end
            if part == 'megaman.animation' then score = score + 115 end
            if part == lower(basename(character_folder)) .. '.animation' then score = score + 65 end
            local simple = string.gsub(part, '%.animation$', '')
            if #simple >= 4 and string.find(archive_hint, lower(simple), 1, true) then
                score = score + 65
            end
            if string.find(character_entry, basename(name), 1, true) then score = score + 40 end
            if use_shared and string.find(shared_entry, basename(name), 1, true) then score = score + 40 end
            if string.find(part, 'effect', 1, true) or string.find(part, 'projectile', 1, true)
                or string.find(part, 'teleport', 1, true) or string.find(part, 'impact', 1, true)
                or string.find(part, 'background', 1, true) or part == 'bg.animation'
                or string.find(part, 'guard_hit', 1, true)
                or string.find(part, 'explosion', 1, true)
                or string.find(part, 'pew.', 1, true)
                or string.find(part, 'mob_move', 1, true)
                or string.find(part, 'buster', 1, true) then
                score = score - 150
            end
            if score >= 65 then scores[#scores + 1] = {name = name, score = score} end
        end
    end
    table.sort(scores, function(a,b)
        if a.score == b.score then return a.name < b.name end
        return a.score > b.score
    end)
    if #scores == 0 then return nil, 'no identifiable primary battle animation' end
    if #scores > 1 and scores[1].score - scores[2].score < 15 then
        return nil, 'ambiguous primary battle animation'
    end
    return scores[1].name
end

local function parse_encounter_aliases(archive)
    local contents = archive:read('entry.lua', 2 * 1024 * 1024)
    if not contents then return nil end
    local section = string.match(contents, 'enemy_packages%s*=%s*(%b{})')
    if not section then return nil end
    local mapped = {}
    for alias, quote, package_id in string.gmatch(section,
        '([%a_][%w_]*)%s*=%s*(["\'])(.-)%2') do
        mapped[alias] = package_id
    end
    return mapped
end

function Registry.init(directory)
    if initialized then return report end
    initialized = true
    directory = directory or ROOT
    local filenames, list_err = list_zips(directory)
    if not filenames then
        log('BOOT_SCAN_FAILED', tostring(list_err))
        return report
    end
    for _, filename in ipairs(filenames) do
        report.archives = report.archives + 1
        local archive, err = Zip.open(directory .. '/' .. filename)
        if not archive then
            report.bad_zip = report.bad_zip + 1
            log('ZIP_SKIPPED', filename, tostring(err))
        elseif string.match(lower(filename), '^ezencounters') then
            local aliases = parse_encounter_aliases(archive)
            if aliases then
                aliases_by_battle_zip[lower(filename)] = aliases
                for _ in pairs(aliases) do report.alias_entries = report.alias_entries + 1 end
            end
        else
            local entry = archive:read('entry.lua', 1024 * 1024)
            if entry then
                report.character_archives = report.character_archives + 1
                local definitions = parse_character_definitions(entry)
                for _, def in ipairs(definitions) do
                    report.character_ids = report.character_ids + 1
                    local animation, why = choose_animation(archive, def.folder, filename)
                    if animation then
                        local text, read_err = archive:read(animation, 1024 * 1024)
                        if text then
                            local frames = parse_frame_dimensions(text)
                            if #frames > 0 and #frames <= 256 then
                                if catalogs_by_id[def.id] then
                                    -- Duplicate character package IDs are unsafe. Retain the
                                    -- first known definition and report the collision.
                                    log('DUPLICATE_CHARACTER_ID', def.id, filename)
                                else
                                    catalogs_by_id[def.id] = frames
                                    source_by_id[def.id] = {zip = filename, animation = animation}
                                    report.mapped = report.mapped + 1
                                    report.animations = report.animations + 1
                                end
                            else
                                report.unresolved = report.unresolved + 1
                                log('FRAME_SET_SKIPPED', def.id, filename, tostring(#frames))
                            end
                        else
                            report.unresolved = report.unresolved + 1
                            log('ANIMATION_READ_FAILED', def.id, tostring(read_err))
                        end
                    else
                        report.unresolved = report.unresolved + 1
                        -- Compact startup diagnostic, never claim incompatible
                        -- enemy mods have a verified frame catalog.
                        log('ANIMATION_UNRESOLVED', def.id, filename, why)
                    end
                end
            end
        end
    end
    local unique_aliases, mapped_aliases, missing_aliases = {}, {}, {}
    for _, aliases in pairs(aliases_by_battle_zip) do
        for alias, id in pairs(aliases) do
            unique_aliases[alias .. ':' .. id] = true
            if catalogs_by_id[id] then
                mapped_aliases[alias .. ':' .. id] = true
            else
                missing_aliases[alias .. ':' .. id] = true
            end
        end
    end
    report.unique_aliases, report.resolved_aliases, report.unresolved_aliases = 0, 0, 0
    for _ in pairs(unique_aliases) do report.unique_aliases = report.unique_aliases + 1 end
    for _ in pairs(mapped_aliases) do report.resolved_aliases = report.resolved_aliases + 1 end
    for alias_id in pairs(missing_aliases) do
        report.unresolved_aliases = report.unresolved_aliases + 1
        unresolved_aliases[#unresolved_aliases + 1] = alias_id
    end
    table.sort(unresolved_aliases)
    for _, alias_id in ipairs(unresolved_aliases) do
        log('ALIAS_WITHOUT_CATALOG', alias_id)
    end
    log('ALIAS_COVERAGE', 'resolved', report.resolved_aliases,
        'of', report.unique_aliases, 'unresolved', report.unresolved_aliases)
    log('BOOT_DONE', 'zips', report.archives, 'character_zips', report.character_archives,
        'character_ids', report.character_ids, 'mapped', report.mapped,
        'unresolved', report.unresolved, 'aliases', report.alias_entries,
        'bad_zip', report.bad_zip)
    return report
end

-- Clone only the handful of Lua tables being serialized to the battle client.
-- Never mutate registered encounter definitions, source character archives,
-- the persistent Liberation bot, or the original enemy metadata.
function Registry.enrich(data, battle_zip_path)
    if type(data) ~= 'table' or type(data.enemies) ~= 'table' then return data end
    if not initialized then Registry.init() end
    local filename = lower(basename(battle_zip_path or data.path))
    local alias_map = aliases_by_battle_zip[filename]
    if not alias_map then
        log('ENCOUNTER_ALIASES_MISSING', filename)
        return data
    end
    local copy, enemies = {}, {}
    for key, value in pairs(data) do copy[key] = value end
    local count = 0
    for i, enemy in ipairs(data.enemies) do
        if type(enemy) == 'table' then
            local clone = {}
            for key, value in pairs(enemy) do clone[key] = value end
            local package_id = alias_map[enemy.name]
            local frames = package_id and catalogs_by_id[package_id]
            if frames and tonumber(enemy.scale) and tonumber(enemy.scale) ~= 1 then
                clone._ez_battle_native_frames = frames
                count = count + 1
            end
            enemies[i] = clone
        else
            enemies[i] = enemy
        end
    end
    copy.enemies = enemies
    if count > 0 then
        log('BATTLE_FRAMES_ATTACHED', filename, 'enemies', count)
    end
    return copy
end

function Registry.status()
    return report
end

-- Read-only startup diagnostics for auditing unusual character mods.
function Registry.audit()
    return { sources_by_character_id = source_by_id,
        unresolved_aliases = unresolved_aliases }
end
return Registry
