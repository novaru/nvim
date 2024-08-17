local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "biome" },
    typescript = { "biome" },
    go = { "gofumpt" },
    cpp = { "clang_format" },
    rust = { "rustfmt" },
    python = { "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
