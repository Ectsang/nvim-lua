return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1999,
    config = function()
      -- vim.cmd.colorscheme("catppuccin")
      vim.cmd.colorscheme("catppuccin-frappe")
      -- vim.cmd.colorscheme("catppuccin-macchiato")
      -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1999,
    opts = {},
    config = function()
      --vim.cmd.colorscheme("tokyonight")
      --vim.cmd.colorscheme("tokyonight-night")
      vim.cmd.colorscheme("tokyonight-storm")
      --vim.cmd.colorscheme("tokyonight-moon")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1999,
    opts = {},
    config = function()
      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1999,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    priority = 1999,
    config = function()
      --vim.cmd.colorscheme("nightfox")
      vim.cmd.colorscheme("duskfox")
      --vim.cmd.colorscheme("nordfox")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1999,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon or dawn
        dark_variant = "main",
        dim_inactive_windows = true,
        extend_background_behind_borders = true,
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
      })

      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "sainnhe/everforest",
    name = "everforest",
    priority = 1999,
    config = function()
      vim.g.everforest_background = "medium" -- hard, medium or soft
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1999,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_style = "maia" -- atlantis, andromeda, shusia, maia, espresso
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1999,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = "soft" -- hard, medium or soft
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "ayu-theme/ayu-vim",
    name = "ayu",
    priority = 1999,
    config = function()
      vim.g.ayucolor = "dark"
      vim.cmd.colorscheme("ayu")
    end,
  },
  {
    "ptdewey/darkearth-nvim",
    priority = 999,
    config = function()
      vim.cmd.colorscheme("darkearth")
    end,
  },
}
