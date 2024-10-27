local M = {}

---@type LazyPluginSpec
M.spec = {
    "projekt0n/github-nvim-theme",
    lazy = true,
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

        local override = require("github-theme.override")

        override.groups = {
            all = {
                FzfLuaNormal = { link = "NeoTreeNormal" },
            },
        }
    end,
}

return M.spec
