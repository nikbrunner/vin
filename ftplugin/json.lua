vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "tsconfig.json", ".eslintrc.json" },
    callback = function()
        vim.bo.filetype = "jsonc"
    end,
})

vim.opt.wrap = true -- display lines as one long line
