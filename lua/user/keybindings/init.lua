require("user.keybindings.noleader")

local mappingGroups = require("user.keybindings.maps.groups")
local wk_opts = require("user.keybindings.wk_opts");
local wk_config = require("user.keybindings.wk_config")

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end


local mappings = {
	[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

	P = mappingGroups.packer,
	f = mappingGroups.find,
	g = mappingGroups.git,
	l = mappingGroups.lsp,
  h = mappingGroups.harpoon,
  i = mappingGroups.insert,
  q = mappingGroups.quit
}

wk.setup(wk_config)
wk.register(mappings, wk_opts.normal.withLeader)
