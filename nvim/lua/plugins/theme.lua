return {
  "shatur/neovim-ayu",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local function set_search_highlights()
      vim.api.nvim_set_hl(0, "Search", { fg = "#0b0e14", bg = "#ffd866", bold = true })
      vim.api.nvim_set_hl(0, "IncSearch", { fg = "#0b0e14", bg = "#ff8f40", bold = true })
      vim.api.nvim_set_hl(0, "CurSearch", { fg = "#0b0e14", bg = "#ff8f40", bold = true })
    end

    local function set_json_highlights()
      local links = {
        ["@property.json"] = "Identifier",
        ["@property.jsonc"] = "Identifier",
        ["@string.json"] = "String",
        ["@string.jsonc"] = "String",
        ["@number.json"] = "Number",
        ["@number.jsonc"] = "Number",
        ["@boolean.json"] = "Boolean",
        ["@boolean.jsonc"] = "Boolean",
        ["@constant.builtin.json"] = "Constant",
        ["@constant.builtin.jsonc"] = "Constant",
        ["@punctuation.bracket.json"] = "Delimiter",
        ["@punctuation.bracket.jsonc"] = "Delimiter",
        ["@punctuation.delimiter.json"] = "Delimiter",
        ["@punctuation.delimiter.jsonc"] = "Delimiter",
        ["jsonKeyword"] = "Identifier",
        ["jsonString"] = "String",
        ["jsonNumber"] = "Number",
        ["jsonBoolean"] = "Boolean",
        ["jsonNull"] = "Constant",
        ["jsonBraces"] = "Delimiter",
        ["jsonQuote"] = "Delimiter",
        ["jsonNoise"] = "Delimiter",
      }

      for group, target in pairs(links) do
        vim.api.nvim_set_hl(0, group, { link = target })
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        set_search_highlights()
        set_json_highlights()
      end,
    })

    vim.cmd.colorscheme("ayu")
    set_search_highlights()
    set_json_highlights()
  end,
}
