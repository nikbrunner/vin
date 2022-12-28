local present, mason = pcall(require, "mason")
if not present then
    return
end

mason.setup({
    ui = {
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",
    },
})
