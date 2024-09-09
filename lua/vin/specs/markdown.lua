local M = {}

---@type LazyPluginSpec
M.spec = {
    "MeanderingProgrammer/markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    opts = {
        -- Characters that will replace the # at the start of markdown headings
        headings = { "󰲡 ", "󰲣  ", "󰲥  ", "󰲧  ", "󰲩  ", "󰲫  " },
        -- Character to use for the bullet point in lists
        bullet = "○",
        checkbox = {
            -- Character that will replace the [ ] in unchecked checkboxes
            unchecked = "󰄱 ",
            -- Character that will replace the [x] in checked checkboxes
            checked = "󰄲 ",
        },
        highlights = {
            -- Used when displaying code blocks
            code = "CursorLine",
            -- Used when displaying bullet points in list
            bullet = "@string",
            checkbox = {
                unchecked = "@markup.todo.unchecked",
                checked = "@markup.todo.checked",
            },
            table = {
                -- Used when displaying header in a markdown table
                head = "@markup.heading",
                -- Used when displaying non header rows in a markdown table
                row = "Normal",
            },
        },
    },
    keys = {
        "<leader>um",
        "<cmd>RenderMarkdown toggle<CR>",
        desc = "Toggle Markdown Rendering",
    },
    config = function(_, opts)
        require("render-markdown").setup(opts)
    end,
}

return M.spec
