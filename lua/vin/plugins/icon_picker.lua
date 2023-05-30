---@LazySpec
local spec = {
    "ziontee113/icon-picker.nvim",
    config = function()
        require("icon-picker").setup({
            disable_legacy_commands = true,
        })
    end,
}

return spec
