local M = {}

M.spec = {
    "projekt0n/github-nvim-theme",
    lazy = false,
    opts = {
        options = {
            darken = { -- Darken floating windows and sidebar-like windows
                floats = true,
                sidebars = {
                    enabled = true,
                },
            },
        },
    },
    config = function(_, opts)
        require("github-theme").setup(opts)
    end,
}

return M.spec
