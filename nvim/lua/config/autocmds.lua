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

local external_file_reload = vim.api.nvim_create_augroup("otto_external_file_reload", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = external_file_reload,
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("silent! checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("FileChangedShell", {
  group = external_file_reload,
  callback = function()
    if not vim.bo.modified then
      vim.v.fcs_choice = "reload"
    end
  end,
})
