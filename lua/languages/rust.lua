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
          -- keep this as you like
          diagnostics = {
            enable = false, -- or true if you want RA diagnostics
          },
          procMacro = {
            enable = true,
            -- remove the 'ignored' block entirely, or leave it empty:
            ignored = {},
          },
          cargo = {
            -- choose the set that matches your project:
            features = "all",
          },
          checkOnSave = {
            command = "clippy", -- or "check"
            allTargets = false, -- avoid spurious target errors
            -- extraArgs = { "--target-dir", "target/ra" }, -- optional perf isolation
          },
          rustfmt = {
            overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
          },
        },
      },
    },
  },

  -- Always format Rust with rustfmt
  -- formatters_by_ft = {
  --   rust = { "rustfmt" },
  -- },

  formatters_config = {},

  mason_lsp = { "rust_analyzer" },
  mason_tools = { "rustfmt" },
}
