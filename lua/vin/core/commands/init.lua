local fzf_lua = require("vin.core.commands.fzf-lua")
local copy = require("vin.core.commands.copy")

local Commands = {
	fuzzy = fzf_lua,
	copy = copy,
}

return Commands
