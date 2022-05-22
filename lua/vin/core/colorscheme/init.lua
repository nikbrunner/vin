require("vin.core.colorscheme.github")
require("vin.core.colorscheme.onedark")
require("vin.core.colorscheme.onenord")
require("vin.core.colorscheme.kanagawa")
-- require("vin.core.colorscheme.lunarvim_themes")

local colorscheme = "onenord"

local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

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

-- Custom Highlights
vim.cmd([[
  hi StatusLine gui=NONE guifg=NONE guibg=NonText guisp=NonText
  hi StatusLineNc gui=NONE guifg=NONE guibg=NonText guisp=NonText
  hi WinSeparator gui=NONE guifg=NONE guibg=NonText guisp=NonText
]])

-- Transparent folds
-- vim.cmd([[
--   hi Folded gui=NONE guifg=NONE guibg=NonText guisp=NonText
--   hi FoldColumn gui=NONE guifg=NONE guibg=NonText guisp=NonText
-- ]])

-- Hide Vertical SplitLines
vim.cmd([[
  hi VertSplit gui=NONE guifg=NONE guibg=NonText guisp=NonText
]])
