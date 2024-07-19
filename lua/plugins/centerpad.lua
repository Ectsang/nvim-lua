return {
  -- Lua
  {
    "smithbm2316/centerpad.nvim",
    vim.api.nvim_set_keymap(
      "n",
      "<leader>z",
      "<cmd>lua require'centerpad'.toggle{ leftpad = 80, rightpad = 80 }<cr>",
      { silent = true, noremap = true }
    ),
  },
}
