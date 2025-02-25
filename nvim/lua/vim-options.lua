local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

vim.cmd("set expandtab")
-- Set editor indentation configuration. These settings are commonly used.
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Miscellaneous settings
vim.g.mapleader = " "

-- Navigate vim panes better
-- Move cursor to top/bottom pane with Ctrl-K/J respectively,
-- and move cursor to previous/next pane with Ctrl-H/L respectively.
map("n", "<c-k>", ":wincmd k<CR>", opts)
map("n", "<c-j>", ":wincmd j<CR>", opts)
map("n", "<c-h>", ":wincmd h<CR>", opts)
map("n", "<c-l>", ":wincmd l<CR>", opts)

-- Toggle hlsearch
map("n", "<leader>h", ":nohlsearch<CR>", opts)
vim.cmd("set ignorecase")
-- Case insensitive searching in normal and search mode,
-- also used in 'ignorecase' option for better matching.
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

-- Set clipboard to system clipboard. This allows the user to paste from their OS clipboard.
vim.cmd("set clipboard=unnamedplus")

-- Open diagnostic info, float below current window
map("n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", opts)

-- Copy command from standard output to system clipboard. Use 'a-y' to copy all content of the buffer.
map("n", "<A-y>", "+y", opts)
map("n", "<A-Y>", "+Y", opts)
map("n", "<A-yy>", "+yy", opts)

-- Paste line/paragraph from system clipboard into standard output. Use '<leader>x' to paste into file.
map("n", "<A-p>", "+p", opts)
map("n", "<A-P>", "+P", opts)

-- Display relative & absolute line numbers and the 'cursorline' status.
vim.wo.number = true
vim.wo.relativenumber = true
-- mapping to reload LSP
-- Add shortcuts for common user interactions:
-- Reload LSP diagnostics after pressing <leader>l
map("n", "<leader>l", ":LspRestart<CR>", opts)

-- Run shell commands using the command palette
map("n", "<leader>k", ":!", { noremap = true, silent = false })

-- Redo action with Ctrl-R. The redo feature seems to be disabled by a plugin in your setup,
-- please adjust or remove it as needed.
map("n", "<leader>k", ":!", { noremap = true, silent = false })

-- mapping for redo
map("n", "<leader>r", "<C-r>", opts)
