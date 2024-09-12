local M = {}

---@type LazyPluginSpec
M.spec = {
    "MeanderingProgrammer/markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    opts = {},
    keys = {
        "<leader>um",
        "<cmd>RenderMarkdown toggle<CR>",
        desc = "Toggle Markdown Rendering",
    },
}

return M.spec
