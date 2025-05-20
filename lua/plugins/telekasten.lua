return {
  {
    "renerocksai/telekasten.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      local base = vim.fn.expand("~/zettelkasten")
      require("telekasten").setup({
        home = base .. "/personal",
        dailies = base .. "/dailies",
        weeklies = base .. "/weeklies",
        templates = base .. "/templates",
        template_new_note = base .. "/templates/default.md",
        template_new_daily = base .. "/templates/daily.md",
        template_new_weekly = base .. "/templates/weekly.md",
        image_subdir = "img",
        sort = "modified",
        command_palette_theme = "dropdown",
        vaults = {
          c1 = {
            home = base .. "/c1",
            dailies = base .. "/dailies",
            weeklies = base .. "/weeklies",
            templates = base .. "/templates",
            template_new_note = base .. "/templates/default.md",
            template_new_daily = base .. "/templates/daily.md",
            template_new_weekly = base .. "/templates/weekly.md",
            image_subdir = "img",
            sort = "modified",
            command_palette_theme = "dropdown",
          },
        },
      })
      vim.treesitter.language.register("markdown", "telekasten")
    end,
  },
}
