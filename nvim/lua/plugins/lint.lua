return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      local function executable(cmd)
        return vim.fn.executable(cmd) == 1
      end

      local eslint = executable("eslint_d") and "eslint_d" or executable("eslint") and "eslint" or nil

      lint.linters_by_ft = {
        javascript = eslint and { eslint } or {},
        javascriptreact = eslint and { eslint } or {},
        lua = executable("luacheck") and { "luacheck" } or {},
        markdown = executable("vale") and { "vale" } or {},
        python = executable("flake8") and { "flake8" } or {},
        svelte = eslint and { eslint } or {},
        typescript = eslint and { eslint } or {},
        typescriptreact = eslint and { eslint } or {},
      }

      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "ℹ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
        },
      })

      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function(args)
          if vim.bo[args.buf].buftype == "" then
            lint.try_lint()
          end
        end,
      })

      vim.api.nvim_create_user_command("Lint", function()
        lint.try_lint()
      end, {})
    end,
  },
}
