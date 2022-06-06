local general = require("vin.commands.general")
local lsp = require("vin.commands.lsp")
local fzf_lua = require("vin.commands.fzf-lua")
local telescope = require("vin.commands.telescope")
require("vin.commands.copy")
local harpoon = require("vin.commands.harpoon")
require("vin.commands.zen")
local packer = require("vin.commands.packer")
require("vin.commands.diffview")
local utils = require("vin.commands.utils")

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
