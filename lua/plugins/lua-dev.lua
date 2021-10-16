local luadev = require("lua-dev").setup({ lspconfig = { enabled = false } })
local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup(luadev)
