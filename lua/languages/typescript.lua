-- lua/languages/typescript.lua
local util = require("lspconfig.util")

return {
  lsp = {
    vtsls = {
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      root_dir = util.root_pattern("pnpm-workspace.yaml"),
      single_file_support = false, -- avoids loading LSP in files not tied to the monorepo
      settings = {
        typescript = {
          format = {
            enable = true,
          },
        },
        javascript = {
          format = {
            enable = true,
          },
        },
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            enableProjectDiagnostics = true, -- enables cross-package diagnostics
          },
        },
        completions = {
          completeFunctionCalls = true,
        },
      },
    },
  },

  formatters_by_ft = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },

  formatters_config = {},

  mason_lsp = { "vtsls" },
  mason_tools = { "prettier" },
}
