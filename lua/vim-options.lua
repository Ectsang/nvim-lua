vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")

vim.g.mapleader = " "
vim.opt.swapfile = false

vim.keymap.set("n", ";", ":")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<Esc>", ":noh<CR><Esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "m/", "<Esc>_i#<Space><Esc>l")
vim.keymap.set("n", "n/", "<Esc>_xx<Esc>")

vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "\\s", ":split<CR>", opts)
vim.keymap.set("n", "\\v", ":vsplit<CR>", opts)

vim.keymap.set("n", "<C-k>", function()
  vim.diagnostic.goto_next()
end, opts)

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = {"start", "eol", "indent"}
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"


