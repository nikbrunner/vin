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
            title = "nbr.nvim",
            border = "solid",
            wo = {
                winblend = 0,
            },
        },

        delay = 150,

        sort = { "local", "order", "group", "case", "alphanum", "mod" },

        layout = {
            spacing = 5, -- spacing between columns
        },

        ---@type wk.Spec
        spec = {
            {
                mode = { "n", "v" },
                -- v3
                { "<leader>w", group = "[W]orkspace", icon = "󰲃 " },
                -- { "<leader>d", group = "[D]ocument", icon = "󱔘 " },

                -- v2
                { "<leader>c", group = "Code", icon = " " },
                { "<leader>.", group = "TMUX", icon = "󱂬 " },
                { "<leader>;", icon = " " },
                { "<leader>N", icon = "󱀂 " },
                { "<leader>U", icon = "󰣜 " },
                { "<leader>c", group = "Code", icon = " " },
                { "<leader>cl", group = "Log", icon = " " },
                { "<leader>cp", group = "Picker", icon = "󱥚 " },
                { "<leader>d", group = "Diagnostics", icon = " " },
                { "<leader>dc", group = "Calls", icon = " " },
                { "<leader>e", group = "Explorer", icon = "󰙅" },
                { "<leader>g", group = "Git", icon = " " },
                { "<leader>gd", group = "Diff", icon = "" },
                { "<leader>gr", group = "Revert" },
                { "<leader>gs", group = "Stage" },
                { "<leader>gu", group = "Unstage" },
                { "<leader>gp", group = "Preview" },
                { "<leader>gC", group = "Checkout", icon = " " },
                { "<leader>h", group = "HTTP", icon = "󰿘 " },
                { "<leader>i", group = "Intelligence", icon = "󰧑 " },
                { "<leader>j", group = "Jumps", icon = "󰴪 " },
                { "<leader>o", group = "Obsidian", icon = " " },
                { "<leader>s", group = "Search", icon = " " },
                { "<leader>S", group = "Session", icon = " " },
                { "<leader>m", group = "Marks", icon = "󰍐 " },
                { "<leader>n", group = "Notes", icon = " " },
                { "<leader>u", group = "UI", icon = "󰙵 " },
                { "<leader>a", group = "[A]pp", icon = " " },
                { "[", group = "Prev", icon = "󰒮 " },
                { "]", group = "Next", icon = "󰒭 " },
                { "g", group = "G", icon = "󱡓 " },
                { "S", group = "Surround", icon = "󰅩 " },
            },
        },
        icons = {
            mappings = false, -- Disable all icons
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
