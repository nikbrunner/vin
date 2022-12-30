local present, lsp = pcall(require, "lsp-zero")
if not present then
    return
end

lsp.configure("tsserver", {
    on_init = function(client)
        -- We want to format with null-ls, so we disable the native formatter
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
})
