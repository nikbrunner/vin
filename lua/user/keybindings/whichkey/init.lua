local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

local groups = require("user.keybindings.whichkey.groups")
local options = require("user.keybindings.whichkey.options")
local config = require("user.keybindings.whichkey.config")

local noLabel = "which_key_ignore"

local maps = {
	-- Singles
	[";"] = { "<cmd>Alpha<cr>", "  Dashboard" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "  Explorer" },
	[" "] = { "<C-^>", "⮂  Alt File" },
	["n"] = { ":nohl", "No Highlights" },
	["p"] = { "<nop>", noLabel },
	["1"] = { "1gt", noLabel },
	["2"] = { "2gt", noLabel },
	["3"] = { "3gt", noLabel },
	["4"] = { "4gt", noLabel },
	["5"] = { "5gt", noLabel },
	["6"] = { "6gt", noLabel },
	["7"] = { "7gt", noLabel },
	["8"] = { "8gt", noLabel },
	["9"] = { "9gt", noLabel },

	-- Groups
	P = groups.packer,
	f = groups.find,
	g = groups.git,
	l = groups.lsp,
	h = groups.harpoon,
	i = groups.insert,
	q = groups.quit,
	c = groups.copy,
	b = groups.buffer,
}

whichkey.setup(config)
whichkey.register(maps, options.normal.withLeader)
whichkey.register(maps, options.visual.withLeader)
