return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  config = function()
    require('trouble').setup {
      auto_preview = false,
      auto_fold = true,
      use_lsp_diagnostic_signs = true,
    }
  end,
  setup = function()
    -- vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>Trouble<cr>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>xR', '<cmd>Trouble lsp_references<cr>', { noremap = true, silent = true })
  end,
}
