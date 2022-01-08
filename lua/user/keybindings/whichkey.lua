local mappingGroups = require("user.keybindings.mappings.groups")
local which_key_options = require("user.keybindings.options");
local wk_config = require("user.keybindings.wk_config")

local status_ok, which_key = pcall(require, "which-key")
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

which_key.setup(wk_config)
which_key.register(mappings, which_key_options.normal.withLeader)
