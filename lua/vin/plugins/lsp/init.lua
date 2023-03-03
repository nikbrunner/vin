local utils = require("vin.lib.utils")

return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
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
            automatic_installation = true,
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
            {
                "jose-elias-alvarez/null-ls.nvim",
                event = "BufReadPre",
            },
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
                        debounce_text_changes = 0,
                    },
                },
            }

            lsp_zero.setup_servers(utils.merge({
                Vin.config.mason.ensure_installed.servers,
                shared_lsp_opts,
            }))

            -- scan all names of files in the lsp.servers directory
            local server_configs = vim.fn.readdir(
                vim.fn.stdpath("config") .. "/lua/vin/plugins/lsp/servers"
            )

            local load_server_config = function(server_config_file_name)
                require("vin.plugins.lsp.servers." .. server_config_file_name).setup(
                    lsp_zero
                )
            end

            -- for each file name require it
            for i, server_config in ipairs(server_configs) do
                -- Remove file extension from server_config and load it
                load_server_config(server_config:gsub("%..*", ""))
            end

            lsp_zero.nvim_workspace()

            -- NOTE: Must be called after all of server configurations
            lsp_zero.setup()

            -- Setup Vim Diagnostic Settings
            vim.diagnostic.config({
                virtual_text = Vin.config.diagnostics.virtual_text_enabled,
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
            require("vin.plugins.lsp.null_ls").setup(lsp_zero, Vin.config.null_ls)
        end,
    },
}
