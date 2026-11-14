-- Optional numbered custom properties. Only 1..9 are supported by new
-- Liberation configuration objects. Legacy Dark Hole Encounter Lists may
-- retain larger lists until a map author explicitly migrates them.
local Numbered = {}

function Numbered.collect(properties, prefix, maximum)
    local entries = {}
    local excess = {}
    local seen = {}
    maximum = maximum or 9
    for key, value in pairs(properties or {}) do
        local number = type(key) == "string" and key:match("^" .. prefix .. " (%d+)$")
        if number then
            local index = tonumber(number)
            if index and index >= 1 and index % 1 == 0 then
                if index <= maximum then
                    if not seen[index] then
                        entries[#entries + 1] = {index = index, value = value}
                        seen[index] = true
                    end
                else
                    excess[#excess + 1] = index
                end
            end
        end
    end
    table.sort(entries, function(a, b) return a.index < b.index end)
    table.sort(excess)
    return entries, excess
end

function Numbered.boss_ids(properties)
    local ids, seen = {}, {}
    for _, entry in ipairs(Numbered.collect(properties, "Boss ID", 9)) do
        local value = entry.value and tostring(entry.value):match("^%s*(.-)%s*$")
        if value and value ~= "" and value ~= "0" and not seen[value] then
            ids[#ids + 1] = value
            seen[value] = true
        end
    end
    return ids
end

function Numbered.names(properties, legacy)
    local max_count = legacy and math.huge or 9
    local numbered, excess = Numbered.collect(properties, "Name", max_count)
    local entries = {}
    for _, item in ipairs(numbered) do
        local name = item.value and tostring(item.value):match("^%s*(.-)%s*$") or ""
        if name ~= "" then
            local raw_weight = (properties or {})["Weight " .. item.index]
            local weight = raw_weight == nil and 1 or tonumber(raw_weight)
            entries[#entries + 1] = {index = item.index, name = name, weight = weight}
        end
    end
    return entries, excess
end

return Numbered
