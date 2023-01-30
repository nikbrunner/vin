local M = {}

function M.setup(config_sources)
    local null_ls = require("null-ls")

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

    null_ls.setup({
        sources = buildSources(config_sources),
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePost", {
                    group = vim.api.nvim_create_augroup("LspFormatting", {}),
                    buffer = bufnr,
                    callback = function()
                        Vin.cmds.lsp.format_async(bufnr)
                    end,
                })
            end
        end,
    })
end

return M
