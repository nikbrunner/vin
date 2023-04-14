---@type LazySpec
local spec = {
    "projekt0n/circles.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = function()
        return Vin.config.dot_mode
    end,
    config = function()
        require("circles").setup()
    end,
}

return spec
