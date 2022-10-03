local status_ok, notify = pcall(require, "notify")
if not status_ok then
    return
end

notify.setup({
    -- Animation style
    stages = "static",

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 5000,

    -- Max number of columns for messages
    max_width = 50,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
    background_colour = "NormalFloat",

    -- Minimum width for notification windows
    minimum_width = 50,

    -- Icons for the different levels
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
})
