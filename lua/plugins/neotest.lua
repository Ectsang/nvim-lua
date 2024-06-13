return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("dap-python").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    after = "nvim-dap",
    config = function()
      require("dap-python").setup(".venv/bin/python")
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            args = { "--log-level", "DEBUG" },
            runner = "pytest",
            python = ".venv/bin/python",
          }),
          require("neotest-plenary"),
       },
      })
    end,
  },
}
