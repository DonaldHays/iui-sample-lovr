--- @alias RadioValue "valueA" | "valueB" | "valueC"

--- @class MainTabState
--- @field radioValue RadioValue
--- @field labelValue string
--- @field stringValue string
--- @field floatValue number
--- @field checkA boolean
--- @field checkB boolean
local MainTabState = {}

--- @return MainTabState
function MainTabState.new()
    --- @type MainTabState
    return {
        radioValue = "valueA",
        labelValue = "Click a Button!",
        stringValue = "Hello",
        floatValue = 0.5,
        checkA = true,
        checkB = false,
    }
end

return MainTabState
