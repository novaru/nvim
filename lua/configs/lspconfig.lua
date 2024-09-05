local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "asm_lsp", "html", "cssls", "tsserver", "clangd", "gopls", "pyright", "hls", "zls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
