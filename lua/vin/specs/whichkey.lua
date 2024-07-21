local M = {}

---@module "which-key"
---@type LazyPluginSpec
M.spec = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        win = {
            border = "solid",
            wo = {
                winblend = 10,
            },
        },
        ---@type wk.Spec
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>c", group = "[C]ode", icon = " " },
                { "<leader>cl", group = "[L]og", icon = " " },
                { "<leader>d", group = "[D]iagnostics", icon = " " },
                { "<leader>dc", group = "[C]alls", icon = " " },
                { "<leader>e", group = "[E]xplorer", icon = "󰙅" },
                { "<leader>g", group = "[G]it", icon = " " },
                { "<leader>gh", group = "[H]unks", icon = "" },
                { "<leader>i", group = "[I]ntelligence", icon = "󰧑 " },
                { "<leader>m", group = "[M]arks", icon = "󰍐 " },
                { "<leader>s", group = "[S]earch", icon = " " },
                { "<leader>t", group = "[T]MUX", icon = "" },
                { "<leader>u", group = "[U]I", icon = "󰙵 " },
                { "<leader>v", group = "[V]in", icon = " " },
                { "<leader>n", group = "[N]otes", icon = " " },
                { "<leader>o", group = "[O]bsidian", icon = " " },
                { "S", group = "Surround", icon = "󰅩 " },
                { "[", group = "Prev", icon = "󰒮 " },
                { "]", group = "Next", icon = "󰒭 " },
                { "g", group = "GoTo", icon = "👉 " },
            },
        },
        icons = {
            rules = {
                { plugin = "yazi.nvim", icon = " ", hl = "@constant" },
                { plugin = "file-surfer.nvim", icon = " ", hl = "@function" },
                { plugin = "gitpad.nvim", icon = "󰠮 ", hl = "@character" },
                { plugin = "no-neck-pain.nvim", icon = "󰈈 ", hl = "@annotation" },
                { plugin = "supermaven-nvim", icon = "󰧑 ", hl = "@boolean" },
            },
        },
    },
}

return M.spec
