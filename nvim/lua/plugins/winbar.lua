return {
  "fgheng/winbar.nvim",
  config = function()
    require('winbar').setup({
      enabled = true,
      options = {
        show_file_path = true,
        show_symbols = true,
      }
    })
  end
}