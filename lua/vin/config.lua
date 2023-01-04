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
    null_ls = {
        ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        formatting = {
            "prettier",
            "stylua",
        },
        ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        diagnostics = {
            "eslint",
            "markdownlint",
        },
        ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
        code_actions = {
            "eslint",
            "gitsigns",
        },
    },
    lsp = {
        ---@see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        ---These get hand over to mason.nvim
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
    pathes = {
        config = CONFIG_PATH,
        nvimConfig = NVIM_CONFIG_PATH,
        notes = {
            work = join(NOTES_PATH, "dcd-notes"),
            private = join(NOTES_PATH, "notes"),
        },
    },
}
