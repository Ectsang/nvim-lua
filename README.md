# Neovim Setup

Personal Neovim config. Put the contents of this repo in your `~/.config/nvim` directory.

## Requirements

- **Neovim 0.12+** (uses the native `vim.lsp.config` / `vim.lsp.enable` LSP API)
- A Nerd Font (icons in the statusline / file tree)
- `git`, `ripgrep` (telescope live-grep), and a `cargo` toolchain optional (blink.cmp ships a prebuilt fuzzy binary)

## Layout

- `init.lua` — bootstraps [lazy.nvim](https://github.com/folke/lazy.nvim), loads `vim-options`, then every spec in `lua/plugins/`
- `lua/vim-options.lua` — core options + global keymaps (leader is `<Space>`)
- `lua/plugins/*.lua` — one file per plugin/concern

## Highlights

- **Theme:** [rose-pine](https://github.com/rose-pine/neovim) (`moon` variant) is the active default. Seven other schemes stay installed and hot-swappable via `:colorscheme <name>` (catppuccin, tokyonight, kanagawa, nightfox, sonokai, gruvbox-material, ayu).
- **Completion:** [blink.cmp](https://github.com/saghen/blink.cmp) (LSP + buffer + path + snippets).
- **LSP:** [mason](https://github.com/mason-org/mason.nvim) + mason-lspconfig v2 auto-install/enable `lua_ls`, `pyright`, `rust_analyzer`, `ts_ls`. Solidity (nomicfoundation) is wired up automatically when its language server is on `PATH`.
- **Navigation:** telescope, harpoon, flash, neo-tree, outline, vim-tmux-navigator.
- **Git:** gitsigns, fugitive, lazygit, inline blame.
- **Debug:** nvim-dap + dap-ui + dap-python.
- **Markdown:** [markview.nvim](https://github.com/OXY2DEV/markview.nvim) in-buffer rendering (callouts, LaTeX, code-block icons). render-markdown.nvim stays installed but disabled as a fallback. A local `queries/markdown/injections.scm` overrides nvim-treesitter's markdown injections query, which crashes on Neovim 0.12.

## Key maps (leader = `<Space>`)

| Key | Action |
| --- | --- |
| `<leader>p` / `<leader>/` | find files / live grep |
| `<leader>o` / `<leader>b` | buffers / fuzzy-find in buffer |
| `<leader>n` | toggle file tree |
| `<leader>t` / `<leader>T` | floating terminal |
| `<leader>f` | format buffer |
| `gd` / `gr` / `<leader>ca` | definition / references / code action |
| `<leader>a` / `<leader>1`–`5` | harpoon menu / jump to file |
| `<leader>lg` | lazygit |
| `<leader>d*` | debug (breakpoint, continue, step, …) |

Full bindings live in `lua/vim-options.lua` and the individual plugin files.
