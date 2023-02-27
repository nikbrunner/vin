local present, _ = pcall(require, "harpoon")
if not present then
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

local M = {}

M.add_file = function()
    mark.add_file()
    local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:.")
    vim.notify(" " .. relative_path .. " added to Harpoon!")
end

M.jump_to_file = function(index)
    ui.nav_file(index)
end

M.toggle_quick_menu = function()
    ui.toggle_quick_menu()
end

return M
