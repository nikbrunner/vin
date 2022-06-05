local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local colorscheme = "onenord"

enable_arvo(true)

if is_arvo_enabled() then
	require("vin.core.colorscheme.arvo")
else
	require("vin.core.colorscheme.onenord")
end

require("vin.core.colorscheme.github")
require("vin.core.colorscheme.lunarvim")
require("vin.core.colorscheme.onedark")

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	notify("colorscheme " .. colorscheme .. " not found!")

	vim.cmd([[
    catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  ]])
	return
end

local M = {}

M.set_general_custom_highlights = function()
	-- Custom Highlights
	vim.cmd([[
  hi StatusLine gui=NONE guifg=NONE guibg=NonText guisp=NonText
  hi StatusLineNc gui=NONE guifg=NONE guibg=NonText guisp=NonText
  hi WinSeparator gui=NONE guifg=NONE guibg=NonText guisp=NonText
]])

	-- Transparent Backgrounds for Folds
	vim.cmd([[
  hi Folded guibg=NONE
  hi FoldColumn guibg=NONE
]])

	-- Hide Vertical SplitLines
	vim.cmd([[
  hi VertSplit gui=NONE guifg=NONE guibg=NONE guisp=NONE
]])
end

M.set_general_custom_highlights()

return M
