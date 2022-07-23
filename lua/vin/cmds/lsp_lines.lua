Vin.cmds.lsp_lines = {}
Vin.cmds.lsp_lines.enabled = false

local enable = function()
	vim.diagnostic.config({ virtual_lines = true })
	Vin.cmds.lsp_lines.enabled = true
end

local disable = function()
	vim.diagnostic.config({ virtual_lines = false })
	Vin.cmds.lsp_lines.enabled = false
end

Vin.cmds.lsp_lines.toggle = function()
	if Vin.cmds.lsp_lines.enabled then
		disable()
	else
		enable()
	end
end

-- Initialy start disabled
disable()
