local MainTabState = require "sample.features.main-tab.models.state"
local ImageTabState = require "sample.features.image-tab.models.state"

--- @class SampleAppState
--- @field mainTab MainTabState
--- @field imageTab ImageTabState
local SampleAppState = {}

--- @return SampleAppState
function SampleAppState.new()
    --- @type SampleAppState
    return {
        mainTab = MainTabState.new(),
        imageTab = ImageTabState.new(),
    }
end

return SampleAppState
