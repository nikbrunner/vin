local status_ok, luadev = pcall(require, "lua-dev")
if not status_ok then
	return
end

luadev.setup({
	-- add any options here, or leave empty to use the default settings
	-- lspconfig = {
	-- 	cmd = { "lua-language-server" },
	-- },
})

local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup(luadev)
