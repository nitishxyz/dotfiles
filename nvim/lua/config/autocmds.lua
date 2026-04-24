vim.cmd("syntax enable")

local json_syntax = vim.api.nvim_create_augroup("otto_json_syntax", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "FileType" }, {
  group = json_syntax,
  pattern = { "*.json", "*.jsonc", "json", "jsonc" },
  callback = function(args)
    local syntax = (vim.bo[args.buf].filetype == "jsonc" or tostring(args.match):match("%.jsonc$")) and "jsonc" or "json"
    vim.bo[args.buf].syntax = syntax
  end,
})
