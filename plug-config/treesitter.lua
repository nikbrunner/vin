require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  },
  ensure_installed = { 
    'javascript', 
    'typescript',
    'html',
    'css',
    'scss',
  },
  autopairs = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true
  }
}
