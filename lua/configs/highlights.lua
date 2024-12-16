local M = {}

function M.setup()
  vim.api.nvim_set_hl(0, "blue", { fg = "#89B4FA" })
  vim.api.nvim_set_hl(0, "green", { fg = "#A6E3A1" })
  vim.api.nvim_set_hl(0, "yellow", { fg = "#F9E2AF" })
  vim.api.nvim_set_hl(0, "orange", { fg = "#FAB387" })

  vim.fn.sign_define(
    "DapBreakpoint",
    { text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "•", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapStopped",
    { text = "•", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapLogPoint",
    { text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
end

return M
