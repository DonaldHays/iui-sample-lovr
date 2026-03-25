local MainTabWindowState = require "sample.features.main-tab.models.window-state"
local ImageTabWindowState = require "sample.features.image-tab.models.window-state"

--- @alias TabValue "tabA" | "tabB" | "tabC" | "tabD"

--- @class SampleWindowState
--- @field selectedTab TabValue
--- @field mainTab MainTabWindowState
--- @field imageTab ImageTabWindowState
local SampleWindowState = {}

function SampleWindowState.new()
    --- @type SampleWindowState
    return {
        selectedTab = "tabA",
        mainTab = MainTabWindowState.new(),
        imageTab = ImageTabWindowState.new(),
    }
end

return SampleWindowState
