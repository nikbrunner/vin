---@class Vin
---@field lib table Various general utilities and helper functions
---@field cmd table Function Wrappers for Plugin and Custom Commands
---@field colorscheme table Functions and Vars regarding the colorscheme
_G.Vin = {
	lib = {},
	cmd = {},
	colorscheme = {},
}

require("vin.core.options")
require("vin.core.lib")
require("vin.core.autocommands")
require("vin.core.colorscheme")
