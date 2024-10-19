return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	opts = {
		provider = "claude",
		vendors = {
			ollama = {
				["local"] = true,
				endpoint = "https://nitishs-mac-mini.dala-duck.ts.net/v1",
				api_key_name = "ANTHROPIC_API_KEY",
				model = "llama3.1",
				parse_curl_args = function(opts, code_opts)
					return {
						url = opts.endpoint .. "/chat/completions",
						headers = {
							["Accept"] = "application/json",
							["Content-Type"] = "application/json",
						},
						body = {
							model = opts.model,
							messages = require("avante.providers").copilot.parse_message(code_opts),
							max_tokens = 2048,
							stream = true,
						},
					}
				end,
				parse_response_data = function(data_stream, event_state, opts)
					require("avante.providers").openai.parse_response(data_stream, event_state, opts)
				end,
			},
		},
	},
	build = ":AvanteBuild",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",

		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua",
		{

			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {

				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
