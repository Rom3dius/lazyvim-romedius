local lspconfig = require("lspconfig")
lspconfig.ansiblels.setup({
  settings = {
    ansible = {
      ansible = {
        path = "ansible",
      },
      python = {
        interpreterPath = "python",
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint",
        },
      },
    },
  },
  root_dir = vim.fn.getcwd(),
  filetypes = { "yaml.ansible", "yaml" },
})
