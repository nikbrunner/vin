vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
  require("notify").notify("'" .. client.name .. "' attached!", "info", {
    timeout = 100,
    render = "minimal",
  })

  -- Disable formating abilities from the client, which should be handled by null-ls
  if client.name == "tsserver"
      or client.name == "gopls"
      or client.name == "sumneko_lua"
      or client.name == "jsonls"
  then
    client.server_capabilities.documentFormattingProvider = false
  end
end

protocol.CompletionItemKind = {
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
})

nvim_lsp.sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

nvim_lsp.jsonls.setup(vim.tbl_deep_extend("force", {
  capabilities = capabilities,
  on_attach = on_attach,
}, require("lsp.jsonls"))) -- NOTE: This `require` only works because we modify the package path in the `vin/init.lua`

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] =
vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
    border = "rounded",
  },
})
