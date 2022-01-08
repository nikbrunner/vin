local wkGroups = require("bindings.maps.groups")

local WhichKeySingles = {}

WkIgnore = "which_key_ignore"

WhichKeySingles.noLeader = {
	normal = {
		["Q"] = { "<nop>", WkIgnore },
		["H"] = { "^", "Line Start" },
		["L"] = { "$", "Line End" },

		["jk"] = { "<ESC>", "Escape" },

		["k"] = { "gk", "Adjusted k" },
		["j"] = { "gj", "Adjusted j" },

		["n"] = { "nzzzv", "Adjusted n" },
		["N"] = { "Nzzzv", "Adjusted N" },

		-- ["J"] = { ":m .+1<CR>==", "Move Line Down" },
		-- ["K"] = { ":m .-2<CR>==", "Move Line Up" },

		["<C-h>"] = { "<C-w>h", "Focus Left Pane" },
		["<C-j>"] = { "<C-w>j", "Focus Below Pane" },
		["<C-k>"] = { "<C-w>k", "Focus Above Pane" },
		["<C-l>"] = { "<C-w>l", "Focus Right Pane" },

		["<C-p>"] = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"  Files",
		},
		["<C-e>"] = { "<cmd>Telescope buffers<cr>", "Recent Buffers" },
		["<C-_>"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find Text in File" },
		["<C-s>"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Find Symbol in File" },
		["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle QuickFix List" },

		["<F8>"] = { "<cmd>Telescope diagnostics<cr>", "Workspace Errors" },
		-- ["<F9>"] = { cmds.todo("Telescope"), "Todo Quickfix" },

		["<S-Tab>"] = { ":bprev<cr>", "Previous Buffer" },
		["<Tab>"] = { ":bnext<cr>", "Next Buffer" },
		["˙"] = { ":tabprev<CR>", "Prev Tab" },
		["¬"] = { ":tabnext<CR>", "Next Tab" },

		["["] = wkGroups.goToPrevious,
		["]"] = wkGroups.goToNext,

		g = wkGroups.go,
		v = wkGroups.block.select,
		d = wkGroups.block.delete,
		y = wkGroups.block.yank,
	},
	insert = {
		[","] = { ",<c-g>u", "Add Undo Breakpoint for ," },
		["."] = { ".<c-g>u", "Add Undo Breakpoint for ." },
		["="] = { "=<c-g>u", "Add Undo Breakpoint for =" },
		["!"] = { "!<c-g>u", "Add Undo Breakpoint for !" },
		["?"] = { "?<c-g>u", "Add Undo Breakpoint for ?" },
		["["] = { "[<c-g>u", "Add Undo Breakpoint for [" },
		["("] = { "(<c-g>u", "Add Undo Breakpoint for (" },
		["{"] = { "{<c-g>u", "Add Undo Breakpoint for {" },
	},
	visual = {
		["<"] = { "<gv", "Better Indent for <" },
		[">"] = { ">gv", "Better Indent for >" },

		["p"] = { '"_dP', "Paste" },

		["H"] = { "^", "Line Start" },
		["L"] = { "$", "Line End" },

		["J"] = { ":m '>+1<CR>gv=gv", "Move Line Down" },
		["K"] = { ":m '<-2<CR>gv=gv", "Move Line Up" },

		["<C-a>"] = { "<C-a>gv", "Inc numbers" },
	},
}

WhichKeySingles.withLeader = {
	normal = {
		[";"] = { cmds.dashboard(), "﩯 Dashboard" },
		["e"] = { cmds.nvimTree("Toggle"), "  Explorer" },
		[" "] = { "<C-^>", WkIgnore },
		p = { "<nop>", WkIgnore },
		["1"] = { "1gt", WkIgnore },
		["2"] = { "2gt", WkIgnore },
		["3"] = { "3gt", WkIgnore },
		["4"] = { "4gt", WkIgnore },
		["5"] = { "5gt", WkIgnore },
		["6"] = { "6gt", WkIgnore },
		["7"] = { "7gt", WkIgnore },
		["8"] = { "8gt", WkIgnore },
		["9"] = { "9gt", WkIgnore },
	},
}

return WhichKeySingles
