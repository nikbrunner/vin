local M = {}

---@type LazySpec
M.spec = {
    "projekt0n/circles.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function(_, opts)
        require("circles").setup(opts)
    end,
}

return M.spec
