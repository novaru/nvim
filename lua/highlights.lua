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
  TbBufOff = {
    fg = "#9c9c9c",
  },
  NvimTreeWinSeparator = {
    fg = "#6c6c6c",
  },
  NvimTreeFolderArrowClosed = {
    fg = "#9c9c9c",
  },
  WinSeparator = {
    fg = "#6c6c6c",
  },
  CmpBorder = {
    fg = "green",
  },
  CmpDocBorder = {
    fg = "green",
  },
  TelescopeBorder = {
    fg = "green",
  },
  TelescopePromptBorder = {
    fg = "green",
  },
  TelescopeResultsBorder = {
    fg = "green",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
