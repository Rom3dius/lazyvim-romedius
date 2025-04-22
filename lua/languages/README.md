# Languages

Add LSPs and formatters that are sensible defaults and should run everywhere.

### `python.lua` global example

```lua
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
```

### `.lazy.lua` per-project settings

```lua
return {
	-- LSP Config with mason and mason-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"pmizio/typescript-tools.nvim", -- For vtsls (alternative: "yioneko/nvim-vtsls")
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			local lspconfig = require("lspconfig")

			-- Setup VTSLS for ts/js in monorepo
			lspconfig.vtsls.setup({
				settings = {
					vtsls = {
						enableMoveToFileCodeAction = true,
						experimental = {
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
					typescript = {
						inlayHints = {
							enumMemberValues = true,
							includeInlayParameterNameHints = "all",
						},
					},
				},
				root_dir = lspconfig.util.root_pattern("pnpm-workspace.yaml", "package.json", "tsconfig.base.json"),
			})

			-- Setup ESLint
			lspconfig.eslint.setup({
				root_dir = lspconfig.util.root_pattern(
					".eslintrc.js",
					".eslintrc.json",
					"package.json",
					"pnpm-workspace.yaml"
				),
				settings = {
					format = { enable = true },
					lintTask = { enable = true },
				},
			})
		end,
	},
}
```
