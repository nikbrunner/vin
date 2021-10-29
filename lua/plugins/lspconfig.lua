local lspconfig = require("lspconfig");
local servers = { "tsserver", "html", "cssls" }

for _,lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = {
    "css",
    "scss",
  },
  settings = {
    css = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}
