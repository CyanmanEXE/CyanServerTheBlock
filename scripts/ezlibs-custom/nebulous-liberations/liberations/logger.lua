-- Nebulous Liberations subsystem streams, all grouped under one module.
-- Each subsystem is mirrored to _DEBUGGING/nebulous-liberations/_FULL-log.log.
local SharedLogger = require("scripts/logger/logger")
local root_logger = SharedLogger.register("nebulous-liberations")

local Logger = {
    mission = root_logger:register_subsystem("mission"),
    config = root_logger:register_subsystem("config"),
    spawning = root_logger:register_subsystem("spawning"),
    encounters = root_logger:register_subsystem("encounters"),
    validation = root_logger:register_subsystem("validation"),
    -- Dedicated output: scripts/_DEBUGGING/_MAP_PROBLEMS/_NEBULOUS-LIBERATIONS.log
    map_problems = SharedLogger.register("_MAP_PROBLEMS"):register_subsystem("nebulous-liberations"),
}

return Logger
