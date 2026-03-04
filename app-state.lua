--- @alias RadioValue "valueA" | "valueB" | "valueC"

--- @class SampleAppState
--- @field radioValue RadioValue
--- @field labelValue string
--- @field stringValue string
--- @field floatValue number
--- @field checkA boolean
--- @field checkB boolean
local SampleAppState = {}

--- @return SampleAppState
function SampleAppState.new()
    --- @type SampleAppState
    return {
        radioValue = "valueA",
        labelValue = "Click a Button!",
        stringValue = "Hello",
        floatValue = 0.5,
        checkA = true,
        checkB = false,
    }
end

return SampleAppState
