local iui = require "lib.iui"

local function tabImage()
    local assets = iui.style["assets"] --- @type SampleAssets

    local x, y, w, h = iui.layout.getPanelBounds()
    local margin = iui.style["margin"]

    iui.panelBackground()

    iui.layout.beginRow({ kind = "dynamic", count = 1 }, h - margin * 2)
    iui.image(assets.gameSunsetImage)
end

return tabImage
