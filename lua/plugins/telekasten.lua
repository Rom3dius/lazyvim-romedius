return {
  {
    "renerocksai/telekasten.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/zettelkasten"),
      })
      vim.treesitter.language.register("markdown", "telekasten")
    end,
  },
}
