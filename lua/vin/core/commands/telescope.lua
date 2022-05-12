local telescope_builtin_status_ok, telescope_builtins = pcall(
	require,
	"telescope.builtin"
)
if not telescope_builtin_status_ok then
	return
end

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

local general_commands = require("vin.core.commands.general")

local M = {}

-- Find related files based on the current file's name
M.find_related_files = function()
	telescope_builtins.find_files({
		default_text = general_commands.get_current_filename(),
	})
end

M.find_mixin = function()
	local current_word = vim.fn.expand("<cword>")

	telescope_builtins.grep_string({
		default_text = "@mixin " .. current_word,
	})
end

M.find_scss_variable = function()
	local curr_name = vim.fn.expand("<cword>")

	telescope_builtins.grep_string({
		default_text = "$" .. curr_name .. ": ",
	})
end

-- Find project folders with telescope extension
M.find_projects = function()
	telescope.extensions.projects.projects()
end

-- Go to definition
M.go_to_definition = function()
	telescope_builtins.lsp_definitions()
end

-- List references
M.list_references = function()
	telescope_builtins.lsp_references()
end

return M
