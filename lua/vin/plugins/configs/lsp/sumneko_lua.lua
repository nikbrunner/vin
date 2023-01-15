local lsp_zero_present, lsp_zero = pcall(require, "lsp-zero")
if not lsp_zero_present then
    return
end

local disable_client_formating = Vin.lib.lsp.disable_client_formating

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

-- Setup neodev if present
local neodev_present, neodev = pcall(require, "neodev")
if neodev_present then
    neodev.setup()
end
