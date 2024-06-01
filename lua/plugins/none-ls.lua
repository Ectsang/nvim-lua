return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      debug = true,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with({ extra_args = { "--line-length=80" } }),
        null_ls.builtins.formatting.markdownlint,
        require("none-ls.formatting.eslint_d"),
        require("none-ls.code_actions.eslint_d"),
        null_ls.builtins.formatting.isort.with({
          extra_args = { "--profile", "black" },
        }),
        null_ls.builtins.formatting.black.with({
          extra_args = { "--fast", "--quiet", "--line-length=120" },
        }),
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.markdownlint,
      },
    })

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
  end,
}
