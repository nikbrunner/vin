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
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                "lazy.nvim",
                "/luvit-meta/library",
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "folke/lazydev.nvim",
        },
        opts = {
            ensure_installed = config.ensure_installed.servers,

            -- `:h mason-lspconfig-automatic-server-setup`
            -- `:h mason-lspconfig.setup_handlers`
            handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have a dedicated handler.
                function(server_name) -- default handler (optional)
                    -- TypeScript tools is used for setup @see `lua/vin/specs/typescript_tools.lua`
                    if server_name == "tsserver" then
                        return nil
                    end

                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    ---@see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
                    -- For a list of lsp-configurations see here: `:h lspconfig-all`
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                -- Much is handled by `lazydev` here
                -- https://luals.github.io/wiki/settings/#settings
                ["lua_ls"] = function()
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                },
                                telemetry = { enable = false },
                                hint = { enable = true },
                                codeLens = { enable = true },
                                completion = { callSnippet = "Replace" },
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
