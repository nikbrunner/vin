local M = {}

vim.g.null_ls_auto_format_enabled = true

---@type LazyPluginSpec
M.spec = {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {
            "<leader>cf",
            "<CMD>NullFormat<CR>",
            desc = "Format using null-ls",
        },
        {
            "<leader>cF",
            function()
                vim.g.null_ls_auto_format_enabled = not vim.g.null_ls_auto_format_enabled
                vim.notify("Auto format " .. (vim.g.null_ls_auto_format_enabled and "enabled" or "disabled"))
            end,
            desc = "Toggle auto format",
        },
    },
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
                        callback = function()
                            if vim.g.null_ls_auto_format_enabled then
                                format()
                            end
                        end,
                    })
                end
            end,
            sources = {
                formatting.stylua,
                formatting.prettierd,
                diagnostics.yamllint,
                formatting.shfmt,
            },
        })
    end,
}

return M.spec
