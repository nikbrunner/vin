local present, null_ls = pcall(require, "null-ls")
if not present then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    debug = true,
    sources = {
        formatting.prettier,
        formatting.stylua,
        formatting.gofmt,

        -- If enabled I get double entries
        -- diagnostics.eslint,
        -- diagnostics.tsc,

        code_actions.eslint,
        code_actions.gitsigns,
    },
})
