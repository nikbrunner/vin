local present, _ = pcall(require, "telescope")
if not present then
    print("Telescope not installed")
    return
end

local utils = require("vin.lib.utils")

local delta_previewer = require("telescope.previewers").new_termopen_previewer({
    get_command = function(entry)
        -- this is for status
        -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
        -- just do an if and return a different command
        if entry.status == "??" or "A " then
            return {
                "git",
                "-c",
                "core.pager=delta",
                "-c",
                "delta.side-by-side=false",
                "diff",
                entry.value,
            }
        end

        -- note we can't use pipes
        -- this command is for git_commits and git_bcommits
        return {
            "git",
            "-c",
            "core.pager=delta",
            "-c",
            "delta.side-by-side=false",
            "diff",
            entry.value .. "^!",
        }
    end,
})

local M = {}

M.telescope = function(builtin, opts)
    return function()
        require("telescope.builtin")[builtin](opts or {})
    end
end

M.find_changed_files = function()
    M.telescope("git_status", {
        previewer = delta_previewer,
        layout_config = {
            width = 0.95,
            height = 0.95,
        },
    })()
end

M.find_commits = function()
    M.telescope("git_commits", {
        previewer = delta_previewer,
    })()
end

M.find_related_files = function()
    local current_filename = utils.get_current_filename(false)

    if current_filename then
        M.telescope("find_files", {
            default_text = current_filename,
        })()
    else
        M.telescope("find_files")()
    end
end

M.find_scss_symbol = function()
    local curr_word = vim.fn.expand("<cword>")

    local Symbol = {
        Variable = "variable",
        Mixin = "mixin",
    }

    local Action = {
        GoToDefinition = "go_to_definition",
        ListReferences = "list_references",
    }

    local use_telescope = function(text)
        M.telescope("grep_string", {
            default_text = text,
            path_display = { "truncate" },
            layout_config = {
                width = 0.90,
                height = 0.90,
            },
        })()
    end

    ---@param action_callback function
    local handleSelectAction = function(action_callback)
        vim.ui.select({
            Action.GoToDefinition,
            Action.ListReferences,
        }, {
            prompt = "What do you want to do with " .. curr_word .. "?",
            format_item = function(item)
                if item == Action.GoToDefinition then
                    return "Go to definition"
                elseif item == Action.ListReferences then
                    return "List references"
                end
            end,
        }, function(action)
            action_callback(action)
        end)
    end

    ---@param symbol_type string
    local handleSelectSymbol = function(symbol_type)
        -- SCSS Variables
        if symbol_type == Symbol.Variable then
            handleSelectAction(function(action)
                if action == Action.GoToDefinition then
                    use_telescope("$" .. curr_word .. ": ")
                    vim.notify(
                        "Looking for variable defintion of '" .. curr_word .. "'"
                    )
                elseif action == Action.ListReferences then
                    use_telescope("$" .. curr_word)
                    vim.notify(
                        "Looking for variable references of '" .. curr_word .. "'"
                    )
                end
            end)

            -- SCSS Mixin
        elseif symbol_type == Symbol.Mixin then
            handleSelectAction(function(action)
                if action == Action.GoToDefinition then
                    use_telescope("@mixin " .. curr_word)
                    vim.notify(
                        "Looking for mixin definition of '" .. curr_word .. "'"
                    )
                elseif action == Action.ListReferences then
                    use_telescope("@include " .. curr_word)
                    vim.notify(
                        "Looking for mixin references for '" .. curr_word .. "'"
                    )
                end
            end)
        end
    end

    vim.ui.select({ Symbol.Mixin, Symbol.Variable }, {
        prompt = "What is '" .. curr_word .. "'?",
        format_item = function(item)
            if item == Symbol.Variable then
                return "$" .. item
            elseif item == Symbol.Mixin then
                return "@" .. item
            end
        end,
    }, handleSelectSymbol)
end

---@param path string Path to directory to search in
M.search_in_dir = function(path)
    M.telescope("find_files", {
        cwd = path,
    })()
end

return M
