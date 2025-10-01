return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = false,
                ensure_installed = { "lua_ls", "ts_ls", "gopls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },

        opts = {
            servers = {
                lua_ls = {},
                ts_ls = {
                    settings = {
                        typescript = {
                            suggest = {
                                includeCompletionsWithInsertText = true,
                                includeCompletionsForImportStatements = true,
                                includeAutomaticOptionalChainCompletions = true,
                                importModuleSpecifierPreference = "relative",
                                importModuleSpecifierEnding = "minimal",
                            },
                            preferences = {
                                importModuleSpecifier = "relative",
                                includePackageJsonAutoImports = "on",
                            },
                        },
                        javascript = {
                            suggest = {
                                includeCompletionsWithInsertText = true,
                                includeCompletionsForImportStatements = true,
                                includeAutomaticOptionalChainCompletions = true,
                                importModuleSpecifierPreference = "relative",
                                importModuleSpecifierEnding = "minimal",
                            },
                            preferences = {
                                importModuleSpecifier = "relative",
                                includePackageJsonAutoImports = "on",
                            },
                        },
                        completions = {
                            completeFunctionCalls = true,
                        },
                    },
                },
                gopls = {},
            },
        },
        config = function(_, opts)
            -- LSP keymaps
            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end

            for server, config in pairs(opts.servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                config.on_attach = on_attach
                vim.lsp.enable(server)
            end
        end,
    },
}
