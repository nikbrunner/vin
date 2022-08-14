local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
    return
end

-- TODO Why does this not work with tsserver?
fidget.setup({
    text = {
        spinner = "pipe", -- animation shown when tasks are ongoing
        done = "✔", -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
    },
    align = {
        bottom = true, -- align fidgets along bottom edge of buffer
        right = true, -- align fidgets along right edge of buffer
    },
    timer = {
        spinner_rate = 125, -- frame rate of spinner animation, in ms
        fidget_decay = 1000, -- how long to keep around empty fidget, in ms
        task_decay = 500, -- how long to keep around completed task, in ms
    },
    window = {
        relative = "win", -- where to anchor, either "win" or "editor"
        blend = 0, -- &winblend for the window
        zindex = nil, -- the zindex value for the window
    },
    fmt = {
        leftpad = true, -- right-justify text in fidget box
        stack_upwards = true, -- list of tasks grows upwards
        -- function to format fidget title
        fidget = function(fidget_name, spinner)
            return string.format("%s %s", spinner, fidget_name)
        end,
        -- function to format each task line
        task = function(task_name, message, percentage)
            return string.format(
                "%s%s [%s]",
                message,
                percentage and string.format(" (%s%%)", percentage) or "",
                task_name
            )
        end,
    },
    sources = {
        ["null-ls"] = {
            ignore = true,
        },
    },
    debug = {
        logging = true, -- whether to enable logging, for debugging
    },
})