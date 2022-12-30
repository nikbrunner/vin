local lsp_zero_present, lsp_zero = pcall(require, "lsp-zero")

if lsp_zero_present then
    lsp_zero.configure("sumneko_lua", {
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

    lsp_zero.nvim_workspace({
        library = vim.api.nvim_get_runtime_file("", true),
    })
end

-- Setup neodev if present
local neodev_present, neodev = pcall(require, "neodev")
if neodev_present then
    neodev.setup()
end
