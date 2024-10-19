return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup({})

		require("mini.surround").setup({})

		require("mini.comment").setup({})

		require("mini.pairs").setup({})

		require("mini.indentscope").setup({})

		local miniFiles = require("mini.files")
		miniFiles.setup({
			options = {
				permanent_delete = false,
				use_as_default_explorer = true,
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
