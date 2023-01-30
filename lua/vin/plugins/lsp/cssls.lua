local M = {}

function M.setup(lsp_zero)
    local disable_client_formating = Vin.lib.lsp.disable_client_formating

    lsp_zero.configure("cssls", {
        on_init = function(client)
            -- We want to format with null-ls, so we disable the native formatter
            disable_client_formating(client)
        end,
    })
end

return M
