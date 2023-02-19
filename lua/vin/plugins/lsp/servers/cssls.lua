local disable_client_formating = require("vin.lib.lsp").disable_client_formating

local M = {}

function M.setup(lsp_zero)
    lsp_zero.configure("cssls", {
        on_init = function(client)
            -- We want to format with null-ls, so we disable the native formatter
            disable_client_formating(client)
        end,
    })
end

return M
