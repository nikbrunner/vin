local function set(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    opts.silent = opts.silent == nil and true or opts.silent
    vim.keymap.set(mode, lhs, rhs, opts)
end
local del = vim.keymap.del

-- better up/down
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set(
    { "n", "x" },
    "<Down>",
    "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true }
)
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set(
    { "n", "x" },
    "<Up>",
    "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true }
)
