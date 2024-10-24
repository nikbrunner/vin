return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    opts = {
        enhanced_diff_hl = true, -- See |diffview-config-enhanced_diff_hl|
    },
    keys = {
        {
            "<leader>gdd",
            "<CMD>DiffviewFileOpen<CR>",
            desc = "Diff",
        },
        {
            "<leader>gdf",
            "<CMD>DiffviewFileHistory %<CR>",
            desc = "Diff History (File)",
        },
    },
}
