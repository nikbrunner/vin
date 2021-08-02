local remap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true };

-- TODO Remap keys with a key map like here in lunar.vim (https://github.com/ChristianChiarulli/LunarVim/blob/rolling/lua/keymappings.lua)
-- leader
vim.g.mapleader = " "

-- reload
remap(
  'n', 
  '<leader><C-r>', 
  ':source ~/.config/nvim/init.vim<CR>\\ :echo "NeoVim Config reloaded!"<CR>', 
  options
)

-- adjust or expand defaults
remap('n', 'H', '^',    options)
remap('n', 'L', '$',    options)
remap('n', 'Y', 'y$',   options)
remap('n', '<leader><leader>', '<C-^>', options)
remap('n', 'n', 'nzzzv', options)
remap('n', 'N', 'Nzzzv', options)
remap('n', 'J', 'mzJ`z', options)

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

-- refactor Add Braces to convert function to explicit return 
remap('n', '<leader>rab', 'f(da(i{}<Esc>i<CR><Esc>Oreturn <Esc>p:w<CR>', options)

-- refactor Remove Braces to convert function to implicit return
remap('n', '<leader>rrb', 'f(da(kf{va{p:w<CR>', options)

-- select Block starting with curly brace or parenthesis
remap('n', 'v{', '^vf{%', options)
remap('n', 'v(', '^vf(%', options)

-- copy full path
remap('n', '<leader>cf', ':let @+ = expand("%:p")<CR>', options);
-- copy relative path
remap('n', '<leader>cp', ':let @+ = expand("%")<CR>', options);
-- copy file name
remap('n', '<leader>cn', ':let @+ = expand("%:t")<CR>', options);

-- quickfix
remap('n', '<C-q>',      ':call ToggleQFList(1)<CR>', options)
remap('n', 'qf',         ':Ack<Space>', options) 
remap('n', 'qt',         ':Todolist<CR>', options)
remap('n', 'qn',         ':cnext<CR>zz', options)
remap('n', 'qp',         ':cprev<CR>zz', options)

-- vim:plug
-- lsp-config
-- TODO: It is probably redundant to call <cmd>lua in a .lua file. Check this out
remap('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>', options)
remap('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
remap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>', options)
remap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
remap('n', '<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', options)
remap('n', '<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', options)

  -- lsp-saga
remap('n', 'gR',         ':Lspsaga lsp_finder<CR>', options)
remap('n', 'gh',         ':Lspsaga hover_doc<CR>', options)
remap('n', 'gp',         ':Lspsaga preview_definition<CR>', options)
remap('n', '<F2>',       ':Lspsaga rename<CR>', options)
remap('n', '<M-CR>',     ':Lspsaga code_action<CR>', options)
remap('v', '<M-CR>',     ':Lspsaga range_code_action<CR>', options)

-- barbar
remap('n', '≤',          ':BufferPrevious<CR>', options)
remap('n', '≥',          ':BufferNext<CR>', options)
remap('n', '¯',          ':BufferMovePrevious<CR>', options)
remap('n', '˘',          ':BufferMoveNext<CR>', options)
remap('n', '<leader>qo', ':BufferCloseAllButCurrent<CR>', options)
remap('n', '<C-s>',      ':BufferPick<CR>', options)
remap('n', '<leader>bd', ':BufferOrderByDirectory<CR>', options)
remap('n', '<leader>bl', ':BufferOrderByLanguage<CR>', options)

-- telescope
remap('n', '<C-p>',      '<cmd>Telescope find_files<CR>', options)
remap('n', '<C-f>',      '<cmd>Telescope live_grep<CR>', options)
remap('n', '<C-e>',      '<cmd>Telescope buffers<CR>', options)
remap('n', '<C-y>',      '<cmd>Telescope oldfiles<CR>', options)
remap('n', '<leader>fw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>', options)
remap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', options)
remap('n', '<C-g>',      '<cmd>Telescope git_status<CR>', options)
remap('n', '<leader>i',  '<cmd>Telescope ultisnips<CR>', options)

-- diffview
remap('n', '<leader>dv', ':DiffviewOpen<CR>', options)

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
remap("n", "<F8>", "<cmd>LspTroubleToggle<cr>", {silent = true, noremap = true})
remap("n", "<leader>en", ":lnext<CR>zz", {silent = true, noremap = true})
remap("n", "<leader>ep", ":lprev<CR>zz", {silent = true, noremap = true})

-- zen
remap('n', '<leader>z', ':ZenMode<CR>', options)
