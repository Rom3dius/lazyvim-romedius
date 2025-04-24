return {
  {
    "renerocksai/telekasten.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/zettelkasten"),
        dailies = vim.fn.expand("~/zettelkasten/dailies"),
        weeklies = vim.fn.expand("~/zettelkasten/weeklies"),
        templates = vim.fn.expand("~/zettelkasten/templates"),
        -- image_subdir = "img",
        sort = "modified",
        command_palette_theme = "dropdown",
        vaults = {
          personal = {
            home = vim.fn.expand("~/zettelkasten/personal"),
          },
          c1 = {
            home = vim.fn.expand("~/zettelkasten/c1"),
          },
        },
      })
      vim.treesitter.language.register("markdown", "telekasten")
    end,
  },
}
