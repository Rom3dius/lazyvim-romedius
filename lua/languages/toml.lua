-- lua/languages/toml.lua
---@type Language
local util = require("lspconfig.util")
return {
  -- Taplo (TOML LSP)
  lsp = {
    taplo = {
      filetypes = { "toml" },
      root_dir  = util.root_pattern("Cargo.toml", "pyproject.toml", ".git"),
    },
  },

  -- no formatters for TOML by default
  formatters_by_ft = {},

  -- Mason packages
  mason_lsp   = { "taplo" },
  mason_tools = {},
}
