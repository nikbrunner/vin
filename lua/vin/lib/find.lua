-- QUESTION: Could I make a Plugin out of this?
-- `opts.pathes.preset`: The pathes should get handed over via opts `opts.preset_paths`
-- `opts.pathes.projects`: The user could also define a projects/git repos path and the plugin would automatically search for the subdirectories which contain a .git folder
-- `opts.cmd`: A function which recieves the path of the selected folder. From there the user could use the folder cwd and hand it over to fzf or telescope

local config = require("vin.config")
local repos_path = config.pathes.repos

local M = {
    home = vim.fn.expand("$HOME"),
    config_home = vim.fn.expand("$XDG_CONFIG_HOME"),
}

M.folder_presets = {
    ["home config"] = M.config_home,
    ["neovim / vin"] = M.config_home .. "/nvim",
    ["home scripts"] = M.home .. "/.scripts",
    ["notes (personal)"] = config.pathes.notes.personal,
    ["notes (dcd)"] = config.pathes.notes.work.dcd,
}

-- Helper function to get subdirectories of a directory
local function get_sub_directories(path)
    local sub_dirs = {}
    local dirs = vim.fn.readdir(path)
    if not dirs then
        return sub_dirs
    end
    for _, dir in ipairs(dirs) do
        local full_path = path .. "/" .. dir
        if vim.fn.isdirectory(full_path) == 1 then
            table.insert(sub_dirs, dir)
        end
    end
    return sub_dirs
end

-- Populate folder presets with repositories path
local function populate_folder_presets_from_repos()
    local top_level_dirs = get_sub_directories(repos_path)
    for _, top_dir in ipairs(top_level_dirs) do
        local top_dir_path = repos_path .. "/" .. top_dir
        local second_level_dirs = get_sub_directories(top_dir_path)
        for _, sub_dir in ipairs(second_level_dirs) do
            local repo_name = top_dir .. "/" .. sub_dir
            local repo_path = repos_path .. "/" .. repo_name
            M.folder_presets[repo_name] = repo_path
        end
    end
end

-- Call the function to populate folder_presets
populate_folder_presets_from_repos()

--- Finds a pattern in a line of a file and replaces it with a value
---@param search_cb function(string) - the callback to execute with the search result (folder of choice)
M.search_preset_folder = function(search_cb)
    local choices = vim.tbl_keys(M.folder_presets)

    table.sort(choices)

    vim.ui.select(choices, {
        prompt = "Pick a folder: ",
        format_item = function(choice)
            return " " .. choice
        end,
    }, function(choice)
        local folder = M.folder_presets[choice]
        search_cb(folder)
    end)
end

return M
