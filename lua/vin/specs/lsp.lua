local M = {}

---@type LazySpec[]
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
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "folke/neodev.nvim",
        },
        opts = {
            ensure_installed = {
                "astro",
                "bashls",
                "cssls",
                "gopls",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "rust_analyzer",
                "tsserver",
            },

            -- `:h mason-lspconfig-automatic-server-setup`
            -- `:h mason-lspconfig.setup_handlers`
            handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have a dedicated handler.
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({})
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                -- For a list of lsp-configurations see here: `:h lspconfig-all`
                ["lua_ls"] = function()
                    -- https://github.com/folke/neodev.nvim?tab=readme-ov-file#-setup
                    require("neodev").setup({})

                    require("lspconfig").lua_ls.setup({
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
                    require("lspconfig").tsserver.setup({
                        root_dir = function(...)
                            return require("lspconfig.util").root_pattern(".git")(
                                ...
                            )
                        end,
                        init_options = {
                            hostInfo = "neovim",
                            ---@see https://github.com/typescript-language-server/typescript-language-server#initializationoptions
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
            require("mason-lspconfig").setup(opts)
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "luacheck",
                "shellcheck",
                "prettierd",
                "black",
            },
        },
    },
}

return M.specs
