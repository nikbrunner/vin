local gitsigns = protected_require("gitsigns")
local commands = require("vin.core.commands")

local go_to = commands.general.go_to

local WhichKeyGroups = {}

local noLabel = "which_key_ignore"

WhichKeyGroups.noLeader = {
	g = {
		m = {
			commands.fzf_lua.find_modified_files_with_preview,
			noLabel,
		},
		s = { ":LazyGit<CR>", noLabel },
	},

	-- disable Q
	Q = { "<Nop>", noLabel },

	-- Go to Line Start and End
	H = { "^", noLabel },
	L = { "$", noLabel },

	-- Better n and N (Keep Search Hit in the middle)
	n = { "nzzzv", noLabel },
	N = { "Nzzzv", noLabel },

	-- Better j and k
	j = { "gj", noLabel },
	k = { "gk", noLabel },

	-- Navigate buffers and Tabs
	["<S-Tab>"] = { ":bprevious<CR>", "Prev Buffer" },
	["<Tab>"] = { ":bnext<CR>", "Next Buffer" },
	["˙"] = { ":tabprevious<CR>", "Prev Tab" },
	["¬"] = { ":tabnext<CR>", "Next Tab" },

	-- Move text up and down
	["∆"] = { "<Esc>:m .+1<CR>", "Move Up" },
	["˚"] = { "<Esc>:m .-2<CR>", "Move Down" },

	-- Control bindings
	["<C-p>"] = { commands.fzf_lua.find_files_without_preview, "  Files" },
	["<C-e>"] = { commands.fzf_lua.find_buffers, "﩯 Buffers" },
	["<C-_>"] = { commands.fzf_lua.find_in_file, "  Find Text in File" },
	["<C-g>"] = {
		commands.fzf_lua.find_modified_files_with_preview,
		"Find modified files",
	},
	["<C-s>"] = { ":SymbolsOutline<CR>", "Symbols Outline" },
	["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle Quickfix" },
	["<F8>"] = { "<cmd>TroubleToggle<CR>", "TroubleShoot" },

	-- Better window navigation
	["<C-h>"] = { "<C-w>h", "Focus Left" },
	["<C-j>"] = { "<C-w>j", "Focus Down" },
	["<C-k>"] = { "<C-w>k", "Focus Up" },
	["<C-l>"] = { "<C-w>l", "Focus Right" },

	-- Resize with arrows
	["<C-up>"] = { ":resize -2<CR>", "Resize Up" },
	["<C-down>"] = { ":resize +2<CR>", "Resize Down" },
	["<C-left>"] = { ":vertical resize -2<CR>", "Resize Left" },
	["<C-right>"] = { ":vertical resize +2<CR>", "Resize Right" },

	-- go to prev
	["["] = {
		["q"] = {
			function()
				go_to(vim.cmd([[cprev]]))
			end,
			"Prev QuickFix Item",
		},
		["b"] = {
			function()
				go_to(vim.cmd([[bprev]]))
			end,
			"Prev Buffer",
		},
		["e"] = {
			function()
				go_to(vim.diagnostic.goto_prev)
			end,
			"Prev Problem",
		},
		["g"] = {
			function()
				go_to(gitsigns.prev_hunk())
			end,
			"Prev Change",
		},
	},

	-- go to next
	["]"] = {
		["q"] = {
			function()
				go_to(vim.cmd([[cnext]]))
			end,
			"Prev QuickFix Item",
		},
		["b"] = {
			function()
				go_to(vim.cmd([[bnext]]))
			end,
			"Prev Buffer",
		},
		["e"] = {
			function()
				go_to(vim.diagnostic.goto_next)
			end,
			"Prev Problem",
		},
		["g"] = {
			function()
				go_to(gitsigns.next_hunk())
			end,
			"Prev Change",
		},
	},
}

WhichKeyGroups.diagnostics = {
	name = "Diagnostics",
	d = {
		commands.fzf_lua.find_problems_in_document,
		"⚠  Diagnostics ()",
	},
	w = {
		commands.fzf_lua.find_problems_in_workspace,
		"⚠  Diagnostics (Workspace)",
	},
}

WhichKeyGroups.lsp = {
	name = "  LSP",
	j = {
		"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
		"Next Diagnostic",
	},
	k = {
		"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
		"Prev Diagnostic",
	},
	a = { commands.lsp.code_action, "  Code Action" },
	f = { commands.lsp.format_file, "  Format" },
	i = { "<cmd>LspInfo<CR>", "Info" },
	I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
	r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
	q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
	p = { "<cmd>TroubleToggle<CR>", " Trouble" },
	d = WhichKeyGroups.diagnostics,
	s = { commands.fzf_lua.find_symbols_in_workspace, " Symbol" },
}

WhichKeyGroups.explorer = {
	name = "  Explorer",
	e = { "<cmd>NeoTreeFocusToggle<CR>", " Tree" },
	f = { "<cmd>NeoTreeFloatToggle<CR>", " Float" },
	r = { "<cmd>NeoTreeReveal<CR>", " Reveal" },
	g = { "<cmd>NeoTreeFloat git_status<CR>", " Git Status" },
	s = { ":SymbolsOutline<CR>", "Symbols" },
}

WhichKeyGroups.quit = {
	name = "  Quit",
	c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	s = { ":silent wq<CR>", "Save and Quit Pane (:wq)" },
	q = { ":silent q<CR>", "Quit" },
	Q = { ":silent q!<CR>", "Quit /w Force" },
	o = { ":BufOnly<CR>", "Close All Buffers But Current" },
	a = { ":Bwipeout<CR>", "Close all Buffers" },
}

WhichKeyGroups.buffer = {
	name = "﩯 Buffer",
	k = { ":bprev<CR>", "Previous Buffer" },
	j = { ":bnext<CR>", "Next Buffer" },
	p = { "<cmd>BufferLinePick<CR>", "Pick" },
	f = { commands.fzf_lua.find_buffers, "Find" },
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
	q = WhichKeyGroups.quit,
}

WhichKeyGroups.copy = {
	name = "  Copy",
	f = { commands.copy.fullPath(), "Copy Full Path" },
	r = { commands.copy.relativePath(), "Copy Relative Path" },
	n = { commands.copy.fileName(), "Copy File Name" },
}

WhichKeyGroups.git = {
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
		b = { commands.fzf_lua.find_branches, "Branches" },
		c = { commands.fzf_lua.find_commits, "Commits" },
	},
	g = {
		name = "Github",
		p = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
		f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
		i = { "<cmd>Telescope gh issues<CR>", "Issues" },
		r = { "<cmd>Telescope gh run<CR>", "Run" },
	},
}

WhichKeyGroups.find = {
	name = "  Find",
	["."] = { commands.fzf_lua.find_files_in_dotfiles, "· Dots" },
	p = { commands.telescope.find_projects, "  Recent Projects" },
	f = { commands.fzf_lua.find_files_without_preview, "  Files" },
	F = { commands.fzf_lua.find_files_with_preview, "  Files (With Preview)" },
	r = { commands.telescope.find_related_files, "  Related Files" },
	t = { commands.fzf_lua.find_text, "  Find Text Everywhere" },
	i = { commands.fzf_lua.find_in_file, "  Find Text in File" },
	w = { commands.fzf_lua.find_word_under_cursor, "  Find Current Word" },
	q = { commands.fzf_lua.find_in_quickfix, "  Quickfix" },
	s = { commands.fzf_lua.find_symbols_in_workspace, " Symbol" },
	S = { commands.fzf_lua.find_spelling, "  Spelling" },
	b = { commands.fzf_lua.find_buffers, "﩯 Buffers" },
	R = { commands.fzf_lua.find_old_files, "  Recent Files" },
	c = { commands.fzf_lua.find_commands, "  Commands" },
	C = { commands.fzf_lua.find_colorscheme, "  Colorscheme" },
	a = {
		name = "Advanced",
		t = { commands.fzf_lua.find_help_tags, "  Help Tags" },
		m = { commands.fzf_lua.find_man_page, "  Man Pages" },
		r = { commands.fzf_lua.find_in_registers, "  Registers" },
		k = { commands.fzf_lua.find_keymaps, "  Keymaps" },
	},
	d = WhichKeyGroups.diagnostics,
	g = WhichKeyGroups.git,
}

-- "<cmd>lua require('telescope').extensions.projects.projects()<CR>",

WhichKeyGroups.harpoon = {
	name = "  Harpoon",
	a = { commands.harpoon.add_file, "  Add File" },
	m = { commands.harpoon.toggle_quick_menu, "  Menu" },
	["1"] = {
		function()
			commands.harpoon.jump_to_file(1)
		end,
		" ",
	},
	["2"] = {
		function()
			commands.harpoon.jump_to_file(2)
		end,
		" ",
	},
	["3"] = {
		function()
			commands.harpoon.jump_to_file(3)
		end,
		" ",
	},
	["4"] = {
		function()
			commands.harpoon.jump_to_file(4)
		end,
		" ",
	},
	["5"] = {
		function()
			commands.harpoon.jump_to_file(5)
		end,
		" ",
	},
	["6"] = {
		function()
			commands.harpoon.jump_to_file(6)
		end,
		" ",
	},
	["7"] = {
		function()
			commands.harpoon.jump_to_file(7)
		end,
		" ",
	},
	["8"] = {
		function()
			commands.harpoon.jump_to_file(8)
		end,
		" ",
	},
	["9"] = {
		function()
			commands.harpoon.jump_to_file(9)
		end,
		" ",
	},
}

WhichKeyGroups.packer = {
	name = "  Packer",
	c = { "<cmd>PackerCompile<CR>", "Compile" },
	i = { "<cmd>PackerInstall<CR>", "Install" },
	s = { "<cmd>PackerSync<CR>", "Sync" },
	S = { "<cmd>PackerStatus<CR>", "Status" },
	u = { "<cmd>PackerUpdate<CR>", "Update" },
}

WhichKeyGroups.insert = {
	name = "  Insert",
	l = {
		'oconsole.log("LINE: <C-r>=line(".")<Esc>",);<Esc>O<Esc>jf,a ',
		"console.log()",
	},
}

WhichKeyGroups.tabs = {
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

return WhichKeyGroups
