local ezcache = {}
ezcache.cache = {}
ezcache.cacheable_types = {}   -- dynamic set of types to cache

-- Add a type to the cacheable set
function ezcache.add_cacheable_type(type_name)
    ezcache.cacheable_types[type_name] = true
end

-- Tiled exposes object classification as type, class, or both, depending on
-- the map/runtime. A match in either field is intentional; a Lua object may
-- have type = "NPC" and class = "Waypoint" (or the reverse).
local function matches_object_type(object, expected)
    return type(expected) == "string"
        and (object.type == expected or object.class == expected)
end

-- With allowed_types omitted, check whether either classification is
-- registered as cacheable. With a string or array of strings, perform a
-- direct classification check independent of cache registration.
-- This does not make arbitrary NPC route anchors into Waypoints: an NPC
-- still needs its own cache registration, as it did before.
function ezcache.object_is_of_type(object, allowed_types)
    if not object then return false end

    if allowed_types == nil then
        return (type(object.type) == "string"
                and ezcache.cacheable_types[object.type] == true)
            or (type(object.class) == "string"
                and ezcache.cacheable_types[object.class] == true)
    end

    if type(allowed_types) == "string" then
        return matches_object_type(object, allowed_types)
    end
    if type(allowed_types) == "table" then
        for _, expected in ipairs(allowed_types) do
            if matches_object_type(object, expected) then return true end
        end
    end
    return false
end

-- Store a pre‑fetched object in the cache and remove it from Net
function ezcache.cache_object(area_id, object)
    if not object then return nil end
    area_id = tostring(area_id)
    local object_key = tostring(object.id)
    if not ezcache.cache[area_id] then
        ezcache.cache[area_id] = {}
    end
    -- If already cached, return the cached copy
    if ezcache.cache[area_id][object_key] then
        return ezcache.cache[area_id][object_key]
    end
    -- Store and remove from Net.
    -- The cache key is a string, but Net.remove_object may expect the
    -- original numeric id, so pass the raw object.id through unchanged.
    ezcache.cache[area_id][object_key] = object
    Net.remove_object(area_id, object.id)
    return object
end

-- Get an object by ID, using cache and fetching if necessary
function ezcache.get_object_by_id_cached(area_id, object_id)
    area_id = tostring(area_id)
    -- Use a string key for the cache table so lookups are consistent
    local cache_key = tostring(object_id)

    if not ezcache.cache[area_id] then
        ezcache.cache[area_id] = {}
    end

    if ezcache.cache[area_id][cache_key] then
        return ezcache.cache[area_id][cache_key]
    else
        -- Pass the id through in its original (likely numeric) form for the
        -- Net lookup. Only the cache table key needs to be a string.
        local net_id = tonumber(object_id) or object_id
        local object = Net.get_object_by_id(area_id, net_id)
        if object and ezcache.object_is_of_type(object) then
            return ezcache.cache_object(area_id, object)
        end
        return object   -- uncached type, return as‑is
    end
end

return ezcache