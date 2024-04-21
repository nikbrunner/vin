local M = {}

---@type LazyPluginSpec
M.spec = {
    "codethread/qmk.nvim",
    ft = "c",
    ---@type qmk.UserConfig
    opts = {
        name = "LAYOUT_split_3x5_3",
        layout = {
            "x x x x x _ x x x x x",
            "x x x x x _ x x x x x",
            "x x x x x _ x x x x x",
            "_ _ x x x _ x x x _ _",
        },
    },
    config = function(_, opts)
        require("qmk").setup(opts)
    end,
}

return M.spec
