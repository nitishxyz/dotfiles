return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      
      -- Setup fzf-lua with project-aware configuration
      fzf.setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          row = 0.35,
          preview = {
            layout = 'vertical',
            vertical = 'down:45%'
          },
        },
        fzf_opts = {
          ['--layout'] = 'reverse',
        },
        files = {
          cmd = "fd --type f --hidden --follow --exclude .git",
        },
      })
      
      -- Set up keybindings for project navigation
      vim.keymap.set("n", "<leader>p", fzf.files, { desc = "Find files in project" })
      vim.keymap.set("n", "<leader>fg", fzf.grep_project, { desc = "Grep in project" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "Find word under cursor" })
      vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
    end
  }
} 