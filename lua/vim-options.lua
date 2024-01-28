vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")

vim.g.mapleader = " "

vim.keymap.set("n", ";", ":")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "m/", "<Esc>_i#<Space><Esc>l")
vim.keymap.set("n", "n/", "<Esc>_xx<Esc>")
