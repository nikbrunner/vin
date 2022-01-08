local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

local wkGroups = require("user.keybindings.whichkey.groups")
local wkOptions = require("user.keybindings.whichkey.options");
local wkConfig = require("user.keybindings.whichkey.config")

local wkIgnore = "which_key_ignore"

local mappings = {
	[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  [" "] = { "<C-^>", "Prev Buffer" },
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

	P = wkGroups.packer,
	f = wkGroups.find,
	g = wkGroups.git,
	l = wkGroups.lsp,
  h = wkGroups.harpoon,
  i = wkGroups.insert,
  q = wkGroups.quit,
  c = wkGroups.copy
}

whichkey.setup(wkConfig)
whichkey.register(mappings, wkOptions.normal.withLeader)
