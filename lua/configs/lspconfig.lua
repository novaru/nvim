local lspconfig = require "lspconfig"
local on_attach = function(client)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end
end
local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
  "asm_lsp",
  "html",
  "cssls",
  "lua_ls",
  "ts_ls",
  "clangd",
  "gopls",
  "intelephense",
  "purescriptls",
  "pyright",
  "rust_analyzer",
  "hls",
  "zls",
}

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

-- purescriptls setup
lspconfig.purescriptls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "purescript" },
  root_dir = lspconfig.util.root_pattern("spago.yaml", "package.json", ".git"),
}

-- emmet-language-server setup
lspconfig.emmet_language_server.setup {
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "php",
    "pug",
    "typescriptreact",
  },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {
      vim.fn.stdpath "config" .. "/lua/configs/",
    },
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
}
