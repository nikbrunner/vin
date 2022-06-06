local cmds = require("vin.core.commands")
local groups = require("vin.keybindings.mappings.groups")

local M = {}

M.no_leader = {
	-- Better Indent
	["<"] = { "<gv", WhichKeyIgnoreLabel },
	[">"] = { ">gv", WhichKeyIgnoreLabel },

	-- Move to beginning and end of line
	["H"] = { "^", WhichKeyIgnoreLabel },
	["L"] = { "$", WhichKeyIgnoreLabel },

	-- Move text up and down
	-- TODO Implement `move_line_down` & `move_line_up`
	["∆"] = { ":move '>+1<CR>gv-gv", WhichKeyIgnoreLabel },
	["˚"] = { ":move '<-2<CR>gv-gv", WhichKeyIgnoreLabel },
}

M.with_leader = {
	-- Singles
	["."] = { "<cmd>Alpha<cr>", "  Dashboard" },
	["m"] = { Vin.cmd.zen.toggle_full_screen, "  Maximize Pane" },
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
	s = groups.search,
	e = groups.explorer,
	g = groups.git,
	l = groups.lsp,
	h = groups.harpoon,
	i = groups.insert,
	q = groups.quit,
	c = groups.copy,
	b = groups.buffer,
	t = groups.tabs,
}
return M
