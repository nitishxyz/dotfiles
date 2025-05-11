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

