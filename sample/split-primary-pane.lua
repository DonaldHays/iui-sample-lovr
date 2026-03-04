local iui = require "lib.iui"

local function splitPrimaryPane()
    -- The app state was injected into the style table earlier, so we can
    -- retrieve it without needing to take it as a function parameter.

    --- @type SampleAppState
    local state = iui.style["appState"]

    -- Check boxes take their current value, and return their new value.
    state.checkA = iui.checkbox("Check A", state.checkA)
    state.checkB = iui.checkbox("Check B", state.checkB)

    iui.divider()

    -- Radio buttons take the current value and their represented value, and
    -- return their new value.
    state.radioValue = iui.radio("Radio A", state.radioValue, "valueA")
    state.radioValue = iui.radio("Radio B", state.radioValue, "valueB")
    state.radioValue = iui.radio("Radio C", state.radioValue, "valueC")

    -- Here we do a little layout trick. We retrieve the current panel, and
    -- calculate a custom height to fill the remaining space (less the margin).
    local panel = iui.layout.getPanel()
    local scrollHeight = panel.h - (panel.rowY + panel.margin)

    iui.layout.beginRow({ kind = "dynamic", count = 1 }, scrollHeight)
    iui.scrollView("scroll2", function()
        iui.label("Hello, World 1")
        iui.label("Hello, World 2")
        iui.label("Hello, World 3")
        iui.label("Hello, World 4")

        if iui.button("Clip A") then
            print("Clip A")
        end

        if iui.button("Clip B") then
            print("Clip B")
        end

        if iui.button("Clip C") then
            print("Clip C")
        end
    end)
end

return splitPrimaryPane
