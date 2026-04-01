--- @class SimpleImageState
--- @field filter IUIImageFilter
--- @field fillMode IUIImageMode
--- @field clip boolean

--- @class NineSliceImageState
--- @field filter IUIImageFilter
--- @field width number
--- @field height number

--- @class MSDFImageState
--- @field fillMode IUIImageMode
--- @field clip boolean

--- @class ImageTabState
--- @field simple SimpleImageState
--- @field nineSlice NineSliceImageState
--- @field msdf MSDFImageState
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
        },
        msdf = {
            fillMode = "aspectFit",
            clip = true,
        }
    }
end

return ImageTabState
