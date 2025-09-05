local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
    },
    config = function()
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    -- Lazy load when event occurs. Events are triggered
    -- as mentioned in:
    -- https://vi.stackexchange.com/a/4495/20389
    event = "InsertEnter",
    -- You can also have it load at immediately at
    -- startup by commenting above and uncommenting below:
    lazy = false,
    opts = overrides.copilot,
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function()
  --     vim.g.rustfmt_autosave = 1
  --   end,
  -- },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^6",
  --   lazy = false,
  -- },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "nvchad.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.inline-diagnostics"
    end,
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup(overrides.presence)
    end,
  },
  { "nvzone/volt", lazy = true },

  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup(overrides.hlchunk)
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      enabled = true,
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      stiffness_insert_mode = 0.7,
      trailing_stiffness_insert_mode = 0.7,
      damping = 0.8,
      damping_insert_mode = 0.8,
      distance_stop_animating = 0.5,
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = "*",
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          model = "gpt-4.1",
          extra_request_body = {
            temperature = 0,
            max_tokens = 8192,
          },
        },
      },
      -- provider = "groq",
      -- providers = {
      --   groq = {
      --     __inherited_from = "openai",
      --     api_key_name = "cmd:echo $GROQ_API_KEY",
      --     endpoint = "https://api.groq.com/openai/v1/",
      --     model = "llama-3.3-70b-versatile",
      --     disable_tools = false,
      --     extra_request_body = {
      --       temperature = 0,
      --       max_tokens = 8192, -- remember to increase this value, otherwise it will stop generating halfway
      --     },
      --   },
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
