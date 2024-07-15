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
                { "<leader>c", group = "[C]ode", icon = "" },
                { "<leader>cl", group = "[L]og" },
                { "<leader>d", group = "[D]iagnostics" },
                { "<leader>dc", group = "[C]alls" },
                { "<leader>e", group = "[E]xplorer" },
                { "<leader>g", group = "[G]it" },
                { "<leader>gb", group = "[B]uffer" },
                { "<leader>gh", group = "[H]unks" },
                { "<leader>i", group = "[I]ntelligence" },
                { "<leader>ic", group = "[C]opilot" },
                { "<leader>m", group = "[M]arks" },
                { "<leader>p", group = "[P]ad" },
                { "<leader>s", group = "[S]earch" },
                { "<leader>t", group = "[T]MUX" },
                { "<leader>u", group = "[U]I" },
                { "<leader>v", group = "[V]in" },
                { "<leader>w", group = "[W]indows" },
                { "S", group = "Surround" },
                { "[", group = "Prev" },
                { "]", group = "Next" },
                { "g", group = "GoTo" },
            },
        },
        icons = {
            rules = {
                { plugin = "yazi.nvim", icon = " ", hl = "@constant" },
                { plugin = "gitpad.nvim", icon = "󰠮 ", hl = "@character" },
            },
        },
    },
}

return M.spec
