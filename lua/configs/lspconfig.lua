local lspconfig = require "lspconfig"
local on_attach = function(client)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end
end
local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers =
  { "asm_lsp", "html", "cssls", "lua_ls", "ts_ls", "clangd", "gopls", "pyright", "rust_analyzer", "hls", "zls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- gopls setup
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      hints = {
        compositeLiteralFields = true,
        functionTypeParameters = true,
        parameterNames = true,
      },
    },
  },
}

-- clangd setup
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  offset_encoding = "utf-16",
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}
