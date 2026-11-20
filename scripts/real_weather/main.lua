--[[
  Real Weather - Open Net Battle

  Weather states and particle-powered screen particles.
  Independent from Real Daytime, HP Manager, and external particle scripts.

  Map custom properties (names and string values are case-insensitive):
    Weather_mode       = sync | off | auto | cus
    Weather_latitude   = decimal latitude  (-90 to 90; sync only)
    Weather_longitude  = decimal longitude (-180 to 180; sync only)
    Weather_condition  = clear | clouds | fog | rain | snow |
                         snow_grains | hail | thunderstorm
    Weather_intensity  = low | medium | high

  Modes:
    sync - Read current conditions from Open-Meteo and publish weather values.
    cus  - Read Weather_condition and Weather_intensity without any API calls.
    off  - Clear weather properties and stop weather effects without API requests.
    auto - Reserved for a configurable internal weather generator.

  Weather_condition / Weather_intensity are written by sync, read by cus.
]]

--[[
* ---------------------------------------------------------- *
             real_weather v0.1 by Darkware

  dependency: json.lua by rxi
  license: MIT
  source: https://github.com/rxi/json.lua

  github link:
* ---------------------------------------------------------- *
]]

-- Share the same instance if the loader uses different require/dofile paths.
local initialized = rawget(_G, "__real_weather_initialized")
if initialized then return initialized end

local json = require("scripts/libs/json")
local RealWeather = {}

-- ============================================
-- SETTINGS
-- ============================================

local API_URL = "https://api.open-meteo.com/v1/forecast"
local FETCH_INTERVAL = 600    -- 10 minutes between successful fetches.
local RETRY_INTERVAL = 120    -- 2 minutes after a failed request.
local REQUEST_TIMEOUT = 90    -- Ignore responses from stalled requests.
local FORCE_COOLDOWN = 30     -- Even forced refreshes are rate-limited.
local AREA_SCAN_INTERVAL = 30 -- Notice map property changes periodically.


--[[ AUTO MODE PRESETS
 Uses the server operating system's local time.
 Chances are relative weights; they do not need to sum to 100.]]

RealWeather.auto_config = {
  auto_preset1 = {  --like you see is possible has more then one preset (only use lowercase)
    forecast = 7, --number of climates selected in advance and size of the climate queue
    times = { "00:00" },  -- times for resort the weather
    conditions = {  --weathers whitelist for this preset (name, chance in % and intensitie)
      { name = "clear", chance = 50 },
      { name = "rain", chance = 16.67, intensities = { "low" } },
      { name = "rain", chance = 16.67, intensities = { "medium" } },
      { name = "rain", chance = 16.66, intensities = { "high" } }
    }
  },

  auto_preset2 = {
    forecast = 4,
    times = { "06:00", "18:00" },
    conditions = {
      { name = "clear", chance = 50 },
      { name = "snow", chance = 16.67, intensities = { "low" } },
      { name = "snow", chance = 16.67, intensities = { "medium" } },
      { name = "snow", chance = 16.66, intensities = { "high" } }
    }
  }
}

local VALID_MODES = { sync = true, off = true, auto = true, cus = true }
local VALID_CONDITIONS = {
  clear = true,
  clouds = true,
  fog = true,
  rain = true,
  snow = true,
  snow_grains = true,
  hail = true,
  thunderstorm = true
}
local VALID_INTENSITIES = { low = true, medium = true, high = true }

-- These conditions have no varying intensity at present.
local FIXED_LOW = {
  clear = true,
  clouds = true,
  fog = true,
  snow_grains = true
}

-- Explicit WMO codes. Intensity is derived from documented WMO levels,
-- not from arbitrary precipitation thresholds.
-- Thunderstorm codes 96 and 99 include hail as an additional characteristic.
local WMO = {
  [0]  = { "clear", "low" },
  [1]  = { "clear", "low" },
  [2]  = { "clouds", "low" },
  [3]  = { "clouds", "low" },
  [45] = { "fog", "low" },
  [48] = { "fog", "low" },
  [51] = { "rain", "low" },
  [53] = { "rain", "medium" },
  [55] = { "rain", "high" },
  [56] = { "rain", "low" },
  [57] = { "rain", "high" },
  [61] = { "rain", "low" },
  [63] = { "rain", "medium" },
  [65] = { "rain", "high" },
  [66] = { "rain", "low" },
  [67] = { "rain", "high" },
  [71] = { "snow", "low" },
  [73] = { "snow", "medium" },
  [75] = { "snow", "high" },
  [77] = { "snow_grains", "low" },
  [80] = { "rain", "low" },
  [81] = { "rain", "medium" },
  [82] = { "rain", "high" },
  [85] = { "snow", "low" },
  [86] = { "snow", "high" },
  [95] = { "thunderstorm", "low" },
  [96] = { "thunderstorm", "low" },
  [97] = { "thunderstorm", "high" },
  [99] = { "thunderstorm", "high" }
}

local PROPERTY_NAMES = {
  weather_mode = "Weather_mode",
  weather_latitude = "Weather_latitude",
  weather_longitude = "Weather_longitude",
  weather_condition = "Weather_condition",
  weather_intensity = "Weather_intensity",
  weather_autopreset = "Weather_autopreset"
}

local area_states = {}      -- Area ID -> current weather state.
local location_cache = {}   -- Coordinate key -> shared API/cache state.
local area_errors = {}      -- Last validation issue per area.
local change_listeners = {} -- Optional subscribers for later integrations.
local next_listener_id = 0
local next_scan = 0
local last_tick_time = nil
local next_auto_check = 0
local auto_areas = {}
local auto_queues = {}

local AUTO_SAVE_PATH = "scripts/real_weather/data/auto_forecast.json"
local MAX_FORECAST = 256

local function log(message)
  print("[Real Weather] " .. tostring(message))
end

local function normalize_text(value)
  if type(value) ~= "string" then return nil end
  local result = value:match("^%s*(.-)%s*$")
  return result and result:lower() or nil
end

local function report_issue(area_id, reason)
  if area_errors[area_id] ~= reason then
    area_errors[area_id] = reason
    log("Area '" .. tostring(area_id) .. "': " .. tostring(reason))
  end
end

local function clear_issue(area_id)
  area_errors[area_id] = nil
end

local function read_properties(area_id)
  local result = {}
  local ok, properties = pcall(Net.get_area_custom_properties, area_id)
  if not ok or type(properties) ~= "table" then return result end

  local function add_property(name, value)
    if type(name) ~= "string" then return end
    local lower_name = name:lower()
    if not PROPERTY_NAMES[lower_name] then return end

    local existing = result[lower_name]
    if not existing or name == PROPERTY_NAMES[lower_name] then
      result[lower_name] = { name = name, value = value }
    end
  end

  for name, value in pairs(properties) do
    if type(name) == "string" then
      add_property(name, value)
    elseif type(value) == "table" then
      add_property(value.name or value.key, value.value)
    end
  end

  return result
end

local function get_property(area_id, properties, name)
  local entry = properties[name]
  if entry then return entry.value end

  local canonical = PROPERTY_NAMES[name]
  if not canonical then return nil end
  local ok, value = pcall(Net.get_area_custom_property, area_id, canonical)
  if ok then return value end
  return nil
end

local function set_property(area_id, properties, name, value)
  local entry = properties[name]
  local actual_name = entry and entry.name or PROPERTY_NAMES[name]
  local text_value = tostring(value)
  local current = get_property(area_id, properties, name)

  if tostring(current or "") == text_value then return true end

  local ok, result = pcall(Net.set_area_custom_property, area_id, actual_name, text_value)
  if not ok or result == false then
    log("Unable to update " .. actual_name .. " in area " .. tostring(area_id))
    return false
  end

  properties[name] = { name = actual_name, value = text_value }
  return true
end

local function read_settings(area_id, properties)
  local mode = normalize_text(get_property(area_id, properties, "weather_mode"))
  if not mode or mode == "" then return nil, "missing_mode" end
  if not VALID_MODES[mode] then return nil, "invalid_mode" end

  local settings = { mode = mode }

  if mode == "auto" then
    settings.autopreset = normalize_text(
      get_property(area_id, properties, "weather_autopreset")
    )

    return settings
  end

  if mode ~= "sync" then return settings end

  local lat = tonumber(get_property(area_id, properties, "weather_latitude"))
  local lon = tonumber(get_property(area_id, properties, "weather_longitude"))

  if not lat or not lon or lat ~= lat or lon ~= lon
      or lat < -90 or lat > 90 or lon < -180 or lon > 180 then
    return nil, "invalid_coordinates"
  end

  -- Normalize coordinates so multiple maps at the same position share a fetch.
  settings.latitude = lat
  settings.longitude = lon
  settings.location_key = string.format("%.5f,%.5f", lat, lon)
  return settings
end

local function read_custom_state(area_id, properties)
  local condition = normalize_text(get_property(area_id, properties, "weather_condition"))
  if not VALID_CONDITIONS[condition] then
    return nil, "invalid_or_missing_condition"
  end

  local raw_intensity = normalize_text(get_property(area_id, properties, "weather_intensity"))
  -- Missing, empty or invalid intensity values default to low.
  -- Conditions without variable intensity always remain low.
  local intensity = VALID_INTENSITIES[raw_intensity] and raw_intensity or "low"
  if FIXED_LOW[condition] then intensity = "low" end

  return { mode = "cus", condition = condition, intensity = intensity }
end


-- ============================================
-- AUTO MODE: PRESETS AND SCHEDULE
-- ============================================

local function validate_auto_preset(preset)
  if type(preset) ~= "table"
      or type(preset.times) ~= "table"
      or type(preset.conditions) ~= "table" then
    return nil, "invalid_autopreset"
  end

local forecast = tonumber(preset.forecast or 1)

if not forecast or forecast ~= math.floor(forecast)
    or forecast < 1 or forecast > MAX_FORECAST then
  return nil, "invalid_auto_forecast"
end

  local times, seen = {}, {}

  for _, value in ipairs(preset.times) do
    if type(value) ~= "string" then
      return nil, "invalid_auto_time"
    end

    local hour, minute = value:match("^(%d%d):(%d%d)$")
    hour, minute = tonumber(hour), tonumber(minute)

    if not hour or not minute or hour > 23 or minute > 59 then
      return nil, "invalid_auto_time"
    end

    local total = hour * 60 + minute

    if not seen[total] then
      seen[total] = true
      times[#times + 1] = total
    end
  end

  if #times == 0 then
    return nil, "empty_auto_schedule"
  end

  table.sort(times)

  local choices, total_weight = {}, 0

  for _, entry in ipairs(preset.conditions) do
    if type(entry) ~= "table"
        or not VALID_CONDITIONS[entry.name] then
      return nil, "invalid_auto_condition"
    end

    local weight = tonumber(entry.chance)

    if not weight or weight ~= weight
        or weight <= 0 or weight == math.huge then
      return nil, "invalid_auto_chance"
    end

    local intensities = {}

    if FIXED_LOW[entry.name] then
      intensities = { "low" }
    else
      if type(entry.intensities) ~= "table"
          or #entry.intensities == 0 then
        return nil, "missing_auto_intensities"
      end

      for _, intensity in ipairs(entry.intensities) do
        if not VALID_INTENSITIES[intensity] then
          return nil, "invalid_auto_intensity"
        end

        intensities[#intensities + 1] = intensity
      end
    end

    total_weight = total_weight + weight

    choices[#choices + 1] = {
      name = entry.name,
      chance = weight,
      intensities = intensities
    }
  end

  if total_weight <= 0 or total_weight == math.huge then
    return nil, "empty_auto_conditions"
  end

return {
  times = times,
  conditions = choices,
  total_weight = total_weight,
  forecast = forecast
}
end

-- Returns the most recent scheduled time slot.
-- Uses the OS local timezone.
local function current_auto_slot(times, now)
  local clock = os.date("*t", now)
  local current_minute = clock.hour * 60 + clock.min

  local selected
  local previous_day = false

  for _, time in ipairs(times) do
    if time <= current_minute then
      selected = time
    else
      break
    end
  end

  if not selected then
    selected = times[#times]
    previous_day = true
  end

  local date

  if previous_day then
    date = os.date("%Y-%m-%d", os.time({
      year = clock.year,
      month = clock.month,
      day = clock.day - 1,
      hour = 12,
      min = 0,
      sec = 0
    }))
  else
    date = os.date("%Y-%m-%d", now)
  end

  return string.format(
    "%s@%02d:%02d",
    date,
    math.floor(selected / 60),
    selected % 60
  )
end

local function roll_auto_weather(preset)
  local draw = math.random() * preset.total_weight
  local choice = preset.conditions[#preset.conditions]

  for _, entry in ipairs(preset.conditions) do
    draw = draw - entry.chance

    if draw <= 0 then
      choice = entry
      break
    end
  end

  local options = choice.intensities
  local intensity = options[math.random(#options)]

  return choice.name, intensity
end


-- ============================================
-- AUTO MODE: SHARED FORECAST QUEUES AND STORAGE
-- ============================================

local function next_auto_slot(slot, times)
  local year, month, day, hour, minute =
      slot:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)@(%d%d):(%d%d)$")

  if not year then return nil end

  local current = tonumber(hour) * 60 + tonumber(minute)
  local date = slot:sub(1, 10)

  for _, time in ipairs(times) do
    if time > current then
      return string.format("%s@%02d:%02d",
        date, math.floor(time / 60), time % 60)
    end
  end

  -- Next occurrence is on the following calendar day.
  local tomorrow = os.date("%Y-%m-%d", os.time({
    year = tonumber(year),
    month = tonumber(month),
    day = tonumber(day) + 1,
    hour = 12,
    min = 0,
    sec = 0
  }))

  local first = times[1]

  return string.format("%s@%02d:%02d",
    tomorrow, math.floor(first / 60), first % 60)
end

local function roll_auto_entry(valid)
  local condition, intensity = roll_auto_weather(valid)

  return {
    condition = condition,
    intensity = intensity
  }
end

local function save_auto_queues()
  if type(io) ~= "table" or type(io.open) ~= "function" then
    log("AUTO persistence unavailable: io.open is disabled")
    return false
  end

  local ok, encoded = pcall(json.encode, {
    version = 1,
    presets = auto_queues
  })

  if not ok then
    log("AUTO save encode error: " .. tostring(encoded))
    return false
  end

  local file, err = io.open(AUTO_SAVE_PATH, "w")

  if not file then
    log("AUTO save error: " .. tostring(err))
    return false
  end

  local written, write_err = pcall(function()
    local saved, save_err = file:write(encoded)
    if not saved then error(save_err or "write_failed") end

    local closed, close_err = file:close()
    if not closed then error(close_err or "close_failed") end
  end)

  if not written then
    pcall(function() file:close() end)
    log("AUTO write error: " .. tostring(write_err))
    return false
  end

  return true
end

local function load_auto_queues()
  if type(io) ~= "table" or type(io.open) ~= "function" then
    log("AUTO persistence unavailable: io.open is disabled")
    return
  end

  local file = io.open(AUTO_SAVE_PATH, "r")

  -- First startup: there are no saved forecasts yet.
  if not file then return end

  local ok_read, contents = pcall(function()
    local data = file:read("*a")
    file:close()
    return data
  end)

  if not ok_read then
    pcall(function() file:close() end)
    log("AUTO save read error: " .. tostring(contents))
    return
  end

  local ok, stored = pcall(json.decode, contents)

  if not ok or type(stored) ~= "table"
      or stored.version ~= 1
      or type(stored.presets) ~= "table" then
    log("AUTO saved forecasts invalid; creating new forecasts")
    return
  end

  for name, queue in pairs(stored.presets) do
    if type(name) == "string"
        and type(queue) == "table"
        and type(queue.slot) == "string"
        and queue.slot:match("^%d%d%d%d%-%d%d%-%d%d@%d%d:%d%d$")
        and type(queue.schedule) == "string"
        and type(queue.forecast) == "table"
        and #queue.forecast > 0
        and #queue.forecast <= MAX_FORECAST then

      local restored = {}

      for _, item in ipairs(queue.forecast) do
        if type(item) ~= "table"
            or not VALID_CONDITIONS[item.condition]
            or not VALID_INTENSITIES[item.intensity] then
          restored = nil
          break
        end

        restored[#restored + 1] = {
          condition = item.condition,
          intensity = item.intensity
        }
      end

      if restored then
        auto_queues[name] = {
          slot = queue.slot,
          schedule = queue.schedule,
          forecast = restored
        }
      end
    end
  end
end

-- One shared weather queue per preset.
local function get_auto_state(area_id, settings, now)
  local name = settings.autopreset

  if not name or name == "" then
    return nil, "missing_autopreset"
  end

  local config = RealWeather.auto_config

  if type(config) ~= "table" then
    return nil, "invalid_auto_config"
  end

  if config[name] == nil then
    return nil, "unknown_autopreset"
  end

  local valid, reason = validate_auto_preset(config[name])

  if not valid then
    return nil, reason
  end

  local slot = current_auto_slot(valid.times, now)
  local schedule = table.concat(valid.times, ",")
  local queue = auto_queues[name]
  local changed = false

  if not queue then
    -- First use: create a queue for this preset.
    queue = {
      slot = slot,
      schedule = schedule,
      forecast = {}
    }

    auto_queues[name] = queue
    changed = true

  elseif queue.schedule ~= schedule then
    -- Times changed: re-anchor dates without changing climates.
    queue.schedule = schedule
    queue.slot = slot
    changed = true

  elseif queue.slot < slot then
    -- Advance through all scheduled occurrences that have passed.
    -- There is no need to simulate more than the old queue length:
    -- after that, every entry necessarily comes from a new roll.
    local cursor = queue.slot
    local advances = 0

    while cursor < slot and advances < #queue.forecast do
      local next_slot = next_auto_slot(cursor, valid.times)

      if not next_slot or next_slot > slot then
        break
      end

      cursor = next_slot
      advances = advances + 1
    end

    for _ = 1, advances do
      table.remove(queue.forecast, 1)
      queue.forecast[#queue.forecast + 1] =
          roll_auto_entry(valid)
    end

    queue.slot = slot
    changed = true
  end

  -- Clock rollback: never rewind or reprocess an old slot.

  -- Existing forecasts are NEVER rerolled because conditions,
  -- intensities or probabilities changed.
  -- Only resize the queue when forecast length changes.

  while #queue.forecast > valid.forecast do
    table.remove(queue.forecast)
    changed = true
  end

  while #queue.forecast < valid.forecast do
    queue.forecast[#queue.forecast + 1] =
        roll_auto_entry(valid)
    changed = true
  end

  if changed then
    save_auto_queues()
  end

  local current = queue.forecast[1]

  return {
    mode = "auto",
    condition = current.condition,
    intensity = current.intensity,
    autopreset = name,
    auto_slot = queue.slot
  }
end

-- ============================================
-- STATE AND CHANGE NOTIFICATIONS
-- ============================================

local function copy_table(value)
  if type(value) ~= "table" then return nil end
  local result = {}
  for key, field in pairs(value) do result[key] = field end
  return result
end

local function notify_change(area_id, state, previous)
  for _, callback in pairs(change_listeners) do
    local ok, err = pcall(callback, area_id, copy_table(state), copy_table(previous))
    if not ok then log("Weather listener failed: " .. tostring(err)) end
  end
end

local function update_state(area_id, state)
  local previous = area_states[area_id]
  area_states[area_id] = state

  -- Notify on real state changes, not on every periodic scan.
  if not previous and not state then return end
  if previous and state
      and previous.mode == state.mode
      and previous.autopreset == state.autopreset
      and previous.auto_slot == state.auto_slot
      and previous.condition == state.condition
      and previous.intensity == state.intensity
      and previous.code == state.code
      and previous.location_key == state.location_key
      and previous.observed_at == state.observed_at
      and previous.has_hail == state.has_hail
      and previous.temperature == state.temperature
      and previous.wind_speed == state.wind_speed
      and previous.wind_direction == state.wind_direction
      and previous.cloud_cover == state.cloud_cover
      and previous.visibility == state.visibility then
    return
  end

  notify_change(area_id, state, previous)
end

-- Publish weather properties and notify visual listeners.
local function publish_weather_state(area_id, properties, state)
  local condition_ok = set_property(
    area_id,
    properties,
    "weather_condition",
    state.condition
  )

  local intensity_ok = set_property(
    area_id,
    properties,
    "weather_intensity",
    state.intensity
  )

  update_state(area_id, state)

  return condition_ok and intensity_ok
end

-- ============================================
-- OPEN-METEO RESPONSE AND FETCHING
-- ============================================

local function parse_response(response)
  if type(response) ~= "table" or tonumber(response.status) ~= 200
      or type(response.body) ~= "string" then
    return nil
  end

  local ok, body = pcall(json.decode, response.body)
  if not ok or type(body) ~= "table" or type(body.current) ~= "table" then
    return nil
  end

  local current = body.current
  local code = tonumber(current.weather_code)
  local mapped = code and WMO[code]
  if not mapped then return nil end

  return {
    mode = "sync",
    condition = mapped[1],
    intensity = mapped[2],
    code = code,
    has_hail = (code == 96 or code == 99),
    temperature = tonumber(current.temperature_2m),
    wind_speed = tonumber(current.wind_speed_10m),
    wind_direction = tonumber(current.wind_direction_10m),
    cloud_cover = tonumber(current.cloud_cover),
    visibility = tonumber(current.visibility),
    observed_at = current.time
  }
end

local function make_url(latitude, longitude)
  return API_URL
      .. "?latitude=" .. string.format("%.5f", latitude)
      .. "&longitude=" .. string.format("%.5f", longitude)
      .. "&current=weather_code,temperature_2m,wind_speed_10m,"
      .. "wind_direction_10m,cloud_cover,visibility"
      .. "&temperature_unit=celsius&wind_speed_unit=kmh"
      .. "&timezone=UTC&forecast_days=1"
end

local function apply_sync_state(area_id, properties, settings, observation)
  local state = copy_table(observation)
  state.location_key = settings.location_key

  return publish_weather_state(area_id, properties, state)
end

-- A request may finish after the map was switched to cus/off or moved to new coordinates, recheck every area's live configuration before applying data.
local function apply_to_matching_areas(location_key, observation)
  for _, area_id in ipairs(Net.list_areas() or {}) do
    local properties = read_properties(area_id)
    local settings = read_settings(area_id, properties)
    if settings and settings.mode == "sync"
        and settings.location_key == location_key then
      if apply_sync_state(area_id, properties, settings, observation) then
        clear_issue(area_id)
      else
        report_issue(area_id, "sync_property_update_failed")
      end
    end
  end
end

-- Report an outage only once until a valid response is received.
local function report_outage(entry, key, reason)
  if entry.outage_reported then return end

  local status = entry.observation
      and "Keeping last valid weather."
      or "No valid weather cached."

  log("Open-Meteo unavailable for " .. key ..
    " (" .. tostring(reason) .. "). " .. status)

  entry.outage_reported = true
end

local function request_location(settings, force)
  if not Async or not Async.request or not Async.await or not Async.promisify then
    return false, "async_unavailable"
  end

  local key = settings.location_key
  local entry = location_cache[key]
  if not entry then
    entry = {}
    location_cache[key] = entry
  end

  local now = os.time()
  if entry.pending and now - entry.pending.started < REQUEST_TIMEOUT then
    return true, "request_pending"
  end
  -- Expire stalled requests and preserve the last valid observation.
  if entry.pending then
    entry.pending = nil
    report_outage(entry, key, "request timeout")
  end

  if not force and entry.observation and entry.fetched_at
      and now - entry.fetched_at < FETCH_INTERVAL then
    return true, "cache_fresh"
  end

  if entry.next_attempt and now < entry.next_attempt then
    return false, "rate_limited"
  end

  local token = { started = now }
  entry.pending = token
  entry.next_attempt = now + FORCE_COOLDOWN

  local function fetch()
    local ok, response = pcall(function()
      return Async.await(Async.request(make_url(settings.latitude, settings.longitude)))
    end)

    if entry.pending ~= token then return end
    entry.pending = nil

    local observation = ok and parse_response(response) or nil

    if not observation then
      entry.next_attempt = os.time() + RETRY_INTERVAL

      local reason = not ok and tostring(response)
          or "invalid or unsupported API response"

      report_outage(entry, key, reason)
      return
    end

    if entry.outage_reported then
      log("Open-Meteo connection restored for " .. key)
      entry.outage_reported = nil
    end

    entry.observation = observation
    entry.fetched_at = os.time()
    entry.next_attempt = entry.fetched_at + FORCE_COOLDOWN
    apply_to_matching_areas(key, observation)
  end

  local started, err = pcall(function()
    Async.promisify(coroutine.create(fetch))
  end)

  if not started then
    entry.pending = nil
    entry.next_attempt = os.time() + RETRY_INTERVAL

    report_outage(entry, key, "request failed: " .. tostring(err))
    return false, "request_failed"
  end

  return true, "request_started"
end

-- ============================================
-- PUBLIC API
-- ============================================

function RealWeather.get_mode(area_id)
  local properties = read_properties(area_id)
  local value = normalize_text(get_property(area_id, properties, "weather_mode"))
  if VALID_MODES[value] then return value end
  return nil
end

function RealWeather.get_state(area_id)
  return copy_table(area_states[area_id])
end

-- Returning nil as new_state means Real Weather is no longer managing the area.
function RealWeather.on_change(callback)
  assert(type(callback) == "function", "Expected a weather callback function")
  next_listener_id = next_listener_id + 1
  local slot = next_listener_id
  change_listeners[slot] = callback
  return function() change_listeners[slot] = nil end
end

function RealWeather.refresh_area(area_id, force)
  local properties = read_properties(area_id)
  local settings, reason = read_settings(area_id, properties)

  local is_auto = settings ~= nil and settings.mode == "auto"

  auto_areas[area_id] = is_auto or nil

  if not settings then
    update_state(area_id, nil)
    -- Missing configuration is normal: leave unconfigured maps untouched.
    if reason == "missing_mode" then
      clear_issue(area_id)
    else
      report_issue(area_id, reason)
    end
    return false, reason
  end

  if settings.mode == "off" then
    local condition_ok = set_property(
      area_id, properties, "weather_condition", ""
    )

    local intensity_ok = set_property(
      area_id, properties, "weather_intensity", ""
    )

    -- Remove active weather visuals even if a property write fails.
    update_state(area_id, nil)

    if not condition_ok or not intensity_ok then
      report_issue(area_id, "off_property_update_failed")
      return false, "off_property_update_failed"
    end

    clear_issue(area_id)
    return true, "off"
  end

  if settings.mode == "auto" then
    local state, auto_error = get_auto_state(
      area_id,
      settings,
      os.time()
    )

    if not state then

      -- Safe fallback for missing or invalid presets.
      state = {
        mode = "auto",
        condition = "clear",
        intensity = "low",
        autopreset = settings.autopreset
      }
    end

    -- Publish the state and verify map property updates.
    local published = publish_weather_state(
      area_id,
      properties,
      state
    )

    if not published then
      local issue = "auto_property_update_failed"

      if auto_error then
        issue = issue .. "; " .. tostring(auto_error)
            .. " (fallback: clear)"
      end

      report_issue(area_id, issue)
      return false, "auto_property_update_failed"
    end

    if auto_error then
      report_issue(
        area_id,
        tostring(auto_error) .. " (fallback: clear)"
      )
    else
      clear_issue(area_id)
    end

    return true, auto_error and "auto_fallback" or "auto"
  end

  if settings.mode == "cus" then
    local state, custom_error = read_custom_state(area_id, properties)
    if not state then
      update_state(area_id, nil)
      report_issue(area_id, custom_error)
      return false, custom_error
    end

    update_state(area_id, state)
    clear_issue(area_id)
    return true, "cus"
  end


  -- sync: retrieve the latest observation shared by this location.
  local entry = location_cache[settings.location_key]
  local publish_ok = true

  if entry and entry.observation then
    publish_ok = apply_sync_state(
      area_id,
      properties,
      settings,
      entry.observation
    )
  else
    -- Never show observations inherited from different coordinates or modes.
    local previous = area_states[area_id]

    if previous and (previous.mode ~= "sync"
          or previous.location_key ~= settings.location_key) then
      -- Clear weather values inherited from another configuration.
      local condition_ok = set_property(
        area_id,
        properties,
        "weather_condition",
        ""
      )

      local intensity_ok = set_property(
        area_id,
        properties,
        "weather_intensity",
        ""
      )

      publish_ok = condition_ok and intensity_ok

      update_state(area_id, nil)
    end
  end

  -- Continue fetching weather even if property publication fails.
  local success, fetch_reason = request_location(
    settings,
    force == true
  )

  if not publish_ok then
    report_issue(area_id, "sync_property_update_failed")
    return false, "sync_property_update_failed"
  end

  if not success and fetch_reason ~= "rate_limited" then
    report_issue(area_id, fetch_reason)
  else
    clear_issue(area_id)
  end

  return success, fetch_reason
end

function RealWeather.refresh_all(force)
  for _, area_id in ipairs(Net.list_areas() or {}) do
    RealWeather.refresh_area(area_id, force)
  end
end


-- Return an independent copy of a map's preset forecast.
function RealWeather.get_forecast(area_id)
  local properties = read_properties(area_id)
  local settings = read_settings(area_id, properties)

  if not settings or settings.mode ~= "auto" then
    return nil, "not_auto"
  end

  local name = settings.autopreset

  if not name or name == "" then
    return nil, "missing_autopreset"
  end

  local config = RealWeather.auto_config

  if type(config) ~= "table" then
    return nil, "invalid_auto_config"
  end

  if config[name] == nil then
    return nil, "unknown_autopreset"
  end

  local valid, reason = validate_auto_preset(config[name])
  if not valid then return nil, reason end

  local queue = auto_queues[name]
  if not queue then
    return nil, "forecast_unavailable"
  end

  local entries = {}
  local slot = queue.slot

  for _, item in ipairs(queue.forecast) do
    entries[#entries + 1] = {
      time = slot,
      condition = item.condition,
      intensity = item.intensity
    }

    slot = next_auto_slot(slot, valid.times)
  end

  return {
    preset = name,
    forecast = entries
  }
end

function RealWeather.get_supported_conditions()
  return { "clear", "clouds", "fog", "rain", "snow", "snow_grains", "hail", "thunderstorm" }
end

-- the existing weather-change signal so the weather API stays unchanged.
local weather_effects = require("scripts/real_weather/effects/visuals")
RealWeather.effects = weather_effects

RealWeather.on_change(function(area_id, state)
  weather_effects.set_weather(area_id, state)
end)

-- Detect settings changed through Net.set_area_custom_property().
Net:on("tick", function()
  local now = os.time()

  -- Reset scheduled checks if the OS clock moves backwards.
  if last_tick_time and now < last_tick_time then
    next_scan = 0
    next_auto_check = 0

    -- Reset sync timers after an OS clock rollback.
    for _, entry in pairs(location_cache) do
      entry.fetched_at = nil
      entry.next_attempt = nil
      entry.pending = nil
    end
  end

  last_tick_time = now

  local scanned = false

  -- Scan map settings periodically.
  if now >= next_scan then
    next_scan = now + AREA_SCAN_INTERVAL
    RealWeather.refresh_all()
    scanned = true
  end

  -- Check automatic weather at the beginning
  -- of each minute, using the OS local time.
  if now >= next_auto_check then
    local seconds = os.date("*t", now).sec

    next_auto_check = now + math.max(1, 60 - seconds)

    -- Avoid repeating the refresh if the general
    -- area scan already updated every map.
    if not scanned then
      for area_id in pairs(auto_areas) do
        RealWeather.refresh_area(area_id)
      end
    end
  end
end)

-- Restore forecasts before publishing weather to any map.
load_auto_queues()

-- Initialize all configured areas on server startup.
RealWeather.refresh_all()

rawset(_G, "__real_weather_initialized", RealWeather)
return RealWeather
