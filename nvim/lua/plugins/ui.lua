return {

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true, -- enables the Noice cmdline UI
					view = "cmdline", -- view for rendering the cmdline. Change to "cmdline_popup" for popup
				},
				messages = {
					enabled = true, -- enables the Noice messages UI
					view = "notify", -- default view for messages
					view_error = "notify", -- view for errors
					view_warn = "notify", -- view for warnings
					view_history = "messages", -- view for :messages
					view_search = "virtualtext", -- view for search count messages
				},
				routes = {
					{
						-- Route shell command output to a popup
						filter = {
							event = "msg_show",
							kind = "",
							find = "^:",
						},
						view = "popup",
					},
					{
						-- Route command output that contains multiple lines to split
						filter = {
							event = "msg_show",
							min_height = 5,
						},
						view = "split",
					},
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		"nvzone/floaterm",
		dependencies = "nvzone/volt",
		opts = {
			border = false,
			size = { h = 60, w = 70 },
			mappings = { sidebar = nil, term = nil },
			terminals = {
				{ name = "Terminal" },
			},
		},
		cmd = "FloatermToggle",
		keys = {
			{ "<leader>ft", "<cmd>FloatermToggle<cr>", desc = "Toggle Floaterm" },
		},
	},
}
