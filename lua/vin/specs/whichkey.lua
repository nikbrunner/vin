local M = {}

---@module "which-key"
---@type LazyPluginSpec
M.spec = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@type wk.Opts
    opts = {
        win = {
            width = { min = 35, max = 125 },
            height = { min = 5, max = 15 },
            col = 0.5,
            row = 0.9,
            title = "Vin",
            border = "solid",
            wo = {
                winblend = 0,
            },
        },

        layout = {
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
                { "<leader>cp", group = "Picker", icon = "󱥚 " },
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
                { "<leader>h", group = "HTTP", icon = "󰿘 " },
                { "<leader>r", icon = "󰼥 " },
                { "<leader>s", group = "Search", icon = " " },
                { "<leader>S", group = "Session", icon = " " },
                { "<leader>u", group = "UI", icon = "󰙵 " },
                { "<leader>v", group = "Vin", icon = " " },
                { "S", group = "Surround", icon = "󰅩 " },
                { "[", group = "Prev", icon = "󰒮 " },
                { "]", group = "Next", icon = "󰒭 " },
                { "g", group = "G", icon = "󱡓 " },
            },
        },
        icons = {
            separator = "", -- symbol used between a key and it's label
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
