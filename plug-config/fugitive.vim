" git-fugitive
nnoremap <leader>gs                          :Git<CR>\|:resize 25<CR>
nnoremap <leader>go                          :Git<CR>\|<C-w>k\|:q<CR>\|:TabooRename Git<CR>\|:NERDTreeToggle<CR>\|:tabnew<CR>\|:Telescope find_files<CR>
nnoremap <leader>gc                          :Git commit<CR>
nnoremap <leader>gpu                         :Git push<CR>
nnoremap <leader>gpl                         :Git pull<CR>
nnoremap <leader>gl                          :GV<CR>
nnoremap <leader>gb                          :GV!<CR>
nnoremap <leader>u                           :UndotreeShow<CR>
nnoremap <leader>lg                          :LazyGit<CR>
