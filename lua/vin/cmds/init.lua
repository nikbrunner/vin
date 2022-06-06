require("vin.cmds.diffview")
require("vin.cmds.nav")
require("vin.cmds.edit")
require("vin.cmds.copy")
require("vin.cmds.zen")

local general = require("vin.cmds.general")
local lsp = require("vin.cmds.lsp")
local fzf_lua = require("vin.cmds.fzf-lua")
local telescope = require("vin.cmds.telescope")
local harpoon = require("vin.cmds.harpoon")
local packer = require("vin.cmds.packer")

local M = {
	general = general,
	fzf_lua = fzf_lua,
	telescope = telescope,
	harpoon = harpoon,
	lsp = lsp,
	packer = packer,
}

return M
