; Overrides nvim-treesitter master's markdown injections.scm, which calls the
; `set-lang-from-info-string!` directive. That directive's master-branch
; implementation uses the pre-0.10 treesitter match API and crashes on
; Neovim 0.12 ("attempt to call method 'range' (a nil value)"). This is a copy
; of Neovim 0.12's own bundled query, which needs no custom directive.
; User-config queries take runtimepath precedence over plugin queries, so this
; replaces the broken one. Remove if nvim-treesitter is migrated to `main`.

(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
