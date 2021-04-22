" coc
nmap <silent> gd                             <Plug>(coc-definition)
nmap <silent> gy                             <Plug>(coc-type-definition)
nmap <silent> gi                             <Plug>(coc-implementation)
nmap <silent> gr                             <Plug>(coc-references)
nmap <silent> <M-CR>                         <Plug>(coc-codeaction)
" nmap <silent> ≥                              <Plug>(coc-fix-current)
nmap <silent> <F2>                           <Plug>(coc-rename)
nmap <silent> gh                             :call <SID>show_documentation()<CR>

inoremap <silent><expr><c-space>             coc#refresh()
inoremap <silent><expr><C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k>                             pumvisible() ? "\<C-p>" : "\<C-h>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
