local lsp_zero_present, lsp_zero = pcall(require, "lsp-zero")

if lsp_zero_present then
    lsp_zero.configure("denols", {
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
end
