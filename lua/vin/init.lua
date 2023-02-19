---@class Vin
_G.Vin = {
    icons = {},
    config = {},
}

require("vin.lib")
require("vin.options")
require("vin.icons")
require("vin.config")
require("vin.lazy")
require("vin.autocmds")
require("vin.cmds")
require("vin.keymaps")

-- Initialize colorscheme
require("vin.lib.utils").init_colorscheme(Vin.config.colorscheme)
