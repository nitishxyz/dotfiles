return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = function()
			local has_install_tools = vim.fn.executable("tree-sitter") == 1
				and (vim.fn.executable("cc") == 1 or vim.fn.executable("gcc") == 1 or vim.fn.executable("clang") == 1)
			if has_install_tools then
				pcall(vim.cmd, "TSUpdate")
			end
		end,
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			vim.treesitter.language.register("json", { "jsonc" })

			local has_install_tools = vim.fn.executable("tree-sitter") == 1
				and (vim.fn.executable("cc") == 1 or vim.fn.executable("gcc") == 1 or vim.fn.executable("clang") == 1)
			if has_install_tools then
				require("nvim-treesitter").install({
					"bash",
					"go",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"query",
					"rust",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				})
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"bash",
					"go",
					"javascript",
					"json",
					"jsonc",
					"lua",
					"markdown",
					"query",
					"rust",
					"typescript",
					"typescriptreact",
					"tsx",
					"vim",
					"vimdoc",
					"yaml",
				},
				callback = function(args)
					if vim.bo[args.buf].buftype == "" then
						pcall(vim.treesitter.start, args.buf)
					end
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = false,
					},
				},
			})
		end,
	},
}
