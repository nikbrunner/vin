local disable_client_formating = require("vin.lib.lsp").disable_client_formating

local M = {}

function M.setup(lsp_zero)
    ---@see https://github.com/typescript-language-server/typescript-language-server#initializationoptions
    ---@see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
    lsp_zero.configure("tsserver", {
        on_init = function(client)
            -- We want to format with null-ls, so we disable the native formatter
            disable_client_formating(client)
        end,
    })
end

return M
