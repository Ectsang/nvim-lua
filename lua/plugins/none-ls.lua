return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.markdownlint,
      },
    })

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
  end,
}
