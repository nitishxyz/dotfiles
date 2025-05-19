-- General Vim options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Other useful options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.sidescrolloff = 8 -- Prevents horizontal scrolling until cursor is 8 chars from edge

local map = vim.api.nvim_set_keymap
vim.opt.termguicolors = true
local opts = { noremap = true, silent = true }

-- Navigate vim panes better
-- Move cursor to top/bottom pane with Ctrl-K/J respectively,
-- and move cursor to previous/next pane with Ctrl-H/L respectively.
map("n", "<c-k>", ":wincmd k<CR>", opts)
map("n", "<c-j>", ":wincmd j<CR>", opts)
map("n", "<c-h>", ":wincmd h<CR>", opts)
map("n", "<c-l>", ":wincmd l<CR>", opts)

-- Set clipboard to system clipboard. This allows the user to paste from their OS clipboard.
vim.cmd("set clipboard=unnamedplus")

-- Copy command from standard output to system clipboard. Use 'a-y' to copy all content of the buffer.
map("n", "<A-y>", "+y", opts)
map("n", "<A-Y>", "+Y", opts)
map("n", "<A-yy>", "+yy", opts)

-- Paste line/paragraph from system clipboard into standard output. Use '<leader>x' to paste into file.
map("n", "<A-p>", "+p", opts)
map("n", "<A-P>", "+P", opts)
