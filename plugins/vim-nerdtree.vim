let g:NERDTreeIgnore=                        ['^node_modules$', '\.vscode$', '\.idea$', '\.git$']
let g:NERDTreeGitStatusWithFlags=            1
let g:NERDTreeGitStatusNodeColorization=     1
let g:NERDTreeShowHidden=                    1
let g:NERDTreeWinSize=                       45

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
