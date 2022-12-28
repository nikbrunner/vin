local lsp_zero_present, lsp_zero = pcall(require, "lsp-zero")

if lsp_zero_present then
    local lspkind = require("lspkind")
    local cmp = require("cmp")

    local cmp_mappings = lsp_zero.defaults.cmp_mappings({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
    })

    local cmp_config = lsp_zero.defaults.cmp_config({
        mapping = cmp_mappings,
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = lspkind.cmp_format({
                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                before = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            }),
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    })

    cmp.setup(cmp_config)
end
