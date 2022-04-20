local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status_ok then
	return
end

local cmds = require("vin.core.commands")
local groups = require("vin.keybindings.mappings.groups")

local NormalModeMappings = {}

NormalModeMappings.no_leader = {
	g = groups.advanced_g,

	-- disable Q
	Q = { "<Nop>", WhichKeyIgnoreLabel },

	["<CR>"] = { ":wa<CR>", WhichKeyIgnoreLabel },

	-- Go to Line Start and End
	H = { "^", WhichKeyIgnoreLabel },
	L = { "$", WhichKeyIgnoreLabel },

	-- Better n and N (Keep Search Hit in the middle)
	n = { "nzzzv", WhichKeyIgnoreLabel },
	N = { "Nzzzv", WhichKeyIgnoreLabel },

	-- Better j and k
	j = { "gj", WhichKeyIgnoreLabel },
	k = { "gk", WhichKeyIgnoreLabel },

	-- Navigate buffers and Tabs
	["¬"] = { ":bprevious<CR>", "Prev Buffer" },
	["˙"] = { ":bnext<CR>", "Next Buffer" },
	["<S-Tab>"] = { ":tabprevious<CR>", "Prev Tab" },
	["<Tab>"] = { ":tabnext<CR>", "Next Tab" },

	-- Move text up and down
	["J"] = { "<Esc>:m .+1<CR>", "Move Down" },
	["K"] = { "<Esc>:m .-2<CR>", "Move Up" },

	-- Control bindings
	["<C-p>"] = { cmds.fzf_lua.find_files_without_preview, "  Files" },
	["<C-e>"] = { cmds.fzf_lua.find_buffers, "﩯 Buffers" },
	["<C-_>"] = { cmds.fzf_lua.find_in_file, "  Find Text in File" },
	["<C-g>"] = {
		cmds.fzf_lua.find_modified_files_with_preview,
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
		name = "Prev",
		["q"] = {
			function()
				vim.cmd([[cprev]])
				vim.cmd([[norm zz]])
			end,
			"Prev QuickFix Item",
		},
		["b"] = {
			function()
				vim.cmd([[bprev]])
				vim.cmd([[norm zz]])
			end,
			"Prev Buffer",
		},
		["e"] = {
			function()
				vim.diagnostic.goto_prev()
				vim.cmd([[norm zz]])
			end,
			"Prev Problem",
		},
		["g"] = {
			function()
				gitsigns.prev_hunk()
				vim.cmd([[norm zz]])
			end,
			"Prev Change",
		},
	},

	-- go to next
	["]"] = {
		name = "Next",
		["q"] = {
			function()
				vim.cmd([[cnext]])
				vim.cmd([[norm zz]])
			end,
			"Prev QuickFix Item",
		},
		["b"] = {
			function()
				vim.cmd([[bnext]])
				vim.cmd([[norm zz]])
			end,
			"Prev Buffer",
		},
		["e"] = {
			function()
				vim.diagnostic.goto_next()
				vim.cmd([[norm zz]])
			end,
			"Prev Problem",
		},
		["g"] = {
			function()
				gitsigns.next_hunk()
				vim.cmd([[norm zz]])
			end,
			"Prev Change",
		},
	},

	v = {
		name = "Select",
		b = { cmds.general.blocks.select, "Select Block" },
		v = { cmds.general.line.select, "Select Line" },
		A = { cmds.general.all.select, "Select All" },
	},
	y = {
		name = "Yank",
		b = { cmds.general.blocks.yank, "Yank Block" },
		A = { cmds.general.all.yank, "Yank All" },
	},
	d = {
		name = "Delete",
		b = { cmds.general.blocks.delete, "Delete Block" },
		A = { cmds.general.all.delete, "Delete All" },
	},
}

NormalModeMappings.with_leader = {
	-- Singles
	["."] = { "<cmd>Alpha<cr>", "  Dashboard" },
	["o"] = { ":SymbolsOutline<CR>", " File Outline" },
	["s"] = { cmds.general.save_all, "  Save All" },
	["p"] = { cmds.lsp.format_file, "  Format" },
	["m"] = { cmds.zen.toggle_full_screen, "  Maximize Pane" },
	["n"] = { ":nohl<CR>", WhichKeyIgnoreLabel },

	-- Tab navigation
	["1"] = { "1gt", WhichKeyIgnoreLabel },
	["2"] = { "2gt", WhichKeyIgnoreLabel },
	["3"] = { "3gt", WhichKeyIgnoreLabel },
	["4"] = { "4gt", WhichKeyIgnoreLabel },
	["5"] = { "5gt", WhichKeyIgnoreLabel },
	["6"] = { "6gt", WhichKeyIgnoreLabel },
	["7"] = { "7gt", WhichKeyIgnoreLabel },
	["8"] = { "8gt", WhichKeyIgnoreLabel },
	["9"] = { "9gt", WhichKeyIgnoreLabel },

	-- Groups
  e = groups.explorer,
	P = groups.packer,
	f = groups.find,
	g = groups.git,
	l = groups.lsp,
	h = groups.harpoon,
	i = groups.insert,
	q = groups.quit,
	c = groups.copy,
	b = groups.buffer,
	t = groups.tabs,
}

return NormalModeMappings
