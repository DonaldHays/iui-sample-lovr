local iui = require "lib.iui"

local function content()
    local appState = iui.style["appState"] --- @type SampleAppState
    local state = appState.imageTab.simple

    local assets = iui.style["assets"] --- @type SampleAssets

    iui.layout.fillPanel()

    local bx, by, bw, bh = iui.layout.getBounds()
    iui.colors.sysGray0:set()
    iui.graphics.rectangle(bx, by, bw, bh)

    iui.style.push()
    iui.style["imageFilter"] = state.filter
    iui.style["imageMode"] = state.fillMode
    iui.style["imageClip"] = state.clip

    iui.image(assets.gameSunsetImage)

    iui.style.pop()
end

local function inspector()
    local appState = iui.style["appState"] --- @type SampleAppState
    local state = appState.imageTab.simple

    iui.label("Filter")
    state.filter = iui.radio("Nearest", state.filter, "nearest")
    state.filter = iui.radio("Smooth", state.filter, "smooth")
    state.filter = iui.radio("Linear", state.filter, "linear")

    iui.divider()

    iui.label("Fill Mode")
    state.fillMode = iui.radio(
        "Fill", state.fillMode, "fill"
    )

    state.fillMode = iui.radio(
        "Aspect Fit", state.fillMode, "aspectFit"
    )

    state.fillMode = iui.radio(
        "Aspect Fill", state.fillMode, "aspectFill"
    )

    state.fillMode = iui.radio(
        "Center", state.fillMode, "center"
    )

    iui.divider()

    state.clip = iui.checkbox("Clip to Bounds", state.clip)
end

local function simple()
    local windowState = iui.style["windowState"] --- @type SampleWindowState

    local winState = windowState.imageTab.simple

    iui.style.push()
    iui.style["splitSide"] = "max"

    winState.splitValue = iui.splitView(
        "imageSplit", "horiz", winState.splitValue, content, inspector
    )

    iui.style.pop()
end

return simple
