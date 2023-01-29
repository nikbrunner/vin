return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            ui = {
                -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
                border = "rounded",
            },
        },
        config = function(_, opts)
            local mason = require("mason")
            mason.setup(opts)
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = "mason.nvim",
        opts = {
            ensure_installed = Vin.config.mason.ensure_installed.servers,
        },
        config = function(_, opts)
            local masonLspConfig = require("mason-lspconfig")
            masonLspConfig.setup(opts)
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = "mason.nvim",
        opts = {
            ensure_installed = Vin.config.mason.ensure_installed.tools,
        },
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "mason.nvim",
            "neovim/nvim-lspconfig",
            "tamago324/nlsp-settings.nvim",
            "folke/neodev.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            local merge = Vin.lib.utils.merge
            local ensure_installed = Vin.config.mason.ensure_installed.servers

            lsp_zero.preset("recommended")

            lsp_zero.set_preferences({
                suggest_lsp_servers = true,
                setup_servers_on_start = true,
                set_lsp_keymaps = false, -- Manually set
                configure_diagnostics = true,
                cmp_capabilities = true,
                manage_nvim_cmp = true,
                call_servers = "local",
                sign_icons = {
                    error = "",
                    warn = "",
                    hint = "",
                    info = "",
                },
            })

            -- add border to LspInfo window
            require("lspconfig.ui.windows").default_options.border = "rounded"

            local shared_lsp_opts = {
                -- NOTE: `opts` is a required property for providing options to all mentioned servers
                opts = {
                    flags = {
                        debounce_text_changes = 25,
                    },
                },
            }

            lsp_zero.setup_servers(merge({
                ensure_installed,
                shared_lsp_opts,
            }))

            require("vin.plugins.lsp.jsonls")
            require("vin.plugins.lsp.sumneko_lua")
            require("vin.plugins.lsp.denols")
            require("vin.plugins.lsp.tsserver")
            require("vin.plugins.lsp.cssls")

            -- NOTE: Must be called after all of server configurations
            lsp_zero.setup()

            -- Setup Vim Diagnostic Settings
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = {
                    source = "always",
                    border = "rounded",
                },
            })

            local cmp = require("cmp")
            local lspkind = require("lspkind")

            local cmp_mappings = lsp_zero.defaults.cmp_mappings({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
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
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            })

            cmp.setup(cmp_config)
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        dependencies = { "mason.nvim" },
        opts = function()
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

            return {
                sources = buildSources(Vin.config.null_ls),
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
            }
        end,
        config = function(_, opts)
            local null_ls = require("null-ls")
            null_ls.setup(opts)
        end,
    },
}
