local present, lsp = pcall(require, "lsp-zero")
if not present then
    return
end

local disable_client_formating = Vin.lib.lsp.disable_client_formating

---@see https://github.com/typescript-language-server/typescript-language-server#initializationoptions
---@see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
lsp.configure("tsserver", {
    on_init = function(client)
        -- We want to format with null-ls, so we disable the native formatter
        disable_client_formating(client)
    end,
})
