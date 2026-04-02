--- @alias ImageTabImage "simple" | "9slice" | "msdf" | "9slice-msdf"

--- @class ImageContentWindowState
--- @field splitValue number

--- @class ImageTabWindowState
--- @field leftSplitValue number
--- @field selection ImageTabImage
--- @field simple ImageContentWindowState
--- @field nineSlice ImageContentWindowState
--- @field msdf ImageContentWindowState
--- @field nineSliceMSDF ImageContentWindowState
local ImageTabWindowState = {}

function ImageTabWindowState.new()
    --- @type ImageTabWindowState
    return {
        leftSplitValue = 200,
        selection = "simple",
        simple = {
            splitValue = 300
        },
        nineSlice = {
            splitValue = 300
        },
        msdf = {
            splitValue = 300
        },
        nineSliceMSDF = {
            splitValue = 300
        }
    }
end

return ImageTabWindowState
