local M = {}

---Function to split a string by spaces
---@param string string Input string
---@return chunks table The splitted string as table
M.split_by_space = function(string)
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
M.includes = function(tab, val)
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
M.find_index = function(tab, val)
    local index = nil
    for i, v in ipairs(tab) do
        if v == val then
            index = i
        end
    end
    return index
end

---Protected Checking a global  Variable
---@param var_name string The name of the variable
---@param default_value unknown The Fallback / Default Value if Variable is not defined
---@return any
M.pget_var = function(var_name, default_value)
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
---@param primaryFunction function(...:unknown):unknown Function which gets called if the Condition is true
---@param secondaryFunction? function(...:unknown):unknown Optional Function which gets called if Condition is false
---@return unknown|nil
M.ccall = function(condition, primaryFunction, secondaryFunction, ...)
    if type(primaryFunction) ~= "function" then
        error("Primary function must be a callable function")
    end

    if condition then
        return primaryFunction(...)
    else
        if type(secondaryFunction) == "function" then
            return secondaryFunction(...)
        end
    end
end

---Raises an error if the provided condition is false
---@param condition boolean Condition to evaluate
---@param message string Optional message to include in the error
M.assert = function(condition, message)
    if not condition then
        error(message or "Assertion failed!", 2)
    end
end

---@param withExtension boolean Condition which decides if the returned filename should include the file extension
---@return string
M.get_current_filename = function(withExtension)
    if withExtension then
        return vim.fn.expand("%:t")
    else
        return vim.fn.expand("%:t:r")
    end
end

---Merges the elements of multiple arrays into a single array.
---Elements that are not arrays are included in the resulting array as is.
---@param array table A list of arrays and/or single values to be merged.
---@treturn table The resulting array, containing the elements of the input array.
M.merge = function(array)
    -- Initialize the result array
    local result = {}

    -- Iterate over the elements of the input array
    for i, v in pairs(array) do
        -- Check if the element is an array
        if type(v) == "table" then
            -- Iterate over the keys and values of the array
            for j, w in pairs(v) do
                -- Copy the key and value into the result array
                result[j] = w
            end
        else
            -- The element is not an array, so copy it into the result array as is
            result[i] = v
        end
    end

    -- Return the result array
    return result
end

--- Joins any number of strings or numbers into a single string.
---@param ... any number of strings or numbers to join
---@return string
M.join = function(...)
    -- Initialize an empty result string
    local result = ""

    -- Iterate over the arguments passed to the function
    for i, v in ipairs({ ... }) do
        -- Concatenate the current argument to the result string, after converting it to a string
        result = result .. tostring(v)
    end

    -- Return the joined string
    return result
end

return M
