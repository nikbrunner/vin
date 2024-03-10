local M = {}

---@class BranchNotesConfig
M.config = {
    pathes = {
        notes = {
            personal = require("vin.config").pathes.notes.personal,
            work = {
                dcd = require("vin.config").pathes.notes.work.dcd,
            },
        },
    },
    mappings = {
        toggle_note = "<C-b>",
        toggle_checkbox = "<C-k>",
    },
}

function M.is_dealercenter_digital_repo()
    return string.find(vim.fn.expand("%:p:h"), "dealercenter-digital", 1, true)
end

---Get the appropriate note folder for the current path
---@param config BranchNotesConfig
---@return string
function M.get_notes_folder(config)
    if M.is_dealercenter_digital_repo() then
        return config.pathes.notes.work.dcd
    else
        return config.pathes.notes.personal
    end
end

---@return string
function M.get_repo_owner_name()
    -- Get the git repository URL
    local url = vim.fn.system("git config --get remote.origin.url")

    -- Normalize SSH URLs to HTTPS format
    url = url:gsub("git@github.com:", "https://github.com/")
    url = url:gsub("git@gitlab.com:", "https://gitlab.com/")

    -- Extract the repository owner name
    local repo_owner_name = url:match("//[^/]+/([^/]+)")
    if repo_owner_name then
        -- Escape the dot to match a literal dot in '.git'
        repo_owner_name = repo_owner_name:gsub("%.git", "")
        repo_owner_name = repo_owner_name:gsub("\n", "")
        return repo_owner_name
    else
        return ""
    end
end

---@return string
function M.get_branch_name()
    local branch_name = vim.fn.system("git rev-parse --abbrev-ref HEAD")
    branch_name = string.gsub(branch_name, "\n", "")
    -- if there is `/` in the branch name, than escape it
    branch_name = string.gsub(branch_name, "/", "-")
    return branch_name
end

---@return string
function M.get_repo_name()
    local repository_name = vim.fn.system("basename -s .git `git config --get remote.origin.url`")
    local sanitized_repository_name = string.gsub(repository_name, "\n", "")
    return sanitized_repository_name
end

---Create the folders for the branch note, and returns the path to the appropriate folder
---@param notes_path string
---@param branch_notes_folder_name string
---@param repo_owner_name string
---@param repo_name string
---@return string
function M.create_folders(notes_path, branch_notes_folder_name, repo_owner_name, repo_name)
    local repo_folder_path = ""
    if M.is_dealercenter_digital_repo() then
        -- If the repo is a DealerCenter Digital repo, then we don't need to create a folder for the repo owner
        repo_folder_path = notes_path .. "/" .. branch_notes_folder_name .. "/" .. repo_name
    else
        repo_folder_path = notes_path .. "/" .. branch_notes_folder_name .. "/" .. repo_owner_name .. "/" .. repo_name
    end

    vim.fn.mkdir(repo_folder_path, "p")

    return repo_folder_path
end

M.create_note = function(note_file_path)
    local function write_to_file(file_path, lines)
        local file, err = io.open(file_path, "w")
        if not file then
            error("Error opening file: " .. (err or ""))
        end

        for _, line in ipairs(lines) do
            file:write(line .. "\n")
        end

        file:close()
    end

    write_to_file(note_file_path, {
        "---",
        "date created: " .. os.date("%Y-%m-%d %H:%M:%S"),
        "date modified: " .. os.date("%Y-%m-%d %H:%M:%S"),
        "---",
        "",
        "Start writing here",
    })
end

---@param config BranchNotesConfig
---@return string
function M.get_branch_note_path(config)
    local notes_folder_path = M.get_notes_folder(config)
    local branch_notes_folder_name = "branch_notes"
    local repo_owner_name = M.get_repo_owner_name()
    local repo_name = M.get_repo_name()
    local branch_name = M.get_branch_name()

    local note_folder_path = M.create_folders(notes_folder_path, branch_notes_folder_name, repo_owner_name, repo_name)
    local note_file_path = note_folder_path .. "/" .. branch_name .. ".md"

    -- Check if the note file exists, and create it if it doesn't
    if vim.fn.filereadable(note_file_path) == 0 then
        M.create_note(note_file_path)
    end

    return note_file_path
end

M.handle_checkbox = function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- Current cursor column

    -- Check if line is empty and create a new checkbox
    if line:gsub("%s+", "") == "" then
        vim.api.nvim_set_current_line("- [ ] ")
        vim.api.nvim_command("startinsert!")
        return
    end

    -- Patterns for unchecked and checked checkboxes
    local unchecked_pattern = "- %[ %]"
    local checked_pattern = "- %[x%]"

    -- Toggle checkbox state
    if line:match(unchecked_pattern) then
        local new_line = line:gsub(unchecked_pattern, "- [x]", 1)
        vim.api.nvim_set_current_line(new_line)
    elseif line:match(checked_pattern) then
        local new_line = line:gsub(checked_pattern, "- [ ]", 1)
        vim.api.nvim_set_current_line(new_line)
    end

    -- Restore the cursor position
    vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], col - 1 })
end

function M.auto_continue_list_or_checkbox()
    local line = vim.api.nvim_get_current_line()
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))

    if line:match("^%s*%- %[ %[x%] %].*") then
        -- Line with checked checkbox
        vim.api.nvim_set_current_line(line)
        vim.api.nvim_command(row + 1 .. "s/^/- [ ] /")
    elseif line:match("^%s*%- %[ %] %].*") then
        -- Line with unchecked checkbox
        vim.api.nvim_set_current_line(line)
        vim.api.nvim_command(row + 1 .. "s/^/- [ ] /")
    elseif line:match("^%s*%- .*") then
        -- Line with list item
        vim.api.nvim_set_current_line(line)
        vim.api.nvim_command(row + 1 .. "s/^/- /")
    end

    vim.api.nvim_command("startinsert")
end

function M.handle_close_note()
    vim.cmd("w!")
    vim.cmd("bd!")
end

---@param config BranchNotesConfig
---@return nil
function M.open_branch_note(config)
    local note_file_path = M.get_branch_note_path(config)

    vim.cmd("belowright " .. vim.o.lines * 0.3 .. "split " .. note_file_path)

    local bufnr = vim.api.nvim_get_current_buf()

    -- set filetype to "BranchNote"
    -- vim.api.nvim_buf_set_option(bufnr, "filetype", "BranchNote")

    local title = "Branch Note for ["
        .. M.get_repo_owner_name()
        .. "/"
        .. M.get_repo_name()
        .. "/"
        .. M.get_branch_name()
        .. "]"
        .. "("
        .. note_file_path
        .. ")"

    vim.api.nvim_set_hl(0, "Winbar", { link = "@text.title" })
    vim.opt_local.winbar = title

    local map_opts = function(desc)
        return {
            desc = desc,
            buffer = bufnr,
            silent = true,
            noremap = true,
            nowait = true,
        }
    end

    vim.keymap.set("n", config.mappings.toggle_note, M.handle_close_note, map_opts("Close branch note"))
    vim.keymap.set({ "n", "i" }, config.mappings.toggle_checkbox, M.handle_checkbox, map_opts("Toggle checkbox"))
end

---@param config BranchNotesConfig
function M.setup(config)
    vim.keymap.set("n", config.mappings.toggle_note, function()
        M.open_branch_note(config)
    end, { desc = "Toggle Branch Note" })
end

M.setup(M.config)
