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

        local lazygit_term = fterm:new({
            ft = "ftterm_lazygit",
            cmd = "lazygit",
            border = "rounded",
            hl = "NormalFloat",
            dimensions = { height = 0.95, width = 0.95 },
            on_exit = M.refresh_neotree,
        })

        return {
            -- stylua: ignore start
            { "<leader>gg", mode = "n", function() lazygit_term:toggle() end, desc = "Open Today's Note in Floating Window", },
            -- stylua: ignore end
        }
    end,
    opts = {},
}

return M.spec
