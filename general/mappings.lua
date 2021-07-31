local remap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true };

-- TODO Remap keys with a key map like here in lunar.vim (https://github.com/ChristianChiarulli/LunarVim/blob/rolling/lua/keymappings.lua)
-- vim:leader
vim.g.mapleader = " "

-- vim:reload
remap(
  'n', 
  '<leader><C-r>', 
  ':source ~/.config/nvim/init.vim<CR>\\ :echo "NeoVim Config reloaded!"<CR>', 
  { noremap = true }
)

-- vim:adjust or expand defaults
remap('n', 'H', '^',    options)
remap('n', 'L', '$',    options)
remap('n', 'Y', 'y$',   options)
remap('n', '<leader><leader>', '<C-^>', options)

-- vim:splits
remap('n', '<leader>l',  ':vsp<CR><C-W><C-l>', options)
remap('n', '<leader>j',  ':sp<CR><C-W><C-j>', options)
remap('n', '<C-h>',      '<C-w>h', options)
remap('n', '<C-j>',      '<C-w>j', options)
remap('n', '<C-k>',      '<C-w>k', options)
remap('n', '<C-l>',      '<C-w>l', options)

-- vim:resize
remap('n', '<leader>=',  '<C-w>=', options)
remap('n', '<leader>m',  '<C-w>|', options)

-- vim:tabs
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

-- vim:custom
-- console.log()
remap('n', 'cll', 'oconsole.log("LINE: <C-r>=line(\'.\')<Esc>",);<Esc>O<Esc>jf,a ', options)

-- refactor Add Braces to convert function to explicit return 
remap('n', '<leader>rab', 'f(da(i{}<Esc>i<CR><Esc>Oreturn <Esc>p:w<CR>', options)

-- refactor Remove Braces to convert function to implicit return
remap('n', '<leader>rrb', 'f(da(kf{va{p:w<CR>', options)

-- select Block starting with curly brace or parenthesis
remap('n', 'v{', '^vf{%', options)
remap('n', 'v(', '^vf(%', options)

-- vim:plug
-- ldp-config
-- TODO: It is probably redundant to call <cmd>lua in a .lua file. Check this out
remap('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>', options)
remap('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
remap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>', options)
remap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
remap('n', 'gs',         '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
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
remap('n', '≥',           ':BufferNext<CR>', options)
remap('n', '¯',          ':BufferMovePrevious<CR>', options)
remap('n', '˘',          ':BufferMoveNext<CR>', options)
remap('n', '<leader>qo', ':BufferCloseAllButCurrent<CR>', options)
remap('n', '<C-s>',      ':BufferPick<CR>', options)
remap('n', '<leader>bd', ':BufferOrderByDirectory<CR>', options)
remap('n', '<leader>bl', ':BufferOrderByLanguage<CR>', options)
