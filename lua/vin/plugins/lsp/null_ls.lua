local M = {}

function M.setup(lsp_zero, config_sources)
    local null_ls = require("null-ls")
    local null_opts = lsp_zero.build_options("null-ls", {})

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
            null_opts.on_attach(client, bufnr)

            local format_cmd = function(input)
                vim.lsp.buf.format({
                    id = client.id,
                    timeout_ms = 5000,
                    async = input.bang,
                })
            end

            vim.api.nvim_buf_create_user_command(bufnr, "NullFormat", format_cmd, {
                bang = true,
                range = true,
                desc = "Format using null-ls",
            })

            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePost", {
                    group = vim.api.nvim_create_augroup("NullFormatGroup", {}),
                        buffer = bufnr,
                        callback = format_cmd,
                })
            end
        end,
    })
end

return M
