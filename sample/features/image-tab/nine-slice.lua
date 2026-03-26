local iui = require "lib.iui"

local round = iui.utils.round

local function content()
    local appState = iui.style["appState"] --- @type SampleAppState
    local state = appState.imageTab.nineSlice

    local assets = iui.style["assets"] --- @type SampleAssets

    local x, y, w, h = iui.layout.getPanelBounds()

    iui.draw.pushClip(x, y, w, h)

    local width, height = round(state.width), round(state.height)

    x = x + round((w - width) / 2)
    y = y + round((h - height) / 2)

    iui.layout.beginPanel(x, y, width, height, 0)
    iui.layout.beginRow({ kind = "dynamic", count = 1 }, height)

    iui.style.push()
    iui.style["imageFilter"] = state.filter

    iui.image9Slice(assets.nineSliceImage)

    iui.style.pop()
    iui.layout.endPanel()
    iui.draw.popClip()
end

local function inspector()
    local appState = iui.style["appState"] --- @type SampleAppState
    local state = appState.imageTab.nineSlice

    iui.label("Filter")
    state.filter = iui.radio("Nearest", state.filter, "nearest")
    state.filter = iui.radio("Smooth", state.filter, "smooth")
    state.filter = iui.radio("Linear", state.filter, "linear")

    iui.divider()

    iui.label("Size")

    iui.layout.beginRow({
        kind = "mixed",
        columns = {
            { kind = "fixed",   size = 50 },
            { kind = "dynamic", size = 1 },
        }
    })

    iui.label("Width")
    state.width = iui.slider("Width", state.width, 100, 400)

    iui.label("Height")
    state.height = iui.slider("Height", state.height, 20, 200)
end

local function nineSlice()
    local windowState = iui.style["windowState"] --- @type SampleWindowState

    local winState = windowState.imageTab.nineSlice

    iui.style.push()
    iui.style["splitSide"] = "max"

    winState.splitValue = iui.splitView(
        "imageSplit", "horiz", winState.splitValue, content, inspector
    )

    iui.style.pop()
end

return nineSlice
