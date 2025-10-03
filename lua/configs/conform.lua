local options = {
  formatters_by_ft = {
    c = { "clang-format" },
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "biome" },
    javascript = { "biome" },
    typescript = { "prettierd" },
    purescript = { "purs-tidy" },
    svelte = { "prettierd" },
    php = { "php-cs-fixer" },
    go = {
      cmd = "go fmt",
    },
    rust = { "rustfmt" },
    haskell = { "fourmolu" },
    python = { "black" },
    sql = { "pgformatter" },
    vue = { "prettierd" },
    zig = {
      cmd = "zig fmt",
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
