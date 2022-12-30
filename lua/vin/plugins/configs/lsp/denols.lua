local present, lsp = pcall(require, "lsp-zero")
if not present then
    return
end

lsp.configure("denols", {
    on_init = function(client)
        -- We want to format with null-ls, so we disable the native formatter
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
    cmd = { "deno", "lsp" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    init_options = {
        enable = true,
        lint = true,
        unstable = false,
    },
    -- Look for these files to identify a deno repository, to prevent attaching to unrelated typescript files
    root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
})
