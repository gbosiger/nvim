-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.autoformat = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.opt.relativenumber = false
