-- Prettier in-buffer markdown/LaTeX rendering. Primary renderer; render-markdown
-- is kept installed but disabled (opts.enabled = false) as a one-command fallback.
-- Do NOT lazy-load — markview is already self-lazy-loading; adding ft/event only
-- makes previews slower to appear (per its docs). Loads after the colorscheme.
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
