function! s:goyo_enter()
  set scrolloff=999
endfunction

function! s:goyo_leave()
  hi Normal guibg=NONE ctermbg=NONE
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
