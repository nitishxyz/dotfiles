return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup({})

    require("mini.surround").setup({
      mappings = {
        add = "gsa",            -- Add surrounding in Normal and Visual modes
        delete = "gsd",         -- Delete surrounding
        find = "gsf",           -- Find surrounding (to the right)
        find_left = "gsF",      -- Find surrounding (to the left)
        highlight = "gsh",      -- Highlight surrounding
        replace = "gsr",        -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`

      }
    })


    require("mini.comment").setup({})

    require("mini.pairs").setup({})

    -- require("mini.indentscose").setup({})

    local miniFiles = require("mini.files")
    miniFiles.setup({
      options = {
        permanent_delete = false,
        use_as_default_explorer = false,

      },
    })
    local minifiles_toggle = function(...)
      if not miniFiles.close() then
        miniFiles.open(...)
      end
    end

    vim.keymap.set({ "n", "v" }, "<leader>r", minifiles_toggle)
  end,
}
