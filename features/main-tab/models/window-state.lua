local iui = require "lib.iui"

--- @class MainTabWindowState
--- @field splitValue number
--- @field listManager IUIListManager
--- @field scrollManager IUIScrollManager
local MainTabWindowState = {}

function MainTabWindowState.new()
    --- @type MainTabWindowState
    return {
        splitValue = 200,
        listManager = iui.newListManager(),
        scrollManager = iui.newScrollManager(),
    }
end

return MainTabWindowState
