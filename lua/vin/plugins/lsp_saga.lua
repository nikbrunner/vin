---@type LazySpec
local spec = {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
    },
    event = "LspAttach",
    opts = {
        lightbulb = {
            enable = false,
            enable_in_insert = false,
        },
        ui = {
            border = "rounded",
        },
    },
    config = function(_, opts)
        require("lspsaga").setup(opts)
    end,
}

return spec
