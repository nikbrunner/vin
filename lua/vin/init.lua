---@class Vin
_G.Vin = {
    lib = {},
    cmds = {},
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

-- Setup colorscheme
function InitColorScheme(color)
    color = color or "default"
    vim.cmd.colorscheme(color)
end

InitColorScheme(Vin.config.colorscheme)
