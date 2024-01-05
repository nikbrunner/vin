---@diagnostic disable: missing-fields
local M = {}

function M.refresh_neotree()
    require("neo-tree.sources.manager").refresh("filesystem")
    require("neo-tree.sources.manager").refresh("git_status")
    require("neo-tree.sources.manager").refresh("buffers")
end

---@type LazySpec
M.spec = {
    "numToStr/FTerm.nvim",
    ---@diagnostic disable-next-line: assign-type-mismatch
    keys = function()
        local fterm = require("FTerm")

        local win_opts = {
            border = "single",
            hl = "NormalFloat",
            dimensions = { height = 0.95, width = 0.95 },
        }

        local lazygit_term = fterm:new(vim.tbl_extend("force", win_opts, {
            ft = "ftterm_lazygit",
            cmd = "lazygit",
            on_exit = M.refresh_neotree,
        }))

        local gh_dash_term = fterm:new(vim.tbl_extend("force", win_opts, {
            ft = "ftterm_gh_dash",
            cmd = { "gh", "dash" },
        }))

        return {
            -- stylua: ignore start
            { "<leader>gg", mode = "n", function() lazygit_term:toggle() end, desc = "LazyGit", },
            { "<leader>gp", mode = "n", function() gh_dash_term:toggle() end, desc = "GitHub Dash", },
            -- stylua: ignore end
        }
    end,
    opts = {},
}

return M.spec
