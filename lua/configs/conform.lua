local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "biome" },
    typescript = { "biome" },
    go = { "gofumpt" },
    rust = { "rustfmt" },
    haskell = { "ormolu" },
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
