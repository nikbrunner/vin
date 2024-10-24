local M = {}

---@type LazyPluginSpec
M.spec = {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
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
    },
    config = function(_, opts)
        require("github-theme").setup(opts)
    end,
}

return M.spec
