return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- Fully disabled so markview.nvim is the ONLY markdown renderer. lazy.nvim
  -- skips this plugin entirely (not loaded, no autocmds, no namespaces).
  -- Re-enable: change to `enabled = true` (or delete this file).
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },
}
