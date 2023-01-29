local present, lsp_zero = pcall(require, "lsp-zero")
if not present then
    return
end

local disable_client_formating = Vin.lib.lsp.disable_client_formating

lsp_zero.configure("cssls", {
    on_init = function(client)
        -- We want to format with null-ls, so we disable the native formatter
        disable_client_formating(client)
    end,
})
