local status_ok, luadev = pcall(require, "lua-dev")
if not status_ok then
    return
end

luadev.setup({
    library = {
        vimruntime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    },

    runtime_path = false, -- enable this to get completion in require strings. Slow!

    -- pass any additional options that will be merged in the final lsp config
    lspconfig = {
        cmd = { "lua-language-server" },
        -- on_attach = ...
    },
})

local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup(luadev)
