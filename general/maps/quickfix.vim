" Quickfix workflow =======================================================
nnoremap <C-q>                    :call ToggleQFList(1)<CR>
" nnoremap <leader>qq                :call ToggleQFList(0)<CR> " I am not shure why i should need this 

nnoremap <leader>qf               :Ack<Space> 
nnoremap <leader>qo               :Ack<CR>
nnoremap <leader>qn               :cnext<CR>zz
nnoremap <leader>qp               :cprev<CR>zz

nnoremap <leader>lo               :lopen<CR>
nnoremap <leader>ln               :lnext<CR>zz
nnoremap <leader>lp               :lprev<CR>zz


let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun


" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()

" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>
