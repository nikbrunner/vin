" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufRead,BufNewFile *.ts        set filetype=typescript

" augroup CursorLine
"   au!
"   au VimEnter,InsertEnter,BufWinEnter * setlocal cursorline
"   au InsertLeave * setlocal nocursorline
" augroup END
