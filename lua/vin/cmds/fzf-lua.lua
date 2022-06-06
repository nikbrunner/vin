local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
	return
end

Vin.cmds.fzf_lua = {}

Vin.cmds.fzf_lua.find_files_without_preview = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.25,
			width = 0.5,
			preview = {
				layout = "vertical",
				hidden = "hidden",
			},
		}

	fzf_lua.files(opts)
end

Vin.cmds.fzf_lua.find_files_with_preview = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts
		or {
			height = 0.65,
			width = 0.5,
			row = 0.5,
			preview = {
				layout = "vertical",
				vertical = "down:50%",
			},
		}

	fzf_lua.files(opts)
end

Vin.cmds.fzf_lua.find_files_in_dotfiles = function(opts)
	local nvimConfigPath = "~/.config/nvim"

	opts = opts or {}
	opts.cwd = opts.cwd or nvimConfigPath

	fzf_lua.files(opts)
end

Vin.cmds.fzf_lua.find_files_in_work_notes = function(opts)
	local notes = "~/Documents/notes/dcd-notes"

	opts = opts or {}
	opts.cwd = opts.cwd or notes

	fzf_lua.files(opts)
end

Vin.cmds.fzf_lua.find_colorscheme = function(opts)
	opts = opts or {}
	fzf_lua.colorschemes(opts)
end

Vin.cmds.fzf_lua.find_commands = function(opts)
	opts = opts or {}
	fzf_lua.commands(opts)
end

Vin.cmds.fzf_lua.find_buffers = function(opts)
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

Vin.cmds.fzf_lua.find_in_file = function(opts)
	opts = opts or {}
	fzf_lua.lgrep_curbuf(opts)
end

Vin.cmds.fzf_lua.find_help_tags = function(opts)
	opts = opts or {}
	fzf_lua.help_tags(opts)
end

Vin.cmds.fzf_lua.find_man_page = function(opts)
	opts = opts or {}
	fzf_lua.man_pages(opts)
end

Vin.cmds.fzf_lua.find_old_files = function(opts)
	opts = opts or {}
	fzf_lua.oldfiles(opts)
end

Vin.cmds.fzf_lua.find_problems_in_workspace = function(opts)
	opts = opts or {}
	fzf_lua.lsp_workspace_diagnostics(opts)
end

Vin.cmds.fzf_lua.find_problems_in_document = function(opts)
	opts = opts or {}
	fzf_lua.lsp_document_diagnostics(opts)
end

Vin.cmds.fzf_lua.find_in_registers = function(opts)
	opts = opts or {}
	fzf_lua.registers(opts)
end

Vin.cmds.fzf_lua.find_in_quickfix = function(opts)
	opts = opts or {}
	fzf_lua.quickfix(opts)
end

Vin.cmds.fzf_lua.find_text = function(opts)
	opts = opts or {}
	opts.winopts = opts.winopts or {
		preview = {
			layout = "vertical",
		},
	}

	fzf_lua.live_grep_native(opts)
end

Vin.cmds.fzf_lua.find_word_under_cursor = function(opts)
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

Vin.cmds.fzf_lua.find_keymaps = function(opts)
	opts = opts or {}

	fzf_lua.keymaps(opts)
end

Vin.cmds.fzf_lua.find_symbols_in_workspace = function(opts)
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

Vin.cmds.fzf_lua.find_references = function(opts)
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

Vin.cmds.fzf_lua.find_defintions = function(opts)
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

Vin.cmds.fzf_lua.find_modified_files = function(opts)
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

Vin.cmds.fzf_lua.find_modified_files_with_preview = function(opts)
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

Vin.cmds.fzf_lua.find_branches = function(opts)
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

Vin.cmds.fzf_lua.find_commits = function(opts)
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

Vin.cmds.fzf_lua.find_spelling = function(opts)
	opts = opts or {}
	fzf_lua.spell_suggest(opts)
end

-- Find related files based on the current file's name
-- TODO Default text / prompt doesnt work
Vin.cmds.fzf_lua.find_related_files = function(opts)
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

	Vin.lib.put("opts", opts)

	fzf_lua.files(opts)
end
