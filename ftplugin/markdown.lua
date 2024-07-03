local map = vim.keymap.set

local function toggle_checkbox()
    local line = vim.api.nvim_get_current_line()
    local new_line
    if line:match("^%s*- %[ %]") then
        -- Unchecked box: change to checked
        new_line = line:gsub("^(%s*)- %[ %]", "%1- [x]")
    elseif line:match("^%s*- %[x%]") then
        -- Checked box: change to unchecked
        new_line = line:gsub("^(%s*)- %[x%]", "%1- [ ]")
    else
        -- No checkbox: add unchecked box
        new_line = line:gsub("^(%s*)", "%1- [ ] ")
    end
    vim.api.nvim_set_current_line(new_line)
end

local function smart_enter()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]

    -- Check if we're at the end of a line with a checkbox
    if line:match("^%s*- %[[ x]%].*$") and col == #line then
        -- Simulate key presses to create a new line with an unchecked checkbox
        local keys = vim.api.nvim_replace_termcodes("<CR>- [ ] ", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", true)
        return ""
    else
        -- Normal Enter behavior
        return vim.api.nvim_replace_termcodes("<CR>", true, false, true)
    end
end

map({ "n", "o", "x" }, "j", "gj", {})
map({ "n", "o", "x" }, "k", "gk", {})
map({ "n", "o", "x" }, "0", "g0", {})
map({ "n", "o", "x" }, "$", "g$", {})
map({ "n", "i" }, "<M-CR>", toggle_checkbox, { noremap = true, silent = true })
map("i", "<CR>", smart_enter, { expr = true, noremap = true, silent = true })

vim.opt.wrap = true
