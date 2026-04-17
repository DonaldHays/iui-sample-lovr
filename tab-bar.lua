local iui = require "lib.iui"

local tabMain = require "sample.features.main-tab.main-tab"
local tabDisabled = require "sample.features.disabled-tab.disabled-tab"
local tabImage = require "sample.features.image-tab.tab-image"

local function sampleTabBar()
    local windowState = iui.style["windowState"] --- @type SampleWindowState

    iui.tabBar()

    windowState.selectedTab = iui.tabItem(
        "Split", windowState.selectedTab, "tabA"
    )

    windowState.selectedTab = iui.tabItem(
        "Disabled", windowState.selectedTab, "tabB"
    )

    windowState.selectedTab = iui.tabItem(
        "Images", windowState.selectedTab, "tabC"
    )

    windowState.selectedTab = iui.tabItem(
        "Misc", windowState.selectedTab, "tabD"
    )

    iui.tabBarDivider()

    if windowState.selectedTab == "tabA" then
        tabMain()
    elseif windowState.selectedTab == "tabB" then
        tabDisabled()
    elseif windowState.selectedTab == "tabC" then
        tabImage()
    elseif windowState.selectedTab == "tabD" then
        -- This tab is too simple to justify breaking it out into its
        -- own file.
        iui.panelBackground()
        iui.label("This Tab Intentionally Left Blank")
    end

    iui.endTabBar()
end

return sampleTabBar
