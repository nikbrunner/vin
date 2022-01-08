local functions = require("user.utils.functions")

local WhichKeyGroups = {}

WhichKeyGroups.lsp = {
	name = "  LSP",
	j = {
		"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
		"Next Diagnostic",
	},
	k = {
		"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
		"Prev Diagnostic",
	},
	a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
	i = { "<cmd>LspInfo<cr>", "Info" },
	I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
	r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	d = {
		name = "Diagnostics",
		d = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
	},
	s = {
		name = "Symbols",
		d = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		w = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
}

WhichKeyGroups.quit = {
	name = "  Quit",
	c = { "<cmd>Bdelete!<cr>", "Close Buffer" },
	q = { ":silent wq<cr>", "Save and Quit Pane (:wq)" },
	Q = { ":silent q!<cr>", "Quit (:q!)" },
	o = { ":BufOnly<cr>", "Close All Buffers But Current" },
}

WhichKeyGroups.buffer = {
	name = "﩯 Buffer",
	["["] = { ":bprev<cr>", "Previous Buffer" },
	["]"] = { ":bnext<cr>", "Next Buffer" },
	p = { "<cmd>BufferLinePick<cr>", "Pick" },
	f = { "<cmd>Telescope buffers<cr>", "Find" },
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
	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
	j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
	m = { -- TODO Telescope Wrapper function or resolve existing one
		function()
			local opts = require("telescope.themes").get_dropdown({
				layout_config = { height = 15 },
				previewer = false,
			})
			require("telescope.builtin").git_status(opts)
		end,
		"Modified Files (No Preview)",
	},
	M = { "<cmd>Telescope git_status<cr>", "Modified Files (With Preview)" },
	h = {
		name = "Hunk",
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
	},
	b = {
		name = "Buffer",
		s = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer" },
		r = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
	},
	c = {
		name = "Checkout",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	},

	-- TODO This looks ugly af.. Do I use this wrong?
	-- d = {
	-- 	"<cmd>Gitsigns diffthis HEAD<cr>",
	-- 	"Diff",
	-- },

	-- TODO Setup Telescrope GH and merge my PR!!!
	-- G = {
	-- 	name = "Github",
	-- 	p = { cmds.telescope("gh pull_request"), "Pull Requests" },
	-- 	f = { cmds.telescope("gh pull_request_files"), "Pull Requests Files" },
	-- 	i = { cmds.telescope("gh issues"), "Issues" },
	-- 	r = { cmds.telescope("gh run"), "Run" },
	-- },
}

WhichKeyGroups.find = {
	name = "  Find",
	b = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"﩯 Buffers",
	},
	d = { "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", "·· Dots" },
	c = { "<cmd>Telescope commands<cr>", "  Commands" },
	C = { "<cmd>Telescope colorscheme<cr>", "  Colorscheme" },
	f = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"  Files",
	},
	i = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "  Find in File" },
	h = { "<cmd>Telescope help_tags<cr>", "  Help" },
	M = { "<cmd>Telescope man_pages<cr>", "  Man Pages" },
	r = { "<cmd>Telescope oldfiles<cr>", "  Recent Files" },
	p = { "<cmd>Telescope diagnostics<cr>", "Problems" },
	P = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "  Recent Projects" },
	R = { "<cmd>Telescope registers<cr>", "  Registers" },
	t = { "<cmd>Telescope live_grep theme=ivy<cr>", "  Text" },
	T = { "<cmd>Telescope<cr>", "  Telescope" },
	q = { "<cmd>Telescope quickfix<cr>", "  Quickfix" },
	w = { "<cmd>Telescope grep_string<cr>", "  Current Word" },
	s = {
		name = "Symbols",
		d = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		w = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	k = { "<cmd>Telescope keymaps<cr>", "  Keymaps" },
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
	c = { "<cmd>PackerCompile<cr>", "Compile" },
	i = { "<cmd>PackerInstall<cr>", "Install" },
	s = { "<cmd>PackerSync<cr>", "Sync" },
	S = { "<cmd>PackerStatus<cr>", "Status" },
	u = { "<cmd>PackerUpdate<cr>", "Update" },
}

WhichKeyGroups.insert = {
	name = "  Insert",
	l = {
		'oconsole.log("LINE: <C-r>=line(".")<Esc>",);<Esc>O<Esc>jf,a ',
		"console.log()",
	},
}

return WhichKeyGroups
