---@diagnostic disable: undefined-field
-- Functions for global and vim functions

-- Vim Function to toggle quickfix list
-- TODO Convert to Lua
vim.cmd([[
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
]])

-- Global Function to debug and print table as lines
-- Can be replaced with vim.pretty_print()
function _G.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end

-- Wrapper Function for pcall() command
-- TODO Try this out with a clean install and see if it works
function _G.protected_require(modname)
	local status_ok, mod = pcall(require, modname)
	if not status_ok then
		return nil
	end
	return mod
end

function _G.split_by_space(string)
	local chunks = {}

	for substring in string:gmatch("%S+") do
		table.insert(chunks, substring)
	end

	return chunks
end

function _G.table_contains(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

function _G.find_index(tab, val)
	local index = nil
	for i, v in ipairs(tab) do
		if v == val then
			index = i
		end
	end
	return index
end

---Check the name of current colorscheme
---@return string
function _G.get_current_colorscheme()
	return vim.api.nvim_eval("g:colors_name")
end

---Protected Checking a global  Variable
---@param var_name string The name of the variable
---@param default_value any The Fallback / Default Value if Variable is not defined
---@return any
function _G.pget_var(var_name, default_value)
	local status_ok, value = pcall(function()
		return vim.api.nvim_get_var(var_name)
	end)
	if status_ok then
		return value
	else
		return default_value
	end
end

---Check if the Arvo Customization is enabled
---@return boolean
function _G.is_arvo_enabled()
	return pget_var(IS_ARVO_ENABLED, false)
end

---Enable / Disable Arvo
---@param should_arvo_be_enabled boolean Should the Arvo Customization be enabled
---@return void
function _G.enable_arvo(should_arvo_be_enabled)
	vim.api.nvim_set_var(IS_ARVO_ENABLED, should_arvo_be_enabled)
end
