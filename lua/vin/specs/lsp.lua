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
        opts = {
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "gopls",
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim"
        },
        opts = {},
        config = function()
            -- https://github.com/folke/neodev.nvim?tab=readme-ov-file#-setup
            require("neodev").setup({})

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
        end,
    },
}

return M.specs
