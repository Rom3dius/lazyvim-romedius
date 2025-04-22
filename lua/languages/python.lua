-- lua/languages/python.lua
---@type Language
local util = require("lspconfig.util")

return {
  -- Enable Pyright, letting it pick up .venv via project-local pyrightconfig.json or pyproject.toml
  lsp = {
    pyright = {
      filetypes = { "python" },
      root_dir = util.root_pattern(".git", "pyproject.toml", "setup.py"),
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            diagnosticMode = "workspace",
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

  -- Mason packages to ensure are installed:
  --   - pyright (the language server)
  --   - black    (the formatter)
  mason_lsp = { "pyright" },
  mason_tools = { "black" },
}
