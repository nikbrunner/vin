local M = {}

---@module "which-key"
---@type LazyPluginSpec
M.spec = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@type wk.Opts
    opts = {
        win = {
            width = { min = 15, max = 0.5 },
            height = { min = 4, max = 25 },
            col = 0.5,
            row = 0.9,
            padding = { 3, 10 },
            title = "",
            border = "solid",
            wo = {
                winblend = 10,
            },
        },

        layout = {
            width = { min = 80 }, -- min and max width of the columns
            spacing = 5, -- spacing between columns
        },

        ---@type wk.Spec
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>.", group = "TMUX", icon = "󱂬 " },
                { "<leader>;", icon = " " },
                { "<leader>R", icon = " " },
                { "<leader>c", group = "Code", icon = " " },
                { "<leader>cl", group = "Log", icon = " " },
                { "<leader>d", group = "Diagnostics", icon = " " },
                { "<leader>dc", group = "Calls", icon = " " },
                { "<leader>e", group = "Explorer", icon = "󰙅" },
                { "<leader>g", group = "Git", icon = " " },
                { "<leader>gh", group = "Hunks", icon = "" },
                { "<leader>i", group = "Intelligence", icon = "󰧑 " },
                { "<leader>j", group = "Jumps", icon = "󰴪 " },
                { "<leader>m", group = "Marks", icon = "󰍐 " },
                { "<leader>n", group = "Notes", icon = " " },
                { "<leader>o", group = "Obsidian", icon = " " },
                { "<leader>r", icon = "󰼥 " },
                { "<leader>s", group = "Search", icon = " " },
                { "<leader>u", group = "UI", icon = "󰙵 " },
                { "<leader>v", group = "Vin", icon = " " },
                { "S", group = "Surround", icon = "󰅩 " },
                { "[", group = "Prev", icon = "󰒮 " },
                { "]", group = "Next", icon = "󰒭 " },
                { "g", group = "G", icon = "󱡓 " },
            },
        },
        icons = {
            group = "󰉒 ", -- symbol prepended to a group
            rules = {
                { plugin = "yazi.nvim", icon = " " },
                { plugin = "file-surfer.nvim", icon = " " },
                { plugin = "gitpad.nvim", icon = "󰠮 " },
                { plugin = "no-neck-pain.nvim", icon = "󰈈 " },
                { plugin = "supermaven-nvim", icon = "󰧑 " },
            },
        },
        show_help = false, -- show a help message in the command line for using WhichKey
        show_keys = false, -- show the currently pressed key and its label as a message in the command line
    },
}

return M.spec
