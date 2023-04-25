local M = {}

function M.setup(lsp_zero)
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    local cmp_mappings = lsp_zero.defaults.cmp_mappings({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.config.disable,
        ["<S-Tab>"] = cmp.config.disable,
        -- This is to trigger the completion menu
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    })

    local cmp_config = lsp_zero.defaults.cmp_config({
        mapping = cmp_mappings,
        sources = {
            { name = "copilot" },
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            { name = "luasnip" },
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = lspkind.cmp_format({
                mode = "symbol",
                -- max_width = 50,
                symbol_map = { Copilot = " " },
                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                before = function(entry, vim_item)
                    -- Show import path for LSP items
                    -- Source: https://stackoverflow.com/a/72937872
                    if
                        entry.completion_item.detail ~= nil
                        and entry.completion_item.detail ~= ""
                    then
                        vim_item.menu = entry.completion_item.detail
                    else
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                    end

                    return vim_item
                end,
            }),
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    })

    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    cmp.setup(cmp_config)
end

return M
