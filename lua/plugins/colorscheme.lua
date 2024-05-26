return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 100,
    opts = {},
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
 
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
     config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
