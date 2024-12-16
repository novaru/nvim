local highlight = require "configs.highlights"
local M = {}

highlight.setup()

M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "radium" },
  -- transparency = true,
  hl_override = {
    ["@comment"] = {
      italic = true,
      fg = "#9c9c9c",
    },
    ["@operator"] = {
      fg = "teal",
    },
    Visual = {
      bg = "#33373a",
    },
    LineNr = {
      fg = "#9c9c9c",
    },
    CursorLineNr = {
      bold = true,
      fg = "yellow",
    },
    WinSeparator = {
      fg = "#6c6c6c",
    },
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
}

M.ui = {
  cmp = {
    lspkind_text = false,
    style = "flat_dark",
    format_colors = {
      tailwind = true,
    },
  },

  telescope = { style = "borderless" },

  statusline = {
    theme = "minimal",
    separator_style = "block",
    order = nil,
    modules = nil,
  },

  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
}

-- M.mappings = require "mappings"
--
-- for mode, mode_mappings in pairs(M.mappings.general) do
--   for key, mapping in pairs(mode_mappings) do
--     vim.keymap.set(mode, key, mapping[1], {
--       desc = mapping[2],
--       noremap = mapping.opts and mapping.opts.noremap,
--       silent = mapping.opts and mapping.opts.silent,
--       nowait = mapping.opts and mapping.opts.nowait,
--     })
--   end
-- end
--
-- -- For DAP mappings
-- for key, mapping in pairs(M.mappings.dap.n) do
--   vim.keymap.set("n", key, mapping[1], {
--     desc = mapping[2],
--   })
-- end
--
-- -- For DAP Go mappings
-- for key, mapping in pairs(M.mappings.dap_go.n) do
--   vim.keymap.set("n", key, mapping[1], {
--     desc = mapping[2],
--   })
-- end
--
-- -- For Crates mappings
-- for key, mapping in pairs(M.mappings.crates.n) do
--   vim.keymap.set("n", key, mapping[1], {
--     desc = mapping[2],
--   })
-- end

return M
