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
