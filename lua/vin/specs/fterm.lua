---@diagnostic disable: missing-fields
local M = {}

function M.refresh_neotree()
    require("neo-tree.sources.manager").refresh("filesystem")
    require("neo-tree.sources.manager").refresh("git_status")
    require("neo-tree.sources.manager").refresh("buffers")
    vim.notify("NeoTree refreshed", vim.log.levels.INFO, { title = "NeoTree" })
end

---Normally, `<ctrl-hjkl>` are used to navigate between windows.
---However, when using FTerm, we want to use them to fire restore their default behavior.
---@param term Term
function M.restore_ctrl_hjkl(term)
    local buf = term.buf
    local set = vim.keymap.set
    local opts = { buffer = buf, nowait = true }

    set("t", "<c-h>", "<c-h>", opts)
    set("t", "<c-j>", "<c-j>", opts)
    set("t", "<c-k>", "<c-k>", opts)
    set("t", "<c-l>", "<c-l>", opts)
end

---@type LazyPluginSpec
M.spec = {
    "numToStr/FTerm.nvim",
    enabled = true,
    keys = function()
        local fterm = require("FTerm")

        local win_opts = {
            border = "solid",
            hl = "NormalFloat",
            blend = 10,
            dimensions = { height = 0.95, width = 0.95 },
        }

        -- TODO:  add ability to edit picked file in neovim
        local lazygit_term = fterm:new(vim.tbl_extend("force", win_opts, {
            ft = "ftterm_lazygit",
            cmd = "lazygit",
            dimensions = { height = 1, width = 1 },
            on_exit = function()
                M.refresh_neotree()
            end,
        }))

        local gh_dash_term = fterm:new(vim.tbl_extend("force", win_opts, {
            ft = "ftterm_gh_dash",
            cmd = { "gh", "dash" },
        }))

        return {
            {
                "<A-i>",
                mode = "n",
                function()
                    require("FTerm").toggle()
                end,
            },
            {
                "<A-i>",
                mode = "t",
                function()
                    require("FTerm").toggle()
                end,
            },
            {
                "<leader>gg",
                mode = "n",
                function()
                    lazygit_term:toggle()
                    M.restore_ctrl_hjkl(lazygit_term)
                end,
                desc = "LazyGit",
            },
            {
                "<leader>gp",
                mode = "n",
                function()
                    gh_dash_term:toggle()
                    M.restore_ctrl_hjkl(gh_dash_term)
                end,
                desc = "GitHub Dash",
            },
        }
    end,
    opts = {
        blend = 10,
    },
}

return M.spec
