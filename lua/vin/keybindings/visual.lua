local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local which_key_options = require("vin.keybindings.whichkey.options")
local groups = require("vin.keybindings.maps.groups")
local commands = require("vin.core.commands")

local maps = {
	no_leader = {
		-- Better Indent
		["<"] = { "<gv", WhichKeyIgnoreLabel },
		[">"] = { ">gv", WhichKeyIgnoreLabel },

		-- Move to beginning and end of line
		["H"] = { "^", WhichKeyIgnoreLabel },
		["L"] = { "$", WhichKeyIgnoreLabel },

		-- Move text up and down
		-- TODO Implement `move_line_down` & `move_line_up`
		["J"] = { ":move '>+1<CR>gv-gv", WhichKeyIgnoreLabel },
		["K"] = { ":move '<-2<CR>gv-gv", WhichKeyIgnoreLabel },
	},

	with_leader = {
		-- Singles
		["."] = { "<cmd>Alpha<cr>", "  Dashboard" },
		["s"] = { commands.general.save_all, "  Save" },
		["p"] = { commands.lsp.format_file, "  Format" },
		["m"] = { commands.zen.toggle_full_screen, "  Maximize Pane" },

		-- Some hidden maps
		["M"] = { commands.zen.toggle_small_screen, WhichKeyIgnoreLabel },
		-- [" "] = {
		-- 	commands.fzf_lua.find_files_without_preview,
		-- 	WhichKeyIgnoreLabel,
		-- },
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

which_key.register(maps.no_leader, which_key_options.visual)
which_key.register(maps.with_leader, which_key_options.visual.withLeader)
