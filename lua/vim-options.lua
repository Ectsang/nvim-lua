vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")

vim.g.mapleader = " "
vim.opt.swapfile = false

vim.keymap.set("n", ";", ":")
vim.keymap.set({"i", "v"}, "jk", "<Esc>")
vim.keymap.set("n", "<Esc>", ":noh<CR><Esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")

vim.keymap.set("n", "<C-p>", ":bprev<CR>")
vim.keymap.set("n", "<C-n>", ":bnext<CR>")

vim.keymap.set({"i","n"}, "<M-BS>", "<Esc>ciw<BS>")

vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<M-k>", "ddkP")
vim.keymap.set("n", "<M-j>", "ddp")

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "\\s", ":split<CR>", opts)
vim.keymap.set("n", "\\v", ":vsplit<CR>", opts)

vim.keymap.set("n", "<leader>l", function()
  vim.diagnostic.goto_next()
end, opts)
vim.keymap.set("n", "<leader>h", function()
  vim.diagnostic.goto_prev()
end, opts)

-- show diagnostic in float window
vim.keymap.set("n", "<leader>K", ":lua vim.diagnostic.open_float()<cr>")

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
-- vim.opt.laststatus = 0
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.backspace = {"start", "eol", "indent"}
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"


