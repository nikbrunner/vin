local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function M.setup(lsp_zero, config_sources)
    local null_ls = require("null-ls")
    local null_opts = lsp_zero.build_options("null-ls", {
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                local format = function()
                    vim.lsp.buf.format({
                        id = client.id,
                        bufnr = bufnr,
                        async = true,
                    })
                end

                vim.api.nvim_buf_create_user_command(bufnr, "NullFormat", format, {
                    bang = true,
                    range = true,
                    desc = "Format using null-ls",
                })

                vim.api.nvim_create_autocmd("BufWritePre", {
                    desc = "Auto format before save",
                    pattern = "<buffer>",
                    group = augroup,
                    callback = format,
                })
            end
        end,
    })

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
        on_attach = null_opts.on_attach,
    })
end

return M
