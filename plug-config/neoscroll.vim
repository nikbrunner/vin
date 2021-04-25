" Neoscroll (I've disabled everything else) 
let g:neoscroll_no_mappings=1

nnoremap <silent><C-d>                       :lua require('neoscroll').scroll(vim.wo.scroll, true, 8)<CR>
nnoremap <silent><C-u>                       :lua require('neoscroll').scroll(-vim.wo.scroll, true, 8)<CR>

