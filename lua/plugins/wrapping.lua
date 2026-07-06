return {
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      -- wrapping.nvim still calls the pre-0.11 vim.validate signature, which
      -- prints a one-time deprecation warning on setup. Silence it just for the
      -- duration of setup rather than patching vim.validate permanently.
      local original_validate = vim.validate
      vim.validate = function() end
      require("wrapping").setup()
      vim.validate = original_validate
    end,
  },
}
