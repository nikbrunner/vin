require("user.keybindings.noleader")

local whichkey_group_mappings = require("user.keybindings.maps.groups")
local whichkey_options = require("user.keybindings.options");
local whichkey_config = require("user.keybindings.config")

local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

local wkIgnore = "which_key_ignore"

local mappings = {
	[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  [" "] = { "<C-^>", wkIgnore },
  ["p"] = { "<nop>", wkIgnore },
  ["1"] = { "1gt", wkIgnore },
  ["2"] = { "2gt", wkIgnore },
  ["3"] = { "3gt", wkIgnore },
  ["4"] = { "4gt", wkIgnore },
  ["5"] = { "5gt", wkIgnore },
  ["6"] = { "6gt", wkIgnore },
  ["7"] = { "7gt", wkIgnore },
  ["8"] = { "8gt", wkIgnore },
  ["9"] = { "9gt", wkIgnore },

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
