local concat = table.concat

local HOME_PATH = "~/"
local NVIM_CONFIG_PATH = vim.fn.stdpath("config")
local CONFIG_PATH = concat({ HOME_PATH, ".config/" })
local DOCUMENTS_PATH = concat({ HOME_PATH, "Documents/" })
local NOTES_PATH = concat({ DOCUMENTS_PATH, "notes/" })

---@class VinConfig
Vin.config = {
    username = "Nik",
    colorscheme = "terra",
    transparent = true,
    nightly_version = "0.10",
    dot_mode = false,
    diagnostics = {
        virtual_text_enabled = true,
    },
    copilot = {
        suggestions = {
            enable = true,
            auto_trigger = true,
        },
    },
    mason = {
        ensure_installed = {
            ---Attention: It is not (yet?) possible to ensure installation of `non-lsp` tools (see here: https://github.com/williamboman/mason-lspconfig.nvim/issues/113)
            ---These entries get handed over to via `lsp-zero` to `mason.nvim`
            ---@see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            ---@see https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
            ---@see https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
            servers = {
                "cssls",
                "gopls",
                "gopls",
                "bashls",
                "html",
                "jsonls",
                "marksman",
                "rust_analyzer",
                "lua_ls",
                "tsserver",
                "eslint",
            },
            --- Via: WhoIsSethDaniel/mason-tool-installer.nvim
            tools = {
                "stylua",
                "luacheck",
                "shellcheck",
                "prettierd",
                "black",
            },
        },
    },
    syntax = {
        ---These entries handed over to Treesitter
        ---@see https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        ensure_installed = {
            "bash",
            "css",
            "go",
            "help",
            "html",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "rust",
            "scss",
            "tsx",
            "typescript",
            "vim",
            "yaml",
            "embedded_template",
        },
    },
    null_ls = {
        ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        formatting = {
            "prettierd",
            "stylua",
            "black",
        },
        ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        diagnostics = {},
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
            work = concat({ NOTES_PATH, "dcd-notes" }),
            private = concat({ NOTES_PATH, "notes" }),
        },
    },
}
