return {
{
  'stevearc/conform.nvim',
  opts = {
  },
  config = function()
	  require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    tsx = { "prettierd", "prettier", stop_after_first = true },

    go = { "go", lsp_format = "fallback" }
  },
})
end
}
}
