local nvim_lsp = require("lspconfig")

-- TODO Fix cssls completion
-- https://github.com/hrsh7th/cmp-nvim-lsp/issues/14
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
  "html",
  "cssls",
  "tsserver"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
  }
end
