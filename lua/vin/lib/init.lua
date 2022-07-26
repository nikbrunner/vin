local telescope_ok, utils = pcall(require, "telescope.utils")
if not telescope_ok then
	return
end

local notify_ok, notify = pcall(require, "notify")
if not notify_ok then
	return
end

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

Vin.lib.get_master_branch = function()
	local branches = utils.get_os_command_output({
		"git",
		"branch",
		"-l",
		"master",
		"main",
	})[1]

	-- TODO split function has been changed. THis needs to be fixed
	for _, v in pairs(Vin.lib.split_by_space(branches)) do
		if v == "main" then
			return "main"
		end

		if v == "master" then
			return "master"
		end
	end
end

---Find out current branch
---@return false|current_branch_name: string Current Branch Name
Vin.lib.get_current_branch = function()
	for line in io.popen("git branch 2>nul"):lines() do
		local current_branch_name = line:match("%* (.+)$")
		if current_branch_name then
			return current_branch_name
		end
	end

	return false
end

---@alias Branches chunks
---Find out alle branches
---@return false|Branches: {string ...} All branches as table of strings
Vin.lib.get_all_branches = function()
	local resultString

	local branches_output = io.popen("git branch -l")

	if branches_output == nil then
		print("No branches found!")
		return false
	else
		local read_branches = branches_output:read("*a")
		branches_output:close()

		-- Remove the star indicator from the current branch, and remove the \n line chars
		-- TODO This could be done in a single sub
		local stripped = string.gsub(string.gsub(read_branches, "*", ""), "\n", "")

		-- Now split the string by spaces into a table and return it
		local all_branches = Vin.lib.split_by_space(stripped)
		return all_branches
	end
end

---Global Function to debug and print table as lines
---Can be replaced with vim.pretty_print()
---@param ... any Input Value to print
---@return nil
function Vin.lib.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
end

---Wrapper Function for pcall() command
---TODO Unused, because disfunctional.
---Try this out with a clean install and see if it works
---@param modname string Module Name
---@return mod|nil Module Required Module
function Vin.lib.prequire(modname)
	local status_ok, mod = pcall(require, modname)
	if not status_ok then
		return nil
	end
	return mod
end

---Function to split a string by spaces
---@param string string Input string
---@return chunks table The splitted string as table
function Vin.lib.split_by_space(string)
	local chunks = {}

	for substring in string:gmatch("%S+") do
		table.insert(chunks, substring)
	end
	return chunks
end

---Function to check if a table includes a certain value
---@param tab table Table to search
---@param val unknown Value to search for
---@return boolean
function Vin.lib.includes(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

---Function to check if a table contains a certain value
---@param tab table Table to search
---@param val unknown Value to search for
---@return integer|unknown number Index of value in tab
function Vin.lib.find_index(tab, val)
	local index = nil
	for i, v in ipairs(tab) do
		if v == val then
			index = i
		end
	end
	return index
end

---Check the name of current colorscheme
---@return string Name of current Color Scheme
function Vin.lib.get_current_colorscheme()
	return vim.api.nvim_eval("g:colors_name")
end

---Protected Checking a global  Variable
---@param var_name string The name of the variable
---@param default_value unknown The Fallback / Default Value if Variable is not defined
---@return any
function Vin.lib.pget_var(var_name, default_value)
	local status_ok, value = pcall(function()
		return vim.api.nvim_get_var(var_name)
	end)
	if status_ok then
		return value
	else
		return default_value
	end
end

---Conditionally calls a function, otherwise calls an optional fallback
---The return of the provided functions get returned
---@param condition boolean Condition which decides if the callback gets called
---@param callback function():unknown Function which gets called if the Condition is true
---@param fallback? function():unknown Optional Function which gets called if Condition is false
---@return unknown|nil
function Vin.lib.ccall(condition, callback, fallback)
	if condition then
		return callback()
	else
		if fallback then
			return fallback()
		end
	end
end

Vin.lib.center_line_vertical = function()
	vim.cmd([[norm zz]])
end

Vin.lib.focus_error = function()
	-- get the current window, to be able to jump back to it, after opening the Diag Window
	local current_win = vim.api.nvim_get_current_win()

	-- center view on error
	Vin.lib.center_line_vertical()

	-- show diag window
	vim.cmd([[DiagWindowShow]])
	-- vim.diagnostic.open_float()

	-- refocus original window
	vim.api.nvim_set_current_win(current_win)
end
