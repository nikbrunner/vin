local M = {}

M.advanced_g = {
	name = "Go-To",
	h = { vim.lsp.buf.hover, "Hover Doc" },
	l = { vim.diagnostic.open_float, "Hover Problem" },
	d = { Vin.cmds.telescope.go_to_definition, "Go to Definition" },
	i = { vim.lsp.buf.implementation, "Go to Implementation" },
	r = { ":Trouble lsp_references<CR>", "List References" },
	R = { Vin.cmds.telescope.list_references, "List References with FzfLua" },
	y = { ":Telescope lsp_type_definitions<CR>", "Type Defintions" },
}

M.vin = {
	name = "  Vin",
	c = { Vin.cmds.fzf_lua.find_colorscheme, "  Colorscheme" },
	p = {
		name = "𐃃 Copilot",
		e = { "<cmd>Copilot enable<CR>", "Enable" },
		d = { "<cmd>Copilot disable<CR>", "Disable" },
		s = { "<cmd>Copilot status<CR>", "Status" },
		r = { "<cmd>Copilot restart<CR>", "Restart" },
		p = { "<cmd>Copilot panel<CR>", "Panel" },
		o = { "<cmd>Copilot open<CR>", "Open" },
	},
}

M.diagnostics = {
	name = "Diagnostics",
	d = {
		Vin.cmds.fzf_lua.find_problems_in_document,
		"⚠  Diagnostics ()",
	},
	w = {
		Vin.cmds.fzf_lua.find_problems_in_workspace,
		"⚠  Diagnostics (Workspace)",
	},
}

M.lsp = {
	name = "  LSP",
	j = { vim.lsp.diagnostic.goto_next, "Next Diagnostic" },
	k = { vim.lsp.diagnostic.goto_prev, "Prev Diagnostic" },
	a = { Vin.cmds.lsp.code_action, "Code Action" },
	f = { Vin.cmds.lsp.format_file, "Format" },
	i = { "<cmd>LspInfo<CR>", "Info" },
	I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
	n = { Vin.cmds.lsp.rename, "Rename" },
	l = { vim.lsp.codelens.run, "CodeLens Action" },
	q = { "<cmd>Telescope diagnostics<CR>", "Quickfix" },
	s = { Vin.cmds.fzf_lua.find_symbols_in_workspace, "Symbol" },
	r = { Vin.cmds.fzf_lua.find_references, "List References w/ Fuzzy" },
	R = { ":Trouble lsp_references<CR>", "List References w/ Trouble" },
	y = { ":Telescope lsp_type_definitions<CR>", "Type Definitions" },
	h = { vim.diagnostic.open_float, "Hover Problem" },
	d = { Vin.cmds.telescope.go_to_definition, "Go to Definition" },
	p = { "<cmd>Trouble document_diagnostics<CR>", "Trouble" },
	P = { "<cmd>Trouble workspace_diagnostics<CR>", "Trouble" },
	D = { ":Telescope diagnostics<CR>", "Diagnostics" },
}

-- Currently not used
M.explorer = {
	name = "  Explorer",
	e = { "<cmd>Neotree left toggle<CR>", " Tree" },
	f = { "<cmd>Neotree float toggle<CR>", " Float" },
	r = { "<cmd>Neotree reveal<CR>", "  Reveal File" },
	g = { "<cmd>Neotree git_status<CR>", " Git Status" },
	["."] = { "<cmd>Neotree focus<CR>", "⊙ Focus Tree" },
}

M.quit = {
	name = "  Quit",
	c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	s = { ":silent wq<CR>", "Save and Quit Pane (:wq)" },
	q = { ":silent q<CR>", "Quit" },
	Q = { ":silent q!<CR>", "Quit /w Force" },
	o = { ":BufOnly<CR>", "Close All Buffers But Current" },
	w = { ":Bwipeout<CR>", "Wipeout all Buffers" },
	a = { Vin.cmds.save_and_exit, "Save and Exit" },
}

M.buffer = {
	name = "﩯 Buffer",
	k = { ":bprev<CR>", "Previous Buffer" },
	j = { ":bnext<CR>", "Next Buffer" },
	p = { "<cmd>BufferLinePick<CR>", "Pick" },
	f = { Vin.cmds.fzf_lua.find_buffers, "Find" },
	s = {
		name = "Sort",
		r = {
			"<cmd>BufferLineSortByRelativeDirectory",
			"Sort by relative directory",
		},
		d = { "<cmd>BufferLineSortByDirectory", "Sort by directory" },
		e = { "<cmd>BufferLineSortByExtensions", "Sort by extension" },
		t = { "<cmd>BufferLineSortByTabs", "Sort by tabs" },
	},
	q = M.quit,
}

M.copy = {
	name = "  Copy",
	f = { Vin.cmds.copy.fullPath(), "Copy Full Path" },
	r = { Vin.cmds.copy.relativePath(), "Copy Relative Path" },
	n = { Vin.cmds.copy.fileName(), "Copy File Name" },
}

M.git = {
	name = "  Git",
	s = { "<cmd>:LazyGit<CR>", "Status" },
	-- s = { Vin.cmds.term.lazygit, "Status" },
	d = {
		name = " Diffview",
		d = { "<cmd>DiffviewOpen<CR>", "Current Diff" },
		c = { Vin.cmds.diffview.get_diff_to, "Diff   To Custom" },
		h = { "<cmd>DiffviewFileHistory<CR>", "File History" },
		r = { "<cmd>DiffviewRefresh<CR>", "Refresh" },
		q = { "<cmd>DiffviewClose<CR>", "Close" },
	},
	o = { Vin.cmds.fzf_lua.find_modified_files_with_preview, "Open Changed Files" },
	h = {
		name = "Hunk",
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"Undo Stage Hunk",
		},
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		b = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
	},
	b = {
		name = "Buffer",
		s = { "<cmd>lua require 'gitsigns'.stage_buffer()<CR>", "Stage Buffer" },
		r = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
	},
	c = {
		name = "Checkout",
		b = { Vin.cmds.fzf_lua.find_branches, "Branches" },
		c = { Vin.cmds.fzf_lua.find_commits, "Commits" },
	},
	g = {
		name = "Github",
		p = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
		f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
		i = { "<cmd>Telescope gh issues<CR>", "Issues" },
		r = { "<cmd>Telescope gh run<CR>", "Run" },
	},
}

M.search = {
	name = "  Search",
	["."] = { Vin.cmds.fzf_lua.find_files_in_dotfiles, "· Dots" },
	n = {
		name = "  Notes",
		w = { Vin.cmds.fzf_lua.find_files_in_work_notes, "Work" },
	},
	p = { Vin.cmds.telescope.find_projects, "  Recent Projects" },
	f = { Vin.cmds.telescope.find_files_without_preview, "  Files" },
	F = { Vin.cmds.telescope.find_files_with_preview, "  Files (With Preview)" },
	r = { Vin.cmds.telescope.find_related_files, "  Related Files" },
	t = { Vin.cmds.telescope.find_text, "  Find Text Everywhere" },
	d = { "<cmd>TodoTelescope<CR>", "  Todos" },
	o = { Vin.cmds.telescope.find_open_buffer, "﬘  Open Buffers" },
	g = {
		Vin.cmds.fzf_lua.find_modified_files_with_preview,
		" Open Changed Files",
	},
	i = { Vin.cmds.telescope.find_in_file, "  Find Text in File" },
	w = { Vin.cmds.telescope.find_word, "  Find Current Word" },
	q = { Vin.cmds.telescope.find_in_quickfix, "  Quickfix" },
	s = { Vin.cmds.telescope.find_symbols_in_workspace, " Symbol" },
	S = { Vin.cmds.fzf_lua.find_spelling, "  Spelling" },
	b = { Vin.cmds.fzf_lua.find_buffers, "﩯 Buffers" },
	R = { Vin.cmds.fzf_lua.find_old_files, "  Recent Files" },
	c = { Vin.cmds.fzf_lua.find_commands, "  Commands" },
	C = { Vin.cmds.fzf_lua.find_colorscheme, "  Colorscheme" },
	m = { "<cmd>Telescope marks<CR>", " Marks" },
	a = {
		name = "Advanced",
		s = { Vin.cmds.telescope.find_scss_symbol, " SCSS Symbol" },
		h = { Vin.cmds.fzf_lua.find_help_tags, "  Help Tags" },
		H = { "<cmd>Telescope highlights<CR>", "  Highlights" },
		m = { Vin.cmds.fzf_lua.find_man_page, "  Man Pages" },
		r = { Vin.cmds.fzf_lua.find_in_registers, "  Registers" },
		k = { Vin.cmds.fzf_lua.find_keymaps, "  Keymaps" },
	},
}

M.harpoon = {
	name = "  Harpoon",
	a = { Vin.cmds.harpoon.add_file, "  Add File" },
	m = { Vin.cmds.harpoon.toggle_quick_menu, "  Menu" },
	["1"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(1)
		end,
		" ",
	},
	["2"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(2)
		end,
		" ",
	},
	["3"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(3)
		end,
		" ",
	},
	["4"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(4)
		end,
		" ",
	},
	["5"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(5)
		end,
		" ",
	},
	["6"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(6)
		end,
		" ",
	},
	["7"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(7)
		end,
		" ",
	},
	["8"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(8)
		end,
		" ",
	},
	["9"] = {
		function()
			Vin.cmds.harpoon.jump_to_file(9)
		end,
		" ",
	},
}

M.packer = {
	name = "  Packer",
	c = { "<cmd>PackerCompile<CR>", "Compile" },
	i = { "<cmd>PackerInstall<CR>", "Install" },
	-- s = { "<cmd>PackerSync<CR>", "Sync" },
	s = { Vin.cmds.packer.sync_with_snapshot, "Sync" },
	S = { "<cmd>PackerStatus<CR>", "Status" },
	u = { "<cmd>PackerUpdate<CR>", "Update" },
}

M.session = {
	name = "  Session",
	s = { Vin.cmds.session.save_current, "Save Current Session" },
	l = { Vin.cmds.session.load, "Load Session" },
	L = { Vin.cmds.session.load_last, "Load Last Session" },
	["."] = { Vin.cmds.session.load_current_dir, "Load Current Dir Session" },
	d = { Vin.cmds.session.delete, "Delete Session" },
}

M.insert = {
	name = "  Insert",
	l = {
		Vin.cmds.edit.log_word,
		"Log Word",
	},
}

M.tabs = {
	name = "  Tabs",
	n = { ":tabnew<CR>", "New Tab" },
	h = { ":tabprevious<CR>", "Previous Tab" },
	l = { ":tabnext<CR>", "Next Tab" },
	e = { ":tabmove<CR>", "Move Tab To End" },
	r = { ":TabRename ", "Rename Tab" },
	H = { ":tabmove -1<CR>", "Move Left" },
	L = { ":tabmove +1<CR>", "Move Right" },
	q = { ":tabclose<CR>", "Close Tab" },
	o = { ":tabonly<CR>", "Only Tab" },
	O = { "<C-w>T", "Open in new Tab" },
	["1"] = { "1gt", "Tab 1" },
	["2"] = { "2gt", "Tab 2" },
	["3"] = { "3gt", "Tab 3" },
	["4"] = { "4gt", "Tab 4" },
	["5"] = { "5gt", "Tab 5" },
	["6"] = { "6gt", "Tab 6" },
	["7"] = { "7gt", "Tab 7" },
	["8"] = { "8gt", "Tab 8" },
	["9"] = { "9gt", "Tab 9" },
}

return M
