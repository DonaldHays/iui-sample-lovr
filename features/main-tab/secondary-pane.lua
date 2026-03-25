local iui = require "lib.iui"

--- @param value number
--- @return number newValue
local function labeledSliderSample(value)
    -- This function behaves like a custom widget, but simply composes existing
    -- widgets together.

    -- We're going to create a temporary panel within the bounds of the current
    -- widget, and place a slider and label within. If you drag the split bar in
    -- the sample, you'll see that they move with each other as a unit.

    local sx, sy, sw, sh = iui.layout.getBounds()
    iui.layout.beginPanel(sx, sy, sw, sh, 0)

    -- This is one of the more advanced layout modes. We specify that we'll have
    -- two columns. The second will be fixed at 50 pixels. The first will scale
    -- dynamically to fill the remaining available space, after the fixed
    -- columns are accounted for. The `size` value for the dynamic column is a
    -- relative scale factor. Since there's only one dynamic column, it doesn't
    -- do anything. But if, for example, there were two dynamic columns, one
    -- with a `size` of `2` and a second with a `size` of `1`, the first column
    -- would be allotted twice as much space as the other.
    iui.layout.beginRow({
        kind = "mixed",
        columns = {
            { kind = "dynamic", size = 1 },
            { kind = "fixed",   size = 50 }
        }
    })

    value = iui.slider("Slide Me", value, 0, 1)
    iui.label(tostring(iui.utils.round(value * 1000) / 1000))

    -- Any time you begin a custom panel, it must be balanced with an
    -- `endPanel`.
    iui.layout.endPanel()

    return value
end

local function splitSecondaryPane()
    --- @type MainTabState
    local state = iui.style["appState"].mainTab

    --- @type MainTabWindowState
    local windowState = iui.style["windowState"].mainTab

    -- Do layout using fixed-width columns 250 pixels wide. The layout manager
    -- will fit as many columns of that width within the panel as it can.
    iui.layout.beginRow({ kind = "fixed", size = 250 })

    if iui.button("Click Me") then
        state.labelValue = "Clicked the first button!"
    end

    iui.label(state.labelValue)

    if iui.button("Then Click Me") then
        state.labelValue = "Clicked the second button!"
    end

    -- Call `labeledSliderSample` as though it were a widget.
    state.floatValue = labeledSliderSample(state.floatValue)

    iui.progress(state.floatValue)

    state.stringValue = iui.textField("Some Text", state.stringValue)

    iui.layout.beginRow({ kind = "fixed", size = 300 }, 210)

    -- We pass a custom `IUIScrollManager` instance to this scroll view. Doing
    -- so is optional. If you omit a scroll manager, the widget will create and
    -- manage one itself. However, a widget-managed scroll manager will have a
    -- lifecycle tied to the widget. If the widget doesn't appear in a frame
    -- (such as if you navigate to another tab in this sample app), then the
    -- scroll manager will be destroyed, and a new scroll manager will be
    -- created when the widget next appears, which will appear to the user as
    -- though the scroll position reset. By managing the scroll manager
    -- externally, and passing it in, we can give it a lifecycle longer than the
    -- widget.
    iui.scrollView("scroll", function()
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

        for _ = 1, 10 do
            iui.label("Some more text")
        end
    end, windowState.scrollManager)

    -- Creating a single-column dynamic layout is an easy way to have a divider
    -- fill the width of its panel.
    iui.layout.beginRow({ kind = "dynamic", count = 1 })
    iui.divider()
end

return splitSecondaryPane
