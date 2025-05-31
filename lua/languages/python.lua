-- lua/languages/python.lua
---@type Language
local util = require("lspconfig.util")

-- Helper to detect Poetry virtualenv path
local function get_poetry_venv_python()
  local handle = io.popen("poetry env info -p 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result ~= "" then
      local venv_path = result:gsub("%s+", "")
      return venv_path .. "/bin/python"
    end
  end
  return nil
end

return {
  -- Enable Pyright, letting it pick up .venv via poetry if available
  lsp = {
    pyright = {
      filetypes = { "python" },
      root_dir = util.root_pattern("pyproject.toml", ".git", "setup.py"),
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            diagnosticMode = "workspace",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            -- Dynamically resolve interpreter from Poetry
            pythonPath = get_poetry_venv_python(),
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
