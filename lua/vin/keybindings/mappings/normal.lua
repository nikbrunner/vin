local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status_ok then
	return
end

local jester_status_ok, jester = pcall(require, "jester")
if not jester_status_ok then
	return
end

local groups = require("vin.keybindings.mappings.groups")

local M = {}

M.no_leader = {
	g = groups.advanced_g,

	-- disable Q
	Q = { "<Nop>", WhichKeyIgnoreLabel },

	["<CR>"] = { Vin.cmds.general.save_all, WhichKeyIgnoreLabel },

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
	["<S-Tab>"] = { ":bprev<CR>", "Prev Buffer" },
	["<Tab>"] = { ":bnext<CR>", "Next Buffer" },
	-- ["<S-Tab>"] = { ":tabprevious<CR>", "Prev Tab" },
	-- ["<Tab>"] = { ":tabnext<CR>", "Next Tab" },

	-- Move text up and down
	["∆"] = { "<Esc>:m .+1<CR>", "Move Down" },
	["˚"] = { "<Esc>:m .-2<CR>", "Move Up" },

	-- Control bindings
	["<C-p>"] = { Vin.cmds.fzf_lua.find_files_without_preview, "  Files" },
	["<C-e>"] = { Vin.cmds.fzf_lua.find_buffers, "﩯 Buffers" },
	["˙"] = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" },
	-- ["<C-b>"] = { "<cmd>Neotree toggle<CR>", " Toggle Tree" },
	-- ["<C-f>"] = { cmd.utils.pick_window, "  Pick Window" }, -- TODO: window-picker: This doesnt work anymore
	["<C-/>"] = { Vin.cmds.telescope.find_in_file, "  Find Text in File" },
	["<C-g>"] = { Vin.cmds.term.lazygit, "Find modified files" },
	["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle Quickfix" },
	["<F7>"] = { "<cmd>TodoQuickFix<CR>", "Todo Quick Fix" },
	["<F8>"] = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
	["<F9>"] = { "<cmd>DiagWindowShow<CR>", "Diagnose Window Show" },

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
		["l"] = {
			function()
				vim.cmd([[lprev]])
				vim.cmd([[norm zz]])
			end,
			"Prev LocList Item",
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
		["l"] = {
			function()
				vim.cmd([[lnext]])
				vim.cmd([[norm zz]])
			end,
			"Prev LocList Item",
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
		b = { Vin.cmds.general.blocks.select, "Select Block" },
		v = { Vin.cmds.general.line.select, "Select Line" },
		A = { Vin.cmds.general.all.select, "Select All" },
	},
	y = {
		name = "Yank",
		b = { Vin.cmds.general.blocks.yank, "Yank Block" },
		A = { Vin.cmds.general.all.yank, "Yank All" },
	},
	d = {
		name = "Delete",
		b = { Vin.cmds.general.blocks.delete, "Delete Block" },
		A = { Vin.cmds.general.all.delete, "Delete All" },
	},
}

M.with_leader = {
	-- Singles
	-- [" "] = { Vin.cmds.nav.pick_window, "⦾  Pick Window" },
	-- [" "] = { Vin.cmds.fzf_lua.find_commands, "  Commands" },
	[" "] = { "<cmd>BufferLinePick<CR>", "  Pick Buffer" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "  File Tree" },
	-- ["r"] = {
	-- 	function()
	-- 		jester.run_file()
	-- 	end,
	-- 	WhichKeyIgnoreLabel,
	-- },
	["."] = { "<cmd>Alpha<cr>", "  Dashboard" },
	["f"] = { Vin.cmds.fzf_lua.find_files_without_preview, "  Find File" },
	-- ["f"] = { Vin.cmds.telescope.find_files_with_preview, "  Find File" },
	-- ["F"] = {
	-- 	Vin.cmds.telescope.find_files_with_preview,
	-- 	WhichKeyIgnoreLabel,
	-- },
	["z"] = { Vin.cmds.zen.toggle_full_screen, "  Zen" },
	["m"] = { "<C-w>|", "  Maximize Split" },
	["r"] = { "<C-w>=", "  Restore Splits" },
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
	-- v = groups.vin,
	-- e = groups.explorer,
	b = groups.buffer,
	P = groups.packer,
	s = groups.search,
	S = groups.session,
	g = groups.git,
	i = groups.insert,
	l = groups.lsp,
	h = groups.harpoon,
	q = groups.quit,
	c = groups.copy,
	t = groups.tabs,
}

return M
