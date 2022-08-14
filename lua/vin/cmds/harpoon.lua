local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    return
end

local harpoon_status_ok, _ = pcall(require, "harpoon")
if not harpoon_status_ok then
    return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local icons = {
    marked = " ",
    jumped = "  ",
    error = "  ",
    success = "  ",
}

local title = "Harpoon"

Vin.cmds.harpoon = {}

Vin.cmds.harpoon.add_file = function()
    mark.add_file()

    -- Refresh Neotree after add mark
    -- require("neo-tree.sources.manager").refresh()

    local filename = vim.fn.expand("%:t")

    notify("Added '" .. filename .. "' to Harpoooon!", "info", {
        title = title,
        timeout = 3000,
        icon = icons.marked,
    })
end

Vin.cmds.harpoon.jump_to_file = function(index)
    ui.nav_file(index)
end

Vin.cmds.harpoon.toggle_quick_menu = function()
    ui.toggle_quick_menu()

    notify("Pick or edit these files!", "info", {
        title = title,
        timeout = 3000,
        icon = icons.success,
    })
end
