local map = vim.keymap.set

map({ "n", "v" }, "<A-y>", '"+y', { silent = true, desc = "Yank to system clipboard" })
map("n", "<A-p>", '"+p', { silent = true, desc = "Paste after from system clipboard" })
map("n", "<A-P>", '"+P', { silent = true, desc = "Paste before from system clipboard" })
