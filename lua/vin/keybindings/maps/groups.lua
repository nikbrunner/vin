local cmd = require("vin.core.commands")

local M = {}

M.diagnostics = {
	name = "Diagnostics",
	d = {
		cmd.fzf_lua.find_problems_in_document,
		"⚠  Diagnostics ()",
	},
	w = {
		cmd.fzf_lua.find_problems_in_workspace,
		"⚠  Diagnostics (Workspace)",
	},
}

M.lsp = {
	name = "  LSP",
	j = {
		"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
		"Next Diagnostic",
	},
	k = {
		"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
		"Prev Diagnostic",
	},
	a = { cmd.lsp.code_action, "  Code Action" },
	f = { cmd.lsp.format_file, "  Format" },
	i = { "<cmd>LspInfo<CR>", "Info" },
	I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
	r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
	q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
	p = { "<cmd>TroubleToggle<CR>", " Trouble" },
	d = M.diagnostics,
	s = { cmd.fzf_lua.find_symbols_in_workspace, " Symbol" },
}

M.explorer = {
	name = "  Explorer",
	e = { "<cmd>NeoTreeFocusToggle<CR>", " Tree" },
	f = { "<cmd>NeoTreeFloatToggle<CR>", " Float" },
	r = { "<cmd>NeoTreeReveal<CR>", " Reveal" },
	g = { "<cmd>NeoTreeFloat git_status<CR>", " Git Status" },
	s = { ":SymbolsOutline<CR>", "Symbols" },
}

M.quit = {
	name = "  Quit",
	c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	s = { ":silent wq<CR>", "Save and Quit Pane (:wq)" },
	q = { ":silent q<CR>", "Quit" },
	Q = { ":silent q!<CR>", "Quit /w Force" },
	o = { ":BufOnly<CR>", "Close All Buffers But Current" },
	a = { ":Bwipeout<CR>", "Close all Buffers" },
}

M.buffer = {
	name = "﩯 Buffer",
	k = { ":bprev<CR>", "Previous Buffer" },
	j = { ":bnext<CR>", "Next Buffer" },
	p = { "<cmd>BufferLinePick<CR>", "Pick" },
	f = { cmd.fzf_lua.find_buffers, "Find" },
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
	f = { cmd.copy.fullPath(), "Copy Full Path" },
	r = { cmd.copy.relativePath(), "Copy Relative Path" },
	n = { cmd.copy.fileName(), "Copy File Name" },
}

M.git = {
	name = "  Git",
	s = { "<cmd>:LazyGit<CR>", "Status" }, -- TODO I still get stuck here from time to time
	d = { "<cmd>DiffviewOpen<CR>", "Diffs" },
	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
	j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
	-- m = { commands.fzf_lua.find_modified_files_with_preview, "Modified Files" },
	m = { "<cmd>Telescope git_status<CR>", "Modified Files" },
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
		b = { cmd.fzf_lua.find_branches, "Branches" },
		c = { cmd.fzf_lua.find_commits, "Commits" },
	},
	g = {
		name = "Github",
		p = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
		f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
		i = { "<cmd>Telescope gh issues<CR>", "Issues" },
		r = { "<cmd>Telescope gh run<CR>", "Run" },
	},
}

M.find = {
	name = "  Find",
	["."] = { cmd.fzf_lua.find_files_in_dotfiles, "· Dots" },
	p = { cmd.telescope.find_projects, "  Recent Projects" },
	f = { cmd.fzf_lua.find_files_without_preview, "  Files" },
	F = { cmd.fzf_lua.find_files_with_preview, "  Files (With Preview)" },
	r = { cmd.telescope.find_related_files, "  Related Files" },
	t = { cmd.fzf_lua.find_text, "  Find Text Everywhere" },
	i = { cmd.fzf_lua.find_in_file, "  Find Text in File" },
	w = { cmd.fzf_lua.find_word_under_cursor, "  Find Current Word" },
	q = { cmd.fzf_lua.find_in_quickfix, "  Quickfix" },
	s = { cmd.fzf_lua.find_symbols_in_workspace, " Symbol" },
	S = { cmd.fzf_lua.find_spelling, "  Spelling" },
	b = { cmd.fzf_lua.find_buffers, "﩯 Buffers" },
	R = { cmd.fzf_lua.find_old_files, "  Recent Files" },
	c = { cmd.fzf_lua.find_commands, "  Commands" },
	C = { cmd.fzf_lua.find_colorscheme, "  Colorscheme" },
	a = {
		name = "Advanced",
		t = { cmd.fzf_lua.find_help_tags, "  Help Tags" },
		m = { cmd.fzf_lua.find_man_page, "  Man Pages" },
		r = { cmd.fzf_lua.find_in_registers, "  Registers" },
		k = { cmd.fzf_lua.find_keymaps, "  Keymaps" },
	},
	d = M.diagnostics,
	g = M.git,
}

-- "<cmd>lua require('telescope').extensions.projects.projects()<CR>",

M.harpoon = {
	name = "  Harpoon",
	a = { cmd.harpoon.add_file, "  Add File" },
	m = { cmd.harpoon.toggle_quick_menu, "  Menu" },
	["1"] = {
		function()
			cmd.harpoon.jump_to_file(1)
		end,
		" ",
	},
	["2"] = {
		function()
			cmd.harpoon.jump_to_file(2)
		end,
		" ",
	},
	["3"] = {
		function()
			cmd.harpoon.jump_to_file(3)
		end,
		" ",
	},
	["4"] = {
		function()
			cmd.harpoon.jump_to_file(4)
		end,
		" ",
	},
	["5"] = {
		function()
			cmd.harpoon.jump_to_file(5)
		end,
		" ",
	},
	["6"] = {
		function()
			cmd.harpoon.jump_to_file(6)
		end,
		" ",
	},
	["7"] = {
		function()
			cmd.harpoon.jump_to_file(7)
		end,
		" ",
	},
	["8"] = {
		function()
			cmd.harpoon.jump_to_file(8)
		end,
		" ",
	},
	["9"] = {
		function()
			cmd.harpoon.jump_to_file(9)
		end,
		" ",
	},
}

M.packer = {
	name = "  Packer",
	c = { "<cmd>PackerCompile<CR>", "Compile" },
	i = { "<cmd>PackerInstall<CR>", "Install" },
	s = { "<cmd>PackerSync<CR>", "Sync" },
	S = { "<cmd>PackerStatus<CR>", "Status" },
	u = { "<cmd>PackerUpdate<CR>", "Update" },
}

M.insert = {
	name = "  Insert",
	l = {
		'oconsole.log("LINE: <C-r>=line(".")<Esc>",);<Esc>O<Esc>jf,a ',
		"console.log()",
	},
}

M.tabs = {
	name = "  Tabs",
	n = { ":tabnew<CR>", "New Tab" },
	k = { ":tabprevious<CR>", "Previous Tab" },
	j = { ":tabnext<CR>", "Next Tab" },
	e = { ":tabmove<CR>", "Move Tab To End" },
	h = { ":tabmove -1<CR>", "Move Left" },
	l = { ":tabmove +1<CR>", "Move Right" },
	q = { ":tabclose<CR>", "Close Tab" },
	o = { ":tabonly<CR>", "Only Tab" },
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
