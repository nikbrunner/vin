local M = {}

local function copy(path)
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!', vim.log.levels.INFO)
end

function M.fullPath()
    local full_path = vim.fn.expand("%:p")
    copy(full_path)
end

function M.relativePath()
    -- Source: https://www.reddit.com/r/neovim/comments/q2s3t1/how_to_get_current_filename_relative_to_project/
    local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:.")
    copy(relative_path)
end

function M.fileName()
    local file_name = vim.fn.expand("%:t")
    copy(file_name)
end

M.list_paths = function(opts)
    local actions = require("telescope.actions")
    local actions_state = require("telescope.actions.state")
    local entry_display = require("telescope.pickers.entry_display")

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local config = require("telescope.config").values

    local log = require("plenary.log"):new()

    log.level = "debug"

    function M.file_paths()
        local paths = {
            { type = "File", name = vim.fn.expand("%:t") },
            { type = "Relative", name = vim.fn.expand("%") },
            { type = "Home", name = vim.fn.expand("%:~") },
            { type = "Full", name = vim.fn.expand("%:p:h") },
        }
        return paths
    end

    local displayer = entry_display.create({
        separator = " ",
        items = {
            { width = 15 },
            { remaining = true },
        },
    })

    pickers
        .new(opts, {
            finder = finders.new_table({
                results = M.file_paths(),
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = function()
                            return displayer({
                                { entry.type, "TelescopeResultsNumber" },
                                entry.name,
                            })
                        end,
                        ordinal = entry.name,
                    }
                end,
            }),
            layout_strategy = "cursor",
            layout_config = {
                height = 9,
                width = function(res)
                    -- log.debug(res.finder.results)
                    local max_width = 0
                    for _, v in ipairs(res.finder.results) do
                        -- log.debug(#v.value.name)
                        if #v.value.name > max_width then
                            max_width = #v.value.name
                        end
                    end
                    max_width = max_width + 25
                    -- if vim. < max_width then return win_width - 4 end
                    return max_width
                end,
            },
            sorter = config.generic_sorter(opts),
            prompt_title = "Copy File Meta Information",

            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    local selection = actions_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    -- copy to clipboard
                    vim.fn.setreg('"', selection.value.name)
                end)

                map("i", "<CR>", function()
                    local selection = actions_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    -- copy to system clipboard
                    vim.fn.setreg("+", selection.value.name)
                    vim.notify("Copied `" .. selection.value.name .. "` to Clipboard", vim.log.levels.INFO)
                end)

                map("i", "<c-p>", function()
                    local selection = actions_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    -- paste
                    vim.api.nvim_paste(selection.value.name, true, -1)
                end)

                map("i", "P", function()
                    local selection = actions_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    -- paste above current line
                    vim.api.nvim_put({ selection.value.name }, "l", false, false)
                end)

                map("i", "p", function()
                    local selection = actions_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    -- paste below current line
                    vim.api.nvim_put({ selection.value.name }, "l", true, false)
                end)

                return true
            end,
        })
        :find()
end

return M
