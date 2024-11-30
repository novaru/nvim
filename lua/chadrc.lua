local M = {}

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

return M
