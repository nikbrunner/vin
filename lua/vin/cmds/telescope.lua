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
local previewers = require("telescope.previewers")
local conf = require("telescope.config")

local notification = function(message)
	notify(message, "info", {
		title = "Telescope",
		icon = "",
	})
end

local delta_previewer = previewers.new_termopen_previewer({
	get_command = function(entry)
		-- this is for status
		-- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
		-- just do an if and return a different command
		if entry.status == "??" or "A " then
			return {
				"git",
				"-c",
				"core.pager=delta",
				"-c",
				"delta.side-by-side=false",
				"diff",
				entry.value,
			}
		end

		-- note we can't use pipes
		-- this command is for git_commits and git_bcommits
		return {
			"git",
			"-c",
			"core.pager=delta",
			"-c",
			"delta.side-by-side=false",
			"diff",
			entry.value .. "^!",
		}
	end,
})

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

Vin.cmds.telescope = {}

Vin.cmds.telescope.find_files_without_preview = function()
	builtin.find_files(no_preview())
end

Vin.cmds.telescope.find_files_with_preview = function()
	builtin.find_files(themes.get_ivy())
end

Vin.cmds.telescope.find_in_file = function()
	builtin.current_buffer_fuzzy_find(themes.get_ivy({}))
end

Vin.cmds.telescope.find_text = function()
	builtin.live_grep(themes.get_ivy({}))
end

Vin.cmds.telescope.find_word = function()
	local curr_word = vim.fn.expand("<cword>")
	builtin.grep_string(themes.get_ivy({ default_text = curr_word }))
end

Vin.cmds.telescope.find_in_quickfix = function()
	builtin.quickfix(themes.get_ivy({}))
end

Vin.cmds.telescope.find_symbols_in_workspace = function()
	builtin.lsp_dynamic_workspace_symbols(themes.get_ivy({}))
end

Vin.cmds.telescope.find_changed_files = function(opts)
	builtin.git_status({
		previewer = delta_previewer,
	})
end

Vin.cmds.telescope.find_commits = function(opts)
	builtin.git_commits({
		previewer = delta_previewer,
	})
end

Vin.cmds.telescope.find_related_files = function()
	local current_filename = Vin.cmds.general.get_current_filename()

	if current_filename then
		builtin.find_files(themes.get_ivy({
			default_text = current_filename,
		}))
	else
		builtin.find_files(themes.get_ivy())
	end
end

Vin.cmds.telescope.find_files_in_config = function(opts)
	local path = "~/.config"

	opts = opts or {}
	opts.cwd = path

	builtin.find_files(opts)
end

Vin.cmds.telescope.find_files_in_work_notes = function(opts)
	local notes = "~/Documents/notes/dcd-notes"

	opts = opts or {}
	opts.cwd = opts.cwd or notes

	builtin.find_files(opts)
end

Vin.cmds.telescope.find_open_buffer = function()
	builtin.buffers(themes.get_ivy({}))
end

Vin.cmds.telescope.find_scss_symbol = function()
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
Vin.cmds.telescope.find_projects = function()
	telescope.extensions.project.project({ display_type = "full" })
end

-- Go to definition
Vin.cmds.telescope.go_to_definition = function()
	builtin.lsp_definitions(themes.get_ivy())
end

-- List references
Vin.cmds.telescope.list_references = function()
	builtin.lsp_references(themes.get_ivy())
end

-- Find document symbols with aerial
Vin.cmds.telescope.find_symbol_with_aerial = function()
	telescope.extensions.aerial.aerial(themes.get_ivy())
end

Vin.cmds.telescope.find_spelling = function()
	builtin.spell_suggest(no_preview())
end

Vin.cmds.telescope.find_colorscheme = function()
	builtin.colorscheme(no_preview())
end

Vin.cmds.telescope.find_oldfiles = function()
	builtin.oldfiles(no_preview())
end

Vin.cmds.telescope.find_commands = function()
	builtin.commands()
end

Vin.cmds.telescope.find_marks = function()
	builtin.marks(themes.get_ivy())
end
