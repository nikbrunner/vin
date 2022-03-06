local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

local commands = require("vin.core.commands")

local groups = require("vin.keybindings.whichkey.groups")
local options = require("vin.keybindings.whichkey.options")
local config = require("vin.keybindings.whichkey.config")

local noLabel = "which_key_ignore"

local withLeaderMaps = {
	-- Singles
	["."] = { "<cmd>Alpha<cr>", "  Dashboard" },
	[" "] = { commands.fuzzy.find_files_without_preview, "  Files" },
	["s"] = { commands.general.save_all, "  Save" },
	["p"] = { commands.lsp.format_file, "  Format" },
	["m"] = { commands.zen.toggle_full_screen, "  Maximize Pane" },
	["M"] = { commands.zen.toggle_small_screen, noLabel },
	["n"] = { ":nohl", noLabel },

	-- Tab navigation
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

whichkey.setup(config)
whichkey.register(groups.noLeader, options.normal)
whichkey.register(withLeaderMaps, options.normal.withLeader)
whichkey.register(withLeaderMaps, options.visual.withLeader)
