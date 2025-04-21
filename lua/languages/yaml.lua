-- lua/languages/yaml.lua
---@type Language
return {
  -- YAML LSP
  lsp = {
    yamlls = {},
  },

  -- use Prettier for YAML formatting
  formatters_by_ft = {
    yaml = { "prettier" },
  },

  -- no extra per‑formatter options
  formatters_config = {},

  -- Mason packages
  mason_lsp = { "yamlls" },
  mason_tools = { "prettier" },
}
