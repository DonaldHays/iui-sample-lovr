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

--- @class NineSliceMSDFImageState
--- @field width number
--- @field height number

--- @class ImageTabState
--- @field simple SimpleImageState
--- @field nineSlice NineSliceImageState
--- @field msdf MSDFImageState
--- @field nineSliceMSDF NineSliceMSDFImageState
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
        },
        nineSliceMSDF = {
            width = 300,
            height = 100,
        }
    }
end

return ImageTabState
