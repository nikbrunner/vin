-- Convert to lua
vim.cmd([[
 au BufRead,BufNewFile tsconfig.json,.eslintrc.json set filetype=jsonc
]])
