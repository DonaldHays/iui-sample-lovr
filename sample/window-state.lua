local iui = require "lib.iui"

--- @alias TabValue "tabA" | "tabB" | "tabC" | "tabD"

--- @class SampleWindowState
--- @field selectedTab TabValue
--- @field primarySplitValue number
--- @field primaryScrollManager IUIScrollManager
--- @field imageSplitValue number
local SampleWindowState = {}

function SampleWindowState.new()
    --- @type SampleWindowState
    return {
        selectedTab = "tabA",
        primarySplitValue = 200,
        primaryScrollManager = iui.newScrollManager(),
        imageSplitValue = 300,
    }
end

return SampleWindowState
