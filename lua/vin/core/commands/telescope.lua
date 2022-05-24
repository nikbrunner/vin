local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local general_commands = require("vin.core.commands.general")

local notification = function(message)
	notify(message, "info", {
		title = "Telescope",
		icon = "",
	})
end

local hard_corner_window = function()
	return {
		{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
		results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
		preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	}
end

local no_preview = function()
	return themes.get_dropdown({
		borderchars = hard_corner_window(),
		width = 0.8,
		previewer = false,
		prompt_title = false,
	})
end

local M = {}

M.find_files_without_preview = function()
	builtin.find_files(no_preview())
end

M.find_files_with_preview = function()
	builtin.find_files(themes.get_ivy({}))
end

M.find_in_file = function()
	builtin.current_buffer_fuzzy_find(themes.get_ivy({}))
end

M.find_text = function()
	builtin.live_grep(themes.get_ivy({}))
end

M.find_word = function()
	local curr_word = vim.fn.expand("<cword>")
	builtin.grep_string(themes.get_ivy({ default_text = curr_word }))
end

M.find_in_quickfix = function()
	builtin.quickfix(themes.get_ivy({}))
end

M.find_symbols_in_workspace = function()
	builtin.lsp_dynamic_workspace_symbols(themes.get_ivy({}))
end

M.find_changed_files = function()
	builtin.git_status({
		width = 0.8,
	})
end

M.find_related_files = function()
	builtin.find_files(themes.get_ivy({
		default_text = general_commands.get_current_filename(),
	}))
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

			builtin.grep_string({ default_text = query })
			notification("Looking for '$" .. curr_word .. "'")
		elseif symbol_type == symbol_types[2] then
			local query = "@mixin " .. curr_word

			builtin.grep_string({ default_text = query })
			notification("Looking for '@" .. curr_word .. "'")
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
	builtin.lsp_definitions()
end

-- List references
M.list_references = function()
	builtin.lsp_references()
end

return M
