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

local M = {}

M.add_file = function()
	mark.add_file()

	local filename = vim.fn.expand("%:t")

	notify("Added '" .. filename .. "' to Harpoooon!", "info", {
		title = title,
		timeout = 3000,
		icon = icons.marked,
	})
end

M.jump_to_file = function(index)
	ui.nav_file(index)

	local filename = vim.fn.expand("%:t")

	notify("Jumped to '" .. filename .. "'!", "info", {
		timeout = 1000,
		render = "minimal",
	})
end

M.toggle_quick_menu = function()
	ui.toggle_quick_menu()

	notify("Pick or edit these files!", "info", {
		title = title,
		timeout = 3000,
		icon = icons.success,
	})
end

return M
