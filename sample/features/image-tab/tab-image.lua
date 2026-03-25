local iui = require "lib.iui"

local simple = require "sample.features.image-tab.simple"
local nineSlice = require "sample.features.image-tab.nine-slice"

local function tabImage()
    local windowState = iui.style["windowState"] --- @type SampleWindowState
    local tabWinState = windowState.imageTab

    iui.style.push()
    iui.style["splitMinEdge"] = 200
    iui.style["splitMaxEdge"] = 200
    iui.style["splitSide"] = "min"

    tabWinState.leftSplitValue = iui.splitView(
        "imageLeftSplit",
        "horiz",
        tabWinState.leftSplitValue,
        function()
            iui.label("Image")

            tabWinState.selection = iui.radio(
                "Simple", tabWinState.selection, "simple"
            )

            tabWinState.selection = iui.radio(
                "9-Slice", tabWinState.selection, "9slice"
            )
        end,
        function()
            if tabWinState.selection == "simple" then
                simple()
            elseif tabWinState.selection == "9slice" then
                nineSlice()
            end
        end
    )

    iui.style.pop()
end

return tabImage
