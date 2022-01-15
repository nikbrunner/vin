local functions = require("user.utils.functions")

local WhichKeyGroups = {}

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
	a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
	f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
	i = { "<cmd>LspInfo<CR>", "Info" },
	I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
	r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	d = {
		name = "Diagnostics",
		d = {
			"<cmd>Telescope diagnostics bufnr=0<CR>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope diagnostics<CR>",
			"Workspace Diagnostics",
		},
	},
	s = {
		name = "Symbols",
		d = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		w = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
			"Workspace Symbols",
		},
	},
	l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
	q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
}

WhichKeyGroups.quit = {
	name = "  Quit",
	c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	q = { ":silent wq<CR>", "Save and Quit Pane (:wq)" },
	Q = { ":silent q!<CR>", "Quit (:q!)" },
	o = { ":BufOnly<CR>", "Close All Buffers But Current" },
	a = { ":Bwipeout<CR>", "Close all Buffers" },
}

WhichKeyGroups.buffer = {
	name = "﩯 Buffer",
	k = { ":bprev<CR>", "Previous Buffer" },
	j = { ":bnext<CR>", "Next Buffer" },
	p = { "<cmd>BufferLinePick<CR>", "Pick" },
	f = { "<cmd>Telescope buffers<CR>", "Find" },
	s = {
		name = "Sort",
		r = { "<cmd>BufferLineSortByRelativeDirectory", "Sort by relative directory" },
		d = { "<cmd>BufferLineSortByDirectory", "Sort by directory" },
		e = { "<cmd>BufferLineSortByExtensions", "Sort by extension" },
		t = { "<cmd>BufferLineSortByTabs", "Sort by tabs" },
	},
	q = WhichKeyGroups.quit,
}

WhichKeyGroups.copy = {
	name = "  Copy",
	f = { functions.copy.fullPath(), "Copy Full Path" },
	r = { functions.copy.relativePath(), "Copy Relative Path" },
	n = { functions.copy.fileName(), "Copy File Name" },
}

WhichKeyGroups.git = {
	name = "  Git",
	s = { "<cmd>:LazyGit<CR>", "Status" }, -- TODO I still get stuck here from time to time
	d = { "<cmd>DiffviewOpen<CR>", "Diffs" },
	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
	j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
	m = {
		function()
			local opts = require("telescope.themes").get_dropdown({
				layout_config = { height = 15 },
				previewer = false,
			})
			require("telescope.builtin").git_status(opts)
		end,
		"Modified Files (No Preview)",
	},
	M = { "<cmd>Telescope git_status<CR>", "Modified Files (With Preview)" },
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
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
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
	name = "  Find",
	b = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
		"﩯 Buffers",
	},
	d = { "<cmd>Telescope find_files cwd=~/.config/nvim<CR>", "·· Dots" },
	c = { "<cmd>Telescope commands<CR>", "  Commands" },
	C = { "<cmd>Telescope colorscheme<CR>", "  Colorscheme" },
	f = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
		"  Files",
	},
	g = WhichKeyGroups.git,
	i = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "  Find in File" },
	h = { "<cmd>Telescope help_tags<CR>", "  Help" },
	H = { "<cmd>Telescope man_pages<CR>", "  Man Pages" },
	r = { "<cmd>Telescope oldfiles<CR>", "  Recent Files" },
	p = { "<cmd>Telescope diagnostics<CR>", "Problems" },
	P = { "<cmd>lua require('telescope').extensions.projects.projects()<CR>", "  Recent Projects" },
	R = { "<cmd>Telescope registers<CR>", "  Registers" },
	t = { "<cmd>Telescope live_grep theme=ivy<CR>", "  Text" },
	T = { "<cmd>Telescope<CR>", "  Telescope" },
	q = { "<cmd>Telescope quickfix<CR>", "  Quickfix" },
	w = { "<cmd>Telescope grep_string<CR>", "  Current Word" },
	s = {
		name = "Symbols",
		d = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		w = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
			"Workspace Symbols",
		},
	},
	k = { "<cmd>Telescope keymaps<CR>", "  Keymaps" },
}

WhichKeyGroups.harpoon = {
	name = "  Harpoon",
	a = {
		function()
			require("harpoon.mark").add_file()
		end,
		"  Add File",
	},
	m = {
		function()
			require("harpoon.ui").toggle_quick_menu()
		end,
		"  Menu",
	},
	["1"] = {
		function()
			require("harpoon.ui").nav_file(1)
		end,
		" ",
	},
	["2"] = {
		function()
			require("harpoon.ui").nav_file(2)
		end,
		" ",
	},
	["3"] = {
		function()
			require("harpoon.ui").nav_file(3)
		end,
		" ",
	},
	["4"] = {
		function()
			require("harpoon.ui").nav_file(4)
		end,
		" ",
	},
	["5"] = {
		function()
			require("harpoon.ui").nav_file(5)
		end,
		" ",
	},
	["6"] = {
		function()
			require("harpoon.ui").nav_file(6)
		end,
		" ",
	},
	["7"] = {
		function()
			require("harpoon.ui").nav_file(7)
		end,
		" ",
	},
	["8"] = {
		function()
			require("harpoon.ui").nav_file(8)
		end,
		" ",
	},
	["9"] = {
		function()
			require("harpoon.ui").nav_file(9)
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

return WhichKeyGroups
