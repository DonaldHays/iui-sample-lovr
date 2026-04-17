local iui = require "lib.iui"

local simple = require "sample.features.image-tab.simple"
local nineSlice = require "sample.features.image-tab.nine-slice"
local msdf = require "sample.features.image-tab.msdf"
local nineSliceMSDF = require "sample.features.image-tab.nine-slice-msdf"

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
        tabWinState.leftSplitValue
    )

    iui.label("Image")

    tabWinState.selection = iui.radio(
        "Simple", tabWinState.selection, "simple"
    )

    tabWinState.selection = iui.radio(
        "9-Slice", tabWinState.selection, "9slice"
    )

    tabWinState.selection = iui.radio(
        "MSDF", tabWinState.selection, "msdf"
    )

    tabWinState.selection = iui.radio(
        "9-Slice MSDF", tabWinState.selection, "9slice-msdf"
    )

    iui.splitViewDivider()

    if tabWinState.selection == "simple" then
        simple()
    elseif tabWinState.selection == "9slice" then
        nineSlice()
    elseif tabWinState.selection == "msdf" then
        msdf()
    elseif tabWinState.selection == "9slice-msdf" then
        nineSliceMSDF()
    end

    iui.endSplitView()

    iui.style.pop()
end

return tabImage
