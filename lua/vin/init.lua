---@class Vin
---@field lib table Various general utilities and helper functions
---@field cmds table Function Wrappers for Plugin and Custom Commands
---@field colorscheme table Functions and Vars regarding the colorscheme
_G.Vin = {
    lib = {},
    cmds = {},
    icons = {},
}

-- Function to savely load modules when sourcing the the init.lua
local function load(mod)
    package.loaded[mod] = nil
    return require(mod)
end

load("vin.icons")
load("vin.options")
load("vin.autocmds")
load("vin.lib")
load("vin.cmds")
load("vin.plugins")
load("vin.keybindings")

-- Allow require to look in after/plugin folder
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path
