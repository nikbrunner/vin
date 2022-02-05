local fzf_lua = require("vin.core.commands.fzf-lua")
local copy = require("vin.core.commands.copy")
local harpoon = require("vin.core.commands.harpoon")

local Commands = {
	fuzzy = fzf_lua,
	copy = copy,
	harpoon = harpoon
}

return Commands
