---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "radium" },
  -- transparency = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "default",
    separator_style = "block",
  },
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
