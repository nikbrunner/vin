local map = vim.keymap.set

map("n", "<C-j>", [[/^#\+ .*<CR>]], { buffer = true, silent = true })
map("n", "<C-k>", [[?^#\+ .*<CR>]], { buffer = true, silent = true })
map({ "n", "o", "x" }, "j", "gj", {})
map({ "n", "o", "x" }, "k", "gk", {})
map({ "n", "o", "x" }, "0", "g0", {})
map({ "n", "o", "x" }, "$", "g$", {})

vim.opt.wrap = true
vim.opt.conceallevel = 2
