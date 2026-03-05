local system = require "lovr.system"

--- A type that customizes how the app launches.
---
--- Currently, the only launch option is the `mode`, which may be either
--- "desktop" or "vr". On PC, you can change the option in the table literal
--- below to change which mode the app launches in.
---
--- @class LaunchOptions
--- @field mode IUIIdiom

--- @type LaunchOptions
local launchOptions = {
    mode = "desktop",
}

--- If we're on Android, then we're on a mobile VR headset, so force the mode to
--- "vr", regardless of the prior setting.
if system.getOS() == "Android" then
    launchOptions.mode = "vr"
end

return launchOptions
