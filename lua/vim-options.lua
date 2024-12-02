local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.number = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true -- if you use mixied case, case-sensitive search is assumed

opt.splitright = true
opt.splitbelow = true

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])   -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
