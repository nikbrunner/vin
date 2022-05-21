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

local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local general_commands = require("vin.core.commands.general")

local telescope_notification = function(message)
	notify(message, "info", {
		title = "Telescope",
		icon = "",
	})
end

local M = {}

-- Find related files based on the current file's name
M.find_related_files = function()
	telescope_builtins.find_files({
		default_text = general_commands.get_current_filename(),
	})
end

M.find_scss_symbol = function()
	local curr_word = vim.fn.expand("<cword>")

	local prompt = "What are you looking for?"

	local symbol_types = { "variable", "mixin" }

	local handleFormat = function(item)
		if item == symbol_types[1] then
			return "$" .. item
		elseif item == symbol_types[2] then
			return "@" .. item
		end
	end

	local handleSelection = function(symbol_type)
		if symbol_type == symbol_types[1] then
			local query = "$" .. curr_word .. ": "

			telescope_builtins.grep_string({ default_text = query })
			telescope_notification("Looking for '$" .. curr_word .. "'")
		elseif symbol_type == symbol_types[2] then
			local query = "@mixin " .. curr_word

			telescope_builtins.grep_string({ default_text = query })
			telescope_notification("Looking for '@" .. curr_word .. "'")
		end
	end

	vim.ui.select(symbol_types, {
		prompt = prompt,
		format_item = handleFormat,
	}, handleSelection)
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
