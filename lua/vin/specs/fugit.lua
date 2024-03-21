local M = {}

---@type LazyPluginSpec
M.spec = {
    "SuperBo/fugit2.nvim",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        {
            "chrisgrieser/nvim-tinygit",
            dependencies = { "stevearc/dressing.nvim" },
        },
    },
    cmd = {
        "Fugit2",
        "Fugit2Graph",
    },
    keys = {
        {
            "<leader>gg",
            "<cmd>Fugit2<cr>",
        },
    },
}

return M.spec
