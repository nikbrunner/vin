local cmds = require("vin.core.commands")

local MappingGroups = {}

MappingGroups.advanced_g = {
	name = "Go-To",
	h = { vim.lsp.buf.hover, "Hover Doc" },
	d = { cmds.telescope.go_to_definition, "Go to Definition" },
	i = { vim.lsp.buf.implementation, "Go to Implementation" },
	r = { ":Trouble lsp_references<CR>", "List References" },
	R = { cmds.telescope.list_references, "List References with FzfLua" },
	l = { vim.diagnostic.open_float, "Hover Problem" },
	m = {
		cmds.fzf_lua.find_modified_files_with_preview,
		"Find Modified Files with Preview",
	},
	s = { ":LazyGit<CR>", "LazyGit" },
}

MappingGroups.diagnostics = {
	name = "Diagnostics",
	d = {
		cmds.fzf_lua.find_problems_in_document,
		"⚠  Diagnostics ()",
	},
	w = {
		cmds.fzf_lua.find_problems_in_workspace,
		"⚠  Diagnostics (Workspace)",
	},
}

MappingGroups.lsp = {
	name = "  LSP",
	j = { vim.lsp.diagnostic.goto_next, "Next Diagnostic" },
	k = { vim.lsp.diagnostic.goto_prev, "Prev Diagnostic" },
	a = { cmds.lsp.code_action, "Code Action" },
	f = { cmds.lsp.format_file, "Format" },
	i = { "<cmd>LspInfo<CR>", "Info" },
	I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
	n = { cmds.lsp.symbol_rename, "Change Name" },
	l = { vim.lsp.codelens.run, "CodeLens Action" },
	q = { "<cmd>Telescope diagnostics<CR>", "Quickfix" },
	p = { "<cmd>TroubleToggle<CR>", "Trouble" },
	s = { cmds.fzf_lua.find_symbols_in_workspace, "Symbol" },
	r = { ":Trouble lsp_references<CR>", "List References" },
	R = { cmds.fzf_lua.find_references, "List References" },
	h = { vim.diagnostic.open_float, "Hover Problem" },
	d = { cmds.telescope.go_to_definition, "Go to Definition" },
	D = MappingGroups.diagnostics,
}

-- Currently not used
MappingGroups.explorer = {
	name = "  Explorer",
	e = { "<cmd>Neotree left toggle<CR>", " Tree" },
	f = { "<cmd>Neotree float toggle<CR>", " Float" },
	r = { "<cmd>Neotree reveal<CR>", " Reveal" },
	g = { "<cmd>Neotree git_status<CR>", " Git Status" },
}

MappingGroups.quit = {
	name = "  Quit",
	c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	s = { ":silent wq<CR>", "Save and Quit Pane (:wq)" },
	q = { ":silent q<CR>", "Quit" },
	Q = { ":silent q!<CR>", "Quit /w Force" },
	o = { ":BufOnly<CR>", "Close All Buffers But Current" },
	a = { ":Bwipeout<CR>", "Close all Buffers" },
}

MappingGroups.buffer = {
	name = "﩯 Buffer",
	k = { ":bprev<CR>", "Previous Buffer" },
	j = { ":bnext<CR>", "Next Buffer" },
	p = { "<cmd>BufferLinePick<CR>", "Pick" },
	f = { cmds.fzf_lua.find_buffers, "Find" },
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
	q = MappingGroups.quit,
}

MappingGroups.copy = {
	name = "  Copy",
	f = { cmds.copy.fullPath(), "Copy Full Path" },
	r = { cmds.copy.relativePath(), "Copy Relative Path" },
	n = { cmds.copy.fileName(), "Copy File Name" },
}

MappingGroups.git = {
	name = "  Git",
	s = { "<cmd>:LazyGit<CR>", "Status" }, -- TODO I still get stuck here from time to time
	d = { "<cmd>DiffviewOpen<CR>", "Diffs" },
	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
	j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
	-- m = { commands.fzf_lua.find_modified_files_with_preview, "Modified Files" },
	m = { cmds.fzf_lua.find_modified_files_with_preview, "Modified Files" },
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
		b = { cmds.fzf_lua.find_branches, "Branches" },
		c = { cmds.fzf_lua.find_commits, "Commits" },
	},
	g = {
		name = "Github",
		p = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
		f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
		i = { "<cmd>Telescope gh issues<CR>", "Issues" },
		r = { "<cmd>Telescope gh run<CR>", "Run" },
	},
}

MappingGroups.search = {
	name = "  Search",
	["."] = { cmds.fzf_lua.find_files_in_dotfiles, "· Dots" },
	p = { cmds.telescope.find_projects, "  Recent Projects" },
	f = { cmds.fzf_lua.find_files_without_preview, "  Files" },
	F = { cmds.fzf_lua.find_files_with_preview, "  Files (With Preview)" },
	-- TODO This is broken. Telescope throws a segmentation fault and fzf_lua doesn't work wit ha default prompt
	r = { cmds.telescope.find_related_files, "  Related Files" },
	m = { cmds.telescope.find_mixin, "@mixin" },
	v = { cmds.telescope.find_scss_variable, " SCSS Variable" },
	t = { cmds.fzf_lua.find_text, "  Find Text Everywhere" },
	i = { cmds.fzf_lua.find_in_file, "  Find Text in File" },
	w = { cmds.fzf_lua.find_word_under_cursor, "  Find Current Word" },
	q = { cmds.fzf_lua.find_in_quickfix, "  Quickfix" },
	s = { cmds.fzf_lua.find_symbols_in_workspace, " Symbol" },
	S = { cmds.fzf_lua.find_spelling, "  Spelling" },
	b = { cmds.fzf_lua.find_buffers, "﩯 Buffers" },
	R = { cmds.fzf_lua.find_old_files, "  Recent Files" },
	c = { cmds.fzf_lua.find_commands, "  Commands" },
	C = { cmds.fzf_lua.find_colorscheme, "  Colorscheme" },
	a = {
		name = "Advanced",
		t = { cmds.fzf_lua.find_help_tags, "  Help Tags" },
		m = { cmds.fzf_lua.find_man_page, "  Man Pages" },
		r = { cmds.fzf_lua.find_in_registers, "  Registers" },
		k = { cmds.fzf_lua.find_keymaps, "  Keymaps" },
	},
	d = MappingGroups.diagnostics,
	g = MappingGroups.git,
}

-- "<cmd>lua require('telescope').extensions.projects.projects()<CR>",

MappingGroups.harpoon = {
	name = "  Harpoon",
	a = { cmds.harpoon.add_file, "  Add File" },
	m = { cmds.harpoon.toggle_quick_menu, "  Menu" },
	["1"] = {
		function()
			cmds.harpoon.jump_to_file(1)
		end,
		" ",
	},
	["2"] = {
		function()
			cmds.harpoon.jump_to_file(2)
		end,
		" ",
	},
	["3"] = {
		function()
			cmds.harpoon.jump_to_file(3)
		end,
		" ",
	},
	["4"] = {
		function()
			cmds.harpoon.jump_to_file(4)
		end,
		" ",
	},
	["5"] = {
		function()
			cmds.harpoon.jump_to_file(5)
		end,
		" ",
	},
	["6"] = {
		function()
			cmds.harpoon.jump_to_file(6)
		end,
		" ",
	},
	["7"] = {
		function()
			cmds.harpoon.jump_to_file(7)
		end,
		" ",
	},
	["8"] = {
		function()
			cmds.harpoon.jump_to_file(8)
		end,
		" ",
	},
	["9"] = {
		function()
			cmds.harpoon.jump_to_file(9)
		end,
		" ",
	},
}

MappingGroups.packer = {
	name = "  Packer",
	c = { "<cmd>PackerCompile<CR>", "Compile" },
	i = { "<cmd>PackerInstall<CR>", "Install" },
	s = { "<cmd>PackerSync<CR>", "Sync" },
	S = { "<cmd>PackerStatus<CR>", "Status" },
	u = { "<cmd>PackerUpdate<CR>", "Update" },
}

MappingGroups.insert = {
	name = "  Insert",
	l = {
		'oconsole.log("LINE: <C-r>=line(".")<Esc>",);<Esc>O<Esc>jf,a ',
		"console.log()",
	},
}

MappingGroups.tabs = {
	name = "  Tabs",
	n = { ":tabnew<CR>", "New Tab" },
	k = { ":tabprevious<CR>", "Previous Tab" },
	j = { ":tabnext<CR>", "Next Tab" },
	e = { ":tabmove<CR>", "Move Tab To End" },
	h = { ":tabmove -1<CR>", "Move Left" },
	l = { ":tabmove +1<CR>", "Move Right" },
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

return MappingGroups
