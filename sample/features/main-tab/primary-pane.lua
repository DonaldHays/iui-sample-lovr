local iui = require "lib.iui"

local function splitPrimaryPane()
    -- The app state was injected into the style table earlier, so we can
    -- retrieve it without needing to take it as a function parameter.

    --- @type MainTabState
    local state = iui.style["appState"].mainTab

    -- Check boxes take their current value, and return their new value.
    state.checkA = iui.checkbox("Check A", state.checkA)
    state.checkB = iui.checkbox("Check B", state.checkB)

    iui.divider()

    -- Radio buttons take the current value and their represented value, and
    -- return their new value.
    state.radioValue = iui.radio("Radio A", state.radioValue, "valueA")
    state.radioValue = iui.radio("Radio B", state.radioValue, "valueB")
    state.radioValue = iui.radio("Radio C", state.radioValue, "valueC")

    -- The `fillPanel` API is handy when you want something to fill the rest of
    -- the height of the current panel.
    iui.layout.fillPanel()
    iui.listView("List", 100, iui.layout.getDefaultRowHeight(), function(index)
        iui.label("Item #" .. index)
    end)
end

return splitPrimaryPane
