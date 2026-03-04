local iui = require "lib.iui"

--- @alias TabValue "tabA" | "tabB" | "tabC"

--- @class SampleWindowState
--- @field selectedTab TabValue
--- @field primarySplitValue number
--- @field primaryScrollManager IUIScrollManager
local SampleWindowState = {}

function SampleWindowState.new()
    --- @type SampleWindowState
    return {
        selectedTab = "tabA",
        primarySplitValue = 200,
        primaryScrollManager = iui.newScrollManager(),
    }
end

return SampleWindowState
