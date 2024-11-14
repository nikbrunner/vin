local map = vim.keymap.set

local function toggle_checkbox()
    local line = vim.api.nvim_get_current_line()

    local checked_pattern = "%- %[x%]"
    local unchecked_pattern = "%- %[ %]"

    if line:match(checked_pattern) then
        line = line:gsub(checked_pattern, "- [ ]")
    elseif line:match(unchecked_pattern) then
        line = line:gsub(unchecked_pattern, "- [x]")
    else
        -- If no checkbox exists, create an unchecked one at the start of the line
        line = "- [ ] " .. line
        -- TODO: Use A to append to the end of the line
    end

    -- Set the modified line
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line })
end

map({ "n", "o", "x" }, "j", "gj", {})
map({ "n", "o", "x" }, "k", "gk", {})
map({ "n", "o", "x" }, "0", "g0", {})
map({ "n", "o", "x" }, "$", "g$", {})
map({ "n", "i" }, "<C-CR>", toggle_checkbox, { noremap = true, silent = true })

vim.opt.wrap = true
