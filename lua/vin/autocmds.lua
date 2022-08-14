-- autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]])

local lsp_au_group = vim.api.nvim_create_augroup("Formatting", { clear = true })
local buf_write_post_group = vim.api.nvim_create_augroup(
    "Post Buff Write",
    { clear = true }
)

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
    group = lsp_au_group,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function()
        local colorizer_status_ok, _ = pcall(require, "colorizer")
        if not colorizer_status_ok then
            return
        else
            vim.cmd("ColorizerAttachToBuffer")
        end

        vim.cmd("Gitsigns refresh")
    end,
    group = buf_write_post_group,
})
