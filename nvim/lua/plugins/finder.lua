return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      
      fzf.setup({
        winopts = {
          height = 0.85,
          width = 0.90,
          row = 0.35,
          preview = {
            default = 'builtin',
            layout = 'flex',
            flip_columns = 120,
          },
        },
        fzf_opts = {
          ['--layout'] = 'reverse-list',
        },
        files = {
          prompt = 'Files❯ ',
          cmd = "{ git ls-files --modified --others --exclude-standard 2>/dev/null || true; rg --files --hidden --glob '!.git'; } | awk '!seen[$0]++'",
          file_icons = true,
          color_icons = true,
          path_shorten = false,
        },
        grep = {
          prompt = 'Grep❯ ',
          rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --glob '!.git'",
        },
      })
      
      vim.keymap.set("n", "<leader>p", fzf.files, { desc = "Find files in project" })
      vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Grep in project" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "Find word under cursor" })
      vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<leader>fi", fzf.lgrep_curbuf, { desc = "Search in current file" })
      vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "Git branches" })
    end
  }
} 