require("user.whichkey.noleader")

local whichkey_group_mappings = require("user.whichkey.maps.groups")
local whichkey_options = require("user.whichkey.options");
local whichkey_config = require("user.whichkey.config")

local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end


local mappings = {
	[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

	P = whichkey_group_mappings.packer,
	f = whichkey_group_mappings.find,
	g = whichkey_group_mappings.git,
	l = whichkey_group_mappings.lsp,
  h = whichkey_group_mappings.harpoon,
  i = whichkey_group_mappings.insert,
  q = whichkey_group_mappings.quit
}

whichkey.setup(whichkey_config)
whichkey.register(mappings, whichkey_options.normal.withLeader)
