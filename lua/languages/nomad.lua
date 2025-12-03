-- lua/languages/nomad.lua
---@type Language
local util = require("lspconfig.util")

return {
  -- LSP via efm (runs validate/format under the hood)
  lsp = {
    efm = {
      filetypes = { "nomad", "hcl" },
      root_dir = util.root_pattern(".git", "*.nomad", "nomad.hcl"),
      single_file_support = true,
      init_options = { documentFormatting = true, documentRangeFormatting = true },
      settings = {
        languages = {
          nomad = {
            -- Diagnostics: `nomad job validate -`
            {
              lintCommand = "nomad job validate -",
              lintStdin = true,
              -- parse lines like "5:17: expected '=' after argument name"
              lintFormats = { "%l:%c: %m", "%m" },
              lintIgnoreExitCode = true,
              lintSource = "nomad-validate",
            },
          },
          -- Treat plain .hcl job specs the same way
          hcl = {
            {
              lintCommand = "nomad job validate -",
              lintStdin = true,
              lintFormats = { "%l:%c: %m", "%m" },
              lintIgnoreExitCode = true,
              lintSource = "nomad-validate",
            },
          },
        },
      },
    },
  },

  -- Format Nomad/HCL with the Nomad CLI (keeps your global formatter flow)
  formatters_by_ft = {
    nomad = { "nomad_fmt" },
    hcl = { "nomad_fmt" },
  },

  formatters_config = {
    nomad_fmt = {
      command = "nomad",
      args = { "fmt", "-" }, -- stdin -> stdout
      stdin = true,
    },
  },

  -- Mason packages to ensure are installed
  mason_lsp = { "efm" }, -- efm-langserver
  mason_tools = {}, -- `nomad` CLI is installed via your OS package manager
}
