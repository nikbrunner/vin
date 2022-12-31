-- autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({ higroup = 'Visual', timeout = 200 })
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
]])

-- TODO: If a buffer is closed and it is not a float type, then the windows should get equalized
-- https://github.com/anuvyklack/windows.nvim/blob/main/lua/windows/commands.lua
-- If the NvimTree closes or opens, then equalize the window sizes
local nvim_tree_present, _ = pcall(require, "nvim-tree")
if nvim_tree_present then
    local api = require("nvim-tree.api")
    local Event = api.events.Event

    api.events.subscribe(Event.TreeOpen, function()
        local windows_present, _ = pcall(require, "windows")

        if windows_present then
            require("windows.commands").equalize()
        else
            vim.cmd("wincmd =")
        end
    end)

    api.events.subscribe(Event.TreeClose, function()
        local windows_present, _ = pcall(require, "windows")

        if windows_present then
            require("windows.commands").equalize()
        else
            vim.cmd("wincmd =")
        end
    end)
end
