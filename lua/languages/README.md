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
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			local lspconfig = require("lspconfig")

			lspconfig.ansiblels.setup({
				root_dir = lspconfig.util.root_pattern(".ansible-lint", "ansible.cfg"),
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})
		end,
	},
}
```
