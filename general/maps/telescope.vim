" telescope
nnoremap <C-p>                               <cmd>Telescope find_files<CR>
nnoremap <leader>pw                          :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <C-f>                               <cmd>Telescope live_grep<CR>
nnoremap <C-s>                               <cmd>Telescope grep_string<CR>
nnoremap <C-e>                               <cmd>Telescope buffers<CR>
nnoremap <leader>ht                          <cmd>Telescope help_tags<CR>

