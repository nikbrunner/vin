local M = {}

---@type LazyPluginSpec
M.spec = {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            function M.map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
            end

           -- stylua: ignore start
            M.map("n", "]g", gs.next_hunk, "Next Hunk")
            M.map("n", "[g", gs.prev_hunk, "Prev Hunk")

            M.map({ "n", "v" }, "<leader>gsh", gs.stage_hunk, "Stage Hunk")
            M.map({ "n", "v" }, "<leader>grh", gs.reset_hunk, "Reset Hunk")
            M.map({ "n", "v" }, "<leader>guh", gs.undo_stage_hunk, "Undo Stage Hunk")
            M.map({ "n", "v" }, "<leader>gdh", gs.preview_hunk, "Diff (Hunk)")

            M.map("n", "<leader>grb", gs.reset_buffer, "Reset Buffer")
            M.map("n", "<leader>gsb", gs.stage_buffer, "Stage Buffer")
            -- stylua: ignore end
        end,
    },
}

return M.spec
