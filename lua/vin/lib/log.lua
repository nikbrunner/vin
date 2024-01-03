local M = {}

local AUTO_LOG_PREFIX = "Test"

local function register_log_formats(map, types, format_func)
    for _, t in ipairs(types) do
        map[t] = format_func
    end
end

local filetype_log_map = {}

register_log_formats(filetype_log_map, {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "astro",
}, function(message, value)
    return string.format('console.log("%s", %s)', message, value)
end)

register_log_formats(filetype_log_map, { "lua" }, function(message, value)
    return string.format('print("%s", vim.inspect(%s))', message, value)
end)

register_log_formats(filetype_log_map, { "go" }, function(message, value)
    return string.format('fmt.Println("%s", %s)', message, value)
end)

register_log_formats(filetype_log_map, { "sh" }, function(message, value)
    return string.format('echo "%s: $%s"', message, value)
end)

function M.log_symbol()
    local current_word = vim.fn.expand("<cword>")
    local current_filename = vim.fn.expand("%:t")
    local message = AUTO_LOG_PREFIX .. ": " .. current_filename .. " [[" .. current_word .. "]]"
    local log_func = filetype_log_map[vim.bo.filetype]

    if log_func then
        local log_message = log_func(message, current_word)
        vim.cmd("norm o" .. log_message)
    end
end

function M.delete_logs()
    local buffer = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
    local new_lines = {}

    local log_func = filetype_log_map[vim.bo.filetype]
    local print_cmd = log_func and log_func('"' .. AUTO_LOG_PREFIX .. '"') or nil

    local deleted_lines = 0
    for _, line in ipairs(lines) do
        if print_cmd and string.find(line, print_cmd) == nil then
            table.insert(new_lines, line)
        else
            deleted_lines = deleted_lines + 1
        end
    end

    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, new_lines)
    vim.notify("Deleted " .. deleted_lines .. " lines", vim.log.levels.INFO, { title = "Auto Log" })
end

return M
