local M = {}

---@type Base46HLGroupsList
M.override = {
  ["@keyword"] = {
    bold = true,
  },
  ["@comment"] = {
    italic = true,
    fg = "#6c6c6c",
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
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
