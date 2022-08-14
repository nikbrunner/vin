local mason_present, mason = pcall(require, "mason")

if not mason_present then
    return
end

local mason_lspconfig_present, lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_present then
    return
end

mason.setup({})

lspconfig.setup({
    ensure_installed = { "sumneko_lua", "tsserver" },
})
