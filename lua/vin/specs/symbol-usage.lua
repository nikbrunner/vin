local SymbolKind = vim.lsp.protocol.SymbolKind

---@type LazyPluginSpec
return {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
    opts = {
        hl = { link = "@comment" },
        vt_position = "end_of_line",
        ---@see https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#symbolKind
        ---@type lsp.SymbolKind[] Symbol kinds what need to be count (see `lsp.SymbolKind`)
        kinds = {
            SymbolKind.Function,
            SymbolKind.Method,
            SymbolKind.Variable,
            SymbolKind.Constant,
            SymbolKind.Object,
            SymbolKind.Field,
            SymbolKind.Enum,
        },

        disable = {
            cond = {
                function()
                    -- disable for all files in node_modules
                    return vim.fn.expand("%:p"):find("/node_modules/")
                end,
                function()
                    -- disable for all files outside of the cwd
                    return vim.fn.expand("%:p"):find(vim.fn.getcwd())
                end,
            },
        },
    },
}
