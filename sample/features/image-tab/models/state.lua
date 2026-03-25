--- @class SimpleImageState
--- @field filter IUIImageFilter
--- @field fillMode IUIImageMode
--- @field clip boolean

--- @class NineSliceImageState
--- @field filter IUIImageFilter
--- @field width number
--- @field height number

--- @class ImageTabState
--- @field simple SimpleImageState
--- @field nineSlice NineSliceImageState
local ImageTabState = {}

function ImageTabState.new()
    --- @type ImageTabState
    return {
        simple = {
            filter = "linear",
            fillMode = "aspectFit",
            clip = true,
        },
        nineSlice = {
            filter = "smooth",
            width = 300,
            height = 60,
        }
    }
end

return ImageTabState
