local M = {}

-- [LazyVim/lua/lazyvim/plugins/extras/lang/typescript.lua at main · LazyVim/LazyVim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/typescript.lua)
-- [vtsls/packages/service/configuration.schema.json at main · yioneko/vtsls](https://github.com/yioneko/vtsls/blob/main/packages/service/configuration.schema.json)

---@type LazyPluginSpec
M.spec = {
    "yioneko/nvim-vtsls",
    event = "LspAttach",
    opts = {
        settings = {
            complete_function_calls = true,
            vtsls = {
                enableMoveToFileCodeAction = true,
                autoUseWorkspaceTsdk = true,
                experimental = {
                    completion = {
                        enableServerSideFuzzyMatch = true,
                    },
                },
            },
            typescript = {
                tsserver = { maxTsServerMemory = 25000 },
                updateImportsOnFileMove = { enabled = "always" },
                suggest = {
                    completeFunctionCalls = true,
                },
                inlayHints = {
                    enumMemberValues = { enabled = true },
                    functionLikeReturnTypes = { enabled = true },
                    parameterNames = { enabled = "literals" },
                    parameterTypes = { enabled = true },
                    propertyDeclarationTypes = { enabled = true },
                    variableTypes = { enabled = false },
                },
                preferences = {
                    importModuleSpecifier = "relative",
                },
            },
        },
    },
    config = function(_, opts)
        require("lspconfig").vtsls.setup(opts)
    end,
}

return M.spec
