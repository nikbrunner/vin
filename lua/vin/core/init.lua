---@class Vin
---@field lib table Various utilities and helper functions
---@field cmd table Function Wrappers for Plugin and Custom Commands
---@field arvo table Functions for the Arvo Customizations (Temporary)
_G.Vin = {
	lib = {},
	cmd = {},
	arvo = {},
}

require("vin.core.options")
require("vin.core.lib")
require("vin.core.arvo")
require("vin.core.autocommands")
require("vin.core.colorscheme")
