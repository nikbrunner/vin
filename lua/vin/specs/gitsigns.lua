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

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
            end

           -- stylua: ignore start
            map("n", "]g", gs.next_hunk, "Next Hunk")
            map("n", "[g", gs.prev_hunk, "Prev Hunk")

            map({ "n", "v" }, "<leader>ghs", gs.stage_hunk, "Stage Hunk")
            map({ "n", "v" }, "<leader>ghr", gs.reset_hunk, "Reset Hunk")
            map({ "n", "v" }, "<leader>gl", gs.toggle_current_line_blame, "Current Line Blame")
            map({ "n", "v" }, "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
            map({ "n", "v" }, "<leader>ghp", gs.preview_hunk, "Preview Hunk")
            map({ "n", "v" }, "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")

            map("n", "<leader>gbr", gs.reset_buffer, "Reset Buffer")
            map("n", "<leader>gbs", gs.stage_buffer, "Stage Buffer")

            map("n", "<leader>gd", function() gs.diffthis("~") end, "Diff This ~")
            -- stylua: ignore end
        end,
    },
}

return M.spec
