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
            {
                "hrsh7th/nvim-cmp",
                version = false, -- last release is way too old
                event = "InsertEnter",
                dependencies = {
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-nvim-lua",
                    "saadparwaiz1/cmp_luasnip",
                    "onsails/lspkind-nvim",
                },
            },
        },
        config = function()
            local lsp_zero = require("lsp-zero")

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

            lsp_zero.setup_servers(Vin.lib.utils.merge({
                Vin.config.mason.ensure_installed.servers,
                shared_lsp_opts,
            }))

            -- get all names of files in the lsp.servers directory
            local server_configs = vim.fn.readdir(
                vim.fn.stdpath("config") .. "/lua/vin/plugins/lsp/servers"
            )
            -- for each file name require it
            for i, server in ipairs(server_configs) do
                local server_without_file_ext = server:gsub("%..*", "")
                require("vin.plugins.lsp.servers." .. server_without_file_ext).setup(lsp_zero)
            end

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

            require("vin.plugins.lsp.cmp").setup(lsp_zero)
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
