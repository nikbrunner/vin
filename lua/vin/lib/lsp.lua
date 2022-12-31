local M = {}

--- Configure a language server_capabilities
---@param client any LSP client
---@return nil
M.disable_client_formating = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
end

return M
