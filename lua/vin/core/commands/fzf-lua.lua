local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
	return
end

local M = {}

M.find_files_without_preview = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.75,
			preview = {
				hidden = "hidden",
			},
		}

	fzf_lua.files(opts)
end

M.find_files_with_preview = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.75,
			width = 0.5,
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.files(opts)
end

M.find_files_in_dotfiles = function(opts)
	local nvimConfigPath = "~/.config/nvim"

	opts = opts or {}
	opts.cwd = opts.cwd or nvimConfigPath

	fzf_lua.files(opts)
end

M.find_files_in_work_notes = function(opts)
	local notes = "~/Documents/notes/dcd-notes"

	opts = opts or {}
	opts.cwd = opts.cwd or notes

	fzf_lua.files(opts)
end

M.find_colorscheme = function(opts)
	opts = opts or {}
	fzf_lua.colorschemes(opts)
end

M.find_commands = function(opts)
	opts = opts or {}
	fzf_lua.commands(opts)
end

M.find_buffers = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.5,
			preview = {
				hidden = "hidden",
			},
		}
	fzf_lua.buffers(opts)
end

M.find_in_file = function(opts)
	opts = opts or {}
	fzf_lua.lgrep_curbuf(opts)
end

M.find_help_tags = function(opts)
	opts = opts or {}
	fzf_lua.help_tags(opts)
end

M.find_man_page = function(opts)
	opts = opts or {}
	fzf_lua.man_pages(opts)
end

M.find_old_files = function(opts)
	opts = opts or {}
	fzf_lua.oldfiles(opts)
end

M.find_problems_in_workspace = function(opts)
	opts = opts or {}
	fzf_lua.lsp_workspace_diagnostics(opts)
end

M.find_problems_in_document = function(opts)
	opts = opts or {}
	fzf_lua.lsp_document_diagnostics(opts)
end

M.find_in_registers = function(opts)
	opts = opts or {}
	fzf_lua.registers(opts)
end

M.find_in_quickfix = function(opts)
	opts = opts or {}
	fzf_lua.quickfix(opts)
end

M.find_text = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts or {
		preview = {
			layout = "vertical",
		},
	}

	fzf_lua.live_grep_native(opts)
end

M.find_word_under_cursor = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			fullscreen = true,
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.grep_cword(opts)
end

M.find_keymaps = function(opts)
	opts = opts or {}

	fzf_lua.keymaps(opts)
end

M.find_symbols_in_workspace = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			fullscreen = true,
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.lsp_live_workspace_symbols(opts)
end

M.find_references = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			fullscreen = true,
			preview = {
				layout = "vertical",
				vertical = "down:75%",
			},
		}

	fzf_lua.lsp_references(opts)
end

M.find_defintions = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.lsp_definitions(opts)
end

M.find_modified_files = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.35,
			preview = {
				hidden = "hidden",
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	-- This doesn't respect newly added files. Telescope does that
	fzf_lua.git_status(opts)
end

M.find_modified_files_with_preview = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			-- height = 0.9,
			-- width = 0.9,
			fullscreen = true,
			preview = {
				layout = "vertical",
				vertical = "down:75%",
			},
		}

	fzf_lua.git_status(opts)
end

M.find_branches = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.35,
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.git_branches(opts)
end

M.find_commits = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.35,
			preview = {
				layout = "vertical",
				vertical = "up:65%",
			},
		}

	fzf_lua.git_commits(opts)
end

M.find_spelling = function(opts)
	opts = opts or {}
	fzf_lua.spell_suggest(opts)
end

-- Find related files based on the current file's name
-- TODO Default text / prompt doesnt work
M.find_related_files = function(opts)
	opts = opts
		or {
			-- files = {
			-- 	prompt = "Find related files: ",
			-- },
			-- default_text = general_commands.get_current_filename(),
			winopts = {
				height = 0.25,
				width = 0.75,
				preview = {
					hidden = "hidden",
				},
			},
		}

	put("opts", opts)

	fzf_lua.files(opts)
end

return M
