require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = false
  },
  autopairs = { 
    enable = true 
  },
  ensure_installed = { 
    'javascript', 
    'typescript',
    'html',
    'css',
    'scss',
  },
  rainbow = {
    enable = true,
    extended_mode = true
  }
}
