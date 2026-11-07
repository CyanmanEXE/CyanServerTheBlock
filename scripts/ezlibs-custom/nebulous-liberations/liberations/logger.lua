-- Dedicated Nebulous Liberations subsystem loggers.
-- Each category writes to scripts/ezlibs-scripts/_DEBUGGING/<module>/debugging.log
-- using the existing ezlogger API (no additional filesystem logic).
local ezlogger = require("scripts/ezlibs-scripts/ezlogger")
local Logger = {
    mission = ezlogger.get("nebulous-liberations"),
    config = ezlogger.get("nebulous-liberations-config"),
    spawning = ezlogger.get("nebulous-liberations-spawning"),
    encounters = ezlogger.get("nebulous-liberations-encounters"),
    validation = ezlogger.get("nebulous-liberations-validation"),
}
return Logger
