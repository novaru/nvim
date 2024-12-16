require "nvchad.mappings"
---@type MappingsTable
local M = {}

-- General keymaps
M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<C-s>"] = { "<cmd>w<CR>", "Save current buffer", opts = { nowait = true } },
  },
  i = {
    ["<C-l>"] = { "λ", "Insert lambda", opts = { noremap = true, silent = true } },
    ["<C-p>"] = { "π", "Insert pi", opts = { noremap = true, silent = true } },
  },
}

-- Debug Adapter Protocol (DAP) keymaps
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>", "Add or remove breakpoint" },
    ["<leader>dr"] = { "<cmd>DapContinue<CR>", "Run or Continue the debugger" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        widgets.sidebar(widgets.scopes).open()
      end,
      "Open debugging sidebar",
    },
  },
}

-- DAP (Go)
M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "debug last go test",
    },
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

M.general.n["<M-\\>"] = {
  ":CopilotToggle<CR>",
  "Toggle Copilot",
  opts = { noremap = true, silent = true },
}

-- Rust Crates keymaps
M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "Upgrade all crates",
    },
  },
}

-- Go To Definition
M.general.n["gd"] = {
  function()
    vim.lsp.buf.definition()
  end,
  "Go To Definition",
  opts = { noremap = true, silent = true },
}

-- Buffer switching with Alt keys
for i = 1, 9 do
  M.general.n[string.format("<A-%s>", i)] = {
    function()
      if vim.t.bufs and vim.t.bufs[i] then
        vim.api.nvim_set_current_buf(vim.t.bufs[i])
      else
        print(string.format("Buffer %d not available", i))
      end
    end,
    string.format("Switch to buffer %d", i),
    opts = { noremap = true, silent = true },
  }
end

return M
