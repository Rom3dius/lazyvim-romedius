-- lua/languages/go.lua
---@type Language
local util = require("lspconfig.util")

return {
  lsp = {
    gopls = {
      filetypes = { "go", "gomod" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    },
  },

  -- Always format Go with goimports (or gofmt)
  formatters_by_ft = {
    go = { "goimports" },
  },

  formatters_config = {},

  -- Mason packages to ensure are installed:
  --   - gopls       (the language server)
  --   - goimports   (the formatter; you could also use gofumpt or gofmt)
  mason_lsp = { "gopls" },
  mason_tools = { "goimports" },
}
