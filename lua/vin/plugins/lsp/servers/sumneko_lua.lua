local disable_client_formating = require("vin.lib.lsp").disable_client_formating

local M = {}

function M.setup(lsp_zero)
    -- Setup neodev if present
    -- NOTE: neodev will only setup types for my own neovim config
    -- Source: https://github.com/folke/neodev.nvim#-setup
    local neodev_present, neodev = pcall(require, "neodev")
    if neodev_present then
        neodev.setup({
            library = {
                enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
                -- these settings will be used for your Neovim config directory
                runtime = true, -- runtime path
                types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
                plugins = true, -- installed opt or start plugins in packpath
                -- you can also specify the list of plugins to make available as a workspace library
                -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
            },
            setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
            -- for your Neovim config directory, the config.library settings will be used as is
            -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
            -- for any other directory, config.library.enabled will be set to false
            override = function(root_dir, options) end,
            -- With lspconfig, Neodev will automatically setup your lua-language-server
            -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
            -- in your lsp start options
            lspconfig = true,
            -- much faster, but needs a recent built of lua-language-server
            -- needs lua-language-server >= 3.6.0
            pathStrict = true,
        })
    end

    lsp_zero.configure("sumneko_lua", {
        on_init = function(client)
            -- We want to format with null-ls, so we disable the native formatter
            disable_client_formating(client)
        end,
    })

    -- Setyup nvim workspace
    lsp_zero.nvim_workspace({
        library = vim.api.nvim_get_runtime_file("", true),
    })
end

return M
