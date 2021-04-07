let mapleader = " "

" Unmaps
nnoremap Q <nop>

" source, save, quit
nnoremap <leader><C-r>                       :source ~/.config/nvim/init.vim<CR>

" Sessions
nnoremap <silent><leader>ps                  :Obsess<CR>

" Startify
nnoremap <silent><leader>s                   :Startify<CR>

" nerdtree
nnoremap <expr>¡                             g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" ranger
nnoremap <silent><leader>n                   :EditVifm .<CR>

" prettier
nnoremap <leader>p                           :PrettierAsync<CR>

" emmet
let g:user_emmet_leader_key=                 '<C-y>'

" goyo
nnoremap <silent><leader>z                   :Goyo<CR>

" md preview
nmap <leader>md                              <Plug>MarkdownPreviewToggle

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cp                        :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cP :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>cf                        :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>cd                        :let @*=expand("%:p:h")<CR>
endif

" Easy log
nnoremap cll                                 oconsole.log("LINE: <C-r>=line('.')<Esc>",)<Esc>O<Esc>jf,a

" Refactor Add Braces to convert function to explicit return 
nnoremap rab                                 f(da(i{}<Esc>i<CR><Esc>Oreturn <Esc>p:w<CR>

" Refactor Remove Braces to convert function to implicit return
nnoremap rrb                                 f(da(kf{va{p:w<CR>

" Close all buffers except current
command! BuffOnly                             %bdelete|edit #|normal `"

