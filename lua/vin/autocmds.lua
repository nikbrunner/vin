local colorizer_status_ok, _ = pcall(require, "colorizer")
if not colorizer_status_ok then
	return
end

vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]])

local lsp_au_group = vim.api.nvim_create_augroup("Formatting", { clear = true })
local config_au_group = vim.api.nvim_create_augroup("ConfigGroup", {})
local buf_win_enter_au_group = vim.api.nvim_create_augroup(
	"BufWinEnterAuGroup",
	{ clear = true }
)

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
	group = lsp_au_group,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		vim.cmd("ColorizerAttachToBuffer")
		-- vim.cmd("Gitsigns refresh")
	end,
	group = lsp_au_group,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		-- Set foldmethod for specific filetypes
		-- if vim.bo.filetype == "css" or vim.bo.filetype == "scss" then
		--  print("do this")
		-- 	return
		-- else
		-- print("do something else")
		-- end

		vim.o.foldmethod = "indent"
		vim.o.foldlevel = 6
	end,
	group = buf_win_enter_au_group,
})
