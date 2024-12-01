---@type LazyPluginSpec
return {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    ---@type GhTheme.Config
    opts = {
        options = {
            hide_end_of_buffer = true,
            darken = {
                floats = true,
                sidebars = {
                    enable = true,
                },
            },
        },
        groups = {
            all = {
                FzfLuaNormal = { bg = "bg0" },
                FzfLuaBorder = { bg = "bg0" },
                NormalFloat = { bg = "bg0" },
                FloatTitle = { bg = "bg0" },
                FloatBorder = { bg = "bg0" },
            },
        },
    },
    config = function(_, opts)
        require("github-theme").setup(opts)
    end,
}
