local M = {}

---@type LazySpec
M.spec = {
    "nvimtools/none-ls.nvim",
    lazy = false,
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting

        -- To check state use `:NullLsInfo`
        null_ls.setup({

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
            sources = {
                formatting.stylua,

                formatting.prettierd,
                diagnostics.eslint_d,

                diagnostics.shellcheck,
                code_actions.shellcheck,
            },
        })
    end,
}

return M.spec
