return {
    "anuvyklack/windows.nvim",
    event = "VeryLazy",
    dependencies = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim",
    },
    opts = {
        autowidth = {
            enable = false,
            winwidth = 30,
            filetype = {
                help = 2,
            },
        },
        ignore = {
            buftype = { "quickfix" },
            filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
        },
        animation = {
            enable = true,
            duration = 300,
            fps = 30,
            easing = "in_out_sine",
        },
    },
    config = function(_, opts)
        local windows = require("windows")

        vim.o.winwidth = 10
        vim.o.winminwidth = 10
        vim.o.equalalways = false
        windows.setup(opts)
    end,
}
