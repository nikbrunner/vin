" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufRead,BufNewFile *.ts        set filetype=typescript

augroup CursorLine
  au!
  au VimEnter,InsertEnter,BufWinEnter * setlocal cursorline
  au VimEnter,InsertEnter,BufWinEnter * setlocal rnu nu
  au InsertLeave * setlocal nocursorline
augroup END

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =
