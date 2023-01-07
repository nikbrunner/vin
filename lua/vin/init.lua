---@type Vin
_G.Vin = {
    lib = {},
    cmds = {},
    icons = {},
    config = {},
}

require("vin.lib")
require("vin.options")
require("vin.config")
require("vin.icons")
require("vin.plugins")
require("vin.autocmds")
require("vin.colorscheme")
require("vin.cmds")
require("vin.keymaps")

-- Allow require to look in after/plugin folder
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path
