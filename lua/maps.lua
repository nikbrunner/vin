local remap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true };

-- TODO Remap keys with a key map like here in lunar.vim (https://github.com/ChristianChiarulli/LunarVim/blob/rolling/lua/keymappings.lua)
-- leader
vim.g.mapleader = " "

-- reload
remap( 'n', '<leader><C-r>', ':luafile ~/.config/nvim/init.lua<CR>', options)

-- adjust or expand defaults
remap('n', 'H', '^',    options)
remap('n', 'L', '$',    options)
remap('n', 'Y', 'y$',   options)
remap('n', '<leader><leader>', '<C-^>', options)
remap('n', 'n', 'nzzzv', options)
remap('n', 'N', 'Nzzzv', options)
remap('n', 'J', 'mzJ`z', options)
remap('n', 'vv','^v$',   options)

remap('i', ',', ',<c-g>u', options)
remap('i', '.', '.<c-g>u', options)
remap('i', '!', '!<c-g>u', options)
remap('i', '?', '?<c-g>u', options)

remap('v', 'J', ':m +1<CR>gv=gv', options)
remap('v', 'K', ':m -2<CR>gv=gv', options)

-- splits
remap('n', '<leader>l',  ':vsp<CR><C-W><C-l>', options)
remap('n', '<leader>j',  ':sp<CR><C-W><C-j>', options)
remap('n', '<C-h>',      '<C-w>h', options)
remap('n', '<C-j>',      '<C-w>j', options)
remap('n', '<C-k>',      '<C-w>k', options)
remap('n', '<C-l>',      '<C-w>l', options)

-- resize
remap('n', '<leader>=',  '<C-w>=', options)
remap('n', '<leader>m',  '<C-w>|', options)

-- tabs
remap('n', '<TAB>',      ':tabnext<CR>', options)
remap('n', '<S-TAB>',    ':tabprevious<CR>', options)
remap('n', '<leader>-',  ':tabm -1<CR>', options)
remap('n', '<leader>+',  ':tabm +1<CR>', options)
remap('n', '<leader>tw', '<C-w>T', options)           -- new tab with current pane
remap('n', '<leader>to', ':tabnew<CR>', options)      -- new empty tab
remap('n', '<leader>tc', ':tabclose<CR>', options)    -- close current tab
remap('n', '<leader>1',  '1gt', options)
remap('n', '<leader>2',  '2gt', options)
remap('n', '<leader>3',  '3gt', options)
remap('n', '<leader>4',  '4gt', options)
remap('n', '<leader>5',  '5gt', options)
remap('n', '<leader>6',  '6gt', options)
remap('n', '<leader>7',  '7gt', options)
remap('n', '<leader>8',  '8gt', options)
remap('n', '<leader>9',  '9gt', options)

-- custom
-- console.log()
remap('n', 'cll', 'oconsole.log("LINE: <C-r>=line(\'.\')<Esc>",);<Esc>O<Esc>jf,a ', options)

-- select Block starting with curly brace or parenthesis
remap('n', 'v{', '^vf{%', options)
remap('n', 'v(', '^vf(%', options)

-- copy full path
remap('n', '<leader>cpf', ':let @+ = expand("%:p")<CR>', options);
-- copy relative path
remap('n', '<leader>cpp', ':let @+ = expand("%")<CR>', options);
-- copy file name
remap('n', '<leader>cpn', ':let @+ = expand("%:t")<CR>', options);

-- quickfix
-- TODO convert to lua
vim.cmd[[
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
]]

remap('n', '<C-q>',      ':call ToggleQuickFix()<CR>', options)
remap('n', ']q',         ':cnext<CR>zz', options)
remap('n', '[q',         ':cprev<CR>zz', options)

-- vim:plug
-- lsp-config
remap('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>', options)
remap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>', options)

-- lsp-saga
remap('n', 'gD',         ':Lspsaga preview_definition<CR>', options)
remap('n', 'gh',         ':Lspsaga hover_doc<CR>', options)
remap('n', 'gp',         ':Lspsaga preview_definition<CR>', options)
remap('n', '<F2>',       ':Lspsaga rename<CR>', options)
remap('n', '<M-CR>',     ':Lspsaga code_action<CR>', options)
remap('v', '<M-CR>',     ':Lspsaga range_code_action<CR>', options)
remap('n', ']e',         ':Lspsaga diagnostic_jump_next<CR>', options)
remap('n', '[e',         ':Lspsaga diagnostic_jump_prev<CR>', options)

-- bookmarks
remap('n', ']m',         ':BookmarkNext<CR>', options)
remap('n', '[m',         ':BookmarkPrev<CR>', options)
remap('n', 'ml',         ':BookmarkAnnotate<CR>', options)

-- barbar
remap('n', '[b',         ':BufferPrevious<CR>', options)
remap('n', ']b',         ':BufferNext<CR>', options)
remap('n', '<leader>qo', ':BufferCloseAllButCurrent<CR>', options)
remap('n', '<leader>bp', ':BufferPick<CR>', options)
remap('n', '<leader>bd', ':BufferOrderByDirectory<CR>', options)
remap('n', '<leader>bl', ':BufferOrderByLanguage<CR>', options)

-- telescope
remap('n', '<C-p>',      '<cmd>Telescope find_files<CR>', options)
remap('n', '<C-f>',      '<cmd>Telescope live_grep<CR>', options)
remap('n', '<C-e>',      '<cmd>Telescope buffers<CR>', options)
remap('n', '<C-g>',      '<cmd>Telescope git_status<CR>', options)
remap('n', '<C-y>',      '<cmd>Telescope oldfiles<CR>', options)
remap('n', '<leader>fw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>', options)
remap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', options)

-- lazygit
remap('n', 'gs',         ':LazyGit<CR>', options)

-- nvim-tree
remap('n', '<C-b>',      ':NvimTreeToggle<CR>', options)

-- dashboard
remap('n', '<leader>ss', ':<C-u>SessionSave<CR>', options)
remap('n', '<leader>sl', ':<C-u>SessionLoad<CR>', options)

-- compe
remap('s', '<Tab>',      'v:lua.tab_complete()', {expr = true})
remap('i', '<S-Tab>',    'v:lua.s_tab_complete()', {expr = true})

-- trouble
remap("n", "<F8>",       "<cmd>LspTroubleToggle<cr>", options)

-- zen
remap('n', '<leader>z', ':ZenMode<CR>', options)
