local config = require("vin.config")

local M = {}

---@type LazyPluginSpec[]
M.specs = {
    {
        "williamboman/mason.nvim",
        opts = {},
        ---@param opts MasonSettings | {ensure_installed: string[]}
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "folke/neodev.nvim",
        },
        opts = {
            ensure_installed = config.ensure_installed.servers,

            -- `:h mason-lspconfig-automatic-server-setup`
            -- `:h mason-lspconfig.setup_handlers`
            handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have a dedicated handler.
                function(server_name) -- default handler (optional)
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                ---@see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
                -- For a list of lsp-configurations see here: `:h lspconfig-all`
                ["lua_ls"] = function()
                    -- https://github.com/folke/neodev.nvim?tab=readme-ov-file#-setup
                    require("neodev").setup({})

                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,

                tsserver = function()
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    require("lspconfig").tsserver.setup({
                        capabilities = capabilities,
                        root_dir = function(...)
                            return require("lspconfig.util").root_pattern(".git")(...)
                        end,
                        init_options = {
                            hostInfo = "neovim",
                            -- https://github.com/typescript-language-server/typescript-language-server#initializationoptions
                            preferences = {
                                importModuleSpecifierPreference = "relative",
                            },
                        },
                        settings = {
                            typescript = {
                                inlayHints = {
                                    includeInlayParameterNameHints = "literal",
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayEnumMemberValueHints = true,
                                },
                            },
                            javascript = {
                                inlayHints = {
                                    includeInlayParameterNameHints = "all",
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayEnumMemberValueHints = true,
                                },
                            },
                        },
                    })
                end,
            },
        },
        config = function(_, opts)
            local icons = require("vin.icons")

            vim.fn.sign_define("DiagnosticSignError", { text = icons.diagnostics.Error, texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn", { text = icons.diagnostics.Warn, texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo", { text = icons.diagnostics.Info, texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint", { text = icons.diagnostics.Hint, texthl = "DiagnosticSignHint" })

            vim.diagnostic.config({
                underline = false,
                virtual_text = {
                    prefix = " " .. require("vin.icons").misc.circle,
                },
                signs = true,
                update_in_insert = false,
                float = {
                    border = "solid",
                },
            })

            require("mason-lspconfig").setup(opts)
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = "williamboman/mason.nvim",
        -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
        lazy = false,
        opts = {
            ensure_installed = config.ensure_installed.tools,
        },
    },
}

return M.specs
