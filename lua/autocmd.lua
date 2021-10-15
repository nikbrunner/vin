-- set filetypes as typescriptreact
vim.cmd "au BufNewFile,BufRead *jsx        set filetype=javascriptreact"
vim.cmd "au BufNewFile,BufRead *.tsx       set filetype=typescriptreact"
vim.cmd "au BufRead,BufNewFile *.js        set filetype=javascript"
vim.cmd "au BufRead,BufNewFile *.ts        set filetype=typescript"

-- Wrap lines for markdown files
vim.cmd [[
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap linebreak nolist
augroup END
]]

-- Auto-resize splits when Vim gets resized.
vim.cmd "au VimResized * wincmd ="
