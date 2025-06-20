-- lua/languages/python.lua
---@type Language
local util = require("lspconfig.util")

return {
  -- Enable Pyright, letting it pick up .venv via poetry if available
  lsp = {
    basedpyright = {
      filetypes = { "python" },
      root_dir = util.root_pattern("pyproject.toml", ".git", "setup.py"),
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "basic",
            diagnosticMode = "workspace",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    },
  },

  -- Always format Python with Black
  formatters_by_ft = {
    python = { "black" },
  },

  -- No additional per-formatter options for Black
  formatters_config = {},

  -- Mason packages to ensure are installed
  mason_lsp = { "pyright" },
  mason_tools = { "black" },
}
