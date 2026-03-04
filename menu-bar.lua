local iui = require "lib.iui"

-- You'll see many menu items define keyboard shortcuts here. IUI merely
-- displays the shortcuts, it doesn't listen handle them in any way. It's up to
-- you to implement a keyboard shortcut handler.

local function fileMenu()
    if iui.subMenu("File") then
        if iui.menuItem("New", "Ctrl+N") then
            print("New!")
        end

        iui.divider()

        if iui.menuItem("Open...", "Ctrl+O") then
            print("Open!")
        end

        if iui.subMenu("Open Recent") then
            if iui.subMenu("Even More") then
                if iui.menuItem("Last File") then
                    print("All done!")
                end

                iui.endSubMenu()
            end

            iui.divider()

            if iui.menuItem("File 1") then
                print("File 1")
            end

            if iui.menuItem("File 2") then
                print("File 2")
            end

            if iui.menuItem("File 3") then
                print("File 3")
            end

            iui.endSubMenu()
        end

        iui.divider()

        if iui.menuItem("Save", "Ctrl+S") then
            print("Save!")
        end
        if iui.menuItem("Save As...", "Ctrl+Shift+S") then
            print("Save As!")
        end

        iui.divider()

        if iui.subMenu("Share") then
            if iui.menuItem("Share File") then
                print("Time to share!")
            end

            iui.endSubMenu()
        end

        if iui.menuItem("Exit", "Ctrl+Q") then
            iui.backend.system.quit()
        end

        iui.endSubMenu()
    end
end

local function editMenu()
    if iui.subMenu("Edit") then
        iui.beginDisabled()
        if iui.menuItem("Undo", "Ctrl+Z") then
            print("Undo!")
        end
        if iui.menuItem("Redo", "Ctrl+Y") then
            print("Redo!")
        end
        iui.endDisabled()

        iui.divider()

        if iui.menuItem("Cut", "Ctrl+X") then
            print("Cut!")
        end
        if iui.menuItem("Copy", "Ctrl+C") then
            print("Copy!")
        end
        if iui.menuItem("Paste", "Ctrl+V") then
            print("Paste!")
        end

        iui.endSubMenu()
    end
end

local function helpMenu()
    if iui.subMenu("Help") then
        if iui.menuItem("About...") then
            print("About")
        end

        iui.endSubMenu()
    end
end

--- @param content fun()
local function sampleMenuBar(content)
    -- The menu bar widget takes a function that defines the menu bar items, and
    -- another function that supplies their content below the menu bar in the
    -- containing panel. We declare the menu items ourselves here, but we take
    -- the content function as a parameter.

    iui.menuBar(function()
        fileMenu()
        editMenu()
        helpMenu()
    end, content)
end

return sampleMenuBar
