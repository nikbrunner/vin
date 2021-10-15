-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require( "lspconfig" ).cssls.setup {
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    less = { validate = true },
    scss = { validate = true }
  }
}
