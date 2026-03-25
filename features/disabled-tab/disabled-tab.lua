local iui = require "lib.iui"

local function tabDisabled()
    -- This function just shows what a lot of disabled controls look like.

    local x, y, w, h = iui.layout.getPanelBounds()

    iui.panelBackground()

    -- To disable controls, surround them in a pair of
    -- `beginDisabled`/`endDisabled` function calls. IUI maintains a disabled
    -- count internally, so the pairs can be nested.
    iui.beginDisabled()

    -- For aesthetic purposes, I create a centered 300px panel so the controls
    -- don't fill the width of the screen.
    local panelW = math.min(300, w)
    local panelX = math.floor((w - panelW) / 2)
    iui.layout.beginPanel(x + panelX, y, panelW, h)

    iui.label("Disabled View")
    iui.checkbox("Disabled Checkbox", true)
    iui.checkbox("Disabled Checkbox 2", false)
    iui.radio("Disabled Radio", 1, 1)
    iui.radio("Disabled Radio 2", 1, 2)
    iui.button("Disabled Button")
    iui.slider("Disabled Slider", 0.5, 0, 1)
    iui.progress(0.5)
    iui.textField(
        "Disabled Text Field", "Disabled Text Field"
    )

    iui.layout.endPanel()

    iui.endDisabled()
end

return tabDisabled
