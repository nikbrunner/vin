let mapleader = " "

" Unmaps
nnoremap Q <nop>

" source, save, quit
nnoremap <leader><C-r>                       :source ~/.config/nvim/init.vim<CR>

" Neoscroll
" I've disabled everything else
nnoremap <silent><C-d>                       :lua require('neoscroll').scroll(vim.wo.scroll, true, 8)<CR>
nnoremap <silent><C-u>                       :lua require('neoscroll').scroll(-vim.wo.scroll, true, 8)<CR>

" Sessions
nnoremap <silent><leader>ps                  :Obsess<CR>

" Startify
nnoremap <silent><leader>s                   :Startify<CR>

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

" nerdtree
nnoremap <expr>¡                             g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" ranger
nnoremap <silent><leader>n                   :EditVifm .<CR>

" tabs
nnoremap <leader>to                          :TabooOpen<Space>
nnoremap <leader>tn                          :TabooRename<Space>

" prettier
nnoremap <leader>p                           :PrettierAsync<CR>

" telescope
nnoremap <C-p>                               <cmd>Telescope find_files<CR>
nnoremap <C-f>                               <cmd>Telescope live_grep<CR>
nnoremap <C-s>                               <cmd>Telescope grep_string<CR>
nnoremap <C-e>                               <cmd>Telescope buffers<CR>
nnoremap <leader>ht                          <cmd>Telescope help_tags<CR>

" spectre
nnoremap <leader>S :lua require('spectre').open()<CR>

"search current word
vnoremap <leader>S :lua require('spectre').open_visual()<CR>
nnoremap <leader>Sw viw:lua require('spectre').open_visual()<CR>

"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

" emmet
let g:user_emmet_leader_key=                 '<C-y>'

" git-fugitive
nnoremap <leader>gs                          :Git<CR>\|:resize 25<CR>
nnoremap <leader>go                          :Git<CR>\|<C-w>k\|:q<CR>\|:TabooRename Git<CR>\|:NERDTreeToggle<CR>\|:tabnew<CR>\|:Telescope find_files<CR>
nnoremap <leader>gc                          :Gcommit<CR>
nnoremap <leader>gpu                         :Git push<CR>
nnoremap <leader>gpl                         :Git pull<CR>
nnoremap <leader>gl                          :GV<CR>
nnoremap <leader>gb                          :GV!<CR>
nnoremap <leader>gm                          :MerginalToggle<CR>
nnoremap <leader>u                           :UndotreeShow<CR>
nnoremap <leader>lg                          :LazyGit<CR>

" git-gutter
nmap ˚                                       <Plug>(GitGutterPrevHunk)
nmap ∆                                       <Plug>(GitGutterNextHunk)
nmap ghs                                     <Plug>(GitGutterStageHunk)
nmap ghu                                     <Plug>(GitGutterUndoHunk)

" goyo
nnoremap <silent><leader>z                       :Goyo<CR>

" md preview
nmap <leader>md                              <Plug>MarkdownPreviewToggle

" coc
nmap <silent> gd                             <Plug>(coc-definition)
nmap <silent> gy                             <Plug>(coc-type-definition)
nmap <silent> gi                             <Plug>(coc-implementation)
nmap <silent> gr                             <Plug>(coc-references)
nmap <silent> <M-CR>                         <Plug>(coc-codeaction)
nmap <silent> ≥                              <Plug>(coc-fix-current)
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

" Easy log
nnoremap cll                      oconsole.log("LINE: <C-r>=line('.')<Esc>",)<Esc>O<Esc>jf,a

" Refactor Add Braces to convert function to explicit return 
nnoremap rab                      f(da(i{}<Esc>i<CR><Esc>Oreturn <Esc>p:w<CR>

" Refactor Remove Braces to convert function to implicit return
nnoremap rrb                      f(da(kf{va{p:w<CR>

" Quickfix workflow
nnoremap <leader>qf               :grep
nnoremap <leader>qn               :cnext<CR>
nnoremap <leader>qp               :cprev<CR> 
nnoremap <leader>qo               :copen<CR>

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
