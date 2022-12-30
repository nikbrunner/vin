local lsp_zero_present, lsp_zero = pcall(require, "lsp-zero")
if not lsp_zero_present then
    return
end

lsp_zero.configure("sumneko_lua", {
    on_init = function(client)
        -- We want to format with null-ls, so we disable the native formatter
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            completion = {
                callSnippet = "Replace",
            },
        },
    },
})

-- Setyup nvim workspace
lsp_zero.nvim_workspace({
    library = vim.api.nvim_get_runtime_file("", true),
})

-- Setup neodev if present
local neodev_present, neodev = pcall(require, "neodev")
if neodev_present then
    neodev.setup()
end
