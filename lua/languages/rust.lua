-- lua/languages/rust.lua
---@type Language
local util = require("lspconfig.util")

return {
  lsp = {
    rust_analyzer = {
      filetypes = { "rust" },
      root_dir = util.root_pattern("Cargo.toml"),
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = false,
          },
          procMacro = {
            ignored = {
              leptos_macro = {
                "component",
                "server",
              },
            },
          },
        },
      },
    },
  },

  -- Always format Rust with rustfmt
  formatters_by_ft = {
    rust = { "rustfmt" },
  },

  formatters_config = {},

  -- Mason packages to ensure are installed:
  --   - rust_analyzer (the language server)
  --   - rustfmt       (the formatter)
  mason_lsp = { "rust_analyzer" },
  mason_tools = { "rustfmt" },
}
