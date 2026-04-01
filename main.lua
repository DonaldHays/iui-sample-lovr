if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require "lldebugger".start()
end

local launch = require "launch"

local iui = require "lib.iui"
local backend = require "lib.lovr-iui"

local sample = require "sample"

--- @type Texture
local envTex

--- @type LovrIUIWorldWindow
local mainWindow

function lovr.load()
    if launch.mode == "desktop" then
        backend.mouse = require "lib.lovr-mouse"

        lovr.system.setKeyRepeat(true)
    end

    iui.load(backend)

    sample.load({
        gameSunsetImage = lovr.graphics.newTexture(
            "sample/assets/game-sunset.png", {}
        ),
        nineSliceImage = {
            image = lovr.graphics.newTexture(
                "sample/assets/ui-box-slice.png", { mipmaps = false }
            ),
            l = 8,
            t = 8,
            r = 8,
            b = 8
        },
        checkmarkMSDFImage = lovr.graphics.newTexture(
            "lib/iui/assets/glyph-checkmark.png",
            { linear = true, mipmaps = false }
        ),
    })

    if iui.idiom == "vr" then
        lovr.headset.setPassthrough("opaque")

        mainWindow = backend.worldWindow.new()

        envTex = lovr.graphics.newTexture("assets/img/env.png", {})
    end
end

function lovr.update(dt)
    if lovr.system.isKeyDown("escape") then
        lovr.event.quit()
    end

    iui.beginFrame(dt)

    if iui.idiom == "desktop" then
        -- In desktop mode, we use IUI's standard window API to fill the screen.
        iui.beginWindow(lovr.system.getWindowDimensions())

        sample.main()

        iui.endWindow()
    elseif iui.idiom == "vr" then
        -- In VR mode, we have access to the backend's `LovrIUIWorldWindow`
        -- class, which handles windowing in world-space.
        if mainWindow:beginFrame() then
            sample.main()

            mainWindow:endFrame()
        end
    end

    iui.endFrame()
end

function lovr.draw(pass)
    if iui.idiom == "desktop" then
        backend.graphics.pass = pass

        iui.draw()
    elseif iui.idiom == "vr" then
        -- The only important part for the sample here is
        -- `mainWindow:draw(pass)`, down at the end. But here I draw a little VR
        -- environment so you're not stuck in a black void.

        pass:setClear(0.5, 0.5, 0.5)

        pass:setColor(1, 1, 1)
        pass:setMaterial(envTex)
        pass:draw(envTex, 0, 0, 0, 512, math.pi * 0.5, 1, 0, 0)
        pass:draw(envTex, 0, 5, 0, 512, math.pi * 0.5, 1, 0, 0)

        pass:setMaterial()
        pass:setColor(0, 0, 0, 0.75)
        pass:plane(0, 0, 0, 8, 8, math.pi * 0.5, 1, 0, 0, "line", 20, 20)

        mainWindow:draw(pass)
    end

    return false
end

function lovr.recenter()
    if iui.idiom == "vr" then
        mainWindow:recenter()
    end
end

if launch.mode == "desktop" then
    function lovr.mousemoved(x, y, dx, dy)
        backend.mousemoved(x, y, dx, dy)
    end

    function lovr.mousepressed(x, y, button)
        backend.mousepressed(x, y, button)
    end

    function lovr.mousereleased(x, y, button)
        backend.mousereleased(x, y, button)
    end

    function lovr.wheelmoved(x, y)
        backend.wheelmoved(x, y)
    end

    function lovr.keypressed(key, scancode, isRepeat)
        backend.keypressed(key, scancode, isRepeat)
    end

    function lovr.keyreleased(key, scancode)
        backend.keyreleased(key, scancode)
    end

    function lovr.textinput(text)
        backend.textinput(text)
    end
end
