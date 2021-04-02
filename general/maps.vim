" general remaps
let mapleader = " "

" Unmaps
nnoremap Q <nop>

" source, save, quit
nnoremap <leader><C-r>                       :source ~/.config/nvim/init.vim<CR>

nnoremap <silent><CR>                        :wa<CR>
nnoremap <leader>qo                          :wa<CR>:only<CR>
nnoremap <leader>q                           :q!<CR>
nnoremap <silent>Q                           :Bdelete menu<CR>

nnoremap <C-a>                               ggVG

" Sessions
nnoremap <silent><leader>ps                  :Obsess<CR>

" New splits
nnoremap <silent><leader>l                   :vsp<CR><C-W><C-l>
nnoremap <silent><leader>j                   :sp<CR><C-W><C-j>

" Resize panes
nnoremap <silent>H                           :vertical:resize +5<CR>
nnoremap <silent>L                           :vertical:resize -5<CR>
nnoremap <silent><leader>=                   <C-w><C-=>

" Nav Tab
nnoremap <silent><S-Tab>                     :tabprevious<CR>
nnoremap <silent><Tab>                       :tabnext<CR>

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

" nerdtree
nnoremap <expr>¡                             g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" ranger
nnoremap <leader>f                           :EditVifm .<CR>

" tabs
nnoremap <leader>to                          :TabooOpen<Space>
nnoremap <leader>tn                          :TabooRename<Space>

" prettier
nnoremap <leader>p                           :PrettierAsync<CR>

" telescope
nnoremap <C-p>                               <cmd>Telescope find_files<CR>
nnoremap <C-f>                               <cmd>Telescope live_grep<CR>
nnoremap <C-e>                               <cmd>Telescope buffers<CR>
nnoremap <leader>fh                          <cmd>Telescope help_tags<CR>

" emmet
let g:user_emmet_leader_key=                 '<C-y>'

" git-fugitive
nnoremap <leader>gs                          :Git<CR> \| :resize 25<CR>
nnoremap <leader>go                          :Git<CR> \| <C-w>k \| :q<CR> \| :TabooRename Git<CR> \| :echo "Git set up. :)"<CR> \| <cmd>Telescope find_files<CR>
nnoremap <leader>gc                          :Gcommit<CR>
nnoremap <leader>gpu                         :Git push<CR>
nnoremap <leader>gpl                         :Git pull<CR>
nnoremap <leader>gl                          :GV<CR>
nnoremap <leader>gb                          :GV!<CR>
nnoremap <leader>gm                          :MerginalToggle<CR>
nnoremap <leader>u                           :UndotreeShow<CR>

" setup mapping to call :LazyGit
nnoremap ª                                   :LazyGit<CR>

" git-gutter
nmap ˚                                       <Plug>(GitGutterPrevHunk)
nmap ∆                                       <Plug>(GitGutterNextHunk)
nmap ghs                                     <Plug>(GitGutterStageHunk)
nmap ghu                                     <Plug>(GitGutterUndoHunk)

" goyo
nnoremap <silent><leader>z                       :Goyo<CR>

" coc
nmap <silent> gd                             <Plug>(coc-definition)
nmap <silent> gy                             <Plug>(coc-type-definition)
nmap <silent> gi                             <Plug>(coc-implementation)
nmap <silent> gr                             <Plug>(coc-references)
nmap <silent> ca                             <Plug>(coc-codeaction)
nmap <silent> ≥                          <Plug>(coc-fix-current)
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

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cp :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cP :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>cf :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>cd :let @*=expand("%:p:h")<CR>
endif

" centers the current pane as the middle 2 of 4 imaginary columns
" should be called in a window with a single pane

 function CenterPane()
   lefta vnew
   wincmd w
   exec 'vertical resize '. string(&columns * 0.65)
 endfunction

" optionally map it to a key:
 nnoremap <leader>c :call CenterPane()<cr>

" Easy console.log
" nnoremap cll                      oconsole.log("LINE: <C-r>=line('.')<Esc>","")<Esc>F"i
nnoremap cll                      oconsole.log("LINE: <C-r>=line('.')<Esc>","")<Esc>O<Esc>j3f"a
