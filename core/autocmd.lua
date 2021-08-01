-- set filetypes as typescriptreact
vim.cmd "au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact"
vim.cmd "au BufRead,BufNewFile *.ts        set filetype=typescript"

-- Auto-resize splits when Vim gets resized.
vim.cmd "au VimResized * wincmd ="
