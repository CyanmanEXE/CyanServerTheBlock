-- FootBomb area identity and transfer diagnostics.
--
-- A source/lobby area is recognized from the actual Tiled referee object,
-- not from a literal area ID, a map-name prefix, or the instance-template name.
-- Instances are recognized from EzMapInstance metadata.game == "footbomb".
--
-- This module tracks referee objects when object_registry.load_all() runs:
-- object_registry caches/removes handled objects, so a later Net.list_objects()
-- in player_transfer cannot reliably rediscover the authored referee.
--
-- No Net listeners are registered here. The FootBomb plugin forwards
-- player_join/player_transfer/player_disconnect through this observer.
local AreaObserver = {}
AreaObserver.__index = AreaObserver

local function string_value(value, default)
    if value == nil or value == "" then return default end
    return tostring(value)
end

local function source_summary(sources)
    if type(sources) ~= "table" then return "none", 0, "none" end
    local ids, templates, count = {}, {}, 0
    for id, record in pairs(sources) do
        count = count + 1
        ids[#ids + 1] = tostring(id) .. ":" .. tostring(record.object_type)
        templates[#templates + 1] = tostring(record.instance_map)
    end
    table.sort(ids)
    table.sort(templates)
    return table.concat(ids, ","), count, table.concat(templates, ",")
end

function AreaObserver.new(options)
    options = options or {}
    return setmetatable({
        log = type(options.log) == "function" and options.log or function() end,
        instances = options.instances,
        default_instance_map = string_value(options.default_instance_map, nil),
        source_areas = {},
        player_locations = {},
    }, AreaObserver)
end

function AreaObserver:register_source(area_id, object)
    if type(area_id) ~= "string" or area_id == "" or type(object) ~= "table" then
        self.log("AREA_DISCOVERY: invalid referee registration area=" .. tostring(area_id))
        return false
    end
    local id = tostring(object.id)
    local sources = self.source_areas[area_id]
    if not sources then
        sources = {}
        self.source_areas[area_id] = sources
    end
    if sources[id] then return true end
    local props = object.custom_properties or {}
    local template = string_value(props["Instance Map"], self.default_instance_map)
    sources[id] = { object_type = object.type, instance_map = template }
    if not template then
        self.log("AREA_DISCOVERY: WARNING source area=" .. tostring(area_id)
            .. " referee_id=" .. id
            .. " has no Instance Map and no configured default template")
    end
    local identity = object.type == "FootBomb Ref" and "legacy" or "canonical"
    self.log("AREA_DISCOVERY: source registered area=" .. tostring(area_id)
        .. " referee_id=" .. id
        .. " referee_type=" .. tostring(object.type)
        .. " identity=" .. identity
        .. " instance_template=" .. tostring(template))

    -- One-time useful validation at startup; never use this to classify areas.
    if template and Net and type(Net.list_areas) == "function" then
        local ok, listed = pcall(Net.list_areas)
        if ok and type(listed) == "table" then
            local found = false
            for _, candidate in ipairs(listed) do
                if candidate == template then found = true; break end
            end
            if not found then
                self.log("AREA_DISCOVERY: WARNING referee area=" .. tostring(area_id)
                    .. " object_id=" .. id .. " Instance Map=" .. template
                    .. " is not currently listed by Net.list_areas()")
            end
        end
    end
    return true
end

function AreaObserver:describe(area_id)
    local summary = {
        area_id = area_id,
        role = nil,
        instance_id = nil,
        template_area = nil,
        source_referees = "none",
        source_referee_count = 0,
        source_templates = "none",
    }
    if type(area_id) ~= "string" or area_id == "" then return summary end
    local record
    if self.instances and type(self.instances.get) == "function" then
        record = self.instances.get(area_id)
    end
    if record and record.metadata and record.metadata.game == "footbomb" then
        summary.role = "instance"
        summary.instance_id = record.id
        summary.template_area = record.base_area_id
    elseif self.source_areas[area_id] then
        summary.role = "source"
    end
    local info,count,templates = source_summary(self.source_areas[area_id])
    summary.source_referees = info
    summary.source_referee_count = count
    summary.source_templates = templates
    return summary
end

function AreaObserver:role(area_id)
    return self:describe(area_id).role
end

function AreaObserver:observe_player(event_name, player_id, area_id)
    local current = self:describe(area_id)
    local previous = self.player_locations[player_id]
    local owned_instance
    if self.instances and type(self.instances.get_for_player) == "function" then
        owned_instance = self.instances.get_for_player(player_id)
    end
    -- Avoid spamming unrelated transfers, but log leaving a FootBomb area even
    -- when the destination is not part of FootBomb.
    if current.role or (previous and previous.role)
        or (owned_instance and owned_instance.metadata
            and owned_instance.metadata.game == "footbomb") then
        self.log("AREA_OBSERVER: event=" .. tostring(event_name)
            .. " player=" .. tostring(player_id)
            .. " area=" .. tostring(area_id)
            .. " role=" .. tostring(current.role or "other")
            .. " previous_area=" .. tostring(previous and previous.area_id or "unknown")
            .. " previous_role=" .. tostring(previous and previous.role or "unknown")
            .. " source_referees=" .. current.source_referees
            .. " source_templates=" .. current.source_templates
            .. " instance_id=" .. tostring(current.instance_id or "none")
            .. " template_area=" .. tostring(current.template_area or "none")
            .. " tracked_instance=" .. tostring(owned_instance and owned_instance.id or "none"))
    end
    self.player_locations[player_id] = current
    return current.role
end

function AreaObserver:forget_player(player_id)
    self.player_locations[player_id] = nil
end

return AreaObserver
