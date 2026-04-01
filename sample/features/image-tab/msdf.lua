local iui = require "lib.iui"

local function content()
    local appState = iui.style["appState"] --- @type SampleAppState
    local state = appState.imageTab.msdf

    local assets = iui.style["assets"] --- @type SampleAssets

    iui.layout.fillPanel()

    iui.style.push()
    iui.style["imageMode"] = state.fillMode
    iui.style["imageClip"] = state.clip

    iui.msdfImage(assets.checkmarkMSDFImage, iui.colors.sysAccent500)

    iui.style.pop()
end

local function inspector()
    local appState = iui.style["appState"] --- @type SampleAppState
    local state = appState.imageTab.msdf

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

local function msdf()
    local windowState = iui.style["windowState"] --- @type SampleWindowState

    local winState = windowState.imageTab.msdf

    iui.style.push()
    iui.style["splitSide"] = "max"

    winState.splitValue = iui.splitView(
        "imageSplit", "horiz", winState.splitValue, content, inspector
    )

    iui.style.pop()
end

return msdf
