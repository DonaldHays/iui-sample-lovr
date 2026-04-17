local iui = require "lib.iui"

local round = iui.utils.round

local function content()
    local appState = iui.style["appState"] --- @type SampleAppState
    local state = appState.imageTab.nineSliceMSDF

    local assets = iui.style["assets"] --- @type SampleAssets

    local x, y, w, h = iui.layout.getPanelBounds()

    iui.draw.pushClip(x, y, w, h)

    local width, height = round(state.width), round(state.height)

    x = x + round((w - width) / 2)
    y = y + round((h - height) / 2)

    iui.layout.beginPanel(x, y, width, height, 0)
    iui.layout.fillPanel()

    iui.msdfLayeredImage9Slice(assets.nineSliceMSDFLayeredImage)

    iui.layout.endPanel()
    iui.draw.popClip()
end

local function inspector()
    local appState = iui.style["appState"] --- @type SampleAppState
    local state = appState.imageTab.nineSliceMSDF

    iui.label("Size")

    iui.layout.beginMixedRow {
        { kind = "fixed",   size = 50 },
        { kind = "dynamic", size = 1 },
    }

    iui.label("Width")
    state.width = iui.slider("Width", state.width, 100, 400)

    iui.label("Height")
    state.height = iui.slider("Height", state.height, 64, 200)
end

local function nineSliceMSDF()
    local windowState = iui.style["windowState"] --- @type SampleWindowState

    local winState = windowState.imageTab.nineSliceMSDF

    iui.style.push()
    iui.style["splitSide"] = "max"

    winState.splitValue = iui.splitView(
        "imageSplit", "horiz", winState.splitValue
    )
    content()
    iui.splitViewDivider()
    inspector()
    iui.endSplitView()

    iui.style.pop()
end

return nineSliceMSDF
