local M = {}

M.center_line_vertical = function()
    vim.cmd([[norm zz]])
end

M.toggle_quickfix = function()
    local windows = vim.fn.getwininfo()

    for _, win in pairs(windows) do
        if win.quickfix == 1 then
            vim.cmd("cclose")
        else
            vim.cmd("copen")
        end
    end
end

return M
