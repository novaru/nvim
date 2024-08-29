-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

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
  Visual = {
    bg = "#676767",
  },
  LineNr = {
    fg = "#9c9c9c",
  },
  CursorLineNr = {
    bold = true,
    fg = "#ccdd00",
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
