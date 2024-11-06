local M = {}

--- Run a shell command and optionally strip newline characters from the output.
-- @param command The shell command to run
-- @param strip_newline Boolean flag to remove newline characters from the output
-- @return result The output of the shell command, as a string
local function run_command(command, strip_newline)
    local handle = io.popen(command)
    local result = handle and handle:read("*a")
    if strip_newline then
        result = result:gsub("\n", "")
    end
    if handle then
        handle:close()
    end
    return result
end

-- Helper function to filter sessions list
local function filter_sessions(sessions, current_session)
    return vim.tbl_filter(function(item)
        return item ~= "" and ((current_session and item ~= current_session) or not current_session)
    end, sessions)
end

function M.start_smug_session()
    local sessions = vim.split(run_command("smug list", false), "\n")
    vim.cmd("Neotree close")

    if sessions then
        vim.ui.select(sessions, {
            prompt = "Start a new preconfigured tmux session:",
        }, function(session, _)
            if session then
                vim.fn.system(string.format("smug start %s", session))

                vim.ui.select({
                    "Yes",
                    "No",
                }, {
                    prompt = "Attach to the new session?",
                }, function(attach, _)
                    if attach == "Yes" then
                        vim.fn.system(string.format("tmux switch-client -t %s", session))
                        vim.fn.system(string.format("tmux select-window -t %s:1", session))
                    end
                end)
            end
        end)
    else
        print("No smug sessions available.")
    end
end

function M.kill_tmux_session()
    local current_session = run_command("tmux display-message -p '#S'", true)
    local sessions =
        filter_sessions(vim.split(run_command("tmux list-sessions -F '#{session_name}'"), "\n"), current_session)

    if #sessions > 0 then
        vim.cmd("Neotree close")

        vim.ui.select(sessions, {
            prompt = "Select a tmux session to kill:",
        }, function(session, _)
            if session then
                vim.fn.system(string.format("tmux kill-session -t %s", session))
            end
        end)
    else
        print("No other active tmux sessions.")
    end
end

function M.switch_tmux_session()
    local current_session = run_command("tmux display-message -p '#S'", true)
    local sessions =
        filter_sessions(vim.split(run_command("tmux list-sessions -F '#{session_name}'"), "\n"), current_session)

    if #sessions > 0 then
        vim.cmd("Neotree close")

        vim.ui.select(sessions, {
            prompt = "Select a tmux session to switch to:",
        }, function(session, _)
            if session then
                vim.fn.system(string.format("tmux switch-client -t %s", session))
            end
        end)
    else
        print("No other active tmux sessions.")
    end
end

--- Function to switch to a specific tmux window across all sessions
---@return nil
function M.switch_tmux_window()
    local current_window_id = run_command("tmux display-message -p '#{session_name}:#{window_id}'", true)

    local window_list = run_command("tmux list-windows -a -F '#{session_name} #{window_id} #{window_name}'")

    if window_list and window_list ~= "" then
        local windows = vim.split(window_list, "\n")
        windows = vim.tbl_filter(function(item)
            return item ~= ""
        end, windows)
        local display_windows = {}
        local window_map = {}

        windows = vim.tbl_filter(function(item)
            local session, window_id, window_name = string.match(item, "([^ ]+) ([^ ]+) (.+)")
            if session and window_id then
                local full_id = session .. ":" .. window_id
                if item ~= "" and ((current_window_id and full_id ~= current_window_id) or not current_window_id) then
                    local display_name = session .. " - " .. window_name
                    table.insert(display_windows, display_name)
                    window_map[display_name] = full_id
                    return true
                end
            else
                print("Debug: session or window_id is nil for item:", item)
            end
            return false
        end, windows)

        if #display_windows > 0 then
            vim.cmd("Neotree close")

            vim.ui.select(display_windows, {
                prompt = "Select a tmux window to switch to:",
            }, function(selected, _)
                if selected then
                    local full_id = window_map[selected]
                    local session, window_id = string.match(full_id, "([^:]+):([^:]+)")
                    vim.fn.system(string.format("tmux switch-client -t %s:%s", session, window_id))
                end
            end)
        else
            print("No other active tmux windows.")
        end
    else
        print("Failed to list tmux windows.")
    end
end

--- Function to start a custom tmux session
---@return nil
function M.start_custom_tmux_session()
    vim.cmd("Neotree close")

    -- Prompt the user for a custom session name
    vim.ui.input({
        prompt = "Enter a name for the custom tmux session: ",
        default = "",
    }, function(input)
        if input and input ~= "" then
            -- Create and switch to the new custom tmux session
            local cmd_create = string.format("tmux new-session -d -s %s", input)
            local cmd_switch = string.format("tmux switch-client -t %s", input)
            vim.fn.system(cmd_create)
            vim.fn.system(cmd_switch)
        elseif input == "" then
            print("Session name cannot be empty.")
        else
            print("Operation aborted.")
        end
    end)
end

function M.switch_nvim_instance()
    local nvim_panes = {}
    local panes_info = vim.fn.systemlist(
        "tmux list-panes -a -F '#{session_name} - #{window_index} - #{window_name} - #{pane_id} - #{pane_current_command}'"
    )

    for _, pane_info in ipairs(panes_info) do
        if string.match(pane_info, "nvim") then
            local cleaned_pane_info = string.gsub(pane_info, " %- nvim", "")
            table.insert(nvim_panes, cleaned_pane_info)
        end
    end

    if #nvim_panes > 0 then
        vim.cmd("Neotree close")

        vim.ui.select(nvim_panes, {
            prompt = "Select a Neovim instance to switch to:",
        }, function(pane_info, _)
            if pane_info then
                -- We disable the unused-local diagnostic here for `window`, because the regexp will fail otherwise
                ---@diagnostic disable-next-line: unused-local
                local session, window_index, window, pane_id = string.match(pane_info, "(.-) %- (.-) %- (.-) %- (%%[0-9]+)")

                -- Switch to the tmux session, window, and pane
                vim.fn.system(
                    string.format(
                        "tmux switch-client -t %s ; tmux select-window -t %s:%s ; tmux select-pane -t %s",
                        session,
                        session,
                        window_index,
                        pane_id
                    )
                )
            end
        end)
    else
        print("No other active Neovim instances.")
    end
end

function M.setup(options)
    if options.enable_bindings then
        vim.keymap.set("n", "<leader>tc", M.start_custom_tmux_session, { desc = "Create Session" })
        vim.keymap.set("n", "<leader>ts", M.switch_tmux_session, { desc = "Switch Session" })
        vim.keymap.set("n", "<leader>tw", M.switch_tmux_window, { desc = "Switch Windows" })
        vim.keymap.set("n", "<leader>tt", M.switch_nvim_instance, { desc = "Switch Neovim Instance" })
    end
end

M.setup({
    enable_bindings = false,
})
