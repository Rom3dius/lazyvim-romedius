-- lua/languages/docker.lua
---@type Language
local util = require("lspconfig.util")
return {
  -- Dockerfile LSP
  lsp = {
    dockerls = {},
    docker_compose_language_service = {},
  },

  -- no special formatters for Dockerfiles by default
  formatters_by_ft = {},

  -- Mason packages
  mason_lsp = { "dockerls", "docker_compose_language_service" },
  mason_tools = {},
}
