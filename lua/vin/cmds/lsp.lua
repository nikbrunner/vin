local M = {}

---Wrapper Function for async formatting
---@param bufnr integer
---@param filter? function
M.format_async = function(bufnr, filter)
    filter = filter
        or function(_client)
            return _client.name == "null-ls"
        end

    vim.lsp.buf.format({
        async = true,
        bufnr = bufnr or 0,
        filter = filter,
    })
end

return M
