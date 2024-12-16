local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers =
  { "asm_lsp", "html", "cssls", "lua_ls", "ts_ls", "clangd", "gopls", "pyright", "rust_analyzer", "hls", "zls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- clangd setup
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  offset_encoding = "utf-16",
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}
