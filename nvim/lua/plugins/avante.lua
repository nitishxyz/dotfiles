return {
  {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    version = false,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "folke/snacks.nvim",
      "ibhagwan/fzf-lua",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      provider = "otto",
      mode = "agentic",
      acp_providers = {
        otto = {
          command = "otto",
          args = { "--acp" },
          env = {
            NODE_NO_WARNINGS = "1",
            HOME = vim.env.HOME,
            USER = vim.env.USER,
            LOGNAME = vim.env.LOGNAME,
            SHELL = vim.env.SHELL,
            XDG_CONFIG_HOME = vim.env.XDG_CONFIG_HOME,
            XDG_DATA_HOME = vim.env.XDG_DATA_HOME,
            XDG_CACHE_HOME = vim.env.XDG_CACHE_HOME,
            OTTO_HOME = vim.env.OTTO_HOME,
            OTTO_CONFIG_HOME = vim.env.OTTO_CONFIG_HOME,
          },
        },
      },
      input = {
        provider = "snacks",
      },
      selector = {
        provider = "fzf_lua",
      },
      behaviour = {
        auto_add_current_file = true,
        acp_follow_agent_locations = true,
        auto_approve_tool_permissions = false,
      },
      windows = {
        position = "right",
        width = 40,
        input = {
          height = 8,
        },
      },
    },
    keys = {
      {
        "<leader>oo",
        "<cmd>AvanteToggle<cr>",
        desc = "Otto Avante Toggle",
        mode = { "n", "v" },
      },
      {
        "<leader>on",
        "<cmd>AvanteChatNew<cr>",
        desc = "Otto Avante New Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>oa",
        "<cmd>AvanteAsk<cr>",
        desc = "Otto Avante Ask",
        mode = { "n", "v" },
      },
      {
        "<leader>om",
        "<cmd>AvanteModels<cr>",
        desc = "Otto Avante Models",
      },
      {
        "<leader>op",
        "<cmd>AvanteSwitchProvider otto<cr>",
        desc = "Otto Avante Provider",
      },
      {
        "<leader>os",
        "<cmd>AvanteStop<cr>",
        desc = "Otto Avante Stop",
      },
      {
        "<leader>oz",
        function()
          require("avante.api").zen_mode()
        end,
        desc = "Otto Avante Zen Mode",
      },
    },
  },
}
