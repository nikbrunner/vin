local M = {}

---@type LazyPluginSpec
M.spec = {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "]g",
            function()
                require("gitsigns").nav_hunk("next")
            end,
            desc = "Next Hunk",
        },
        {
            "[g",
            function()
                require("gitsigns").nav_hunk("prev")
            end,
            desc = "Prev Hunk",
        },
        {
            "<leader>hs",
            function()
                require("gitsigns").stage_hunk()
            end,
            desc = "Stage Hunk",
            mode = { "n", "v" },
        },
        {
            "<leader>hr",
            function()
                require("gitsigns").reset_hunk()
            end,
            desc = "Reset Hunk",
            mode = { "n", "v" },
        },
        {
            "<leader>hu",
            function()
                require("gitsigns").undo_stage_hunk()
            end,
            desc = "Undo Stage Hunk",
            mode = { "n", "v" },
        },
        {
            "<leader>hd",
            function()
                require("gitsigns").preview_hunk()
            end,
            desc = "Diff (Hunk)",
            mode = { "n", "v" },
        },
        {
            "<leader>dvr",
            function()
                require("gitsigns").reset_buffer()
            end,
            desc = "[R]evert changes",
        },
        {
            "<leader>dvs",
            function()
                require("gitsigns").stage_buffer()
            end,
            desc = "[S]tage document",
        },
    },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
    },
}

return M.spec
