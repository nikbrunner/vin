" Move to previous/next
nnoremap <silent>≤                  :BufferPrevious<CR>
nnoremap <silent>≥                  :BufferNext<CR>

" Re-order to previousMnext
nnoremap <silent>¯                  :BufferMovePrevious<CR>
nnoremap <silent>˘                  :BufferMoveNext<CR>

" Close buffer
nnoremap <silent> <leader>qq        :BufferClose<CR>

" Close commands
nnoremap <silent> <leader>qo        :BufferCloseAllButCurrent<CR>

" Magic buffer-picking mode
nnoremap <silent> <C-s>             :BufferPick<CR>

" Sort automatically by...
nnoremap <silent> <Space>bd         :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl         :BufferOrderByLanguage<CR>
