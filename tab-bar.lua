local iui = require "lib.iui"

local tabSplit = require "sample.tab-split"
local tabDisabled = require "sample.tab-disabled"

local function sampleTabBar()
    local windowState = iui.style["windowState"] --- @type SampleWindowState

    iui.tabBar(
        function()
            windowState.selectedTab = iui.tabItem(
                "Split", windowState.selectedTab, "tabA"
            )

            windowState.selectedTab = iui.tabItem(
                "Disabled", windowState.selectedTab, "tabB"
            )

            windowState.selectedTab = iui.tabItem(
                "Misc", windowState.selectedTab, "tabC"
            )
        end,
        function()
            if windowState.selectedTab == "tabA" then
                tabSplit()
            elseif windowState.selectedTab == "tabB" then
                tabDisabled()
            elseif windowState.selectedTab == "tabC" then
                -- This tab is too simple to justify breaking it out into its
                -- own file.
                iui.panelBackground()
                iui.label("This Tab Intentionally Left Blank")
            end
        end
    )
end

return sampleTabBar
