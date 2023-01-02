local present, null_ls = pcall(require, "null-ls")
if not present then
    return
end

---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

local lspFormattingGroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier,
        formatting.stylua,
        diagnostics.eslint,
        diagnostics.markdownlint,
        code_actions.eslint,
        code_actions.gitsigns,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = lspFormattingGroup,
                buffer = bufnr,
            })

            vim.api.nvim_create_autocmd("BufWritePost", {
                group = lspFormattingGroup,
                buffer = bufnr,
                callback = function()
                    Vin.cmds.lsp.format_async(bufnr)
                end,
            })
        end
    end,
})

local fm = {}

for i, formatter in ipairs(Vin.config.null_ls.formatting) do
    table.insert(fm, i, "null_ls.builtins.formatting." .. formatter)
end

vim.pretty_print(fm)
