require('rooter').setup({
  echo = false,
  patterns = {
    '.git',
    'package.json'
  },
  non_project_files = 'current',
  
  -- the start path to pass to nvim_lsp.util.root_pattern(patterns...)
  start_path = function()
    return vim.fn.expand [[%:p:h]]
  end,
})
