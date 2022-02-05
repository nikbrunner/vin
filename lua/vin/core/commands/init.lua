local general = require("vin.core.commands.general")
local lsp = require("vin.core.commands.lsp")
local fzf_lua = require("vin.core.commands.fzf-lua")
local copy = require("vin.core.commands.copy")
local harpoon = require("vin.core.commands.harpoon")

local Commands = {
	general = general,
	fuzzy = fzf_lua,
	copy = copy,
	harpoon = harpoon,
	lsp = lsp,
}

return Commands
