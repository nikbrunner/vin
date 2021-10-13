local wk = require("which-key")

-- Function to toggle quickfix list
vim.cmd[[
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
]]

-- Define leader key
vim.g.mapleader = " "

local remap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true };

-- Adjust or Expand defaults 
-- These should not show up in which-key
remap('n', 'H', '^',    options)
remap('n', 'L', '$',    options)
remap('n', 'Y', 'y$',   options)
remap('n', 'n', 'nzzzv', options)
remap('n', 'N', 'Nzzzv', options)
remap('n', 'J', 'mzJ`z', options)
remap('n', 'vv','^v$',   options)

-- Add undo break points after these symbols
remap('i', ',', ',<c-g>u', options)
remap('i', '.', '.<c-g>u', options)
remap('i', '=', '=<c-g>u', options)
remap('i', '!', '!<c-g>u', options)
remap('i', '?', '?<c-g>u', options)

-- Reselect after indent
remap('v', '<', '<gv', options)
remap('v', '>', '>gv', options)

-- Unbind default prettier binding
remap('n', '<leader>p', '<Nop>', options)

-- [NORMAL] MODE
local nOptions = {
  mode = "n", -- NORMAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local nOptionsWithLeader = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local nSingleMaps = {
  ["<S-Tab>"] = { "<cmd>BufferPrevious<CR>", "Previous Buffer"},
  ["<Tab>"]   = { "<cmd>BufferNext<CR>", "Next Buffer"},

  -- Navigation
  ["<C-h>"] = { "<C-w>h", "Focus Left Window"},
  ["<C-j>"] = { "<C-w>j", "Focus Below Window"},
  ["<C-k>"] = { "<C-w>k", "Focus Above Window"},
  ["<C-l>"] = { "<C-w>l", "Focus Right Window"},

  -- Console Log Snippet
  ["cl"] = { "oconsole.log(\"LINE: <C-r>=line(\".\")<Esc>\",);<Esc>O<Esc>jf,a ", "console.log()"},

  -- Toggle Quick Fix List
  ["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle QuickFix List" },

  -- Next / Previous
  ["[q"] = { ":cprev<CR>zz", "Prev Quickfix Item" },
  ["]q"] = { ":cnext<CR>zz", "Next Quickfix Item" },
  ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Error" },
  ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Error" },
  ["[b"] = { ":BufferPrevious<CR>", "Prev Buffer" },
  ["]b"] = { ":BufferNext<CR>", "Next Buffer" },
  ["[g"] = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
  ["]g"] = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },

  ["gh"] = { "<cmd>Lspsaga hover_doc<CR>", "Show Hover" },
  -- ["gh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Hover" },
  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
  ["gD"] = { "<cmd>Lspsaga preview_definition<CR>", "Preview Definition" },
  ["gr"] = { "<cmd>Lspsaga lsp_finder<CR>", "Goto References" },
  ["gR"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Quickfix: References" },
  ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },

  -- TODO Add delete Block
  ["vv"] = { "^v$", "Select Line from Start to End" },
  ["v{"] = { "^vf{%", "Select { Block" },
  ["v("] = { "^vf(%", "Select ( Block" },
  ["v["] = { "^vf[%", "Select [ Block" },

  ["y{"] = { "^vf{%y", "Yank { Block" },
  ["y("] = { "^vf(%y", "Yank ( Block" },
  ["y["] = { "^vf[%y", "Yank [ Block" },
}


local nSingleMapsWithLeader = {
  [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["z"] = { "<cmd>ZenMode <CR>", "Zen" },
  ["e"] = { "<cmd>NvimTreeToggle <CR>", "Explorer" },
  ["<leader>"] = { "<C-^>", "Last Buffer" } 
}

local nGroupMapsWithLeader = {
  l = {
    name = "  LSP",
    a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
    n = { "<cmd>Lspsaga rename<CR>", "Rename" },
    h = { "<cmd>Lspsaga hover_doc<CR>", "Show Hover" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    D = { "<cmd>Lspsaga preview_definition<CR>", "Preview Definition" },
    -- TODO Show references with LSPSaga?
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Goto references" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    p = { "<cmd>LspTroubleToggle<CR>", "Problems View" },
    s = { "<cmd>LspInfo<CR>", "Status" },
  },
  b = {
    name = "﩯 Buffer",
    j = { "<cmd>BufferPick<CR>", "Jump"},
    f = { "<cmd>Telescope buffers<CR>", "Find" },
    c = {
      name = "Close",
      w = { "<cmd>BufferWipeout<CR>", "Wipeout" },
      c = { "<cmd>BufferClose<CR>", "Close Current Buffer"},
      o = { "<cmd>BufferCloseAllButCurrent<CR>", "Close All Buffers But Current"},
    },
    p = { "<cmd>BufferPrevious<CR>", "Previous Buffer"},
    j = { "<cmd>BufferNext<CR>", "Next Buffer"},
    D = { "<cmd>BufferOrderByDirectory<CR>", "Sort by directory" },
    L = { "<cmd>BufferOrderByLanguage<CR>", "Sort by language" },
  },
  c = {
    name = "  Copy",
    f = { ":let @+ = expand('%:p')<CR>", "Copy Full Path" },
    r = { ":let @+ = expand('%')<CR>", "Copy Relative Path" },
    n = { ":let @+ = expand('%:t')<CR>", "Copy File Name" },
  },
  g = {
    name = "  Git",
    s = { "<cmd>LazyGit <CR>", "LazyGit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
      "Undo Stage Hunk",
    },
    m = { "<cmd>Telescope git_status<CR>", "Modified Files" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
    -- FIXME What is this even?
    -- d = {
    --   "<cmd>Gitsigns diffthis HEAD<CR>",
    --   "Git Diff",
    -- },
  },
  s = {
    name = "  Search",
    b = { "<cmd>Telescope buffers<CR>", "﩯 Buffers" },
    c = { "<cmd>Telescope colorscheme<CR>", "  Colorscheme" },
    f = { "<cmd>Telescope find_files<CR>", "  File" },
    h = { "<cmd>Telescope help_tags<CR>", "  Help" },
    M = { "<cmd>Telescope man_pages<CR>", "  Man Pages" },
    r = { "<cmd>Telescope oldfiles<CR>", "  Recent Files" },
    p = { "<cmd>Telescope projects<CR>", "  Recent Projects" },
    R = { "<cmd>Telescope registers<CR>", "  Registers" },
    t = { "<cmd>Telescope live_grep<CR>", "  Text" },
    -- TODO I shouldnt need lua require here
    w = { ":lua require(\"telescope.builtin\").grep_string { search = vim.fn.expand(\"<cword>\") }<CR>", "  Current Word" },
    k = { "<cmd>Telescope keymaps<CR>", "  Keymaps" },
    C = { "<cmd>Telescope commands<CR>", "  Commands" },
  },
  p = {
    name = "  Packer",
    c = { "<cmd>PackerClean<CR>", "Clean" },
    C = { "<cmd>PackerCompile<CR>", "Compile" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
  },
}

wk.register(nSingleMaps , nOptions)
wk.register(nSingleMapsWithLeader, nOptionsWithLeader)
wk.register(nGroupMapsWithLeader, nOptionsWithLeader)

-- [VISUAL] MODE
local vOptions = {
  mode = "v", -- VISUAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vOptionsWithLeader = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vSingleMaps = {
  ["K"] = { ":m '<-2<CR>gv=gv", "Move Lines Up" },
  ["J"] = { ":m '>+1<CR>gv=gv", "Move Lines Down" }
}

local vSingleMapsWithLeader = {
  ["/"] = { ":'<,'>Commentary<CR>", "Comment" }
}

local vGroupMapsWithLeader = {
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga range_code_action<CR>", "Code Action" }
  },
}

wk.register(vSingleMaps , vOptions)
wk.register(vSingleMapsWithLeader, vOptionsWithLeader)
wk.register(vGroupMapsWithLeader, vOptionsWithLeader)
