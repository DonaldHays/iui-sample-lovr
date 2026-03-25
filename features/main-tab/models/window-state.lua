local iui = require "lib.iui"

--- @class MainTabWindowState
--- @field splitValue number
--- @field scrollManager IUIScrollManager
local MainTabWindowState = {}

function MainTabWindowState.new()
    --- @type MainTabWindowState
    return {
        splitValue = 200,
        scrollManager = iui.newScrollManager(),
    }
end

return MainTabWindowState
