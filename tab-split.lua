local iui = require "lib.iui"

local splitPrimaryPane = require "sample.split-primary-pane"
local splitSecondaryPane = require "sample.split-secondary-pane"

local function tabSplit()
    local windowState = iui.style["windowState"] --- @type SampleWindowState

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

    windowState.primarySplitValue = iui.splitView(
        "primarySplit",
        "horiz",
        windowState.primarySplitValue,
        splitPrimaryPane,
        splitSecondaryPane
    )

    -- Pushing a scope must be balanced with a pop.
    iui.style.pop()
end

return tabSplit
