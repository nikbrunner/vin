local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

Vin.colorscheme = {
	initial_theme = "terra",
	-- initial_theme = "github_dark_default",
	-- initial_theme = "onenord",
	snippets = {},
}

-- require("vin.colorscheme.github")
-- require("vin.colorscheme.onenord")
require("vin.colorscheme.terra")

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. Vin.colorscheme.initial_theme)
if not status_ok then
	notify("colorscheme " .. Vin.colorscheme.initial_theme .. " not found!")

	vim.cmd([[
    colorscheme default
    set background=dark
  ]])
	return
else
	vim.cmd("colorscheme " .. Vin.colorscheme.initial_theme)
end

Vin.colorscheme.set_standard_highlights = function()
	-- Transparent StatusLine
	vim.cmd([[
    hi StatusLine gui=NONE guifg=NONE guibg=NonText guisp=NonText
    hi StatusLineNc gui=NONE guifg=NONE guibg=NonText guisp=NonText
  ]])

	-- Transparent WinSeparator
	-- vim.cmd([[
	--    hi WinSeparator gui=NONE guifg=NONE guibg=NonText guisp=NonText
	--  ]])

	-- Transparent VertSplit
	-- vim.cmd([[
	--    hi VertSplit gui=NONE guifg=NONE guibg=NONE guisp=NONE
	--  ]])

	-- Transparent Backgrounds for Folds
	vim.cmd([[
    hi Folded guibg=NONE
    hi FoldColumn guibg=NONE
  ]])

	-- Disable CursorLine Background
	-- vim.cmd([[
 --    hi CursorLine guibg=NONE
 --  ]])
end

-- The question remains if thats even sensible,
-- since a dedicated VSCode Theme almost certainly has these already defined
Vin.colorscheme.snippets.set_cmp_vscode_highlights = function()
	vim.cmd([[
	   " gray
	   highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080

	   " blue
	   highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
	   highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6

	   " light blue
	   highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
	   highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
	   highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE

	   " pink
	   highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
	   highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0

	   " front
	   highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
	   highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
	   highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
	 ]])
end

-- Initial call
Vin.colorscheme.set_standard_highlights()
