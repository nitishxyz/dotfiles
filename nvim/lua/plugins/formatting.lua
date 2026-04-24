return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      notify_on_error = false,
      notify_no_formatters = false,
      format_on_save = function(bufnr)
        if vim.bo[bufnr].buftype ~= "" then
          return
        end

        return {
          timeout_ms = 1000,
          lsp_format = "fallback",
          quiet = true,
        }
      end,
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        jsonc = { "prettierd", "prettier" },
        lua = { "stylua" },
        markdown = { "prettierd", "prettier" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
      },
    },
  },
}
