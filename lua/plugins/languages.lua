local langs = require("languages").load()

return {
  -- 1) Extend built‑in LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      for srv, cfg in pairs(langs.lsp_servers) do
        opts.servers[srv] = vim.tbl_deep_extend("force", opts.servers[srv] or {}, cfg)
      end
    end,
  },

  -- 2) Tell Mason‑LSPconfig to install those LSPs
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      -- Only install servers available in mason's registry
      local mlsp = require("mason-lspconfig")
      local available = mlsp.get_available_servers()

      for _, srv in ipairs(langs.mason_lsp) do
        if vim.tbl_contains(available, srv) then
          table.insert(opts.ensure_installed, srv)
        else
          vim.schedule(function()
            vim.notify("Skipping unknown LSP server: " .. srv, vim.log.levels.WARN)
          end)
        end
      end
    end,
  },

  -- 3) Ensure your external formatter CLIs are present
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = langs.mason_tools,
      run_on_start = true,
      auto_update = false,
    },
  },

  -- 4) Merge into Conform’s formatters
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, langs.formatters_by_ft)
      opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, langs.formatters_config)
    end,
  },
}
