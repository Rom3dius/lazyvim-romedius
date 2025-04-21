---@type Language
return {
  enabled = true,

  lsp = {
    marksman = {
      filetypes = { "markdown", "markdown.mdx" },
      root_dir  = require("lspconfig.util").root_pattern(".git", ".marksman.toml"),
    },
  },

  formatters_by_ft = {
    markdown      = { "prettier" },
    ["markdown.mdx"] = { "prettier" },
  },

  -- you could supply prettier-specific args here:
  formatters_config = {
    prettier = {
      -- e.g. prepend_args = { "--prose-wrap", "always" },
    },
  },

  mason_lsp   = { "marksman" },
  mason_tools = { "prettier" },
}

