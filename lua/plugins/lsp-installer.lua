local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(
    function(server)

      local opts = {}

      -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
    end
)
