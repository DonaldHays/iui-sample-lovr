local iui = require "lib.iui"

local primaryPane = require "sample.features.main-tab.primary-pane"
local secondaryPane = require "sample.features.main-tab.secondary-pane"

local function tabSplit()
    --- @type MainTabWindowState
    local windowState = iui.style["windowState"].mainTab

    -- Widgets can consult the `style` table for additional customization beyond
    -- their arguments. In this case, the minimum and maximum split view resize
    -- limits can be customized.

    -- The `style` table also implements a scope stack paradigm. You can push a
    -- scope, customize the style, and then pop the scope later. Any
    -- customizations you make within a scope will be reset after you pop it.
    -- Scopes inherit all the properties from their ancestor scopes.

    iui.style.push()

    iui.style["splitMinEdge"] = 100
    iui.style["splitMaxEdge"] = 320

    windowState.splitValue = iui.splitView(
        "primarySplit",
        "horiz",
        windowState.splitValue
    )
    primaryPane()
    iui.splitViewDivider()
    secondaryPane()
    iui.endSplitView()

    -- Pushing a scope must be balanced with a pop.
    iui.style.pop()
end

return tabSplit
