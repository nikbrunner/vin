require("vin.cmds.diffview")
require("vin.cmds.nav")
require("vin.cmds.edit")
require("vin.cmds.copy")
require("vin.cmds.zen")
require("vin.cmds.general")
require("vin.cmds.telescope")

local lsp = require("vin.cmds.lsp")
local fzf_lua = require("vin.cmds.fzf-lua")
local harpoon = require("vin.cmds.harpoon")
local packer = require("vin.cmds.packer")

local M = {
	fzf_lua = fzf_lua,
	harpoon = harpoon,
	lsp = lsp,
	packer = packer,
}

return M
