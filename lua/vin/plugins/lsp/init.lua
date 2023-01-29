return {
    {
        "williamboman/mason.nvim",
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
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "mason.nvim",
            "neovim/nvim-lspconfig",
            "tamago324/nlsp-settings.nvim",
            "folke/neodev.nvim",
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            local merge = Vin.lib.utils.merge
            local ensure_installed = Vin.config.servers.ensure_installed

            lsp_zero.preset("recommended")

            lsp_zero.ensure_installed(ensure_installed)

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
                        debounce_text_changes = 75,
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

            local lspFormattingGroup = vim.api.nvim_create_augroup(
                "LspFormatting",
                {}
            )

            return {
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
            }
        end,
        config = function(_, opts)
            local null_ls = require("null-ls")
            null_ls.setup(opts)
        end,
    },
}
