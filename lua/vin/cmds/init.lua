require("vin.cmds.diffview")
require("vin.cmds.nav")
require("vin.cmds.edit")
require("vin.cmds.copy")
require("vin.cmds.zen")
require("vin.cmds.general")
require("vin.cmds.telescope")
require("vin.cmds.harpoon")
require("vin.cmds.packer")

local lsp = require("vin.cmds.lsp")
local fzf_lua = require("vin.cmds.fzf-lua")

local M = {
	fzf_lua = fzf_lua,
	lsp = lsp,
}

return M
