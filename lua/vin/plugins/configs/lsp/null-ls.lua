local present, null_ls = pcall(require, "null-ls")
if not present then
    return
end

---Build null_ls sources from entries in VinConfig
---@param config VinConfig.null_ls
---@return table
local buildSources = function(config)
    local sources = {}

    for category, entries in pairs(config) do
        for _, entry in ipairs(entries) do
            local source = null_ls.builtins[category][entry]
            table.insert(sources, source)
        end
    end

    return sources
end

local lspFormattingGroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = buildSources(Vin.config.null_ls),
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
