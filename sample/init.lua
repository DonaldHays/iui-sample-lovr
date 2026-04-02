local iui = require "lib.iui"

local SampleAppState = require "sample.models.app-state"
local SampleWindowState = require "sample.models.window-state"

local sampleMenuBar = require "sample.menu-bar"
local sampleTabBar = require "sample.tab-bar"

--- @class SampleAssets
--- @field gameSunsetImage any
--- @field nineSliceImage IUIImage9Slice
--- @field checkmarkMSDFImage any
--- @field nineSliceMSDFImage IUIImage9Slice

-- For this sample, I created two "model" object types: an app state and a
-- window state. The app state contains the values for various controls, while
-- the window state contains presentation information for the window, like which
-- tab is selected. There's no need to model your work the same way, nor even
-- use dependency injected-objects like this sample does, this is just one
-- example of how you could create a scalable architecture.

local state = SampleAppState.new()
local windowState = SampleWindowState.new()

--- @class Sample
--- @field assets SampleAssets
local sample = {}

--- @param assets SampleAssets
function sample.load(assets)
    sample.assets = assets
end

function sample.main()
    -- We can use the `style` table for dependency injection. Here, we inject
    -- the app and window states in our main function, along with some assets,
    -- making them available from anywhere in the UI.
    iui.style["appState"] = state
    iui.style["windowState"] = windowState
    iui.style["assets"] = sample.assets

    sampleMenuBar(
        sampleTabBar
    )
end

return sample
