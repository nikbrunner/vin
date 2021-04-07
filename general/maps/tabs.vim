
" New splits
nnoremap <silent><leader>l                   :vsp<CR><C-W><C-l>
nnoremap <silent><leader>j                   :sp<CR><C-W><C-j>

" Resize panes
nnoremap <silent>H                           :vertical:resize +5<CR>
nnoremap <silent>J                           :resize +5<CR>
nnoremap <silent>K                           :resize -5<CR>
nnoremap <silent>L                           :vertical:resize -5<CR>
nnoremap <silent><leader>=                   <C-w><C-=>

" Nav Tab
nnoremap <silent><S-Tab>                     :tabprevious<CR>
nnoremap <silent><Tab>                       :tabnext<CR>
nnoremap <leader>-                           :tabm -1<CR>
nnoremap <leader>+                           :tabm +1<CR>

" Switch between two buffers
nnoremap <leader><leader>                    <C-^>

" Go to tab by number
nnoremap <leader>1                           1gt
nnoremap <leader>2                           2gt
nnoremap <leader>3                           3gt
nnoremap <leader>4                           4gt
nnoremap <leader>5                           5gt
nnoremap <leader>6                           6gt
nnoremap <leader>7                           7gt
nnoremap <leader>8                           8gt
nnoremap <leader>9                           9gt

" tabs
nnoremap <leader>to                          :TabooOpen<Space>
nnoremap <leader>tn                          :TabooRename<Space>
