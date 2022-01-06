local WhichKeyGroups = {}

-- WhichKeyGroups.go = {
-- 	name = "  Go",
-- 	h = { cmds.lspsaga("hover_doc"), "Show Hover" },
-- 	s = { cmds.lazyGit(), "Git Status" },
-- 	m = {
-- 		-- TODO Telescope Wrapper function or resolve existing one
-- 		function()
-- 			local opts = require("telescope.themes").get_dropdown({
-- 				layout_config = { height = 15 },
-- 				previewer = false,
-- 			})
-- 			require("telescope.builtin").git_status(opts)
-- 		end,
-- 		"Modified Files (No Preview)",
-- 	},
-- 	M = { cmds.telescope("git_status"), "Modified Files (With Preview)" },
-- 	d = { cmds.vimLsp("definition()"), "Goto Definition" },
-- 	D = { cmds.lspsaga("preview_definition"), "Preview Definition" },
-- 	r = { cmds.lspsaga("lsp_finder"), "Goto References" },
-- 	R = { cmds.vimLsp("references()"), "References to QF" },
-- 	I = { cmds.vimLsp("implementation()"), "Goto Implementation" },
-- }

-- WhichKeyGroups.goToPrevious = {
-- 	name = "  Previous",
-- 	q = { ":cprev<CR>zz", "Quickfix Item" },
-- 	e = { cmds.lspsaga("diagnostic_jump_prev"), "Error" },
-- 	b = { cmds.buffer("Previous"), "Buffer" },
-- 	g = { cmds.gitsigns("prev_hunk"), "Hunk" },
-- }

-- WhichKeyGroups.goToNext = {
-- 	name = "  Next",
-- 	q = { ":cnext<CR>zz", "Quickfix Item" },
-- 	e = { cmds.lspsaga("diagnostic_jump_next"), "Error" },
-- 	b = { cmds.buffer("Next"), "Buffer" },
-- 	g = { cmds.gitsigns("next_hunk"), "Hunk" },
-- }

-- WhichKeyGroups.block = {
-- 	select = {
-- 		name = "  Select Block",
-- 		v = { "^v$", "Select Line from Start to End" },
-- 		["{"] = { "^vf{%", "Select { Block" },
-- 		["("] = { "^vf(%", "Select ( Block" },
-- 		["["] = { "^vf[%", "Select [ Block" },
-- 	},
-- 	delete = {
-- 		name = "  Delete Block",
-- 		["{"] = { "^vf{%d", "Delete { Block" },
-- 		["("] = { "^vf(%d", "Delete ( Block" },
-- 		["["] = { "^vf[%d", "Delete [ Block" },
-- 	},
-- 	yank = {
-- 		name = "  Yank Block",
-- 		["{"] = { "^vf{%y", "Yank { Block" },
-- 		["("] = { "^vf(%y", "Yank ( Block" },
-- 		["["] = { "^vf[%y", "Yank [ Block" },
-- 	},
-- }

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

-- WhichKeyGroups.quit = {
-- 	name = "  Quit",
-- 	w = { cmds.buffer("Wipeout"), "Wipeout" },
-- 	c = { cmds.buffer("Close"), "Close Current Buffer" },
-- 	q = { ":silent wq<CR>", "Save and Quit Pane (:wq)" },
-- 	Q = { ":silent q!<CR>", "Quit (:q!)" },
-- 	o = { cmds.buffer("CloseAllButCurrent"), "Close All Buffers But Current" },
-- }

-- WhichKeyGroups.buffer = {
-- 	name = "﩯 Buffer",
-- 	p = { cmds.buffer("Pick"), "Pick" },
-- 	f = { cmds.telescope("buffers"), "Find" },
-- 	["["] = { cmds.buffer("Previous"), "Previous Buffer" },
-- 	["]"] = { cmds.buffer("Next"), "Next Buffer" },
-- 	s = {
-- 		name = "Sort",
-- 		d = { cmds.buffer("OrderByDirectory"), "Sort by directory" },
-- 		l = { cmds.buffer("OrderByLanguage"), "Sort by language" },
-- 	},
-- 	q = WhichKeyGroups.quit,
-- }

-- WhichKeyGroups.copy = {
-- 	name = "  Copy",
-- 	f = { cmds.copy.fullPath(), "Copy Full Path" },
-- 	r = { cmds.copy.relativePath(), "Copy Relative Path" },
-- 	n = { cmds.copy.fileName(), "Copy File Name" },
-- }

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
	f = { "<cmd>Telescope find_files<cr>", "  Files" },
	i = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "  Find in File" },
	h = { "<cmd>Telescope help_tags<cr>", "  Help" },
	M = { "<cmd>Telescope man_pages<cr>", "  Man Pages" },
	r = { "<cmd>Telescope oldfiles<cr>", "  Recent Files" },
	p = { "<cmd>Telescope diagnostics<cr>", "Problems" },
	P = { "<cmd>Telescope project<cr>", "  Recent Projects" },
	R = { "<cmd>Telescope registers<cr>", "  Registers" },
	t = { "<cmd>Telescope live_grep<cr>", "  Text" },
	T = { "<cmd>Telescope", "  Telescope<cr>" },
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

-- WhichKeyGroups.harpoon = {
-- 	name = "  Harpoon",
-- 	a = {
-- 		function()
-- 			require("harpoon.mark").add_file()
-- 		end,
-- 		"  Add File",
-- 	},
-- 	m = {
-- 		function()
-- 			require("harpoon.ui").toggle_quick_menu()
-- 		end,
-- 		"  Menu",
-- 	},
-- 	["1"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(1)
-- 		end,
-- 		" ",
-- 	},
-- 	["2"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(2)
-- 		end,
-- 		" ",
-- 	},
-- 	["3"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(3)
-- 		end,
-- 		" ",
-- 	},
-- 	["4"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(4)
-- 		end,
-- 		" ",
-- 	},
-- 	["5"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(5)
-- 		end,
-- 		" ",
-- 	},
-- 	["6"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(6)
-- 		end,
-- 		" ",
-- 	},
-- 	["7"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(7)
-- 		end,
-- 		" ",
-- 	},
-- 	["8"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(8)
-- 		end,
-- 		" ",
-- 	},
-- 	["9"] = {
-- 		function()
-- 			require("harpoon.ui").nav_file(9)
-- 		end,
-- 		" ",
-- 	},
-- }

WhichKeyGroups.packer = {
	name = "Packer",
	c = { "<cmd>PackerCompile<cr>", "Compile" },
	i = { "<cmd>PackerInstall<cr>", "Install" },
	s = { "<cmd>PackerSync<cr>", "Sync" },
	S = { "<cmd>PackerStatus<cr>", "Status" },
	u = { "<cmd>PackerUpdate<cr>", "Update" },
}

-- WhichKeyGroups.view = {
-- 	name = "  View",
-- 	m = { ":MarkdownPreview<CR>", "Markdown Preview" },
-- 	z = { "<cmd>ZenMode<CR>", "Zen" },
-- 	h = { ":vertical resize -20<CR>", "Narrow Pane" },
-- 	l = { ":vertical resize +20<CR>", "Wide Pane" },
-- }

-- WhichKeyGroups.todo = {
-- 	name = "  Todo",
-- 	t = { cmds.todo("Telescope"), "Telescope" },
-- 	q = { cmds.todo("QuickFix"), "QuickFix" },
-- 	r = { cmds.todo("Trouble"), "Trouble" },
-- }

-- WhichKeyGroups.insert = {
-- 	name = "  Insert",
-- 	l = {
-- 		'oconsole.log("LINE: <C-r>=line(".")<Esc>",);<Esc>O<Esc>jf,a ',
-- 		"console.log()",
-- 	},
-- }

return WhichKeyGroups
