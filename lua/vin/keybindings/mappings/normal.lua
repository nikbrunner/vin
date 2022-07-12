local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status_ok then
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

	["ZZ"] = { Vin.cmds.save_and_exit, WhichKeyIgnoreLabel },

	-- Navigate buffers and Tabs
	["<S-Tab>"] = { ":bprev<CR>", "Prev Buffer" },
	["<Tab>"] = { ":bnext<CR>", "Next Buffer" },
	-- ["<S-Tab>"] = { ":tabprevious<CR>", "Prev Tab" },
	-- ["<Tab>"] = { ":tabnext<CR>", "Next Tab" },

	-- Move text up and down
	["∆"] = { "<Esc>:m .+1<CR>", "Move Down" },
	["˚"] = { "<Esc>:m .-2<CR>", "Move Up" },

	-- Control bindings
	-- ["<C-p>"] = { Vin.cmds.fzf_lua.find_files_without_preview, "  Files" },
	-- ["<C-b>"] = { "<cmd>Neotree toggle<CR>", " Toggle Tree" },
	-- ["<C-f>"] = { cmd.utils.pick_window, "  Pick Window" }, -- TODO: window-picker: This doesnt work anymore
	-- ["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle Quickfix" },
	-- ["<C-e>"] = { Vin.cmds.fzf_lua.find_buffers, "﩯 Buffers" },

	-- ["<C-e>"] = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" },
	["<C-/>"] = { Vin.cmds.telescope.find_in_file, "  Find Text in File" },
	["<C-g>"] = { Vin.cmds.term.lazygit, "Find modified files" },

	["<C-q>"] = { "<cmd>BufferLinePickClose<CR>", "  Pick & Close Buffer" },
	["<C-p>"] = { "<cmd>BufferLinePick<CR>", "  Pick Buffer" },

	["<F6>"] = { ":call ToggleQuickFix()<CR>", "Todo Quick Fix" },
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
				Vin.lib.center_line_vertical()
			end,
			"Prev QuickFix Item",
		},
		["l"] = {
			function()
				vim.cmd([[lprev]])
				Vin.lib.center_line_vertical()
			end,
			"Prev LocList Item",
		},
		["b"] = {
			function()
				vim.cmd([[bprev]])
				Vin.lib.center_line_vertical()
			end,
			"Prev Buffer",
		},
		["e"] = {
			function()
				vim.diagnostic.goto_prev()
				Vin.lib.focus_error()
			end,
			" Prev Diagnostic",
		},
		["g"] = { Vin.cmds.git.hunk_go_prev, "Prev Change" },
	},

	-- go to next
	["]"] = {
		name = "Next",
		["q"] = {
			function()
				vim.cmd([[cnext]])
				Vin.lib.center_line_vertical()
			end,
			"Next QuickFix Item",
		},
		["l"] = {
			function()
				vim.cmd([[lnext]])
				Vin.lib.center_line_vertical()
			end,
			"Next LocList Item",
		},
		["b"] = {
			function()
				vim.cmd([[bnext]])
				Vin.lib.center_line_vertical()
			end,
			"Next Buffer",
		},
		["e"] = {
			function()
				vim.diagnostic.goto_next()
				Vin.lib.focus_error()
			end,
			" Next Diagnostic",
		},
		["g"] = { Vin.cmds.git.hunk_go_next, "Next Change" },
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
	[" "] = { Vin.cmds.nav.pick_window, "⦾  Pick Window" },
	-- [" "] = { Vin.cmds.fzf_lua.find_commands, "  Commands" },
	-- [" "] = { Vin.cmds.fzf_lua.find_buffers, "﬘ Find Buffer" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "  File Tree" },
	["o"] = { "<cmd>AerialToggle<CR>", " Symbol Tree" },
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
	a = groups.actions,
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
