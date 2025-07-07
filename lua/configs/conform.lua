local options = {
  formatters_by_ft = {
    c = { "clang-format" },
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "biome" },
    javascript = { "biome" },
    typescript = { "prettier" },
    purescript = { "purs-tidy" },
    svelte = { "prettier" },
    php = { "php-cs-fixer" },
    go = {
      cmd = "go fmt",
    },
    rust = { "rustfmt" },
    haskell = { "fourmolu" },
    python = { "black" },
    zig = {
      cmd = "zig fmt",
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 800,
    lsp_fallback = true,
  },
}

return options
