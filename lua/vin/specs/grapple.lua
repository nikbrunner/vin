local M = {}

---@type LazyPluginSpec
M.spec = {
    "cbochs/grapple.nvim",
    opts = {
        scope = "git_branch", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
        { "<leader>ma", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
        { "<leader>mm", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
        { "[m", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
        { "]m", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
    },
}

return M.spec
