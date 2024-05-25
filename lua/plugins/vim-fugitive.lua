return {
  {
    "tpope/vim-fugitive",
    vim.keymap.set('n', '<leader>v', ':Gvdiffsplit<CR>'),
    vim.keymap.set('n', '<leader>ga', ':Git add .<CR>'),
    vim.keymap.set('n', '<leader>gc', ':Git commit<CR>'),
    vim.keymap.set('n', '<leader>gp', ':Git push<CR>'),
  },
}
