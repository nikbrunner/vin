" telescope
" find file                 ff
nnoremap <C-p>                                    <cmd>Telescope find_files<CR> 
nnoremap <leader>ff                               <cmd>Telescope find_files<CR> 

" find word under cursor    fw
nnoremap <leader>fw                               :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

" find text                 ft
nnoremap <C-f>                                    <cmd>Telescope live_grep<CR>
nnoremap <leader>ft                               <cmd>Telescope live_grep<CR>

" find buffer               fb
nnoremap <C-e>                                    <cmd>Telescope buffers<CR>
nnoremap <leader>fb                               <cmd>Telescope buffers<CR>

" find help                 fh
nnoremap <leader>fh                               <cmd>Telescope help_tags<CR>

" find git                  fg
nnoremap <leader>fg                               <cmd>Telescope git_status<CR>

