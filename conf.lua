local launch = require "launch"

local function isVR()
    return launch.mode == "vr"
end

local function isResizable()
    return launch.mode == "desktop"
end

function lovr.conf(t)
    if isVR() then
        t.headset.supersample = 2
    else
        t.modules.headset = nil
    end

    t.window.width = 1280
    t.window.height = 720
    t.window.resizable = isResizable()
end
