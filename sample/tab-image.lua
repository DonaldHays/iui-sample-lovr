local iui = require "lib.iui"

local function tabImage()
    local windowState = iui.style["windowState"] --- @type SampleWindowState
    local appState = iui.style["appState"]       --- @type SampleAppState

    local assets = iui.style["assets"]           --- @type SampleAssets

    iui.style.push()
    iui.style["splitMinEdge"] = 200
    iui.style["splitMaxEdge"] = 200
    iui.style["splitSide"] = "max"

    windowState.imageSplitValue = iui.splitView(
        "imageSplit",
        "horiz",
        windowState.imageSplitValue,
        function()
            local x, y, w, h = iui.layout.getPanelBounds()
            local margin = iui.style["margin"]

            iui.layout.beginRow({ kind = "dynamic", count = 1 }, h - margin * 2)

            iui.style.push()
            iui.style["imageMode"] = appState.imageFillMode

            iui.image(assets.gameSunsetImage)

            iui.style.pop()
        end,
        function()
            iui.label("Fill Mode")
            appState.imageFillMode = iui.radio(
                "Fill", appState.imageFillMode, "fill"
            )

            appState.imageFillMode = iui.radio(
                "Aspect Fit", appState.imageFillMode, "aspectFit"
            )

            appState.imageFillMode = iui.radio(
                "Aspect Fill", appState.imageFillMode, "aspectFill"
            )

            appState.imageFillMode = iui.radio(
                "Center", appState.imageFillMode, "center"
            )
        end
    )

    iui.style.pop()
end

return tabImage
