local M = {}

local function copy(path)
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!', vim.log.levels.INFO)
end

function M.full_path()
    return vim.fn.expand("%:p")
end

function M.full_path_from_home()
    return vim.fn.expand("%:~")
end

function M.file_name()
    return vim.fn.expand("%:t")
end

function M.get_github_url()
    -- It is import to make this conversion and not use it directly, because the
    -- line range selection results in "V" and not in "v", what the plugin requires as argument
    local current_vim_mode = vim.api.nvim_get_mode().mode
    local mode_for_plugin = current_vim_mode == "n" and "n" or "v"

    return require("gitlinker").get_buf_range_url(mode_for_plugin, { print_url = false })
end

function M.get_current_relative_path(with_line_number)
    local current_file = vim.fn.expand("%")
    local current_line = vim.fn.line(".")
    local relative_path = vim.fn.fnamemodify(current_file, ":~:.")

    if with_line_number then
        return relative_path .. "#L" .. current_line
    end

    return relative_path
end

M.list_paths = function(opts)
    local actions = require("telescope.actions")
    local actions_state = require("telescope.actions.state")
    local entry_display = require("telescope.pickers.entry_display")

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local config = require("telescope.config").values

    local log = require("plenary.log"):new()

    local github_url = M.get_github_url()

    log.level = "debug"

    function M.file_paths()
        local paths = {
            { type = "Filename", name = M.file_name() },
            { type = "Relative /w Line Number", name = M.get_current_relative_path(true) },
            { type = "Relative", name = M.get_current_relative_path(false) },
            { type = "Full Path (Home)", name = M.full_path_from_home() },
            { type = "Full Path (Absolute)", name = M.full_path() },
            github_url and { type = "GitHub", name = M.get_github_url() } or nil,
        }
        return paths
    end

    local menu_height = #M.file_paths() + 4

    local displayer = entry_display.create({
        separator = " " .. require("vin.icons").misc.separator .. " ",
        items = {
            { width = 25 },
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
                height = menu_height,
                width = function(res)
                    local max_width = 0
                    for _, v in ipairs(res.finder.results) do
                        if #v.value.name > max_width then
                            max_width = #v.value.name
                        end
                    end
                    max_width = max_width + 50
                    return max_width
                end,
            },
            sorter = config.generic_sorter(opts),
            prompt_title = "Copy File Meta Information",
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    local selection = actions_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    copy(selection.value.name)
                end)

                map("i", "<M-CR>", function()
                    local selection = actions_state.get_selected_entry()
                    if selection.value.type == "GitHub" then
                        require("gitlinker.actions").open_in_browser(selection.value.name)
                    end
                    actions.close(prompt_bufnr)
                    vim.notify("Opening GitHub Link in Browser", vim.log.levels.INFO)
                end)

                map("i", "<CR>", function()
                    local selection = actions_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    copy(selection.value.name)
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
