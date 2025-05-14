local lsp = {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "debugpy",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "rust_analyzer",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local cmp_capabilities = cmp_nvim_lsp.default_capabilities()

      local config = require("mason-lspconfig")
      local on_attach = config.on_attach
      local capabilities = config.capabilities

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "python" },
      })
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      local configs = require("lspconfig/configs")
      if not lspconfig.solidity then
        configs.solidity = {
          default_config = {
            cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
            filetypes = { "solidity" },
            root_dir = lspconfig.util.find_git_ancestor,
            single_file_support = true,
            settings = {
              capabilities = {
                textDocument = {
                  completion = {
                    completionItem = {
                      snippetSupport = true,
                    },
                  },
                },
              },
            },
          },
        }
        lspconfig.solidity.setup({
          on_attach = on_attach,
          capabilities = cmp_capabilities,
        })
      end

      if not lspconfig.solidity_ls then
        lspconfig.solidity_ls.setup({
          on_attach = on_attach,
          capabilities = cmp_capabilities,
          filetypes = { "solidity" },
          root_dir = lspconfig.util.root_pattern("hardhat.config.*", "package.json", "tsconfig.json", ".git"),
        })
      end

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
return lsp
