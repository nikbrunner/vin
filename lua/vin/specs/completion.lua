local M = {}

---@type LazyPluginSpec[]
M.specs = {
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind.nvim",
        },
        event = "InsertEnter",
        ---@see [nvim-cmp/lua/cmp/config/default.lua at main · hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua)
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            cmp.setup({
                completeopt = "menu,menuone,preview,noinsert",
                window = {
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                        border = "solid",
                    }),
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                        border = "solid",
                    }),
                    scrollbar = false,
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(4),

                    ["<C-j>"] = cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Insert,
                    }),
                    ["<C-k>"] = cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Insert,
                    }),

                    ["<C-l>"] = cmp.mapping.complete(), -- This triggers the suggestion
                    ["<C-e>"] = cmp.mapping.abort(),

                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),

                -- [Menu Appearance · hrsh7th/nvim-cmp Wiki](https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-get-types-on-the-left-and-offset-the-menu)
                formatting = {
                    expandable_indicator = true,
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = "    [" .. (strings[2] or "") .. "]"

                        -- append source name to menu
                        if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
                            kind.menu = kind.menu .. "    (" .. entry.completion_item.detail .. ")"
                        end

                        return kind
                    end,
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    -- { name = "luasnip" },
                    { name = "cmp_yanky" },
                }, {
                    { name = "path" },
                    { name = "buffer" },
                }),
            })
        end,
    },
}

return M.specs
