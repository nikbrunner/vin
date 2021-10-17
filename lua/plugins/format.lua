-- FIXME Prettier function throws errors
local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath",
      "--config .prettierrc",
      vim.api.nvim_buf_get_name(0)
    },
    stdin = true
  }
end

require("formatter").setup(
    {
      logging = false,
      filetype = {
        javascript = { prettier },
        javascriptreact = { prettier },
        typescript = { prettier },
        typescriptreact = { prettier },
        css = { prettier },
        less = { prettier },
        sass = { prettier },
        scss = { prettier },
        graphql = { prettier },
        markdown = { prettier },
        vue = { prettier },
        yaml = { prettier },
        html = { prettier }
      }
    }
)

vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.vue,*.yaml,*.html FormatWrite
augroup END
]], true
)
