local M = {}

---@type LazySpec
M.spec = {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting

        -- To check state use `:NullLsInfo`
        null_ls.setup({
            sources = {
                formatting.stylua,
                diagnostics.luacheck,

                formatting.prettierd,
                diagnostics.eslint_d,

                diagnostics.shellcheck,
                code_actions.shellcheck,
            },
        })
    end,
}

return M.spec
