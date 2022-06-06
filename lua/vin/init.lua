---@class Vin
---@field lib table Various general utilities and helper functions
---@field cmd table Function Wrappers for Plugin and Custom Commands
---@field colorscheme table Functions and Vars regarding the colorscheme
_G.Vin = {
	lib = {},
	cmd = {},
	colorscheme = {},
}

-- Function to savely load modules when sourcing the the init.lua
local function load(mod)
	package.loaded[mod] = nil
	return require(mod)
end

load("vin.options")
load("vin.autocommands")
load("vin.lib")
load("vin.core")
load("vin.plugins")
load("vin.colorscheme")
load("vin.configs")
load("vin.lsp")
load("vin.keybindings")
