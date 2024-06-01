local M = {}

---@type LazyPluginSpec
M.spec = {
    "MeanderingProgrammer/markdown.nvim",
    enabled = false,
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        -- Characters that will replace the # at the start of markdown headings
        headings = { "󰲡 ", "󰲣  ", "󰲥  ", "󰲧  ", "󰲩  ", "󰲫  " },
        -- Character to use for the bullet point in lists
        bullet = "○",
        highlights = {
            -- Used when displaying code blocks
            code = "CursorLine",
            -- Used when displaying bullet points in list
            bullet = "@string",
            table = {
                -- Used when displaying header in a markdown table
                head = "@markup.heading",
                -- Used when displaying non header rows in a markdown table
                row = "Normal",
            },
        },
    },
    config = function(_, opts)
        require("render-markdown").setup(opts)
    end,
}

return M.spec
