local join = Vin.lib.utils.join

local HOME_PATH = "~/"
local CONFIG_PATH = join(HOME_PATH, ".config/")
local NVIM_CONFIG_PATH = vim.fn.stdpath("config")
local DOCUMENTS_PATH = join(HOME_PATH, "Documents/")
local NOTES_PATH = join(DOCUMENTS_PATH, "notes/")

---@class VinConfig
Vin.config = {
    username = "Nik",
    colorscheme = "terra",
    nightly_version = "0.9",
    servers = {
        ---These entries get handed over to via `lsp-zero` to `mason.nvim`
        ---@see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        ensure_installed = {
            "html",
            "tsserver",
            "cssls",
            "gopls",
            "sumneko_lua",
            "gopls",
            "rust_analyzer",
            "jsonls",
            "marksman",
        },
    },
    syntax = {
        ---These entries handed over to Treesitter
        ---@see https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        ensure_installed = {
            "html",
            "help",
            "jsdoc",
            "bash",
            "javascript",
            "typescript",
            "css",
            "tsx",
            "json",
            "lua",
            "vim",
            "python",
            "rust",
            "go",
            "java",
            "yaml",
            "markdown",
        },
    },
    null_ls = {
        ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        formatting = {
            "prettier",
            "stylua",
        },
        ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        diagnostics = {
            "eslint",
        },
        ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
        code_actions = {
            "eslint",
            "gitsigns",
        },
    },
    pathes = {
        config = CONFIG_PATH,
        nvimConfig = NVIM_CONFIG_PATH,
        notes = {
            work = join(NOTES_PATH, "dcd-notes"),
            private = join(NOTES_PATH, "notes"),
        },
    },
}
