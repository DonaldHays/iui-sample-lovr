local iui = require "lib.iui"

--- @class MainTabWindowState
--- @field splitValue number
--- @field listManager IUIListManager
--- @field scrollManager IUIScrollManager
local MainTabWindowState = {}

function MainTabWindowState.new()
    local listManager = iui.newListManager()

    listManager.allowsMultipleSelection = true

    --- @type MainTabWindowState
    return {
        splitValue = 200,
        listManager = listManager,
        scrollManager = iui.newScrollManager(),
    }
end

return MainTabWindowState
