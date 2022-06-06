local general = require("vin.cmds.general")
local lsp = require("vin.cmds.lsp")
local fzf_lua = require("vin.cmds.fzf-lua")
local telescope = require("vin.cmds.telescope")
require("vin.cmds.copy")
local harpoon = require("vin.cmds.harpoon")
require("vin.cmds.zen")
local packer = require("vin.cmds.packer")
require("vin.cmds.diffview")
local utils = require("vin.cmds.utils")

local M = {
	general = general,
	fzf_lua = fzf_lua,
	telescope = telescope,
	harpoon = harpoon,
	lsp = lsp,
	packer = packer,
	utils = utils,
}

return M
