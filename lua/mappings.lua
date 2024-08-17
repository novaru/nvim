require "nvchad.mappings"
---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- Copilot toggle
local copilot_on = true

vim.api.nvim_create_user_command("CopilotToggle", function()
  if copilot_on then
    vim.cmd "Copilot disable"
    print "Copilot OFF"
  else
    vim.cmd "Copilot enable"
    print "Copilot ON"
  end
  copilot_on = not copilot_on
end, { nargs = 0 })

vim.keymap.set("n", "<M-\\>", ":CopilotToggle<CR>", { noremap = true, silent = true })

-- rust crates
M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "upgrade all crates",
    },
  },
}

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

return M
