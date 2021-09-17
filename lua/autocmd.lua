-- set filetypes as typescriptreact
vim.cmd "au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact"
vim.cmd "au BufRead,BufNewFile *.ts        set filetype=typescript"

-- Wrap lines for markdown files
vim.cmd[[
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap linebreak nolist
augroup END
]]

-- Auto-resize splits when Vim gets resized.
vim.cmd "au VimResized * wincmd ="
