local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status_ok then
	return
end

local commands = require("vin.core.commands")
local groups = require("vin.keybindings.maps.groups")
local options = require("vin.keybindings.whichkey.options")

local maps = {
	no_leader = {
		g = {
			m = {
				commands.fzf_lua.find_modified_files_with_preview,
				WhichKeyIgnoreLabel,
			},
			s = { ":LazyGit<CR>", WhichKeyIgnoreLabel },
		},

		-- disable Q
		Q = { "<Nop>", WhichKeyIgnoreLabel },

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

		-- p = { '"_dP', WhichKeyIgnoreLabel },

		v = {
			name = "Select",
			b = { commands.general.blocks.select, "Select Block" },
			v = {
				function()
					vim.cmd([[norm ^v$]])
				end,
				"Select Line",
			},
			A = { commands.general.all.select, "Select All" },
		},
		y = {
			name = "Yank",
			b = { commands.general.blocks.yank, "Yank Block" },
			A = { commands.general.all.yank, "Yank All" },
		},
		d = {
			name = "Delete",
			b = { commands.general.blocks.delete, "Delete Block" },
			A = { commands.general.all.delete, "Delete All" },
		},
	},

	with_leader = {
		-- Singles
		["."] = { "<cmd>Alpha<cr>", "  Dashboard" },
		["s"] = { commands.general.save_all, "  Save" },
		["p"] = { commands.lsp.format_file, "  Format" },
		["m"] = { commands.zen.toggle_full_screen, "  Maximize Pane" },

		-- Some hidden maps
		["M"] = { commands.zen.toggle_small_screen, WhichKeyIgnoreLabel },
		["n"] = { ":nohl", WhichKeyIgnoreLabel },

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
		P = groups.packer,
		f = groups.find,
		e = groups.explorer,
		g = groups.git,
		l = groups.lsp,
		h = groups.harpoon,
		i = groups.insert,
		q = groups.quit,
		c = groups.copy,
		b = groups.buffer,
		t = groups.tabs,
	},
}

which_key.register(maps.no_leader, options.normal.no_leader)
which_key.register(maps.with_leader, options.normal.with_leader)
